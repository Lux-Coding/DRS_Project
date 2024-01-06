--------------------------------------------------------------------------------
-- Title       : Parameter sets for audio codec (Wolfson WM8731 and compatible)
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: ParamCodec-p.vhd 664 2017-09-26 19:39:57Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : As a user of this project you may adapt the settings made in
--               this file while avoiding the risk of destroying functionality
--               or introducing errors to the model.
--               The parameter configurations have to be valid of course. Be
--               aware that severe damage to the hardware may result from bad
--               parameter configurations.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Global.all;
use work.DefinitionsCodec.all;

package ParamCodec is

  -----------------------------------------------------------------------------
  -- Parameters of the codec that may be adapted by the user.
  -----------------------------------------------------------------------------
  -- The number of parameter sets is given by the number of elements of the
  -- type defined after this comment. Every parameter set is given a unique
  -- name which is one of the elements of the type.
  -- You may change the number of parameter sets if needed. Just add another
  -- Element in the type definition and add another parameter set in the
  -- definition of the constant cParamSets below.
  type aParamSetName is (
    MicroOverSidetone,
    LineOverBypass,
    MicroSlaveSampleRate44k1,
    LineSlaveSampleRate44k1,
    MicroMasterSampleRate44k1,
    LineMasterSampleRate44k1,
    UnusedSet6,
    UnusedSet7,
    UnusedSet8,
    UnusedSet9);

  -- All parameter sets are kept in one rather complex constant. The single
  -- parameters in that constant are sorted by a hierarchy of records.
  -- A parameter set is choosen by via a single generic. This generic is
  -- addressing the paramter set by name.
  type     aParamSets is array (aParamSetName) of aCodecRegSet;
  constant cParamSets : aParamSets :=
    (
      ---------------------------------
      MicroOverSidetone              =>
      ---------------------------------
      (
        Reg0                         =>
        (
          LineLeftRightSimul         => cSimulLineVolUpdateDisabled,
          LineLeftMute               => cLineInputMuted,
          LineLeftVol                => -34.5
          ),
        Reg1                         =>
        (
          LineRightLeftSimul         => cSimulLineVolUpdateDisabled,
          LineRightMute              => cLineInputMuted,
          LineRightVol               => -34.5
          ),
        Reg2                         =>
        (
          PhonesLeftRightSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesLeftZeroCrossDetect  => cZeroCrossDetectOff,
          PhonesLeftVol              => 0
          ),
        Reg3                         =>
        (
          PhonesRightLeftSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesRightZeroCrossDetect => cZeroCrossDetectOff,
          PhonesRightVol             => 0
          ),
        Reg4                         =>
        (
          SidetoneAttenuation        => -6,
          SidetoneEnable             => cSidetoneEnabled,
          DacSelect                  => cDacOff,
          AnalogBypass               => cAnalogBypassDisabled,
          AdcInputSelect             => cAdcInputMicroSelected,
          MicroMute                  => cMicroMuted,
          MicroBoost                 => cMicroNoBoost
          ),
        Reg5                         =>
        (
          HPOR                       => cHPORClearOffset,
          DacSoftMute                => cDacSoftMuteEnabled,
          Deemphasis                 => cDeemphasisDisabled,
          AdcHighpassFilter          => cAdcHighpassFilterDisabled
          ),
        Reg6                         =>
        (
          DevicePower                => cPowerOn,
          ClkPower                   => cPowerOff,
          OscillatorPower            => cPowerOff,
          OutputsPower               => cPowerOn,
          DacPower                   => cPowerOff,
          AdcPower                   => cPowerOff,
          MicroPower                 => cPowerOn,
          LinePower                  => cPowerOff
          ),
        Reg7                         =>
        (
          BclkInvert                 => cDontInvertBlck,
          MasterSlaveMode            => cIsSlave,  -- cIsSlave is the secure setting!
          DacLeftRightSwap           => cDontSwapLeftRight,
          LeftRightPhase             => cLrcinHighOrDspMode1stBlck,
          InputBitLength             => BitWidthToCodecBitLengthSetting(cDefaultAudioBitWidth),
          DataFormat                 => cI2s
          ),
        Reg8                         =>
        (
          ClockOutputDivider         => cUseMclk,
          ClockInputDivider          => cUseMclk,
          CodecSampleRate            => cAdc44117Dac44117
          ),
        Reg9                         =>
        (
          InterfaceActivation        => cInterfaceActivated
          )
        ),
      ---------------------------------
      LineOverBypass                 =>
      ---------------------------------
      (
        Reg0                         =>
        (
          LineLeftRightSimul         => cSimulLineVolUpdateDisabled,
          LineLeftMute               => cLineInputMuted,
          LineLeftVol                => 12.0
          ),
        Reg1                         =>
        (
          LineRightLeftSimul         => cSimulLineVolUpdateDisabled,
          LineRightMute              => cLineInputMuted,
          LineRightVol               => 12.0
          ),
        Reg2                         =>
        (
          PhonesLeftRightSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesLeftZeroCrossDetect  => cZeroCrossDetectOff,
          PhonesLeftVol              => 0
          ),
        Reg3                         =>
        (
          PhonesRightLeftSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesRightZeroCrossDetect => cZeroCrossDetectOff,
          PhonesRightVol             => 0
          ),
        Reg4                         =>
        (
          SidetoneAttenuation        => -15,
          SidetoneEnable             => cSidetoneDisabled,
          DacSelect                  => cDacOff,
          AnalogBypass               => cAnalogBypassEnabled,
          AdcInputSelect             => cAdcInputLineSelected,
          MicroMute                  => cMicroMuted,
          MicroBoost                 => cMicroNoBoost
          ),
        Reg5                         =>
        (
          HPOR                       => cHPORClearOffset,
          DacSoftMute                => cDacSoftMuteEnabled,
          Deemphasis                 => cDeemphasisDisabled,
          AdcHighpassFilter          => cAdcHighpassFilterDisabled
          ),
        Reg6                         =>
        (
          DevicePower                => cPowerOn,
          ClkPower                   => cPowerOff,
          OscillatorPower            => cPowerOff,
          OutputsPower               => cPowerOn,
          DacPower                   => cPowerOff,
          AdcPower                   => cPowerOff,
          MicroPower                 => cPowerOff,
          LinePower                  => cPowerOn
          ),
        Reg7                         =>
        (
          BclkInvert                 => cDontInvertBlck,
          MasterSlaveMode            => cIsSlave,  -- cIsSlave is the secure setting!
          DacLeftRightSwap           => cDontSwapLeftRight,
          LeftRightPhase             => cLrcinHighOrDspMode1stBlck,
          InputBitLength             => BitWidthToCodecBitLengthSetting(cDefaultAudioBitWidth),
          DataFormat                 => cI2s
          ),
        Reg8                         =>
        (
          ClockOutputDivider         => cUseMclk,
          ClockInputDivider          => cUseMclk,
          CodecSampleRate            => cAdc44117Dac44117
          ),
        Reg9                         =>
        (
          InterfaceActivation        => cInterfaceActivated
          )
        ),
      ---------------------------------
      MicroSlaveSampleRate44k1       =>
      ---------------------------------
      (
        Reg0                         =>
        (
          LineLeftRightSimul         => cSimulLineVolUpdateDisabled,
          LineLeftMute               => cLineInputMuted,
          LineLeftVol                => -34.5
          ),
        Reg1                         =>
        (
          LineRightLeftSimul         => cSimulLineVolUpdateDisabled,
          LineRightMute              => cLineInputMuted,
          LineRightVol               => -34.5
          ),
        Reg2                         =>
        (
          PhonesLeftRightSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesLeftZeroCrossDetect  => cZeroCrossDetectOff,
          PhonesLeftVol              => 0
          ),
        Reg3                         =>
        (
          PhonesRightLeftSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesRightZeroCrossDetect => cZeroCrossDetectOff,
          PhonesRightVol             => 0
          ),
        Reg4                         =>
        (
          SidetoneAttenuation        => -15,
          SidetoneEnable             => cSidetoneDisabled,
          DacSelect                  => cDacSelected,
          AnalogBypass               => cAnalogBypassDisabled,
          AdcInputSelect             => cAdcInputMicroSelected,
          MicroMute                  => cMicroUnmuted,
          MicroBoost                 => cMicroNoBoost
          ),
        Reg5                         =>
        (
          HPOR                       => cHPORClearOffset,
          DacSoftMute                => cDacSoftMuteDisabled,
          Deemphasis                 => cDeemphasisDisabled,
          AdcHighpassFilter          => cAdcHighpassFilterDisabled
          ),
        Reg6                         =>
        (
          DevicePower                => cPowerOn,
          ClkPower                   => cPowerOff,
          OscillatorPower            => cPowerOff,
          OutputsPower               => cPowerOn,
          DacPower                   => cPowerOn,
          AdcPower                   => cPowerOn,
          MicroPower                 => cPowerOn,
          LinePower                  => cPowerOff
          ),
        Reg7                         =>
        (
          BclkInvert                 => cDontInvertBlck,
          MasterSlaveMode            => cIsSlave,  -- cIsSlave is the secure setting!
          DacLeftRightSwap           => cDontSwapLeftRight,
          LeftRightPhase             => cLrcinHighOrDspMode1stBlck,
          InputBitLength             => BitWidthToCodecBitLengthSetting(cDefaultAudioBitWidth),
          DataFormat                 => cI2s
          ),
        Reg8                         =>
        (
          ClockOutputDivider         => cUseMclk,
          ClockInputDivider          => cUseMclk,
          CodecSampleRate            => cAdc44117Dac44117
          ),
        Reg9                         =>
        (
          InterfaceActivation        => cInterfaceActivated
          )
        ),
      ---------------------------------
      LineSlaveSampleRate44k1        =>
      ---------------------------------
      (
        Reg0                         =>
        (
          LineLeftRightSimul         => cSimulLineVolUpdateDisabled,
          LineLeftMute               => cLineInputUnmuted,
          LineLeftVol                => 12.0
          ),
        Reg1                         =>
        (
          LineRightLeftSimul         => cSimulLineVolUpdateDisabled,
          LineRightMute              => cLineInputUnmuted,
          LineRightVol               => 12.0
          ),
        Reg2                         =>
        (
          PhonesLeftRightSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesLeftZeroCrossDetect  => cZeroCrossDetectOff,
          PhonesLeftVol              => 0
          ),
        Reg3                         =>
        (
          PhonesRightLeftSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesRightZeroCrossDetect => cZeroCrossDetectOff,
          PhonesRightVol             => 0
          ),
        Reg4                         =>
        (
          SidetoneAttenuation        => -15,
          SidetoneEnable             => cSidetoneDisabled,
          DacSelect                  => cDacSelected,
          AnalogBypass               => cAnalogBypassDisabled,
          AdcInputSelect             => cAdcInputLineSelected,
          MicroMute                  => cMicroMuted,
          MicroBoost                 => cMicroNoBoost
          ),
        Reg5                         =>
        (
          HPOR                       => cHPORClearOffset,
          DacSoftMute                => cDacSoftMuteDisabled,
          Deemphasis                 => cDeemphasisDisabled,
          AdcHighpassFilter          => cAdcHighpassFilterDisabled
          ),
        Reg6                         =>
        (
          DevicePower                => cPowerOn,
          ClkPower                   => cPowerOff,
          OscillatorPower            => cPowerOff,
          OutputsPower               => cPowerOn,
          DacPower                   => cPowerOn,
          AdcPower                   => cPowerOn,
          MicroPower                 => cPowerOff,
          LinePower                  => cPowerOn
          ),
        Reg7                         =>
        (
          BclkInvert                 => cDontInvertBlck,
          MasterSlaveMode            => cIsSlave,  -- cIsSlave is the secure setting!
          DacLeftRightSwap           => cDontSwapLeftRight,
          LeftRightPhase             => cLrcinHighOrDspMode1stBlck,
          InputBitLength             => BitWidthToCodecBitLengthSetting(cDefaultAudioBitWidth),
          DataFormat                 => cI2s
          ),
        Reg8                         =>
        (
          ClockOutputDivider         => cUseMclk,
          ClockInputDivider          => cUseMclk,
          CodecSampleRate            => cAdc44117Dac44117
          ),
        Reg9                         =>
        (
          InterfaceActivation        => cInterfaceActivated
          )
        ),
      ---------------------------------
      MicroMasterSampleRate44k1      =>
      ---------------------------------
      (
        Reg0                         =>
        (
          LineLeftRightSimul         => cSimulLineVolUpdateDisabled,
          LineLeftMute               => cLineInputMuted,
          LineLeftVol                => -34.5
          ),
        Reg1                         =>
        (
          LineRightLeftSimul         => cSimulLineVolUpdateDisabled,
          LineRightMute              => cLineInputMuted,
          LineRightVol               => -34.5
          ),
        Reg2                         =>
        (
          PhonesLeftRightSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesLeftZeroCrossDetect  => cZeroCrossDetectOff,
          PhonesLeftVol              => 0
          ),
        Reg3                         =>
        (
          PhonesRightLeftSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesRightZeroCrossDetect => cZeroCrossDetectOff,
          PhonesRightVol             => 0
          ),
        Reg4                         =>
        (
          SidetoneAttenuation        => -15,
          SidetoneEnable             => cSidetoneDisabled,
          DacSelect                  => cDacSelected,
          AnalogBypass               => cAnalogBypassDisabled,
          AdcInputSelect             => cAdcInputMicroSelected,
          MicroMute                  => cMicroUnmuted,
          MicroBoost                 => cMicroNoBoost
          ),
        Reg5                         =>
        (
          HPOR                       => cHPORClearOffset,
          DacSoftMute                => cDacSoftMuteDisabled,
          Deemphasis                 => cDeemphasisDisabled,
          AdcHighpassFilter          => cAdcHighpassFilterDisabled
          ),
        Reg6                         =>
        (
          DevicePower                => cPowerOn,
          ClkPower                   => cPowerOff,
          OscillatorPower            => cPowerOff,
          OutputsPower               => cPowerOn,
          DacPower                   => cPowerOn,
          AdcPower                   => cPowerOn,
          MicroPower                 => cPowerOn,
          LinePower                  => cPowerOff
          ),
        Reg7                         =>
        (
          BclkInvert                 => cDontInvertBlck,
          MasterSlaveMode            => cIsMaster,  -- cIsMaster IS THE *INSECURE* SETTING
          DacLeftRightSwap           => cDontSwapLeftRight,
          LeftRightPhase             => cLrcinHighOrDspMode1stBlck,
          InputBitLength             => BitWidthToCodecBitLengthSetting(cDefaultAudioBitWidth),
          DataFormat                 => cI2s
          ),
        Reg8                         =>
        (
          ClockOutputDivider         => cUseMclk,
          ClockInputDivider          => cUseMclk,
          CodecSampleRate            => cAdc8000Dac48000 
          ),
        Reg9                         =>
        (
          InterfaceActivation        => cInterfaceActivated
          )
        ),
      ---------------------------------
      LineMasterSampleRate44k1       =>
      ---------------------------------
      (
        Reg0                         =>
        (
          LineLeftRightSimul         => cSimulLineVolUpdateDisabled,
          LineLeftMute               => cLineInputUnmuted,
          LineLeftVol                => 12.0
          ),
        Reg1                         =>
        (
          LineRightLeftSimul         => cSimulLineVolUpdateDisabled,
          LineRightMute              => cLineInputUnmuted,
          LineRightVol               => 12.0
          ),
        Reg2                         =>
        (
          PhonesLeftRightSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesLeftZeroCrossDetect  => cZeroCrossDetectOff,
          PhonesLeftVol              => 0
          ),
        Reg3                         =>
        (
          PhonesRightLeftSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesRightZeroCrossDetect => cZeroCrossDetectOff,
          PhonesRightVol             => 0
          ),
        Reg4                         =>
        (
          SidetoneAttenuation        => -15,
          SidetoneEnable             => cSidetoneDisabled,
          DacSelect                  => cDacSelected,
          AnalogBypass               => cAnalogBypassDisabled,
          AdcInputSelect             => cAdcInputLineSelected,
          MicroMute                  => cMicroMuted,
          MicroBoost                 => cMicroNoBoost
          ),
        Reg5                         =>
        (
          HPOR                       => cHPORClearOffset,
          DacSoftMute                => cDacSoftMuteDisabled,
          Deemphasis                 => cDeemphasisDisabled,
          AdcHighpassFilter          => cAdcHighpassFilterDisabled
          ),
        Reg6                         =>
        (
          DevicePower                => cPowerOn,
          ClkPower                   => cPowerOff,
          OscillatorPower            => cPowerOff,
          OutputsPower               => cPowerOn,
          DacPower                   => cPowerOn,
          AdcPower                   => cPowerOn,
          MicroPower                 => cPowerOff,
          LinePower                  => cPowerOn
          ),
        Reg7                         =>
        (
          BclkInvert                 => cDontInvertBlck,
          MasterSlaveMode            => cIsMaster,  -- cIsMaster IS THE *INSECURE* SETTING
          DacLeftRightSwap           => cDontSwapLeftRight,
          LeftRightPhase             => cLrcinHighOrDspMode1stBlck,
          InputBitLength             => BitWidthToCodecBitLengthSetting(cDefaultAudioBitWidth),
          DataFormat                 => cI2s
          ),
        Reg8                         =>
        (
          ClockOutputDivider         => cUseMclk,
          ClockInputDivider          => cUseMclk,
          CodecSampleRate            => cAdc44117Dac44117
          ),
        Reg9                         =>
        (
          InterfaceActivation        => cInterfaceActivated
          )
        ),
      ---------------------------------
      UnusedSet6                     =>
      ---------------------------------
      (
        Reg0                         =>
        (
          LineLeftRightSimul         => cSimulLineVolUpdateDisabled,
          LineLeftMute               => cLineInputMuted,
          LineLeftVol                => -34.5
          ),
        Reg1                         =>
        (
          LineRightLeftSimul         => cSimulLineVolUpdateDisabled,
          LineRightMute              => cLineInputMuted,
          LineRightVol               => -34.5
          ),
        Reg2                         =>
        (
          PhonesLeftRightSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesLeftZeroCrossDetect  => cZeroCrossDetectOff,
          PhonesLeftVol              => 0
          ),
        Reg3                         =>
        (
          PhonesRightLeftSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesRightZeroCrossDetect => cZeroCrossDetectOff,
          PhonesRightVol             => 0
          ),
        Reg4                         =>
        (
          SidetoneAttenuation        => -6,
          SidetoneEnable             => cSidetoneDisabled,
          DacSelect                  => cDacOff,
          AnalogBypass               => cAnalogBypassDisabled,
          AdcInputSelect             => cAdcInputLineSelected,
          MicroMute                  => cMicroMuted,
          MicroBoost                 => cMicroNoBoost
          ),
        Reg5                         =>
        (
          HPOR                       => cHPORClearOffset,
          DacSoftMute                => cDacSoftMuteDisabled,
          Deemphasis                 => cDeemphasisDisabled,
          AdcHighpassFilter          => cAdcHighpassFilterDisabled
          ),
        Reg6                         =>
        (
          DevicePower                => cPowerOn,
          ClkPower                   => cPowerOff,
          OscillatorPower            => cPowerOff,
          OutputsPower               => cPowerOff,
          DacPower                   => cPowerOff,
          AdcPower                   => cPowerOff,
          MicroPower                 => cPowerOff,
          LinePower                  => cPowerOff
          ),
        Reg7                         =>
        (
          BclkInvert                 => cDontInvertBlck,
          MasterSlaveMode            => cIsSlave,  -- cIsSlave is the secure setting!
          DacLeftRightSwap           => cDontSwapLeftRight,
          LeftRightPhase             => cLrcinHighOrDspMode1stBlck,
          InputBitLength             => BitWidthToCodecBitLengthSetting(cDefaultAudioBitWidth),
          DataFormat                 => cI2s
          ),
        Reg8                         =>
        (
          ClockOutputDivider         => cUseMclk,
          ClockInputDivider          => cUseMclk,
          CodecSampleRate            => cAdc44117Dac44117
          ),
        Reg9                         =>
        (
          InterfaceActivation        => cInterfaceActivated
          )
        ),
      ---------------------------------
      UnusedSet7                     =>
      ---------------------------------
      (
        Reg0                         =>
        (
          LineLeftRightSimul         => cSimulLineVolUpdateDisabled,
          LineLeftMute               => cLineInputMuted,
          LineLeftVol                => -34.5
          ),
        Reg1                         =>
        (
          LineRightLeftSimul         => cSimulLineVolUpdateDisabled,
          LineRightMute              => cLineInputMuted,
          LineRightVol               => -34.5
          ),
        Reg2                         =>
        (
          PhonesLeftRightSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesLeftZeroCrossDetect  => cZeroCrossDetectOff,
          PhonesLeftVol              => 0
          ),
        Reg3                         =>
        (
          PhonesRightLeftSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesRightZeroCrossDetect => cZeroCrossDetectOff,
          PhonesRightVol             => 0
          ),
        Reg4                         =>
        (
          SidetoneAttenuation        => -6,
          SidetoneEnable             => cSidetoneDisabled,
          DacSelect                  => cDacOff,
          AnalogBypass               => cAnalogBypassDisabled,
          AdcInputSelect             => cAdcInputLineSelected,
          MicroMute                  => cMicroMuted,
          MicroBoost                 => cMicroNoBoost
          ),
        Reg5                         =>
        (
          HPOR                       => cHPORClearOffset,
          DacSoftMute                => cDacSoftMuteDisabled,
          Deemphasis                 => cDeemphasisDisabled,
          AdcHighpassFilter          => cAdcHighpassFilterDisabled
          ),
        Reg6                         =>
        (
          DevicePower                => cPowerOn,
          ClkPower                   => cPowerOff,
          OscillatorPower            => cPowerOff,
          OutputsPower               => cPowerOff,
          DacPower                   => cPowerOff,
          AdcPower                   => cPowerOff,
          MicroPower                 => cPowerOff,
          LinePower                  => cPowerOff
          ),
        Reg7                         =>
        (
          BclkInvert                 => cDontInvertBlck,
          MasterSlaveMode            => cIsSlave,  -- cIsSlave is the secure setting!
          DacLeftRightSwap           => cDontSwapLeftRight,
          LeftRightPhase             => cLrcinHighOrDspMode1stBlck,
          InputBitLength             => BitWidthToCodecBitLengthSetting(cDefaultAudioBitWidth),
          DataFormat                 => cI2s
          ),
        Reg8                         =>
        (
          ClockOutputDivider         => cUseMclk,
          ClockInputDivider          => cUseMclk,
          CodecSampleRate            => cAdc44117Dac44117
          ),
        Reg9                         =>
        (
          InterfaceActivation        => cInterfaceActivated
          )
        ),
      ---------------------------------
      UnusedSet8                     =>
      ---------------------------------
      (
        Reg0                         =>
        (
          LineLeftRightSimul         => cSimulLineVolUpdateDisabled,
          LineLeftMute               => cLineInputMuted,
          LineLeftVol                => -34.5
          ),
        Reg1                         =>
        (
          LineRightLeftSimul         => cSimulLineVolUpdateDisabled,
          LineRightMute              => cLineInputMuted,
          LineRightVol               => -34.5
          ),
        Reg2                         =>
        (
          PhonesLeftRightSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesLeftZeroCrossDetect  => cZeroCrossDetectOff,
          PhonesLeftVol              => 0
          ),
        Reg3                         =>
        (
          PhonesRightLeftSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesRightZeroCrossDetect => cZeroCrossDetectOff,
          PhonesRightVol             => 0
          ),
        Reg4                         =>
        (
          SidetoneAttenuation        => -6,
          SidetoneEnable             => cSidetoneDisabled,
          DacSelect                  => cDacOff,
          AnalogBypass               => cAnalogBypassDisabled,
          AdcInputSelect             => cAdcInputLineSelected,
          MicroMute                  => cMicroMuted,
          MicroBoost                 => cMicroNoBoost
          ),
        Reg5                         =>
        (
          HPOR                       => cHPORClearOffset,
          DacSoftMute                => cDacSoftMuteDisabled,
          Deemphasis                 => cDeemphasisDisabled,
          AdcHighpassFilter          => cAdcHighpassFilterDisabled
          ),
        Reg6                         =>
        (
          DevicePower                => cPowerOn,
          ClkPower                   => cPowerOff,
          OscillatorPower            => cPowerOff,
          OutputsPower               => cPowerOff,
          DacPower                   => cPowerOff,
          AdcPower                   => cPowerOff,
          MicroPower                 => cPowerOff,
          LinePower                  => cPowerOff
          ),
        Reg7                         =>
        (
          BclkInvert                 => cDontInvertBlck,
          MasterSlaveMode            => cIsSlave,  -- cIsSlave is the secure setting!
          DacLeftRightSwap           => cDontSwapLeftRight,
          LeftRightPhase             => cLrcinHighOrDspMode1stBlck,
          InputBitLength             => BitWidthToCodecBitLengthSetting(cDefaultAudioBitWidth),
          DataFormat                 => cI2s
          ),
        Reg8                         =>
        (
          ClockOutputDivider         => cUseMclk,
          ClockInputDivider          => cUseMclk,
          CodecSampleRate            => cAdc44117Dac44117
          ),
        Reg9                         =>
        (
          InterfaceActivation        => cInterfaceActivated
          )
        ),
      ---------------------------------
      UnusedSet9                     =>
      ---------------------------------
      (
        Reg0                         =>
        (
          LineLeftRightSimul         => cSimulLineVolUpdateDisabled,
          LineLeftMute               => cLineInputMuted,
          LineLeftVol                => -34.5
          ),
        Reg1                         =>
        (
          LineRightLeftSimul         => cSimulLineVolUpdateDisabled,
          LineRightMute              => cLineInputMuted,
          LineRightVol               => -34.5
          ),
        Reg2                         =>
        (
          PhonesLeftRightSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesLeftZeroCrossDetect  => cZeroCrossDetectOff,
          PhonesLeftVol              => 0
          ),
        Reg3                         =>
        (
          PhonesRightLeftSimul       => cSimulPhonesVolUpdateDisabled,
          PhonesRightZeroCrossDetect => cZeroCrossDetectOff,
          PhonesRightVol             => 0
          ),
        Reg4                         =>
        (
          SidetoneAttenuation        => -6,
          SidetoneEnable             => cSidetoneDisabled,
          DacSelect                  => cDacOff,
          AnalogBypass               => cAnalogBypassDisabled,
          AdcInputSelect             => cAdcInputLineSelected,
          MicroMute                  => cMicroMuted,
          MicroBoost                 => cMicroNoBoost
          ),
        Reg5                         =>
        (
          HPOR                       => cHPORClearOffset,
          DacSoftMute                => cDacSoftMuteDisabled,
          Deemphasis                 => cDeemphasisDisabled,
          AdcHighpassFilter          => cAdcHighpassFilterDisabled
          ),
        Reg6                         =>
        (
          DevicePower                => cPowerOn,
          ClkPower                   => cPowerOff,
          OscillatorPower            => cPowerOff,
          OutputsPower               => cPowerOff,
          DacPower                   => cPowerOff,
          AdcPower                   => cPowerOff,
          MicroPower                 => cPowerOff,
          LinePower                  => cPowerOff
          ),
        Reg7                         =>
        (
          BclkInvert                 => cDontInvertBlck,
          MasterSlaveMode            => cIsSlave,  -- cIsSlave is the secure setting!
          DacLeftRightSwap           => cDontSwapLeftRight,
          LeftRightPhase             => cLrcinHighOrDspMode1stBlck,
          InputBitLength             => BitWidthToCodecBitLengthSetting(cDefaultAudioBitWidth),
          DataFormat                 => cI2s
          ),
        Reg8                         =>
        (
          ClockOutputDivider         => cUseMclk,
          ClockInputDivider          => cUseMclk,
          CodecSampleRate            => cAdc44117Dac44117
          ),
        Reg9                         =>
        (
          InterfaceActivation        => cInterfaceActivated
          )
        )
      );

end ParamCodec;

