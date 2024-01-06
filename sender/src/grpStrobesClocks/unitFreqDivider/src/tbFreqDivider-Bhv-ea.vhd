--------------------------------------------------------------------------------
-- Title       : Testbench for design "FreqDivider"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbFreqDivider-Bhv-ea.vhd 664 2017-09-26 19:39:57Z mroland $
-- Authors     : Markus Pfaff, Hagenberg/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.Global.all;

--------------------------------------------------------------------------------

entity tbFreqDivider is
end entity tbFreqDivider;

--------------------------------------------------------------------------------

architecture Bhv of tbFreqDivider is

  -- component generics
  constant cClkFrequency               : natural := 48E6;
  constant cIsLowPercentageOfDutyCycle : natural := 65;
  constant cInResetDuration            : time    := 140 ns;
  constant cDivideBy                   : natural := 6;


  -- component ports
  signal Clk         : std_ulogic;
  signal nResetAsync : std_ulogic;
  signal DivdClk     : std_ulogic;

begin  -- architecture Bhv

  -- component instantiation
  DUT : entity work.FreqDivider
    generic map (
      gDivideBy => cDivideBy)
    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,
      oDivdClk     => DivdClk);

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
