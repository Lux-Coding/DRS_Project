--------------------------------------------------------------------------------
-- Title       : Testbed for FSK transmitter on Altera DE1-SoC
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdTxFsk-e.vhd 733 2017-12-04 02:28:35Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Bit stream input from UART loaned from HPS
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- fixed_pkg resides in the library ieee since VHDL-2008 (QuestaSim backports
-- this to VHDL-93 too). However, Quartus (as of version 13.0sp1) still does
-- not have native support for ieee.fixed_pkg. Therefore, we provide the
-- VHDL-93 compatibility versions as part of this excercise. These must be
-- compiled into the are located in the library ieee_proposed. Include them in
-- your Config.tcl and don't forget to set the ExtraLibraries and TargetLibrary
-- parameters to compile them into the right library (ieee_proposed) with fhlow.
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;
-- In future (when both QuestaSim and Quartus support the VHDL-2008
-- ieee.fixed_pkg) simply use:
--use ieee.fixed_float_types.all;
--use ieee.fixed_pkg.all;

use work.Global.all;
use work.DefinitionsCodec.all;
use work.ParamCodec.all;
use work.DefinitionsFsk.all;

entity TbdTxFsk is
  
  generic (
    gClkFrequency           : natural := cDefaultClkFrequency;
    gAudioBitWidth          : natural := cDefaultAudioBitWidth;
    gSampleRate             : natural := cDefaultSampleRate;
    -- Tx parameters
    gChannels         : aSetOfTxChannels(0 to 1) := (
        0 => (Frequency0 =>  800.0,   -- Hz
              Frequency1 => 1300.0),  -- Hz
        1 => (Frequency0 => 2800.0,   -- Hz
              Frequency1 => 3300.0))  -- Hz
  );

  port (
    iClk         : in std_ulogic;
    --inResetAsync : in std_ulogic;

    -- User interface
    iSwitch      : in  std_ulogic_vector(9 downto 0);  -- active high
    inButton     : in  std_ulogic_vector(3 downto 1);  -- active low
    oSEG0        : out std_ulogic_vector(6 downto 0);  -- active low
    oSEG1        : out std_ulogic_vector(6 downto 0);  -- active low
    oSEG2        : out std_ulogic_vector(6 downto 0);  -- active low
    oSEG3        : out std_ulogic_vector(6 downto 0);  -- active low
    oSEG4        : out std_ulogic_vector(6 downto 0);  -- active low
    oSEG5        : out std_ulogic_vector(6 downto 0);  -- active low
    oLed         : out std_ulogic_vector(9 downto 0);  -- active high
    
    -- Audio codec
    oI2cSclk     : out   std_ulogic;
    ioI2cSdin    : inout std_logic;

    oMclk        : out std_ulogic;

    oBclk        : out std_ulogic;
    iADCdat      : in  std_ulogic;
    oDACdat      : out std_ulogic;
    oADClrc      : out std_ulogic;
    oDAClrc      : out std_ulogic;
    
    
    ----------------------------------------------------------------------------
    -- HPS I/O PINS
    ----------------------------------------------------------------------------
    
    -- DDR3 SDRAM
    HPS_DDR3_ADDR    : out   std_logic_vector(14 downto 0);
    HPS_DDR3_BA      : out   std_logic_vector(2 downto 0);
    HPS_DDR3_CK_P    : out   std_logic;
    HPS_DDR3_CK_N    : out   std_logic;
    HPS_DDR3_CKE     : out   std_logic;
    HPS_DDR3_CS_N    : out   std_logic;
    HPS_DDR3_RAS_N   : out   std_logic;
    HPS_DDR3_CAS_N   : out   std_logic;
    HPS_DDR3_WE_N    : out   std_logic;
    HPS_DDR3_RESET_N : out   std_logic;
    HPS_DDR3_DQ      : inout std_logic_vector(31 downto 0);
    HPS_DDR3_DQS_P   : inout std_logic_vector(3 downto 0);
    HPS_DDR3_DQS_N   : inout std_logic_vector(3 downto 0);
    HPS_DDR3_ODT     : out   std_logic;
    HPS_DDR3_DM      : out   std_logic_vector(3 downto 0);
    HPS_DDR3_RZQ     : in    std_logic;
    
    -- ETHERNET
    HPS_ENET_GTX_CLK : out   std_logic;
    HPS_ENET_MDC     : out   std_logic;
    HPS_ENET_MDIO    : inout std_logic;
    HPS_ENET_RX_CLK  : in    std_logic;
    HPS_ENET_RX_DATA : in    std_logic_vector(3 downto 0);
    HPS_ENET_RX_DV   : in    std_logic;
    HPS_ENET_TX_DATA : out   std_logic_vector(3 downto 0);
    HPS_ENET_TX_EN   : out   std_logic;
    HPS_ENET_INT_N   : inout std_logic;  -- HPS_GPIO35
    
    -- QSPI FLASH
    HPS_FLASH_DATA   : inout std_logic_vector(3 downto 0);
    HPS_FLASH_DCLK   : out   std_logic;
    HPS_FLASH_NCSO   : out   std_logic;
    
    -- I2C
    HPS_I2C_CONTROL  : inout std_logic;  -- HPS_GPIO48
    HPS_I2C1_SCLK    : inout std_logic;
    HPS_I2C1_SDAT    : inout std_logic;
    HPS_I2C2_SCLK    : inout std_logic;
    HPS_I2C2_SDAT    : inout std_logic;
    
    -- SD CARD
    HPS_SD_CMD       : inout std_logic;
    HPS_SD_CLK       : out   std_logic;
    HPS_SD_DATA      : inout std_logic_vector(3 downto 0);
    
    -- USB
    HPS_USB_CLKOUT   : in    std_logic;
    HPS_USB_DATA     : inout std_logic_vector(7 downto 0);
    HPS_USB_DIR      : in    std_logic;
    HPS_USB_NXT      : in    std_logic;
    HPS_USB_STP      : out   std_logic;
    HPS_CONV_USB_N   : inout std_logic;  -- HPS_GPIO09
    
    -- SPI
    HPS_SPIM_CLK     : out   std_logic;
    HPS_SPIM_MISO    : in    std_logic;
    HPS_SPIM_MOSI    : out   std_logic;
    HPS_SPIM_SS      : out   std_logic;

    -- UART
    HPS_UART_TX      : inout std_logic;  -- HPS_GPIO50
    HPS_UART_RX      : inout std_logic;  -- HPS_GPIO49
    
    -- GPIO
    HPS_KEY          : inout std_logic;  -- HPS_GPIO54
    HPS_LED          : inout std_logic;  -- HPS_GPIO53
    HPS_LTC_GPIO     : inout std_logic;  -- HPS_GPIO40
    HPS_GSENSOR_INT  : inout std_logic); -- HPS_GPIO61

end TbdTxFsk;
