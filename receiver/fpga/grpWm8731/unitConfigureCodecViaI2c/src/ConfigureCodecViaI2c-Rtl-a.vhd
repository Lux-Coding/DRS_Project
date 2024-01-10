--------------------------------------------------------------------------------
-- Title       : Configuration of Wolfson WM8731 via I2C
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: ConfigureCodecViaI2c-Rtl-a.vhd 664 2017-09-26 19:39:57Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2012-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of ConfigureCodecViaI2c is

  -----------------------------------------------------------------------------
  -- Assemble register bit map from abstract parameter definition (see DefinitionsCodec)
  -----------------------------------------------------------------------------
  constant cRegBitMap : aRegBitMap := toCodecRegBitMap(cParamSets(gChoosenParamSet));

  -- R/W bit
  constant cRWBitWrite : std_ulogic := '0';

  -----------------------------------------------------------------------------
  -- register definition
  -----------------------------------------------------------------------------
  type aActivity is (Idle, Transmitting);
  type aFrameState is (Idle, Start, Address, RWBit, Ack1, Data1, Ack2, Data2, Ack3, Stop);

  type aRegSet is record
    Activity    : aActivity;
    FrameState  : aFrameState;
    AddrCtr     : natural range 0 to (2**7 - 1);
    BitCtr      : natural range 0 to 15;
    Data        : std_ulogic_vector(15 downto 0);
    Sclk        : std_ulogic;
    Sdin        : std_ulogic;
    AckError    : std_ulogic;
    Configured  : std_ulogic;
  end record aRegSet;

  constant cRinitVal: aRegSet := (
      Activity    => Idle,
      FrameState  => Idle,
      AddrCtr     => 0,
      BitCtr      => 0,
      Data        => (others => '0'),
      Sclk        => cActivated,
      Sdin        => cActivated,
      AckError    => cInactivated,
      Configured  => cInactivated
  );

  signal R, NextR : aRegSet;
  
