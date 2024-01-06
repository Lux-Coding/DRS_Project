--------------------------------------------------------------------------------
-- Title       : Testbench for design "TxFsk"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbDspDly-Bhv-ea.vhd 711 2017-11-03 18:22:43Z mroland $
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

entity tbTxFsk is
end tbTxFsk;

--------------------------------------------------------------------------------

architecture Bhv of tbTxFsk is

  -- component generics
  constant cClkFrequency               : natural := cDefaultClkFrequency;
  constant cIsLowPercentageOfDutyCycle : natural := 65;
  constant cInResetDuration            : time    := 140 ns;
  constant cMclkFrequency              : natural := 12E6;
  constant cSampleRate                 : natural := cDefaultSampleRate;
  constant cAudioBitWidth              : natural := cDefaultAudioBitWidth;

  constant cWetWavFileName : string := "WetWavFile.wav";
  constant cWetRawWavFileName : string := "WetRawFile.raw";
  constant cRecordingDurationAftWaveEnd : time := 550 ms;

  signal Clk         : std_ulogic;
  signal nResetAsync : std_ulogic;
  signal DwetL   : aAudioData(0 downto -(cAudioBitWidth-1));
  signal DwetR   : aAudioData(0 downto -(cAudioBitWidth-1));
  signal ValWetL    : std_ulogic;
  signal ValWetR    : std_ulogic;
  signal WaveAtEnd : boolean := false;
  signal ADClrc    : std_ulogic;
  signal Mclk      : std_ulogic;
  signal Bclk      : std_ulogic;
  signal Lrc       : std_ulogic;

  constant cStreamLen                  : natural := 100;
  constant cIndexChange                : natural := 25; 
  constant cStream                     : std_ulogic_vector (1 to cStreamLen) := "0000000000000000000000000000000000000000000000000011111111111111111111111111111111111111111111111111";
  constant cChannelselect               : natural := 0;
  signal Index                         : natural range 1 to cStreamLen := 1;
  signal IndexCnt                      : natural range 1 to cStreamLen := 1;
  signal DataBit                       : std_ulogic;
  signal PhaseStrobeL          : std_ulogic;
  signal PhaseStrobeR          : std_ulogic;
  signal oldADClrc            : std_ulogic;

begin


  RegAdclrc: process(Clk, nResetAsync)
	begin
		if nResetAsync = cnActivated then
			Index <= 1;
      DataBit <= '0';
      oldADClrc <= '0';
		elsif Clk'event and Clk = cActivated then
			Index <= Index;	
      oldADClrc <= ADClrc;	
			if PhaseStrobeL = '1' then 
        if IndexCnt + 1 > cIndexChange then 
          IndexCnt <= 1;
          if Index + 1 > cStreamLen then
            Index <= 1;
          else
            Index <= Index + 1;
          end if;
          DataBit <= cStream(Index);
        else
          IndexCnt <= IndexCnt + 1;
        end if;
      end if;
		end if;
	end process;

  PhaseStrobeL <= '1' when (ADClrc = '1') and (oldADClrc = '0') else '0';
  PhaseStrobeR <= '1' when (ADClrc = '0') and (oldADClrc = '1') else '0';

  -- DUT:
  DUT_L : entity work.TxFsk
    generic map (
      gClkFrequency  => cClkFrequency,
      gAudioBitWidth => cAudioBitWidth,
      gSampleRate    => cSampleRate)

    port map (
      iClk            => Clk,
      inResetAsync    => nResetAsync,
      iChannelSelect  => 0,
      iD              => DataBit,
      iSampleStrobe   => PhaseStrobeL,
      oVal            => ValWetL,
      oD              => DwetL);

  -- DUT:
  DUT_R : entity work.TxFsk
    generic map (
      gClkFrequency  => cClkFrequency,
      gAudioBitWidth => cAudioBitWidth,
      gSampleRate    => cSampleRate)

    port map (
      iClk            => Clk,
      inResetAsync    => nResetAsync,
      iChannelSelect  => 1,
      iD              => DataBit,
      iSampleStrobe   => PhaseStrobeR,
      oVal            => ValWetR,
      oD              => DwetR);

  
  WaveAtEnd <= true after 50 ms;

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
      iDL        => DwetL,
      iDR        => DwetR,
      iValL      => ValWetL,
      iValR      => ValWetR,
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
