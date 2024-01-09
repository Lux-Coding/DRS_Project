--------------------------------------------------------------------------------
-- Title       : Synchronize asynchronous signals
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: Sync-e.vhd 746 2017-12-04 12:01:02Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2006-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.global.all;

entity Sync is
  
  generic (
    gInitialState : std_ulogic := cInactivated;
    gDepth        : natural    := 2
  );
  
  port (iClk         : in  std_ulogic;  -- system clock
        inResetAsync : in  std_ulogic;  -- global asynchronous reset
        iAsync       : in  std_ulogic;  -- asynchronous input signal
        oSync        : out std_ulogic); -- synchronous output signal

end Sync;
