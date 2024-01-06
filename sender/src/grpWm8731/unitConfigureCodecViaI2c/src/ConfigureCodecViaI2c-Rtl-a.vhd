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

  constant cChipAddress : std_ulogic_vector(6 downto 0) := "0011010";

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

    -----------------------------------------------------------------------------
    -- TODO: Add signals to sensitivity list ...
    -----------------------------------------------------------------------------
    R, iStrobeI2C, iStart, ioI2cSdin

  )

  begin

    ---------------------------------------------------------------------------
    -- Set Next State Defaults
    ---------------------------------------------------------------------------
    NextR <= R;

    ---------------------------------------------------------------------------
    -- Consider Actual States and Inputs
    ---------------------------------------------------------------------------
    
    if (iStrobeI2C = cActivated) then
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
            -- Continue with next register (or return to idle after transmission of the last register)
            if (R.AddrCtr = cRegBitMap'high) then
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

      when Idle => 

        -- clock off, high Z on sdin
        NextR.Sclk <= '1';
        NextR.Sdin <= '1';

        -- start the transmission on strobesig
        if (iStrobeI2C = '1' and R.Activity = Transmitting) then
          NextR.Framestate <= start;
          NextR.Sdin <= '0';
        end if;

      -- send the Start-Bit
      when Start => 

      -- keep the clock high
      NextR.Sclk <= '1';
      
      -- clear previous acknowledge error
      NextR.AckError <= '0';

      -- create a falling edge after start bit was sent
      if (iStrobeI2C = '1') then 
          NextR.Sclk <= '0';
          NextR.FrameState <= Address;
          NextR.BitCtr <= cChipAddress'high;
      end if;  

      -- send chip address and RW bit
      when Address =>

          -- increment the bitcounter on every falling edge of sclk
          if (iStrobeI2C = '1' and R.Sclk = '1') then
            
            if (R.BitCtr /= 0 ) then
              NextR.BitCtr <= R.BitCtr - 1;
            end if;

            -- if all address bits have been sent -> send the RWBit
            if (R.BitCtr = 0) then
              NextR.FrameState <= RWBit;
            end if;
          end if;

          -- only write bit to Sdin if the sclk is low
          if (R.Sclk = '0' and R.BitCtr <= cChipAddress'high) then
           NextR.Sdin <= cChipAddress(R.BitCtr);
          end if;

      when RWBit =>


      -- only write bit to Sdin if the sclk is low
      if (R.Sclk = '0') then
        NextR.Sdin <= cRWBitWrite;
      end if;

      -- wait for the RW bit to be sent completely (falling edge)
      if (iStrobeI2C = '1' and R.Sclk = '1') then
        NextR.FrameState <= Ack1;
        -- weak high on sdin
        NextR.Sdin <= '1';
      end if;

      
      when Ack1 => 

        -- wait for a rising edge to read the ack bit
        if (iStrobeI2C = '1' and R.Sclk = '0') then
          -- acknowledge received
          if (ioI2cSdin = '0') then
            NextR.AckError <= '0';
          -- no acknowledge received -> wait again
          else
           NextR.AckError <= '1';
           -- try to send the data again
           NextR.Framestate <= Idle;
          end if;
        end if;

        -- wait falling edge and check if acknowledge was received
        if (iStrobeI2C = '1' and R.Sclk = '1' and R.AckError = '0') then
          NextR.FrameState <= Data1;
          NextR.BitCtr <= R.Data'high;
        end if;

      when Data1 => 

        -- decrement the bitcounter on every falling edge of sclk
        if (iStrobeI2C = '1' and R.Sclk = '1') then
    
            NextR.BitCtr <= R.BitCtr - 1;

          -- if the first 8 Data bits have been sent -> wait for ACK
          if (R.BitCtr = R.Data'length/2) then
            NextR.FrameState <= Ack2;
            NextR.Sdin <= '1';
          end if;
        end if;

        -- only write bit to Sdin if the sclk is low
        if (R.Sclk = '0') then
          NextR.Sdin <= R.Data(R.BitCtr);
        end if;

      when Ack2 =>

        -- wait for a rising edge to read the ack bit
        if (iStrobeI2C = '1' and R.Sclk = '0') then
          -- acknowledge received
          if (ioI2cSdin = '0') then
            NextR.AckError <= '0';
          -- no acknowledge received -> wait again
          else
            NextR.AckError <= '1';
            -- try to send the data again
            NextR.Framestate <= Idle;
          end if;
        end if;

        -- wait falling edge and check if acknowledge was received
        if (iStrobeI2C = '1' and R.Sclk = '1' and R.AckError = '0') then
          NextR.FrameState <= Data2;
        end if;

      when Data2 =>

        -- decrement the bitcounter on every falling edge of sclk
        if (iStrobeI2C = '1' and R.Sclk = '1') then
    
          if (R.BitCtr /= 0 ) then
            NextR.BitCtr <= R.BitCtr - 1;
          end if;

          -- if the last 8 Data bits have been sent -> wait for ACK
          if (R.BitCtr = 0) then
            NextR.FrameState <= Ack3;
            NextR.Sdin <= '1';
          end if;
        end if;

        -- only write bit to Sdin if the sclk is low
        if (R.Sclk = '0') then
          NextR.Sdin <= R.Data(R.BitCtr);
        end if;

      when Ack3 =>

        -- wait for a rising edge to read the ack bit
        if (iStrobeI2C = '1' and R.Sclk = '0') then
          -- acknowledge received
          if (ioI2cSdin = '0') then
            NextR.AckError <= '0';
          -- no acknowledge received -> send again
          else
            NextR.AckError <= '1';
            -- try to send the data again
            NextR.Framestate <= Idle;
          end if;
        end if;

        -- wait falling edge and check if acknowledge was received
        if (iStrobeI2C = '1' and R.Sclk = '1' and R.AckError = '0') then
          NextR.FrameState <= stop;
        end if;

      when stop => 

        -- send stop bit
        NextR.Sdin <= '0';

        if iStrobeI2C = '1' and R.Sclk = '1' then

          NextR.Framestate <= Idle;
          NextR.Sclk <= '1'; 

        end if ;
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
