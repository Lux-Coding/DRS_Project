--------------------------------------------------------------------------------
-- Title       : Testbench for design "WavToPar"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbWavToPar-Bhv-ea.vhd 704 2017-10-27 19:25:59Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.Global.all;
use work.RiffFileTreatment.all;

entity tbWavToPar is
end tbWavToPar;

architecture Struct of tbWavToPar is

  -- component generics
  constant cClkFrequency               : natural := cDefaultClkFrequency;
  constant cIsLowPercentageOfDutyCycle : natural := 65;
  constant cInResetDuration            : time    := 140 ns;
  constant cMclkFrequency              : natural := 12E6;
  constant cSampleRate                 : natural := cDefaultSampleRate;
  constant cAudioBitWidth              : natural := cDefaultAudioBitWidth;
  constant cWaveFileName               : string  := "../../../../sounds/SinusStereo440Hz.wav";


  signal Clk         : std_ulogic;
  signal nResetAsync : std_ulogic;
  signal DL, DR      : aAudioData(0 downto -(cAudioBitWidth-1));
  signal ValL, ValR  : std_ulogic;
  signal SampleRate  : aDword;
  signal WaveAtEnd   : boolean := false;
  signal ADClrc      : std_ulogic;
  signal Mclk        : std_ulogic;
  signal Bclk        : std_ulogic;
  signal Lrc         : std_ulogic;
  signal Sd          : std_ulogic;

begin

  DUT : entity work.WavToPar
    generic map (
      gWaveFileName  => cWaveFileName,
      gSampleRate    => cSampleRate,
      gAudioBitWidth => cAudioBitWidth)
    port map (
      iClk       => Clk,
      oDL        => DL,
      oDR        => DR,
      oValL      => ValL,
      oValR      => ValR,
      oWaveAtEnd => WaveAtEnd,
      iLrc       => ADClrc);

  TheParToI2s: entity work.ParToI2s
    generic map (
      gAudioBitWidth => cAudioBitWidth)
    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,
      iDL          => DL,
      iDR          => DR,
      iValL        => ValL,
      iValR        => ValR,
      iBclk        => Bclk,
      oLrc         => Lrc,
      oSd          => Sd);

  GenClks : entity work.ClkMaster
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

  -- reset generation
  PwrOnResetSource : entity work.PwrOnReset
    generic map (
      gInResetDuration => cInResetDuration,
      gResetLevel      => cResetActive)
    port map (
      onResetAsync => nResetAsync);

end Struct;
