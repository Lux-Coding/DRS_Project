--------------------------------------------------------------------------------
-- Title       : Testbed for configuration of Wolfson WM8731 via I2C
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdConfigureCodecViaI2c-e.vhd 664 2017-09-26 19:39:57Z mroland $
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

entity TbdConfigureCodecViaI2c is
  
  port (
    iClk         : in std_ulogic;
    inResetAsync : in std_ulogic;

    oI2cSclk     : out   std_ulogic;
    ioI2cSdin    : inout std_logic;

    oMclk        : out std_ulogic;

    -- WARNING
    -- Bclck, ADClrc and DAClrc are outputs of the Codec (and inputs for the FPGA) when the Codec is in Master Mode
    -- Bclck, ADClrc and DAClrc are inputs of the Codec (and outputs for the FPGA) when the Codec is in Slave Mode
    oBclk        : out std_ulogic;
    iADCdat      : in  std_ulogic;
    oADClrc      : out std_ulogic;
    oDACdat      : out std_ulogic;
    oDAClrc      : out std_ulogic;

    oLed         : out std_ulogic_vector(9 downto 0));

end TbdConfigureCodecViaI2c;
