--------------------------------------------------------------------------------
-- Title       : Testbench for design "RectGen"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbRectGen-Bhv-ea.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

use work.Global.all;

--------------------------------------------------------------------------------

entity tbRectGen is
end entity tbRectGen;

--------------------------------------------------------------------------------

architecture Bhv of tbRectGen is

  -- component generics
  constant cClkFrequency               : natural := 48E6;
  constant cIsLowPercentageOfDutyCycle : natural := 65;
  constant cInResetDuration            : time    := 140 ns;
  constant cMclkFrequency              : natural := 12E6;
  constant cSampleRate                 : natural := 44117;
  constant cGenFrequency               : natural := 440;
  constant cAudioBitWidth              : natural := 16;


  -- component ports
  signal Clk         : std_ulogic;
  signal nResetAsync : std_ulogic;
  signal Lrc         : std_ulogic;
  signal Bclk        : std_ulogic;
  signal Mclk        : std_ulogic;
  signal Val         : std_ulogic;
  signal D           : aAudioData(0 downto -(cAudioBitWidth-1));

begin  -- architecture Bhv

  DUT : entity work.RectGen
    generic map (
      gClkFrequency  => cClkFrequency,
      gGenFrequency  => cGenFrequency,
      gAudioBitWidth => cAudioBitWidth)
    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,
      iLrc         => Lrc,
      oVal         => Val,
      oD           => D);

  TheClkMaster : entity work.ClkMaster
    generic map (
      gClkFrequency  => cClkFrequency,
      gMclkFrequency => cMclkFrequency,
      gSampleRate    => cSampleRate)
    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,
      oMclk        => Mclk,
      oBclk        => Bclk,
      oADClrc      => Lrc);

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
