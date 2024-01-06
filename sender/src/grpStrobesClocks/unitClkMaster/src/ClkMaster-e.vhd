--------------------------------------------------------------------------------
-- Title       : Generator for clock signals of the I2S digital audio interface
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: ClkMaster-e.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Global.all;

entity ClkMaster is
  
  generic (
    gClkFrequency  : natural := 48E6;
    gMclkFrequency : natural := 12E6;
    gSampleRate    : natural := 44117);

  port (
    -- Sequential logic inside this unit
    iClk         : in std_ulogic;
    inResetAsync : in std_ulogic;

    -- Main clock of the codec
    oMclk : out std_ulogic;
    -- Bit clock of the codec's digital audio interface
    oBclk : out std_ulogic;
    -- Left-right flag of the codec's digital audio interface for ADC
    oADClrc : out std_ulogic);

end ClkMaster;
