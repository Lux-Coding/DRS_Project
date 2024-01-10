--------------------------------------------------------------------------------
-- Title       : Frequency divider
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: FreqDivider-e.vhd 664 2017-09-26 19:39:57Z mroland $
-- Authors     : Markus Pfaff, Hagenberg/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Generates a symmetrical clock signal from the iClk. The
--               divider is given by the generic gDivideBy.
--               Division by 1 is not possible. The minimum divider is 4. The
--               divider must be an even number.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Global.all;

entity FreqDivider is
  
  generic (
    gDivideBy : natural := 4);

  port (
    -- Sequential logic inside this unit
    iClk         : in std_ulogic;
    inResetAsync : in std_ulogic;

    -- Strobe with the above given cycle time
    oDivdClk : out std_ulogic);

begin

  assert (gDivideBy >= 4)
    report "Mp: Divider must be at least 4."
    severity error;

  assert (gDivideBy rem 2 = 0)
    report "Mp: Divider must be an even number."
    severity error;


end FreqDivider;
