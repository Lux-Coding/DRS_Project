--------------------------------------------------------------------------------
-- Title       : Configuration of Wolfson WM8731 via I2C
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: ConfigureCodecViaI2c-e.vhd 664 2017-09-26 19:39:57Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2012-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.global.all;
use work.DefinitionsCodec.all;
use work.ParamCodec.all;

entity ConfigureCodecViaI2c is
  
  generic (
    gChoosenParamSet : aParamSetName := MicroOverSidetone;
    gI2cAddress      : std_ulogic_vector(6 downto 0) := "0011010");
  
  port (
    iClk         : in    std_ulogic;
    inResetAsync : in    std_ulogic;
    iStrobeI2C   : in    std_ulogic;
    iStart       : in    std_ulogic;
    oConfigured  : out   std_ulogic;
    oAckError    : out   std_ulogic;
    oI2cSclk     : out   std_ulogic;
    ioI2cSdin    : inout std_logic);

end ConfigureCodecViaI2c;
