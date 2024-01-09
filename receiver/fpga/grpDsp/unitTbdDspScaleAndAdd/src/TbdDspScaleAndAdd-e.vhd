--------------------------------------------------------------------------------
-- Title       : Testbed for scale and add amplitudes on Altera DE1-SoC
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdDspScaleAndAdd-e.vhd 704 2017-10-27 19:25:59Z mroland $
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
use work.DefinitionsCodec.all;
use work.ParamCodec.all;

entity TbdDspScaleAndAdd is
  
  generic (
    gClkFrequency  : natural    := cDefaultClkFrequency;
    gAudioBitWidth : natural    := cDefaultAudioBitWidth;
    gSampleRate    : natural    := cDefaultSampleRate;
    gScaleFactor       : aSetOfFactors(1 to 2) := (0.1, 0.3);
    gRegisteredOutputs : boolean               := false);

  port (
    iClk         : in std_ulogic;
    inResetAsync : in std_ulogic;

    oI2cSclk     : out   std_ulogic;
    ioI2cSdin    : inout std_logic;

    oMclk        : out std_ulogic;

    oBclk        : out std_ulogic;
    iADCdat      : in  std_ulogic;
    oADClrc      : out std_ulogic;
    oDACdat      : out std_ulogic;
    oDAClrc      : out std_ulogic;

    oLed         : out std_ulogic_vector(9 downto 0));

end TbdDspScaleAndAdd;
