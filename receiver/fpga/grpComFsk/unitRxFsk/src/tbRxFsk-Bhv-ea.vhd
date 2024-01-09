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
use work.DefinitionsFsk.all;

entity tbRxFsk is
end entity tbRxFsk;

architecture Bhv of tbRxFsk is

  constant cPhaseResolution   : natural := 20-1;

  --constant cChannel4Frequency0 : real := 7237.9453125000;
  constant cChannel4PhaseInc0  : natural := natural(real(2**cPhaseResolution) * 0.328125);
  --constant cChannel4Frequency1 : real := 12063.2421875000;
  constant cChannel4PhaseInc1  : natural := natural(real(2**cPhaseResolution) * 0.546875);
  --constant cChannel7Frequency0 : real := 7927.2734375000;
  constant cChannel7PhaseInc0  : natural := natural(real(2**cPhaseResolution) * 0.359375);
  --constant cChannel7Frequency1 : real := 12752.5703125000;
  constant cChannel7PhaseInc1  : natural := natural(real(2**cPhaseResolution) * 0.578125);

  constant cSampleTime : time := (1e9 / cDefaultSampleRate) * 1 ns;

  signal Clk : std_ulogic := '0';
  signal nResetAsync : std_ulogic;

  type aInputSelect is (None, Channel4Val0, Channel4Val1, Channel7Val0, Channel7Val1);

  signal Channel4B0 : aAudioData(0 downto -(cDefaultAudioBitWidth-1));
  signal Channel4B1 : aAudioData(0 downto -(cDefaultAudioBitWidth-1));
  signal Channel7B0 : aAudioData(0 downto -(cDefaultAudioBitWidth-1));
  signal Channel7B1 : aAudioData(0 downto -(cDefaultAudioBitWidth-1));

  signal Channel4B0DdsOut : aAudioData(0 downto -(cDefaultAudioBitWidth-1));
  signal Channel4B0DdsVal : std_ulogic;
  signal Channel4B1DdsOut : aAudioData(0 downto -(cDefaultAudioBitWidth-1));
  signal Channel4B1DdsVal : std_ulogic;
  signal Channel7B0DdsOut : aAudioData(0 downto -(cDefaultAudioBitWidth-1));
  signal Channel7B0DdsVal : std_ulogic;
  signal Channel7B1DdsOut : aAudioData(0 downto -(cDefaultAudioBitWidth-1));
  signal Channel7B1DdsVal : std_ulogic;

  signal InputSelect : aInputSelect := None;
  signal ChannelSelect : integer := 0;
  signal Input : aAudioData(0 downto -(cDefaultAudioBitWidth-1));
  signal Output : std_ulogic;
  signal SampleStrobe : std_ulogic;

begin

  Verify: process

    constant cWaitSamples : positive := 300;

  begin
    -- No input
    wait for cSampleTime * 10;
    ChannelSelect <= 4;
    wait for cSampleTime * 10;
    ChannelSelect <= 7;
    wait for cSampleTime * 10;
    ChannelSelect <= 0;

    -- input channel 7, 0
    InputSelect <= Channel7Val0;
    wait for cSampleTime * 10;
    ChannelSelect <= 4;
    wait for cSampleTime * cWaitSamples;
    ChannelSelect <= 7;
    wait for cSampleTime * cWaitSamples;
    ChannelSelect <= 0;

    -- input channel 7, 1
    InputSelect <= Channel7Val1;
    wait for cSampleTime * 10;
    ChannelSelect <= 4;
    wait for cSampleTime * cWaitSamples;
    ChannelSelect <= 7;
    wait for cSampleTime * cWaitSamples;
    ChannelSelect <= 0;

    -- input channel 4, 0
    InputSelect <= Channel4Val0;
    wait for cSampleTime * 10;
    ChannelSelect <= 4;
    wait for cSampleTime * cWaitSamples;
    ChannelSelect <= 7;
    wait for cSampleTime * cWaitSamples;
    ChannelSelect <= 0;

    -- input channel 4, 1
    InputSelect <= Channel4Val1;
    wait for cSampleTime * 10;
    ChannelSelect <= 4;
    wait for cSampleTime * cWaitSamples;
    ChannelSelect <= 7;
    wait for cSampleTime * cWaitSamples;
    ChannelSelect <= 0;

    wait;
  end process Verify;

  SelectInput: Input <=
    Channel4B0 when InputSelect = Channel4Val0 else
    Channel4B1 when InputSelect = Channel4Val1 else
    Channel7B0 when InputSelect = Channel7Val0 else
    Channel7B1 when InputSelect = Channel7Val1 else
    to_sfixed(0, Input);

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

  TheRxFsk: entity work.RxFsk
    generic map (
      gClkFrequency      => cDefaultClkFrequency,
      gAudioBitWidth     => cDefaultAudioBitWidth,
      gSampleRate        => cDefaultSampleRate,
      gCoefWidth         => cFskFilterCoefWidth
    )
    port map (
      inResetAsync   => nResetAsync,
      iClk           => Clk,
      iChannelSelect => ChannelSelect,
      iVal           => SampleStrobe,
      iD             => Input,
      oD             => Output
    );

    GenSampleStrobe: entity work.StrobeGen
    generic map (
      gClkFrequency    => cDefaultClkFrequency,
      gStrobeFrequency => cDefaultSampleRate
    )
    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,
      oStrobe      => SampleStrobe
    );

    DDsSinC4B0: entity work.DspDds(Rtl)
      port map (
        iClk            => Clk,
        inResetAsync    => nResetAsync,
        iPhaseIncrement => cChannel4PhaseInc0,
        iSampleStrobe   => SampleStrobe,
        oVal            => Channel4B0DdsVal,
        oD              => Channel4B0DdsOut
      );

    Channel4B0 <= Channel4B0DdsOut when Channel4B0DdsVal = cActivated and rising_edge(Clk);

    DDsSinC4B1: entity work.DspDds(Rtl)
      port map (
        iClk            => Clk,
        inResetAsync    => nResetAsync,
        iPhaseIncrement => cChannel4PhaseInc1,
        iSampleStrobe   => SampleStrobe,
        oVal            => Channel4B1DdsVal,
        oD              => Channel4B1DdsOut
      );

    Channel4B1 <= Channel4B1DdsOut when Channel4B1DdsVal = cActivated and rising_edge(Clk);

    DDsSinC7B0: entity work.DspDds(Rtl)
      port map (
        iClk            => Clk,
        inResetAsync    => nResetAsync,
        iPhaseIncrement => cChannel7PhaseInc0,
        iSampleStrobe   => SampleStrobe,
        oVal            => Channel7B0DdsVal,
        oD              => Channel7B0DdsOut
      );

    Channel7B0 <= Channel7B0DdsOut when Channel7B0DdsVal = cActivated and rising_edge(Clk);

    DDsSinC7B1: entity work.DspDds(Rtl)
      port map (
        iClk            => Clk,
        inResetAsync    => nResetAsync,
        iPhaseIncrement => cChannel7PhaseInc1,
        iSampleStrobe   => SampleStrobe,
        oVal            => Channel7B1DdsVal,
        oD              => Channel7B1DdsOut
      );

    Channel7B1 <= Channel7B1DdsOut when Channel7B1DdsVal = cActivated and rising_edge(Clk);

end architecture Bhv;