--------------------------------------------------------------------------------
-- Title       : Testbench for design "ParToWav"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbParToWav-Bhv-ea.vhd 704 2017-10-27 19:25:59Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : After the input wave is at its end the unit will write
--               additional samples into the WavOutFile. This is only done with
--               valid samples (i.e. the valid line has to be activated to flag
--               the sample valid).
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.Global.all;
use work.RiffFileTreatment.all;

entity tbParToWav is
end tbParToWav;

architecture Bhv of tbParToWav is

  -- component generics
  constant cClkFrequency               : natural := cDefaultClkFrequency;
  constant cIsLowPercentageOfDutyCycle : natural := 50;
  constant cInResetDuration            : time    := 1 ns;
  constant cMclkFrequency              : natural := 12E6;
  constant cSampleRate                 : natural := cDefaultSampleRate;
  constant cAudioBitWidth              : natural := cDefaultAudioBitWidth;

  constant cDryWavFileName    : string := "../../../../sounds/Wobble10Hz22050Hz100ms.wav";
  constant cWetWavFileName    : string := "WetWobble10Hz22050Hz100ms.wav";
  constant cWetRawWavFileName : string := "SinkRawFile.raw";

  constant cRecordingDurationAftWaveEnd : time := 100 us;

  signal Clk         : std_ulogic;
  signal nResetAsync : std_ulogic;
  signal DL, DR      : aAudioData(0 downto -(cAudioBitWidth-1));
  signal ValL, ValR  : std_ulogic;
  signal WaveAtEnd   : boolean := false;
  signal ADClrc      : std_ulogic;
  signal Mclk        : std_ulogic;
  signal Bclk        : std_ulogic;
  signal Lrc         : std_ulogic;

begin

  TheWavToPar : entity work.WavToPar
    generic map (
      gWaveFileName  => cDryWavFileName,
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

  DUT : entity work.ParToWav
    generic map (
      gWavFileName                 => cWetWavFileName,
      gRawWavFileName              => cWetRawWavFileName,
      gRecordingDurationAftWaveEnd => cRecordingDurationAftWaveEnd,
      gFormatTag                   => open,
      gAudioBitWidth               => open,
      gChannels                    => open,
      gSampleRate                  => cDefaultSampleRate)
    port map (
      iClk       => Clk,
      iDL        => DL,
      iDR        => DR,
      iValL      => ValL,
      iValR      => ValR,
      iWaveAtEnd => WaveAtEnd);

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


end Bhv;
