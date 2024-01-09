--------------------------------------------------------------------------------
-- Title       : FSK receiver
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: RxFsk-e.vhd 733 2017-12-04 02:28:35Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
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
use work.DefinitionsFsk.all;

entity RxFsk is
  
  generic (
    gClkFrequency  : natural    := cDefaultClkFrequency;
    gAudioBitWidth : natural    := cDefaultAudioBitWidth;
    gSampleRate    : natural    := cDefaultSampleRate;
    gCoefWidth     : natural    := cFskFilterCoefWidth;
    -- Filter coefficients (The number of these coefficients determines
    -- the number of taps of the filter.)
    gChannelBandpasses : aSetOfRxBandpasses := (
        0 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 0/freq. 0
              Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 0/freq. 1
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
    gLowpass           : aSetOfFactors := ( -0.0001220703125, -9.15527343750000e-05, -9.15527343750000e-05, -9.15527343750000e-05, -6.10351562500000e-05, 0.0, 0.0001220703125, 0.0002441406250, 0.00042724609375, 0.000701904296875, 0.00103759765625, 0.001464843750, 0.002044677734375, 0.002685546875, 0.00347900390625, 0.004425048828125, 0.005462646484375, 0.0067138671875, 0.008056640625, 0.009552001953125, 0.011199951171875, 0.012939453125, 0.014801025390625, 0.0167236328125, 0.018707275390625, 0.020751953125, 0.02276611328125, 0.0247802734375, 0.0267333984375, 0.028564453125, 0.030303955078125, 0.031890869140625, 0.03326416015625, 0.034423828125, 0.035369873046875, 0.03607177734375, 0.036468505859375, 0.03662109375, 0.036468505859375, 0.03607177734375, 0.035369873046875, 0.034423828125, 0.03326416015625, 0.031890869140625, 0.030303955078125, 0.028564453125, 0.0267333984375, 0.0247802734375, 0.02276611328125, 0.020751953125, 0.018707275390625, 0.0167236328125, 0.014801025390625, 0.012939453125, 0.011199951171875, 0.009552001953125, 0.008056640625, 0.0067138671875, 0.005462646484375, 0.004425048828125, 0.00347900390625, 0.002685546875, 0.002044677734375, 0.001464843750, 0.00103759765625, 0.000701904296875, 0.00042724609375, 0.0002441406250, 0.0001220703125, 0.0, -6.10351562500000e-05, -9.15527343750000e-05, -9.15527343750000e-05, -9.15527343750000e-05, -0.000122070312500000 ) -- low pass
  );

  port (
    inResetAsync : in std_ulogic;
    iClk         : in std_ulogic;

    -- Channel selection signal
    iChannelSelect : in natural range gChannelBandpasses'range;
    
    -- Parallel digital audio data protocol
    iVal : in std_ulogic;
    iD   : in aAudioData(0 downto -(gAudioBitWidth-1));

    -- Output data signal.
    oD : out std_ulogic
  );

end entity RxFsk;
