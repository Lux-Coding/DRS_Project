--------------------------------------------------------------------------------
-- Title       : Rectangular wave form generator
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: RectGen-e.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Global.all;

entity RectGen is
  
  generic (
    gClkFrequency  : natural := 48E6;
    gGenFrequency  : natural := 100;
    gAudioBitWidth : natural := 16);

  port (
    -- Sequential logic inside this unit
    iClk         : in std_ulogic;
    inResetAsync : in std_ulogic;

    -- Audio synchronization
    iLrc : in std_ulogic;

    -- Parallel digital audio data protocol
    oVal : out std_ulogic;
    oD   : out aAudioData(0 downto -(gAudioBitWidth-1)));

end RectGen;
