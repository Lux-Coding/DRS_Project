--------------------------------------------------------------------------------
-- Title       : Testbench for design "TbdDspDds"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbTbdDspDds-Bhv-ea.vhd 826 2019-10-30 20:36:03Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

-- fixed_pkg resides in the library ieee since VHDL-2008 (QuestaSim backports
-- this to VHDL-93 too). However, Quartus (as of version 13.0sp1) still does
-- not have native support for ieee.fixed_pkg. Therefore, we provide the
-- VHDL-93 compatibility versions as part of this excercise. These must be
-- compiled into the are located in the library ieee_proposed. Include them in
-- your Config.tcl and don't forget to set the ExtraLibraries and TargetLibrary
-- parameters to compile them into the right library (ieee_proposed) with fhlow.
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;
-- In future (when both QuestaSim and Quartus support the VHDL-2008
-- ieee.fixed_pkg) simply use:
--use ieee.fixed_float_types.all;
--use ieee.fixed_pkg.all;

use work.Global.all;

--------------------------------------------------------------------------------

entity tbTbdDspDds is
end tbTbdDspDds;

--------------------------------------------------------------------------------

architecture Bhv of tbTbdDspDds is

  -- component generics
  constant cClkFrequency               : natural := cDefaultClkFrequency;
  constant cIsLowPercentageOfDutyCycle : natural := 65;
  constant cInResetDuration            : time    := 140 ns;
  constant cMclkFrequency              : natural := 12E6;
  constant cSampleRate                 : natural := cDefaultSampleRate;
  constant cAudioBitWidth              : natural := cDefaultAudioBitWidth;
  constant cPhaseResolution            : natural := 25;
  constant cNrOfPhaseDitherBits        : natural := 0; --15;
  constant cWaveTableBitWidth          : natural := 14;

  constant cWavName : string := "d50org";

  constant cDryWavFileName : string := "../../../../sounds/" & cWavName & ".wav";
  constant cWetWavFileName : string := "Wet" & cWavName & ".wav";
  constant cWetRawWavFileName : string := "SinkRawFile.raw";

  constant cRecordingDurationAftWaveEnd : time := 100 us;

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

  signal Dwet                 : aAudioData(0 downto -(cAudioBitWidth-1));
  signal LastDwetL, LastDwetR : aAudioData(0 downto -(cAudioBitWidth-1));
  signal ValWetL, ValWetR     : std_ulogic;
  signal WaveAtEnd            : boolean := false;

begin  -- architecture Bhv

  I2cSclk <= 'H';
  I2cSdin <= 'H';

  ------------------------------------------------------------------------------
  -- Read .wav file and output to I2S format
  ------------------------------------------------------------------------------
  TheWavToI2s : entity work.WavToI2s
    generic map (
      gWaveFileName  => cDryWavFileName,
      gSampleRate    => cSampleRate,
      gAudioBitWidth => cAudioBitWidth)
    port map (
      iClk       => Clk,
      iLrc       => ADClrc,
      iBclk      => Bclk,
      oSd        => ADCdat,
      oWaveAtEnd => WaveAtEnd);

  ------------------------------------------------------------------------------
  -- DUT
  ------------------------------------------------------------------------------
  DUT : entity work.TbdDspDds
    generic map (
      gClkFrequency        => cClkFrequency,
      gAudioBitWidth       => cAudioBitWidth,
      gSampleRate          => cSampleRate,
      gPhaseResolution     => cPhaseResolution,
      gNrOfPhaseDitherBits => cNrOfPhaseDitherBits,
      gWaveTableBitWidth   => cWaveTableBitWidth)
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


  ------------------------------------------------------------------------------
  -- Convert I2S to par and write .wav file
  ------------------------------------------------------------------------------
  TheI2sToPar : entity work.I2sToPar
    generic map (
      gAudioBitWidth => cAudioBitWidth)
    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,
      iBclk        => Bclk,
      iLrc         => DAClrc,
      iSd          => DACdat,
      oD           => Dwet,
      oValL        => ValWetL,
      oValR        => ValWetR);

  LastDwetL <= Dwet when ValWetL = cActivated and rising_edge(Clk);
  LastDwetR <= Dwet when ValWetR = cActivated and rising_edge(Clk);

  TheParToWav : entity work.ParToWav
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
      iDL        => Dwet,
      iDR        => Dwet,
      iValL      => ValWetL,
      iValR      => ValWetR,
      iWaveAtEnd => WaveAtEnd);

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
