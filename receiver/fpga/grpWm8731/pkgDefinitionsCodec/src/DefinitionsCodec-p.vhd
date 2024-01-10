--------------------------------------------------------------------------------
-- Title       : Parameter definitions for audio codec (Wolfson WM8731 and compatible)
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: DefinitionsCodec-p.vhd 664 2017-09-26 19:39:57Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Definitions which can be found in the datasheet of the audio
--               codec Wolfson WM8731.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package DefinitionsCodec is

  ---------------------------------------------------------------------------------------
  -- Definitions common for all registers
  -------------------------------------------------------------------------------------  
  -- Number of bits in a register
  constant cNrOfBitsPerRegister : natural := 9;
  -- How the bits are spread over a register
  subtype aRegBits is std_ulogic_vector(cNrOfBitsPerRegister-1 downto 0);
  -- Number of registers 
  constant cNrOfRegisters : natural := 10;
  -- The address range of all registers of the codec
  subtype aCodecRegAdrRange is integer range cNrOfRegisters-1 downto 0;

  -- The complete register set of the codec on bit level
  type aRegBitMap is array(aCodecRegAdrRange) of aRegBits;

  ---------------------------------------------------------------------------------------
  -- Abstract definitions for register contents
  -------------------------------------------------------------------------------------  
  -- LeftLineVolCtrl
  type aCodecReg0 is record
    LineLeftRightSimul : std_ulogic;
    LineLeftMute       : std_ulogic;
    LineLeftVol        : real range -34.5 to 12.0;
  end record;

  -- RightLineVolCtrl
  type aCodecReg1 is record
    LineRightLeftSimul : std_ulogic;
    LineRightMute      : std_ulogic;
    LineRightVol       : real range -34.5 to 12.0;
  end record;

  -- LeftPhonesVolCtrl
  type aCodecReg2 is record
    PhonesLeftRightSimul      : std_ulogic;
    PhonesLeftZeroCrossDetect : std_ulogic;
    PhonesLeftVol             : integer range -73 to 6;
  end record;

  -- RightPhonesVolCtrl
  type aCodecReg3 is record
    PhonesRightLeftSimul       : std_ulogic;
    PhonesRightZeroCrossDetect : std_ulogic;
    PhonesRightVol             : integer range -73 to 6;
  end record;

  -- AnalogAudioPathCtrl
  type aCodecReg4 is record
    SidetoneAttenuation : integer range -15 to -6;
    SidetoneEnable      : std_ulogic;
    DacSelect           : std_ulogic;
    AnalogBypass        : std_ulogic;
    AdcInputSelect      : std_ulogic;
    MicroMute           : std_ulogic;
    MicroBoost          : std_ulogic;
  end record;

  -- DigitalAudioPathCtrl
  type aCodecReg5 is record
    HPOR              : std_ulogic;
    DacSoftMute       : std_ulogic;
    Deemphasis        : std_ulogic_vector(1 downto 0);
    AdcHighpassFilter : std_ulogic;
  end record;

  -- PowerDownCtrl
  type aCodecReg6 is record
    DevicePower     : std_ulogic;
    ClkPower        : std_ulogic;
    OscillatorPower : std_ulogic;
    OutputsPower    : std_ulogic;
    DacPower        : std_ulogic;
    AdcPower        : std_ulogic;
    MicroPower      : std_ulogic;
    LinePower       : std_ulogic;
  end record;

  -- DigitalAudioFormat
  type aCodecReg7 is record
    BclkInvert       : std_ulogic;
    MasterSlaveMode  : std_ulogic;
    DacLeftRightSwap : std_ulogic;
    LeftRightPhase   : std_ulogic;
    InputBitLength   : std_ulogic_vector(1 downto 0);
    DataFormat       : std_ulogic_vector(1 downto 0);
  end record;

  -- SampleRateControl
  type aCodecReg8 is record
    ClockOutputDivider : std_ulogic;
    ClockInputDivider  : std_ulogic;
    CodecSampleRate    : std_ulogic_vector (5 downto 0);
  end record;

  -- DigitalInterfaceActivation
  type aCodecReg9 is record
    InterfaceActivation : std_ulogic;
  end record;
  
  -- The complete set of registers of the codec described in an abstract way
  type aCodecRegSet is record
    Reg0 : aCodecReg0;
    Reg1 : aCodecReg1;
    Reg2 : aCodecReg2;
    Reg3 : aCodecReg3;
    Reg4 : aCodecReg4;
    Reg5 : aCodecReg5;
    Reg6 : aCodecReg6;
    Reg7 : aCodecReg7;
    Reg8 : aCodecReg8;
    Reg9 : aCodecReg9;
  end record;

  ---------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------
  -- Give names to all values found in the codec registers.
  ---------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------

  ---------------------------------------------------------------------------------------
  -- Registers adresses 0 and 1: Left and Right Line Input Channel Volume Control
  ---------------------------------------------------------------------------------------
  constant cSimulLineVolUpdateDisabled : std_ulogic := '0';
  constant cSimulLineVolUpdateEnabled  : std_ulogic := '1';
  constant cLineInputUnmuted           : std_ulogic := '0';
  constant cLineInputMuted             : std_ulogic := '1';
  -- Conversion of Dezibels to a bit vector for [line] input volume
  function LineInVolDbToBitVec (cVolumeInDb : in real range -34.5 to 12.0)
    return std_ulogic_vector;

  ---------------------------------------------------------------------------------------
  -- Registers adresses 2 und 3: Left and Right Channel Headphone Volume Control
  ---------------------------------------------------------------------------------------
  constant cSimulPhonesVolUpdateDisabled : std_ulogic := '0';
  constant cSimulPhonesVolUpdateEnabled  : std_ulogic := '1';
  constant cZeroCrossDetectOff           : std_ulogic := '0';
  constant cZeroCrossDetectOn            : std_ulogic := '1';
  -- Conversion of Dezibels to a bit vector for headphones output volume
  function PhonesVolDbToBitVec (cVolumeInDb : in integer range -73 to 6) return std_ulogic_vector;

  ---------------------------------------------------------------------------------------
  -- Register address 4: Analog Audio Path Control 
  ---------------------------------------------------------------------------------------
  constant cSidetoneDisabled      : std_ulogic := '0';
  constant cSidetoneEnabled       : std_ulogic := '1';
  constant cDacOff                : std_ulogic := '0';
  constant cDacSelected           : std_ulogic := '1';
  constant cAnalogBypassDisabled  : std_ulogic := '0';
  constant cAnalogBypassEnabled   : std_ulogic := '1';
  constant cAdcInputLineSelected  : std_ulogic := '0';
  constant cAdcInputMicroSelected : std_ulogic := '1';
  constant cMicroUnmuted          : std_ulogic := '0';
  constant cMicroMuted            : std_ulogic := '1';
  constant cMicroNoBoost          : std_ulogic := '0';
  constant cMicroBoost20dB        : std_ulogic := '1';
  -- Conversion of Dezibels to a bit vector for sidetone volume
  constant cSidetoneVolMinus6dB  : std_ulogic_vector(1 downto 0) := "00";
  constant cSidetoneVolMinus9dB  : std_ulogic_vector(1 downto 0) := "01";
  constant cSidetoneVolMinus12dB : std_ulogic_vector(1 downto 0) := "10";
  constant cSidetoneVolMinus15dB : std_ulogic_vector(1 downto 0) := "11";
  constant cSidetoneVolInvalid   : std_ulogic_vector(1 downto 0) := "XX";
  function SidetoneVolDbToBitVec (cVolumeInDb : in integer range -15 to -6) return std_ulogic_vector;

  ---------------------------------------------------------------------------------------
  -- Register address 5: Digital Audio Path Control
  ---------------------------------------------------------------------------------------  
  constant cHPORClearOffset     : std_ulogic                    := '0';
  constant cHPORStoreOffset     : std_ulogic                    := '1';
  constant cDacSoftMuteDisabled : std_ulogic                    := '0';
  constant cDacSoftMuteEnabled  : std_ulogic                    := '1';
  constant cDeemphasisDisabled  : std_ulogic_vector(1 downto 0) := "00";
  constant cDeemphasis32000Hz   : std_ulogic_vector(1 downto 0) := "01";
  constant cDeemphasis44100Hz   : std_ulogic_vector(1 downto 0) := "10";
  constant cDeemphasis48000Hz   : std_ulogic_vector(1 downto 0) := "11";
  -- Datasheed as of feb 2004 has swapped the meaning of the following bit.
  constant cAdcHighpassFilterDisabled : std_ulogic := '1';
  constant cAdcHighpassFilterEnabled  : std_ulogic := '0';

  ---------------------------------------------------------------------------------------
  -- Register address 6: Power Down Control
  ---------------------------------------------------------------------------------------  
  constant cPowerOn  : std_ulogic := '0';
  constant cPowerOff : std_ulogic := '1';

  ---------------------------------------------------------------------------------------
  -- Register address 7: Digital Audio Interface Format
  ---------------------------------------------------------------------------------------  
  constant cDontInvertBlck            : std_ulogic                    := '0';
  constant cInvertBlck                : std_ulogic                    := '1';
  constant cIsSlave                   : std_ulogic                    := '0';
  -- IsMaster setting should only be used after DOUBLE CHECKING!
  constant cIsMaster                  : std_ulogic                    := '1';
  constant cDontSwapLeftRight         : std_ulogic                    := '0';
  constant cSwapLeftRight             : std_ulogic                    := '1';
  constant cLrcinHighOrDspMode1stBlck : std_ulogic                    := '0';
  constant cLrcinLowOrDspMode2ndBlck  : std_ulogic                    := '1';
  constant cInputBitLength16bit       : std_ulogic_vector(1 downto 0) := "00";
  constant cInputBitLength20bit       : std_ulogic_vector(1 downto 0) := "01";
  constant cInputBitLength24bit       : std_ulogic_vector(1 downto 0) := "10";
  constant cInputBitLength32bit       : std_ulogic_vector(1 downto 0) := "11";
  constant cInputBitLengthError       : std_ulogic_vector(1 downto 0) := "XX";
  function BitWidthToCodecBitLengthSetting (AudioBitWidth : natural) return std_ulogic_vector;
  constant cDspFormat            : std_ulogic_vector(1 downto 0) := "11";
  constant cI2s                  : std_ulogic_vector(1 downto 0) := "10";
  constant cMsbFirstLeftAligned  : std_ulogic_vector(1 downto 0) := "01";
  constant cMsbFirstRightAligned : std_ulogic_vector(1 downto 0) := "00";

  ---------------------------------------------------------------------------------------
  -- Register address 8: Sample Rate Control
  ---------------------------------------------------------------------------------------  
  constant cUseMclk             : std_ulogic := '0';
  constant cUseMclkHalf         : std_ulogic := '1';
  constant cNormal256FsUsb250Fs : std_ulogic := '0';
  constant cNormal384FsUsb272Fs : std_ulogic := '1';
  constant cNormalClockMode     : std_ulogic := '0';
  constant cUsbClockMode        : std_ulogic := '1';
  -- Values for sampling rate are based on the assumption that Mclk = 12 MHz
  constant cAdc96000Dac96000 : std_ulogic_vector (5 downto 0) := "0111" & cNormal256FsUsb250Fs & cUsbClockMode;
  constant cAdc88200Dac88200 : std_ulogic_vector (5 downto 0) := "1111" & cNormal384FsUsb272Fs & cUsbClockMode;
  constant cAdc48000Dac48000 : std_ulogic_vector (5 downto 0) := "0000" & cNormal256FsUsb250Fs & cUsbClockMode;
  constant cAdc44117Dac44117 : std_ulogic_vector (5 downto 0) := "1000" & cNormal384FsUsb272Fs & cUsbClockMode;
  constant cAdc32000Dac32000 : std_ulogic_vector (5 downto 0) := "0110" & cNormal256FsUsb250Fs & cUsbClockMode;
  constant cAdc8021Dac8021   : std_ulogic_vector (5 downto 0) := "1011" & cNormal384FsUsb272Fs & cUsbClockMode;
  constant cAdc8000Dac8000   : std_ulogic_vector (5 downto 0) := "0011" & cNormal256FsUsb250Fs & cUsbClockMode;
  constant cAdc48000Dac8000  : std_ulogic_vector (5 downto 0) := "0001" & cNormal256FsUsb250Fs & cUsbClockMode;
  constant cAdc44117Dac8021  : std_ulogic_vector (5 downto 0) := "1001" & cNormal384FsUsb272Fs & cUsbClockMode;
  constant cAdc8000Dac48000  : std_ulogic_vector (5 downto 0) := "0010" & cNormal256FsUsb250Fs & cUsbClockMode;
  constant cAdc8021Dac44117  : std_ulogic_vector (5 downto 0) := "1010" & cNormal384FsUsb272Fs & cUsbClockMode;

  ---------------------------------------------------------------------------------------
  -- Register address 9: Digital Interface Activation
  ---------------------------------------------------------------------------------------  
  constant cInterfaceInactivated : std_ulogic := '0';
  constant cInterfaceActivated   : std_ulogic := '1';

  ------------------------------------------------------------------------------
  -- Collect the bits of all registers from the more abstract kind of
  -- description found in the parameterizing package.
  ------------------------------------------------------------------------------  
  function toCodecReg0Bits (cCodecRegSet : in aCodecRegSet) return aRegBits;
  function toCodecReg1Bits (cCodecRegSet : in aCodecRegSet) return aRegBits;
  function toCodecReg2Bits (cCodecRegSet : in aCodecRegSet) return aRegBits;
  function toCodecReg3Bits (cCodecRegSet : in aCodecRegSet) return aRegBits;
  function toCodecReg4Bits (cCodecRegSet : in aCodecRegSet) return aRegBits;
  function toCodecReg5Bits (cCodecRegSet : in aCodecRegSet) return aRegBits;
  function toCodecReg6Bits (cCodecRegSet : in aCodecRegSet) return aRegBits;
  function toCodecReg7Bits (cCodecRegSet : in aCodecRegSet) return aRegBits;
  function toCodecReg8Bits (cCodecRegSet : in aCodecRegSet) return aRegBits;
  function toCodecReg9Bits (cCodecRegSet : in aCodecRegSet) return aRegBits;

  -----------------------------------------------------------------------------
  -- Combining all register bits into a complete register bit map
  -----------------------------------------------------------------------------
  function toCodecRegBitMap (cCodecRegSet : in aCodecRegSet) return aRegBitMap;
  
