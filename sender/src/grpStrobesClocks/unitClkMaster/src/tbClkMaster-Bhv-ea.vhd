--------------------------------------------------------------------------------
-- Title       : Testbench for design "ClkMaster"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbClkMaster-Bhv-ea.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

use work.Global.all;

--------------------------------------------------------------------------------

entity tbClkMaster is
end entity tbClkMaster;

--------------------------------------------------------------------------------

architecture Bhv of tbClkMaster is

  -- component generics
  constant cClkFrequency               : natural := 48E6;
  constant cMclkFrequency              : natural := 12E6;
  constant cSampleRate                 : natural := 44117;
  constant cIsLowPercentageOfDutyCycle : natural := 65;
  constant cInResetDuration            : time    := 140 ns;


  -- component ports
  signal Clk         : std_ulogic;
  signal nResetAsync : std_ulogic;
  signal Mclk        : std_ulogic;
  signal Bclk        : std_ulogic;
  signal ADClrc      : std_ulogic;

begin  -- architecture Bhv

  DUT : entity work.ClkMaster
    generic map (
      gClkFrequency  => cClkFrequency,
      gMclkFrequency => cMclkFrequency,
      gSampleRate    => cSampleRate)
    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,
      oMclk        => Mclk,
      oBclk        => Bclk,
      oADClrc      => ADClrc);

  ClkGen : entity work.Oscillator
    generic map (
      gFrequency                  => cClkFrequency,
      gIsLowPercentageOfDutyCycle => cIsLowPercentageOfDutyCycle)
    port map (
      oRectangleWave => Clk);

  PwrOnResetSource : entity work.PwrOnReset
    generic map (
      gInResetDuration => cInResetDuration,
      gResetLevel      => cResetActive)
    port map (
      onResetAsync => nResetAsync);

end architecture Bhv;

