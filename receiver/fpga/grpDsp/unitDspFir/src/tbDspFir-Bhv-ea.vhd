library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- fixed_pkg resides in the library ieee since VHDL-2008 (QuestaSim backports
-- this to VHDL-93 too). However, Quartus (as of version 13.0sp1) still does
-- not have native support for ieee.fixed_pkg. Therefore, we provide the
-- VHDL-93 compatibility versions as part of this excercise. These must be
-- compiled into the are located in the library ieee_proposed. Include them in
-- your Config.tcl and don't forget to set the ExtraLibraries and TargetLibrary
-- parameters to compile them into the right library (ieee_proposed) with fhlow.
library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
-- In future (when both QuestaSim and Quartus support the VHDL-2008
-- ieee.fixed_pkg) simply use:
--use ieee.fixed_float_types.all;
--use ieee.fixed_pkg.all;

use work.global.all;

entity tbDspFir is
end entity tbDspFir;

architecture Bhv of tbDspFir is

  signal Clk : std_ulogic := '0';
  signal nResetAsync : std_ulogic;

  signal Ddry : aAudioData(0 downto -(cDefaultAudioBitWidth-1));
  signal Dwet : aAudioData(0 downto -(cDefaultAudioBitWidth-1));
  signal ValDry : std_ulogic;
  signal ValWet : std_ulogic;
  signal Lrc    : std_ulogic;
  signal WaveAtEnd : boolean;
  signal Mclk : std_ulogic;
  signal Bclk : std_ulogic;
  signal LastDwet : aAudioData(0 downto -(cDefaultAudioBitWidth-1));

begin

TheReset: entity work.PwrOnReset
  generic map (
    gInResetDuration => 150 ns,
    gResetLevel      => cResetActive
  )
  port map (
    onResetAsync => nResetAsync
  );

  Oscillator: entity work.Oscillator
    generic map (
      gFrequency                  => cDefaultClkFrequency,
      gIsLowPercentageOfDutyCycle => 50
    )
    port map (
      oRectangleWave => Clk
    );

  DUT: entity work.DspFir
    generic map (
      gAudioBitWidth => cDefaultAudioBitWidth,
      gCoefWidth     => cDefaultAudioBitWidth
    )
    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,
      iDdry        => Ddry,
      iValDry      => ValDry,
      oDwet        => Dwet,
      oValWet      => ValWet
    );

    TheClockMaster: entity work.ClkMaster
      generic map (
        gClkFrequency  => cDefaultClkFrequency,
        gMclkFrequency => 12e6,
        gSampleRate    => cDefaultSampleRate
      )
      port map (
        iClk         => Clk,
        inResetAsync => nResetAsync,
        oMclk        => Mclk,
        oBclk        => Bclk,
        oADClrc      => Lrc
      );

    TheWavToPar: entity work.WavToPar
      generic map (
        gWaveFileName  => "../../../../sounds/Wobble100Hz20kHz100ms.wav",
        gSampleRate    => cDefaultSampleRate,
        gAudioBitWidth => cDefaultAudioBitWidth
      )
      port map (
        iClk       => Clk,
        oDL        => Ddry,
        oValL      => ValDry,
        iLrc       => Lrc,
        oWaveAtEnd => WaveAtEnd
      );

  LastDwet <= Dwet when ValWet = cActivated and rising_edge(Clk);

end architecture Bhv;