end package DefinitionsCodec;


package body DefinitionsCodec is
  
  function LineInVolDbToBitVec (cVolumeInDb : in real range -34.5 to 12.0) return std_ulogic_vector is
  begin
    return std_ulogic_vector(to_unsigned(integer(cVolumeInDb * 10.0) / 15 + 23, 5));
  end function LineInVolDbToBitVec;

  function PhonesVolDbToBitVec (cVolumeInDb : in integer range -73 to 6) return std_ulogic_vector is
  begin
    return std_ulogic_vector(to_unsigned(cVolumeInDb + 121, 7));
  end function PhonesVolDbToBitVec;

  function SidetoneVolDbToBitVec (cVolumeInDb : in integer range -15 to -6) return std_ulogic_vector is
  begin
    case cVolumeInDb is
      when  -6 => return cSidetoneVolMinus6dB;
      when  -9 => return cSidetoneVolMinus9dB;
      when -12 => return cSidetoneVolMinus12dB;
      when -15 => return cSidetoneVolMinus15dB;
      when others =>
        report "Only sidetone volume values: -15dB, -12dB, -9dB, -6dB"
          severity failure;
        return cSidetoneVolInvalid;
    end case;
  end function SidetoneVolDbToBitVec;

  function BitWidthToCodecBitLengthSetting (AudioBitWidth : natural) return std_ulogic_vector is
  begin
    case AudioBitWidth is
      when 16 => return cInputBitLength16bit;
      when 20 => return cInputBitLength20bit;
      when 24 => return cInputBitLength24bit;
      when 32 => return cInputBitLength32bit;
      when others =>
        report "Codec does not offer choosen input bit length!"
          severity failure;
        return cInputBitLengthError;
    end case;
  end function BitWidthToCodecBitLengthSetting;

  function toCodecReg0Bits (cCodecRegSet : in aCodecRegSet) return aRegBits is
    variable vRegBits : aRegBits := (others => '0');
  begin
    vRegBits(8) := cCodecRegSet.Reg0.LineLeftRightSimul;
    vRegBits(7) := cCodecRegSet.Reg0.LineLeftMute;
    vRegBits(4 downto 0) := LineInVolDbToBitVec(cCodecRegSet.Reg0.LineLeftVol);
    return vRegBits;
  end function toCodecReg0Bits;
  
  function toCodecReg1Bits (cCodecRegSet : in aCodecRegSet) return aRegBits is
    variable vRegBits : aRegBits := (others => '0');
  begin
    vRegBits(8) := cCodecRegSet.Reg1.LineRightLeftSimul;
    vRegBits(7) := cCodecRegSet.Reg1.LineRightMute;
    vRegBits(4 downto 0) := LineInVolDbToBitVec(cCodecRegSet.Reg1.LineRightVol);
    return vRegBits;
  end function toCodecReg1Bits;
  
  function toCodecReg2Bits (cCodecRegSet : in aCodecRegSet) return aRegBits is
    variable vRegBits : aRegBits := (others => '0');
  begin
    vRegBits(8) := cCodecRegSet.Reg2.PhonesLeftRightSimul;
    vRegBits(7) := cCodecRegSet.Reg2.PhonesLeftZeroCrossDetect;
    vRegBits(6 downto 0) := PhonesVolDbToBitVec(cCodecRegSet.Reg2.PhonesLeftVol);
    return vRegBits;
  end function toCodecReg2Bits;

  function toCodecReg3Bits (cCodecRegSet : in aCodecRegSet) return aRegBits is
    variable vRegBits : aRegBits := (others => '0');
  begin
    vRegBits(8) := cCodecRegSet.Reg3.PhonesRightLeftSimul;
    vRegBits(7) := cCodecRegSet.Reg3.PhonesRightZeroCrossDetect;
    vRegBits(6 downto 0) := PhonesVolDbToBitVec(cCodecRegSet.Reg3.PhonesRightVol);
    return vRegBits;
  end function toCodecReg3Bits;

  function toCodecReg4Bits (cCodecRegSet : in aCodecRegSet) return aRegBits is
    variable vRegBits : aRegBits := (others => '0');
  begin
    vRegBits(7 downto 6) := SidetoneVolDbToBitVec(cCodecRegSet.Reg4.SidetoneAttenuation);
    vRegBits(5) := cCodecRegSet.Reg4.SidetoneEnable;
    vRegBits(4) := cCodecRegSet.Reg4.DacSelect;
    vRegBits(3) := cCodecRegSet.Reg4.AnalogBypass;
    vRegBits(2) := cCodecRegSet.Reg4.AdcInputSelect;
    vRegBits(1) := cCodecRegSet.Reg4.MicroMute;
    vRegBits(0) := cCodecRegSet.Reg4.MicroBoost;
    return vRegBits;
  end function toCodecReg4Bits;

  function toCodecReg5Bits (cCodecRegSet : in aCodecRegSet) return aRegBits is
    variable vRegBits : aRegBits := (others => '0');
  begin
    vRegBits(4) := cCodecRegSet.Reg5.HPOR;
    vRegBits(3) := cCodecRegSet.Reg5.DacSoftMute;
    vRegBits(2 downto 1) := cCodecRegSet.Reg5.Deemphasis;
    vRegBits(0) := cCodecRegSet.Reg5.AdcHighpassFilter;
    return vRegBits;
  end function toCodecReg5Bits;

  function toCodecReg6Bits (cCodecRegSet : in aCodecRegSet) return aRegBits is
    variable vRegBits : aRegBits := (others => '0');
  begin
    vRegBits(7) := cCodecRegSet.Reg6.DevicePower;
    vRegBits(6) := cCodecRegSet.Reg6.ClkPower;
    vRegBits(5) := cCodecRegSet.Reg6.OscillatorPower;
    vRegBits(4) := cCodecRegSet.Reg6.OutputsPower;
    vRegBits(3) := cCodecRegSet.Reg6.DacPower;
    vRegBits(2) := cCodecRegSet.Reg6.AdcPower;
    vRegBits(1) := cCodecRegSet.Reg6.MicroPower;
    vRegBits(0) := cCodecRegSet.Reg6.LinePower;
    return vRegBits;
  end function toCodecReg6Bits;

  function toCodecReg7Bits (cCodecRegSet : in aCodecRegSet) return aRegBits is
    variable vRegBits : aRegBits := (others => '0');
  begin
    vRegBits(7) := cCodecRegSet.Reg7.BclkInvert;
    vRegBits(6) := cCodecRegSet.Reg7.MasterSlaveMode;
    vRegBits(5) := cCodecRegSet.Reg7.DacLeftRightSwap;
    vRegBits(4) := cCodecRegSet.Reg7.LeftRightPhase;
    vRegBits(3 downto 2) := cCodecRegSet.Reg7.InputBitLength;
    vRegBits(1 downto 0) := cCodecRegSet.Reg7.DataFormat;
    return vRegBits;
  end function toCodecReg7Bits;

  function toCodecReg8Bits (cCodecRegSet : in aCodecRegSet) return aRegBits is
    variable vRegBits : aRegBits := (others => '0');
  begin
    vRegBits(7) := cCodecRegSet.Reg8.ClockOutputDivider;
    vRegBits(6) := cCodecRegSet.Reg8.ClockInputDivider;
    vRegBits(5 downto 0) := cCodecRegSet.Reg8.CodecSampleRate;
    return vRegBits;
  end function toCodecReg8Bits;

  function toCodecReg9Bits (cCodecRegSet : in aCodecRegSet) return aRegBits is
    variable vRegBits : aRegBits := (others => '0');
  begin
    vRegBits(0) := cCodecRegSet.Reg9.InterfaceActivation;
    return vRegBits;
  end function toCodecReg9Bits;

  function toCodecRegBitMap (cCodecRegSet : in aCodecRegSet)
    return aRegBitMap is
    variable vRegBitMap : aRegBitMap;
  begin
    vRegBitMap(0) := toCodecReg0Bits(cCodecRegSet);
    vRegBitMap(1) := toCodecReg1Bits(cCodecRegSet);
    vRegBitMap(2) := toCodecReg2Bits(cCodecRegSet);
    vRegBitMap(3) := toCodecReg3Bits(cCodecRegSet);
    vRegBitMap(4) := toCodecReg4Bits(cCodecRegSet);
    vRegBitMap(5) := toCodecReg5Bits(cCodecRegSet);
    vRegBitMap(6) := toCodecReg6Bits(cCodecRegSet);
    vRegBitMap(7) := toCodecReg7Bits(cCodecRegSet);
    vRegBitMap(8) := toCodecReg8Bits(cCodecRegSet);
    vRegBitMap(9) := toCodecReg9Bits(cCodecRegSet);
    return vRegBitMap;
  end function toCodecRegBitMap;

end package body;
