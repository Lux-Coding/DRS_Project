--------------------------------------------------------------------------------
-- Title       : Testbed for rectangular wave generator on Altera DE1-SoC
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdRectGen-e.vhd 693 2017-10-16 10:25:52Z mroland $
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

entity TbdRectGen is
  
  generic (
    gClkFrequency  : natural := 48E6;
    gGenFrequencyL : natural := 100;
    gGenFrequencyR : natural := 440;
    gAudioBitWidth : natural := 16;
    gSampleRate    : natural := 44117);

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

end TbdRectGen;
