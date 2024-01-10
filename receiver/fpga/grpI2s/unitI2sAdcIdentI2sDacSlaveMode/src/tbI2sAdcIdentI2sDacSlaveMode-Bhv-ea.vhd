--------------------------------------------------------------------------------
-- Title       : Testbench for design "I2sAdcIdentI2sDacSlaveMode"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbI2sAdcIdentI2sDacSlaveMode-Bhv-ea.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.Global.all;

--------------------------------------------------------------------------------

entity tbI2sAdcIdentI2sDacSlaveMode is
end entity tbI2sAdcIdentI2sDacSlaveMode;

--------------------------------------------------------------------------------

architecture Bhv of tbI2sAdcIdentI2sDacSlaveMode is

  -- component generics
  constant cClkFrequency               : natural := 48E6;
  constant cIsLowPercentageOfDutyCycle : natural := 65;
  constant cInResetDuration            : time    := 140 ns;
  constant cSampleRate                 : natural := 44117;

  -- component ports
  signal Clk         : std_ulogic;
  signal nResetAsync : std_ulogic;
  signal I2cSclk     : std_logic;
  signal I2cSdin     : std_logic;
  signal Mclk        : std_ulogic;
  signal Bclk        : std_ulogic;
  signal ADCdat      : std_ulogic;
  signal ADClrc      : std_ulogic;
  signal DACdat      : std_ulogic;
  signal DAClrc      : std_ulogic;
  signal Led         : std_ulogic_vector(9 downto 0);
  signal Configured  : std_ulogic;
  signal AckError    : std_ulogic;

begin  -- architecture Bhv

  I2cSclk <= 'H';
  I2cSdin <= 'H';

  DUT : entity work.I2sAdcIdentI2sDacSlaveMode
    generic map (
      gSampleRate => cSampleRate)

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
      oLed         => Led);

  Configured              <= Led(1);
  AckError                <= Led(2);
  
  
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
  
  -- Set some value other than 'U'. Since we don't know what data comes along the '-'
  -- value fits best.
  ADCdat <= '-';
  
end architecture Bhv;
