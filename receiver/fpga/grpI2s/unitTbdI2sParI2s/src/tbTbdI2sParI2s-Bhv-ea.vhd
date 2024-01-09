--------------------------------------------------------------------------------
-- Title       : Testbench for design "TbdI2sParI2s"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbTbdI2sParI2s-Bhv-ea.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Global.all;

--------------------------------------------------------------------------------

entity tbTbdI2sParI2s is
end entity tbTbdI2sParI2s;

-------------------------------------------------------------------------------

architecture Bhv of tbTbdI2sParI2s is

  -- Constants
  constant cClkFrequency                : natural := 48E6;
  constant cIsLowPercentageOfDutyCycle  : natural := 65;
  constant cInResetDuration             : time    := 140 ns;
  constant cStrobeFrequency             : natural := 750E3;
  constant cAudioBitWidth               : natural := 16;

  -- internal signals
  signal Clk                    : std_ulogic;
  signal nResetAsync            : std_ulogic;
  signal I2cSclk                : std_logic := 'H';
  signal I2cSdin                : std_logic := 'H';
  signal Mclk                   : std_ulogic;
  signal Bclk                   : std_ulogic;
  signal ADCdat                 : std_ulogic;
  signal ADClrc                 : std_ulogic;
  signal DACdat                 : std_ulogic;
  signal DAClrc                 : std_ulogic;
  signal Configured             : std_ulogic;
  signal Led                    : std_ulogic_vector(9 downto 0);

  -- store channels seperately (as they overlap)
  signal LeftChannelInput       : std_ulogic_vector(cAudioBitWidth-1 downto 0);
  signal RightChannelInput      : std_ulogic_vector(cAudioBitWidth-1 downto 0);

    -- codec configuration tracking
  type aPhase is (Idle, Data, Ack, Stop);
  signal Phase : aPhase := Idle;

begin  -- architecture Bhv

  -- Simulate pull-up resistors
  I2cSclk <= 'H';
  I2cSdin <= 'H';

  Configured <= Led(1);

  DUT : entity work.TbdI2sParI2s
    port map(
      iClk          => Clk,
      inResetAsync  => nResetAsync,
      oI2cSclk      => I2cSclk,
      ioI2cSdin     => I2cSdin,
      oMclk         => Mclk,
      oBclk         => Bclk,
      iADCdat       => ADCdat,
      oADClrc       => ADClrc,
      oDACdat       => DACdat,
      oDAClrc       => DAClrc,
      oLed          => Led
    );

  -- Generate pseudo random data with an LFSR.
  RandomBit : process is
    -- Define a data structure for an LFSR.
    variable Lfsr : std_ulogic_vector(31 downto 0) := (others => '1');
  begin
    -- With every falling edge of Bclk.
    wait until Bclk'event and (Bclk = '0');
    -- Shift the LFSR once. Shift in a new bit based on linear automata theory.
    Lfsr := Lfsr(Lfsr'left-1 downto 0) & (Lfsr(Lfsr'left) xor Lfsr(11));
    -- Take any of the bits in the LFSR as source for the output.
    ADCdat <= Lfsr(0);
  end process;

  -- clock generation
  ClkGen : entity work.Oscillator
    generic map (
      gFrequency                  => cClkFrequency,
      gIsLowPercentageOfDutyCycle => cIsLowPercentageOfDutyCycle)
    port map (
      oRectangleWave => Clk);

  -- reset generation
  PwrOnResetSource : entity work.PwrOnReset
    generic map (
      gInResetDuration => cInResetDuration,
      gResetLevel      => cResetActive)
    port map (
      onResetAsync => nResetAsync);

  -- codec configuation phase tracking (for ACK generation)
  PhaseTracking_Proc : process (I2cSclk, I2cSdin)
    variable vSclkCycleCount        : integer := 0;
    variable vByteCycleCount        : integer := 0;
  begin
    if (to_X01(nResetAsync) /= not cResetActive) then
      Phase <= Idle;        
    else            
      case Phase is
        when Idle =>
          if I2cSdin'event then
            Phase <= Data;
            vSclkCycleCount := 0;
            vByteCycleCount := 0;
          end if;          
        when Data =>
          if I2cSclk'event and (to_X01(I2cSclk) = cInactivated) then
            vSclkCycleCount := vSclkCycleCount + 1;
            if (vSclkCycleCount = 9) then
              Phase <= Ack;
            end if;
          end if;          
        when Ack =>
          if I2cSclk'event and (to_X01(I2cSclk) = cInactivated) then
            vSclkCycleCount := 1;
            vByteCycleCount := vByteCycleCount + 1;
            Phase <= Data;
            if (vByteCycleCount = 3) then
              Phase <= Stop;
            end if;
          end if;          
        when Stop =>
          if I2cSdin'event then
            if (to_X01(I2cSdin) = cActivated) then
              Phase <= Idle;
            end if;
          end if;                
      end case;
    end if;
  end process PhaseTracking_Proc;

  -- codec configuration ack generation for i2c
  AckGen_Proc : process
  begin
    wait until Phase = Ack;
    wait for 1 sec / cClkFrequency * 1.5;
    wait for 1 sec / cStrobeFrequency / 4 * 3;
    I2cSdin <= cInactivated;
    wait until to_X01(I2cSclk) = cActivated;
    wait for 1 sec / cStrobeFrequency / 4 * 1;
    I2cSdin <= 'Z';
    wait for 0 sec;
    wait until Phase /= Ack;
  end process AckGen_Proc;

  -- Store test input
  StoreInput: process is
    variable counter          : natural := 0;
    variable SequenceComplete : std_ulogic := '0';
    variable CurrentMode      : std_ulogic := '0';
  begin

    -- wait for adclrc before sampling bits
    wait until ADClrc'event;

    -- ignore first empty bit
    wait until Bclk'event and (Bclk = '1');

    -- sample bits from input
    for vIndex in cAudioBitWidth-1 downto 0 loop
      wait until Bclk'event and Bclk = cActivated;
      if ADClrc = cActivated then -- left channel
        RightChannelInput(vIndex) <= ADCdat;
      else -- right channel
        LeftChannelInput(vIndex) <= ADCdat;
      end if;      
    end loop;
  end process;

  -- Compare test output with input
  CheckTestOutput: process is
    variable counter          : natural := 0;
    variable SequenceComplete : std_ulogic := '0';
    variable CurrentMode      : std_ulogic := '0';
    variable vData            : std_ulogic_vector(cAudioBitWidth-1 downto 0);
  begin

    -- Start checks after reset
    if nResetAsync = cnActivated then
      wait until nResetAsync /= cnActivated;
    end if;

    -- wait for edge on DAClrc before sampling bits
    wait until DAClrc'event;

    -- ignore first empty bit
    wait until Bclk'event and Bclk = cActivated;

    -- sample bits from output
    for vIndex in cAudioBitWidth-1 downto 0 loop
      wait until Bclk'event and Bclk = cActivated;
      vData(vIndex) := DACdat;
    end loop;

    -- compare
    if DAClrc = cActivated then --right channel
      assert(vData = RightChannelInput)
        report "Data on right channel doesn't match. Should be " & integer'image(to_integer(unsigned(RightChannelInput))) & " but is " & integer'image(to_integer(unsigned(vData)))
        severity error;
    else  -- left channel
      assert(vData = LeftChannelInput)
        report "Data on left channel doesn't match. Should be " & integer'image(to_integer(unsigned(LeftChannelInput))) & " but is " & integer'image(to_integer(unsigned(vData)))
        severity error;
    end if;

  end process;

end architecture Bhv;