begin
 
  ------------
  -- Registers
  ------------
  Registers : process(iClk, inResetAsync)
  begin
    if (inResetAsync = cResetActive) then
      R <= cRinitVal;
    elsif rising_edge(iClk) then
      R <= NextR;  
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Next State and Output Logic: Combinatorial
  -----------------------------------------------------------------------------
  NextStateAndOutput : process (

    R, iStart, iStrobeI2C, ioI2cSdin

  )

    -- variables for commonly used conditions
    variable vI2cStrobe : boolean;
    variable vSclkRising : boolean;
    variable vSclkFalling : boolean;
    variable vAckDetected : boolean;

  begin

    -- set variables
    vI2cStrobe := (iStrobeI2C = cActivated);
    vSclkRising := vI2cStrobe and (R.Sclk = cInactivated);
    vSclkFalling := vI2cStrobe and (R.Sclk = cActivated);
    vAckDetected := (ioI2cSdin = cInactivated);

    ---------------------------------------------------------------------------
    -- Set Next State Defaults
    ---------------------------------------------------------------------------
    NextR <= R;

    ---------------------------------------------------------------------------
    -- Consider Actual States and Inputs
    ---------------------------------------------------------------------------
    
    if vI2cStrobe then
      -- Activity state
      case R.Activity is
        when Idle =>
          if (iStart = cActivated) and (R.FrameState = Idle) then
            -- Start signal asserted and ready for (re-)configuration
            NextR.Activity <= Transmitting;
            NextR.AddrCtr <= 0;
            NextR.Configured <= cInactivated;
            NextR.AckError <= cInactivated;
          end if;
  
        when Transmitting =>
          if (R.FrameState = Start) then
            -- Assemble next register configuration data packet (16 bits)
            -- from register address (7 bits) and register value (9 bits)
            NextR.Data <= std_ulogic_vector(to_unsigned(R.AddrCtr, 7)) & cRegBitMap(R.AddrCtr);
          end if;
  
          if (R.FrameState = Stop) and (R.Sclk = cActivated) then
            -- Always return to Idle if AckError
            if (R.AckError = cActivated) then
              NextR.Activity <= Idle;
            -- Continue with next register (or return to idle after transmission of the last register)
            elsif (R.AddrCtr = cRegBitMap'high) then
              NextR.Activity <= Idle;
              NextR.Configured <= cActivated;
            else
              NextR.AddrCtr <= R.AddrCtr + 1;
            end if;
          end if;
          
          -- Toggle Sclk (VHDL semantics imply that Sclk is only toggled if
          -- not explicitly overwritten in FrameState FSM)
          NextR.Sclk <= not R.Sclk;
      end case;
    end if;

    case R.FrameState is
      -- State Idle -----------------------------------------------------------------------------------
      when Idle =>
        -- check at each strobe whether Activity has changed to 'Transmitting'
        if vI2cStrobe and (R.Activity = Transmitting) then
          -- change to FrameState Start
          NextR.FrameState <= Start;
          -- generate the I2C start condition
          NextR.Sclk <= cActivated;
          NextR.Sdin <= cInactivated;
        end if;

      -- State Start ----------------------------------------------------------------------------------
      when Start =>
        -- initialize the BitCtr and switch to FrameState Address when a Strobe is detected
        if vI2cStrobe then
          NextR.BitCtr <= gI2cAddress'high;
          NextR.FrameState <= Address;
        end if;

      -- State Address --------------------------------------------------------------------------------
      when Address =>
        -- output of the current address bit
        NextR.Sdin <= gI2cAddress(R.BitCtr);

        -- decrement the BitCnt at the stobe where Sclk is high,
        -- so that Sdin is only changed in the low phase.
        if vSclkFalling then
          -- use the BitCnt to check whether all address bits have already been transmitted 
          -- and, if necessary, change to the FrameState RWBit
          if (R.BitCtr = gI2cAddress'low) then
            NextR.FrameState <= RWBit;
          else
            NextR.BitCtr <= R.BitCtr - 1;
          end if;          
        end if;

      -- State RWBit ----------------------------------------------------------------------------------
      when RWBit =>
        -- output the RWBit (for writing)
        NextR.Sdin <= cRWBitWrite;

        if vSclkFalling then
          -- change to FrameState Ack1
          NextR.FrameState <= Ack1;          
        end if;     

      -- State Ack1 -----------------------------------------------------------------------------------
      when Ack1 =>
        -- set Sdin to High to be able to check whether the codec pulls the signal ioI2CSdin to Low
        NextR.Sdin <= cActivated;

        if vSclkFalling then
          if (R.AckError = cActivated) then
            -- change to FrameState Stop when Ack wasn't detected
            NextR.FrameState <= Stop;
          else
            -- change to FrameState Data1 when Ack was detected
            NextR.BitCtr <= R.Data'high;
            NextR.FrameState <= Data1;
          end if;
        elsif vSclkRising and not vAckDetected then
          -- Ack was not detected -> Error handling
          NextR.AckError <= cActivated;
        end if;

      -- State Data1 ----------------------------------------------------------------------------------
      when Data1 =>
        -- output of the current data bit
        NextR.Sdin <= R.Data(R.BitCtr);

        -- decrement the BitCnt at the stobe where Sclk is high,
        -- so that Sdin is only changed in the low phase.
        if vSclkFalling then
          -- change to FrameState Ack2 when 8 data bits have been transmitted
          if (R.BitCtr = 8) then
            NextR.FrameState <= Ack2;
          end if;
          
          NextR.BitCtr <= R.BitCtr - 1;
        end if;

      -- State Ack2 -----------------------------------------------------------------------------------
      when Ack2 =>
        -- set Sdin to High to be able to check whether the codec pulls the signal ioI2CSdin to Low
        NextR.Sdin <= cActivated;

        if vSclkFalling then
          if (R.AckError = cActivated) then
            -- change to FrameState Stop when Ack wasn't detected
            NextR.FrameState <= Stop;
          else
            -- change to FrameState Data2 when Ack was detected
            NextR.FrameState <= Data2;
          end if;
        elsif vSclkRising and not vAckDetected then
          -- Ack was not detected -> Error handling
          NextR.AckError <= cActivated;
        end if;
          
      -- State Data2 ----------------------------------------------------------------------------------
      when Data2 =>
        -- output of the current data bit
        NextR.Sdin <= R.Data(R.BitCtr);

        -- decrement the BitCnt at the stobe where Sclk is high,
        -- so that Sdin is only changed in the low phase.
        if vSclkFalling then
          -- change to FrameState Ack3 when all data bits have been transmitted
          if (R.BitCtr = R.Data'low) then
            NextR.FrameState <= Ack3;
          else
            NextR.BitCtr <= R.BitCtr - 1;
          end if;
        end if;

      -- State Ack3 -----------------------------------------------------------------------------------
      when Ack3 =>
        -- set Sdin to High to be able to check whether the codec pulls the signal ioI2CSdin to Low
        NextR.Sdin <= cActivated;

        if vSclkFalling then
          -- change to FrameState Stop
          NextR.FrameState <= Stop;
        elsif vSclkRising and not vAckDetected then
          -- Ack was not detected -> Error handling
          NextR.AckError <= cActivated;
        end if;

      -- State Stop -----------------------------------------------------------------------------------
      when Stop =>
        NextR.Sdin <= cInactivated;

        if vSclkFalling then
          -- change to FrameState Idle
          NextR.FrameState <= Idle;
          -- generate the I2C stop condition
          NextR.Sdin <= cActivated;
          NextR.Sclk <= cActivated;
        end if;
      
    end case;
    
  end process NextStateAndOutput;

  -----------------------------------------------------------------------------
  -- Write to Outputs
  -----------------------------------------------------------------------------
  oI2cSclk  <= '0' when (R.Sclk = cInactivated) else 'Z';
  ioI2cSdin <= '0' when (R.Sdin = cInactivated) else 'Z';
  oAckError <= R.AckError;
  oConfigured <= R.Configured;

end Rtl;
