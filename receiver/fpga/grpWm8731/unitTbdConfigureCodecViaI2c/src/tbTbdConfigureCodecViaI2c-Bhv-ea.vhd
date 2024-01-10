--------------------------------------------------------------------------------
-- Title       : Testbench for design "TbdConfigureCodecViaI2c"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbTbdConfigureCodecViaI2c-Bhv-ea.vhd 664 2017-09-26 19:39:57Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2012-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.Global.all;

entity tbTbdConfigureCodecViaI2c is
end entity tbTbdConfigureCodecViaI2c;


architecture Bhv of tbTbdConfigureCodecViaI2c is

  -- component generics
  constant cClkFrequency               : natural := 48E6;
  constant cIsLowPercentageOfDutyCycle : natural := 65;
  constant cInResetDuration            : time    := 140 ns;

  -- component ports
  signal Clk                     : std_ulogic;
  signal nResetAsync             : std_ulogic;
  signal I2cSclk                 : std_logic := 'H';
  signal I2cSdin                 : std_logic := 'H';
  signal Mclk                    : std_ulogic;
  signal Bclk                    : std_ulogic;
  signal ADCdat                  : std_ulogic;
  signal ADClrc                  : std_ulogic;
  signal DACdat                  : std_ulogic;
  signal DAClrc                  : std_ulogic;
  signal Led                     : std_ulogic_vector(9 downto 0);
  signal Configured              : std_ulogic;
  signal AckError                : std_ulogic;
  signal BclkDiffersFromMclk     : std_ulogic;
  signal DAClrcDiffersFromADClrc : std_ulogic;

begin  -- architecture Bhv

  I2cSclk <= 'H';
  I2cSdin <= 'H';

  ---------------------------------------------------------------------------
  -- Instantiate Design Under Test (DUT)
  ---------------------------------------------------------------------------
  DUT : entity work.TbdConfigureCodecViaI2c
    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,
      oI2cSclk     => I2cSclk,
      ioI2cSdin    => I2cSdin,
      oMclk        => Mclk,
      iBclk        => Bclk,
      iADCdat      => ADCdat,
      iADClrc      => ADClrc,
      oDACdat      => DACdat,
      iDAClrc      => DAClrc,
      oLed         => Led);
  
  Configured              <= Led(1);
  AckError                <= Led(2);
  BclkDiffersFromMclk     <= Led(8);
  DAClrcDiffersFromADClrc <= Led(9);


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

  ---------------------------------------------------------------------------
  -- Implement testbench.
  ---------------------------------------------------------------------------
  
  
end architecture Bhv;
