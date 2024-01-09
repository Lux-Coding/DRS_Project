--------------------------------------------------------------------------------
-- Title       : Converts I2S to parallel digital audio streaming protocol
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: I2sToPar-e.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Global.all;

entity I2sToPar is

  generic (
    gAudioBitWidth : natural := 16);

  port (
    -- Sequential logic inside this unit
    iClk         : in std_ulogic;
    inResetAsync : in std_ulogic;

    -- I2s side
    -- Bit clock of the codec's digital audio interface
    iBclk : in std_ulogic;
    -- Left-right flag of the codec's digital audio interface for ADC
    iLrc  : in std_ulogic;
    -- Serial Data
    iSd   : in std_ulogic;

    -- Par side
    -- Data lines (common for left and right channel)
    oD    : out aAudioData(0 downto -(gAudioBitWidth-1));
    -- Data valid
    oValL : out std_ulogic;
    oValR : out std_ulogic);

end I2sToPar;
