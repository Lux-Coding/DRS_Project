--------------------------------------------------------------------------------
-- Title       : Testbed for FSK receiver on Altera DE1-SoC
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdRxFskBasic-e.vhd 733 2017-12-04 02:28:35Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Decoded output to LED
--------------------------------------------------------------------------------

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
use ieee_proposed.fixed_pkg.all;
-- In future (when both QuestaSim and Quartus support the VHDL-2008
-- ieee.fixed_pkg) simply use:
--use ieee.fixed_float_types.all;
--use ieee.fixed_pkg.all;

use work.Global.all;
use work.DefinitionsCodec.all;
use work.ParamCodec.all;
use work.DefinitionsFsk.all;
use work.InterfaceFunctions.all;

entity TbdRxFskBasic is
  
  generic (
    gClkFrequency           : natural := cDefaultClkFrequency;
    gAudioBitWidth          : natural := cDefaultAudioBitWidth;
    gSampleRate             : natural := cDefaultSampleRate;
    -- Rx parameters
    gCoefWidth : natural    := cFskFilterCoefWidth;
    -- The values used as filter coefficients. The number of those
    -- coefficients determines the number of taps the filter has.
    gChannelBandpasses : aSetOfRxBandpasses := (
        0 => (Bandpass0 => ( cBandpass0DRS ),     -- band pass for Channel 0/freq. 0
              Bandpass1 => ( cBandpass1DRS )),    -- band pass for Channel 0/freq. 1
        1 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 1/freq. 0
              Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 1/freq. 1
        2 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 2/freq. 0
              Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 2/freq. 1
        3 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 3/freq. 0
              Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 3/freq. 1
        4 => (Bandpass0 => ( cBandpass0Ch4 ),     -- band pass for Channel 4/freq. 0
              Bandpass1 => ( cBandpass1Ch4 )),    -- band pass for Channel 4/freq. 1
        5 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 5/freq. 0
              Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 5/freq. 1
        6 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 6/freq. 0
              Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 6/freq. 1
        7 => (Bandpass0 => ( cBandpass0Ch7 ),     -- band pass for Channel 7/freq. 0
              Bandpass1 => ( cBandpass1Ch7 )),    -- band pass for Channel 7/freq. 1
        8 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 8/freq. 0
              Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 8/freq. 1
        9 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 9/freq. 0
              Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 9/freq. 1
        10 => (Bandpass0 => ( cZeroBandpass ),    -- band pass for Channel 10/freq. 0
              Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 10/freq. 1
        11 => (Bandpass0 => ( cZeroBandpass ),    -- band pass for Channel 11/freq. 0
              Bandpass1 => ( cZeroBandpass )));   -- band pass for Channel 11/freq. 1
--     gLowpass           : aSetOfFactors := ( cLowpass ) -- low pass
      gLowpass           : aSetOfFactors := ( cLowpassDRS ) -- low pass

  );

  port (
    iClk         : in std_ulogic;
    inResetAsync : in std_ulogic;

    -- User interface
    iSwitch      : in  std_ulogic_vector(9 downto 0);  -- active high
    inButton     : in  std_ulogic_vector(3 downto 1);  -- active low
    oSEG0        : out std_ulogic_vector(6 downto 0);  -- active low
    oSEG1        : out std_ulogic_vector(6 downto 0);  -- active low
    oSEG2        : out std_ulogic_vector(6 downto 0);  -- active low
    oSEG3        : out std_ulogic_vector(6 downto 0);  -- active low
    oSEG4        : out std_ulogic_vector(6 downto 0);  -- active low
    oSEG5        : out std_ulogic_vector(6 downto 0);  -- active low
    oLed         : out std_ulogic_vector(9 downto 0);  -- active high
    
    -- Audio codec
    oI2cSclk     : out   std_ulogic;
    ioI2cSdin    : inout std_logic;

    oMclk        : out std_ulogic;

    oBclk        : out std_ulogic;
    iADCdat      : in  std_ulogic;
    oDACdat      : out std_ulogic;
    oADClrc      : out std_ulogic;
    oDAClrc      : out std_ulogic);

end TbdRxFskBasic;
