--------------------------------------------------------------------------------
-- Title       : PLL instantiation helper
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: PLL50to48-e.vhd 664 2017-09-26 19:39:57Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2012-2016
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.global.all;

entity PLL50to48 is
  
  port (
    iClk50Mhz    : in  std_ulogic;
    inResetAsync : in  std_ulogic;
    oClk48MHz    : out std_ulogic;
    oLocked      : out std_ulogic);

end PLL50to48;
