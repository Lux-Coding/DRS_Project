--------------------------------------------------------------------------------
-- Title       : Testbed for parallel digital audio streaming protocol test
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdI2sParI2s-e.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Global.all;
use work.DefinitionsCodec.all;
use work.ParamCodec.all;

entity TbdI2sParI2s is
  
  generic (
    gClkFrequency  : natural := cDefaultClkFrequency;
    gAudioBitWidth : natural := cDefaultAudioBitWidth;
    gSampleRate    : natural := cDefaultSampleRate);

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

end TbdI2sParI2s;
