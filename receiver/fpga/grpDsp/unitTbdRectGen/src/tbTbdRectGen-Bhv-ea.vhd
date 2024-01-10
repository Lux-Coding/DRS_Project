--------------------------------------------------------------------------------
-- Title       : Testbench for design "TbdRectGen"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbTbdRectGen-Bhv-ea.vhd 693 2017-10-16 10:25:52Z mroland $
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

entity tbTbdRectGen is
end entity tbTbdRectGen;

--------------------------------------------------------------------------------

architecture Bhv of tbTbdRectGen is

  -- Constants
  constant cIsLowPercentageOfDutyCycle  : natural   := 65;
  constant cInResetDuration             : time      := 140 ns;
  constant cClkFrequency                : natural   := 48E6;
  constant cStrobeFrequency             : natural   := 750E3;
  constant cAudioBitWidth               : natural   := 16;
  constant cLeftRectFrequency           : natural   := 100;
  constant cLeftRectCycle               : time      := 1 sec / cLeftRectFrequency;
  constant cRightRectFrequency          : natural   := 440;
  constant cRightRectCycle              : time      := 1 sec / cRightRectFrequency;

  -- internal signals
  signal Clk                  : std_ulogic;
  signal nResetAsync          : std_ulogic;
  signal I2cSclk              : std_logic := 'H';
  signal I2cSdin              : std_logic := 'H';
  signal Mclk                 : std_ulogic;
  signal Bclk                 : std_ulogic;
  signal ADCdat               : std_ulogic;
  signal ADClrc               : std_ulogic;
  signal DACdat               : std_ulogic;
  signal DAClrc               : std_ulogic;
  signal Led                  : std_ulogic_vector(9 downto 0);
  signal Configured           : std_ulogic;

  -- codec configuration tracking
  type aPhase is (Idle, Data, Ack, Stop);
  signal Phase : aPhase := Idle;

begin  -- architecture Bhv

  -- Simulate pull-up resistors
  I2cSclk <= 'H';
  I2cSdin <= 'H';

  Configured <= Led(1);

  -- clock generation
  ClkGen : entity work.Oscillator
    generic map (
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

  -- device under test
  dut: entity work.TbdRectGen
    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,
      oI2cSclk     => I2cSclk,
      ioI2cSdin    => I2cSdin,
      oMclk        => Mclk,
      oBclk        => Bclk,
      iADCdat      => ADCdat,
      oADClrc      => ADClrc,
      oDACdat      => DACdat,
      oDAClrc      => DAClrc,
      oLed         => Led
    );

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

  test: process
    variable vShouldBe : std_ulogic_vector(cAudioBitWidth-1 downto 0);
    variable vData     : std_ulogic_vector(cAudioBitWidth-1 downto 0);
    variable vCycleTime : time;
    variable vTime : time;
  begin
    -- Start checks after reset
    if nResetAsync = cnActivated then
      wait until nResetAsync /= cnActivated;
    end if;

    -- wait for daclrc before sampling bits
    wait until DAClrc'event;

    -- calculate rect cycle time depending on channel
    if DAClrc = cActivated then
      vCycleTime := cRightRectCycle;  -- right channel
    else
      vCycleTime := cLeftRectCycle;   -- left channel
    end if;

    -- get time between cycles
    vTime := now;
    while vTime > vCycleTime loop
      vTime := vTime - vCycleTime;
    end loop;

    -- calculate value to check for depending on time in cycle
    if vTime < vCycleTime / 2 then
      vShouldBe := "0111111111111111";
    else
      vShouldBe := "1000000000000000";
    end if;
    
    -- ignore first empty bit
    wait until Bclk'event and Bclk = cActivated;
    
    -- sample bits
    for vIndex in cAudioBitWidth-1 downto 0 loop
      wait until Bclk'event and Bclk = cActivated;
      vData(vIndex) := DACdat;
    end loop;

    -- check for correct data
    assert(vData = vShouldBe)
      report "Data doesn't match. Should be " & integer'image(to_integer(unsigned(vShouldBe))) & " but is " & integer'image(to_integer(unsigned(vData)))
      severity error;

  end process test;
  
end architecture Bhv;
