-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "01/10/2024 16:49:48"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	TbdTxFskFull IS
    PORT (
	iClk : IN std_logic;
	inResetAsync : IN std_logic;
	iSwitch : IN IEEE.STD_LOGIC_1164.std_ulogic_vector(9 DOWNTO 0);
	inButton : IN IEEE.STD_LOGIC_1164.std_ulogic_vector(3 DOWNTO 1);
	oSEG0 : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(6 DOWNTO 0);
	oSEG1 : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(6 DOWNTO 0);
	oSEG2 : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(6 DOWNTO 0);
	oSEG3 : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(6 DOWNTO 0);
	oSEG4 : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(6 DOWNTO 0);
	oSEG5 : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(6 DOWNTO 0);
	oLed : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(9 DOWNTO 0);
	GPIO_0 : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(35 DOWNTO 0);
	oI2cSclk : OUT std_logic;
	ioI2cSdin : INOUT std_logic;
	oMclk : OUT std_logic;
	oBclk : OUT std_logic;
	iADCdat : IN std_logic;
	oDACdat : OUT std_logic;
	oADClrc : OUT std_logic;
	oDAClrc : OUT std_logic
	);
END TbdTxFskFull;

-- Design Ports Information
-- iSwitch[3]	=>  Location: PIN_AF10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[4]	=>  Location: PIN_AD11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[5]	=>  Location: PIN_AD12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[6]	=>  Location: PIN_AE11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[7]	=>  Location: PIN_AC9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[8]	=>  Location: PIN_AD10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inButton[2]	=>  Location: PIN_W15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inButton[3]	=>  Location: PIN_Y16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- oSEG0[0]	=>  Location: PIN_AE26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG0[1]	=>  Location: PIN_AE27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG0[2]	=>  Location: PIN_AE28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG0[3]	=>  Location: PIN_AG27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG0[4]	=>  Location: PIN_AF28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG0[5]	=>  Location: PIN_AG28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG0[6]	=>  Location: PIN_AH28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG1[0]	=>  Location: PIN_AJ29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG1[1]	=>  Location: PIN_AH29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG1[2]	=>  Location: PIN_AH30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG1[3]	=>  Location: PIN_AG30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG1[4]	=>  Location: PIN_AF29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG1[5]	=>  Location: PIN_AF30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG1[6]	=>  Location: PIN_AD27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG2[0]	=>  Location: PIN_AB23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG2[1]	=>  Location: PIN_AE29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG2[2]	=>  Location: PIN_AD29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG2[3]	=>  Location: PIN_AC28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG2[4]	=>  Location: PIN_AD30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG2[5]	=>  Location: PIN_AC29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG2[6]	=>  Location: PIN_AC30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG3[0]	=>  Location: PIN_AD26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG3[1]	=>  Location: PIN_AC27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG3[2]	=>  Location: PIN_AD25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG3[3]	=>  Location: PIN_AC25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG3[4]	=>  Location: PIN_AB28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG3[5]	=>  Location: PIN_AB25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG3[6]	=>  Location: PIN_AB22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG4[0]	=>  Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG4[1]	=>  Location: PIN_Y23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG4[2]	=>  Location: PIN_Y24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG4[3]	=>  Location: PIN_W22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG4[4]	=>  Location: PIN_W24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG4[5]	=>  Location: PIN_V23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG4[6]	=>  Location: PIN_W25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG5[0]	=>  Location: PIN_V25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG5[1]	=>  Location: PIN_AA28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG5[2]	=>  Location: PIN_Y27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG5[3]	=>  Location: PIN_AB27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG5[4]	=>  Location: PIN_AB26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG5[5]	=>  Location: PIN_AA26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oSEG5[6]	=>  Location: PIN_AA25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[0]	=>  Location: PIN_V16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[1]	=>  Location: PIN_W16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[2]	=>  Location: PIN_V17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[3]	=>  Location: PIN_V18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[4]	=>  Location: PIN_W17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[5]	=>  Location: PIN_W19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[6]	=>  Location: PIN_Y19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[7]	=>  Location: PIN_W20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[8]	=>  Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oLed[9]	=>  Location: PIN_Y21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[0]	=>  Location: PIN_AC18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[1]	=>  Location: PIN_Y17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[2]	=>  Location: PIN_AD17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[3]	=>  Location: PIN_Y18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[4]	=>  Location: PIN_AK16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[5]	=>  Location: PIN_AK18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[6]	=>  Location: PIN_AK19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[7]	=>  Location: PIN_AJ19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[8]	=>  Location: PIN_AJ17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[9]	=>  Location: PIN_AJ16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[10]	=>  Location: PIN_AH18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[11]	=>  Location: PIN_AH17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[12]	=>  Location: PIN_AG16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[13]	=>  Location: PIN_AE16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[14]	=>  Location: PIN_AF16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[15]	=>  Location: PIN_AG17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[16]	=>  Location: PIN_AA18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[17]	=>  Location: PIN_AA19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[18]	=>  Location: PIN_AE17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[19]	=>  Location: PIN_AC20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[20]	=>  Location: PIN_AH19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[21]	=>  Location: PIN_AJ20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[22]	=>  Location: PIN_AH20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[23]	=>  Location: PIN_AK21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[24]	=>  Location: PIN_AD19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[25]	=>  Location: PIN_AD20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[26]	=>  Location: PIN_AE18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[27]	=>  Location: PIN_AE19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[28]	=>  Location: PIN_AF20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[29]	=>  Location: PIN_AF21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[30]	=>  Location: PIN_AF19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[31]	=>  Location: PIN_AG21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[32]	=>  Location: PIN_AF18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[33]	=>  Location: PIN_AG20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[34]	=>  Location: PIN_AG18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- GPIO_0[35]	=>  Location: PIN_AJ21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oI2cSclk	=>  Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oMclk	=>  Location: PIN_G7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oBclk	=>  Location: PIN_H7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- iADCdat	=>  Location: PIN_K7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- oDACdat	=>  Location: PIN_J7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oADClrc	=>  Location: PIN_K8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oDAClrc	=>  Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ioI2cSdin	=>  Location: PIN_K12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- inButton[1]	=>  Location: PIN_AA15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iClk	=>  Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[9]	=>  Location: PIN_AE12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[0]	=>  Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inResetAsync	=>  Location: PIN_AA14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[1]	=>  Location: PIN_AC12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[2]	=>  Location: PIN_AF9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF TbdTxFskFull IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_iClk : std_logic;
SIGNAL ww_inResetAsync : std_logic;
SIGNAL ww_iSwitch : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_inButton : std_logic_vector(3 DOWNTO 1);
SIGNAL ww_oSEG0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_oSEG1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_oSEG2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_oSEG3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_oSEG4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_oSEG5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_oLed : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_GPIO_0 : std_logic_vector(35 DOWNTO 0);
SIGNAL ww_oI2cSclk : std_logic;
SIGNAL ww_oMclk : std_logic;
SIGNAL ww_oBclk : std_logic;
SIGNAL ww_iADCdat : std_logic;
SIGNAL ww_oDACdat : std_logic;
SIGNAL ww_oADClrc : std_logic;
SIGNAL ww_oDAClrc : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \iSwitch[3]~input_o\ : std_logic;
SIGNAL \iSwitch[4]~input_o\ : std_logic;
SIGNAL \iSwitch[5]~input_o\ : std_logic;
SIGNAL \iSwitch[6]~input_o\ : std_logic;
SIGNAL \iSwitch[7]~input_o\ : std_logic;
SIGNAL \iSwitch[8]~input_o\ : std_logic;
SIGNAL \inButton[2]~input_o\ : std_logic;
SIGNAL \inButton[3]~input_o\ : std_logic;
SIGNAL \iADCdat~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \iClk~input_o\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\ : std_logic;
SIGNAL \inButton[1]~input_o\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\ : std_logic;
SIGNAL \ioI2cSdin~input_o\ : std_logic;
SIGNAL \inButton[1]~inputCLKENA0_outclk\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[0]~5_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[1]~4_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[2]~3_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[3]~2_combout\ : std_logic;
SIGNAL \GenStrobeI2C|Equal0~0_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[4]~1_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[5]~0_combout\ : std_logic;
SIGNAL \GenStrobeI2C|Equal0~1_combout\ : std_logic;
SIGNAL \GenStrobeI2C|oStrobe~q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Address~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector2~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector1~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Sclk~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|NextStateAndOutput~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector3~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.RWBit~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector4~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack1~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector5~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector5~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data1~q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Stop~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector13~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector11~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector11~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector13~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|NextR~11_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector13~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~6_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector11~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector11~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|Add1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector10~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector10~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|NextR~10_combout\ : std_logic;
SIGNAL \ConfigureCodec|NextR~8_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector6~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack2~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector7~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data2~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector10~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector12~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector12~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|NextR~9_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector8~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack3~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector9~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Stop~q\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~1_sumout\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~q\ : std_logic;
SIGNAL \WaitCtr[1]~0_combout\ : std_logic;
SIGNAL \WaitCtr[0]~1_combout\ : std_logic;
SIGNAL \Start~q\ : std_logic;
SIGNAL \Start~0_combout\ : std_logic;
SIGNAL \Start~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[6]~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~2\ : std_logic;
SIGNAL \ConfigureCodec|Add0~25_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~26\ : std_logic;
SIGNAL \ConfigureCodec|Add0~21_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~22\ : std_logic;
SIGNAL \ConfigureCodec|Add0~17_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~18\ : std_logic;
SIGNAL \ConfigureCodec|Add0~13_sumout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Add0~14\ : std_logic;
SIGNAL \ConfigureCodec|Add0~9_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~10\ : std_logic;
SIGNAL \ConfigureCodec|Add0~5_sumout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[5]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Equal0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Activity~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Activity~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Start~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector16~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector16~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AckError~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector0~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector0~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Idle~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector14~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Sclk~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux7~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[15]~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux5~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux3~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux4~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux6~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux2~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~5_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Sdin~q\ : std_logic;
SIGNAL \iSwitch[9]~input_o\ : std_logic;
SIGNAL \inResetAsync~input_o\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter[14]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter[7]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~22\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~17_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~18\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~13_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~14\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~9_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~10\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~6\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~69_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter[8]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~70\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~65_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter~7_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Equal0~2_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~5_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter~1_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter[6]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~66\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~61_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter~6_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~62\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~57_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~58\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~53_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter~5_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter[11]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~54\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~1_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter~0_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter[12]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~2\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~49_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter[13]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~50\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~45_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter[17]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~46\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~41_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter~4_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter[15]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~42\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~37_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter[16]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~38\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~33_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter~3_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Equal0~1_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~29_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~30\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~25_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter~2_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~26\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Add0~21_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Equal0~0_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|Equal0~3_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|oStrobe~DUPLICATE_q\ : std_logic;
SIGNAL \iSwitch[1]~input_o\ : std_logic;
SIGNAL \iSwitch[2]~input_o\ : std_logic;
SIGNAL \fsksender_inst|Add0~53_sumout\ : std_logic;
SIGNAL \fsksender_inst|Reg.SendCounter[0]~3_combout\ : std_logic;
SIGNAL \fsksender_inst|Reg.SendCounter[2]~1_combout\ : std_logic;
SIGNAL \fsksender_inst|Selector0~0_combout\ : std_logic;
SIGNAL \fsksender_inst|LessThan0~4_combout\ : std_logic;
SIGNAL \fsksender_inst|LessThan0~5_combout\ : std_logic;
SIGNAL \fsksender_inst|LessThan0~6_combout\ : std_logic;
SIGNAL \fsksender_inst|Add0~34\ : std_logic;
SIGNAL \fsksender_inst|Add0~29_sumout\ : std_logic;
SIGNAL \fsksender_inst|LessThan0~1_combout\ : std_logic;
SIGNAL \fsksender_inst|LessThan0~0_combout\ : std_logic;
SIGNAL \fsksender_inst|LessThan0~2_combout\ : std_logic;
SIGNAL \StartSending~0_combout\ : std_logic;
SIGNAL \StartSending~q\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~21_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~22\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~17_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~18\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~13_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ClkCounter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~14\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~9_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Equal0~0_combout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ClkCounter[4]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~10\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~5_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~6\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~61_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ClkCounter[5]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~62\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~57_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ClkCounter[6]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~58\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~53_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ClkCounter~6_combout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~54\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~49_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ClkCounter~5_combout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Equal0~2_combout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~50\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~45_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ClkCounter~4_combout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~46\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~1_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ClkCounter[10]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~2\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~41_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ClkCounter~3_combout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~42\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~37_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ClkCounter~2_combout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ClkCounter[12]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~38\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~33_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ClkCounter~1_combout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~34\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~29_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~30\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Add0~25_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ClkCounter~0_combout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Equal0~1_combout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|Equal0~3_combout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|oStrobe~q\ : std_logic;
SIGNAL \fsksender_inst|the_comp~0_combout\ : std_logic;
SIGNAL \fsksender_inst|Reg.WaitCounter[13]~0_combout\ : std_logic;
SIGNAL \fsksender_inst|LessThan0~7_combout\ : std_logic;
SIGNAL \fsksender_inst|Selector0~1_combout\ : std_logic;
SIGNAL \fsksender_inst|Reg.state.WaitForSend~q\ : std_logic;
SIGNAL \fsksender_inst|LessThan0~10_combout\ : std_logic;
SIGNAL \fsksender_inst|LessThan0~11_combout\ : std_logic;
SIGNAL \fsksender_inst|LessThan0~8_combout\ : std_logic;
SIGNAL \fsksender_inst|LessThan0~9_combout\ : std_logic;
SIGNAL \fsksender_inst|Selector1~2_combout\ : std_logic;
SIGNAL \fsksender_inst|Add0~54\ : std_logic;
SIGNAL \fsksender_inst|Add0~49_sumout\ : std_logic;
SIGNAL \fsksender_inst|Add0~50\ : std_logic;
SIGNAL \fsksender_inst|Add0~37_sumout\ : std_logic;
SIGNAL \fsksender_inst|Add0~38\ : std_logic;
SIGNAL \fsksender_inst|Add0~5_sumout\ : std_logic;
SIGNAL \fsksender_inst|Add0~6\ : std_logic;
SIGNAL \fsksender_inst|Add0~1_sumout\ : std_logic;
SIGNAL \fsksender_inst|Add0~2\ : std_logic;
SIGNAL \fsksender_inst|Add0~13_sumout\ : std_logic;
SIGNAL \fsksender_inst|Add0~14\ : std_logic;
SIGNAL \fsksender_inst|Add0~9_sumout\ : std_logic;
SIGNAL \fsksender_inst|Add0~10\ : std_logic;
SIGNAL \fsksender_inst|Add0~25_sumout\ : std_logic;
SIGNAL \fsksender_inst|Add0~26\ : std_logic;
SIGNAL \fsksender_inst|Add0~21_sumout\ : std_logic;
SIGNAL \fsksender_inst|Add0~22\ : std_logic;
SIGNAL \fsksender_inst|Add0~17_sumout\ : std_logic;
SIGNAL \fsksender_inst|Add0~18\ : std_logic;
SIGNAL \fsksender_inst|Add0~45_sumout\ : std_logic;
SIGNAL \fsksender_inst|Add0~46\ : std_logic;
SIGNAL \fsksender_inst|Add0~41_sumout\ : std_logic;
SIGNAL \fsksender_inst|Add0~42\ : std_logic;
SIGNAL \fsksender_inst|Add0~33_sumout\ : std_logic;
SIGNAL \fsksender_inst|LessThan0~3_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|oStrobe~q\ : std_logic;
SIGNAL \fsksender_inst|Selector1~0_combout\ : std_logic;
SIGNAL \fsksender_inst|Selector1~1_combout\ : std_logic;
SIGNAL \fsksender_inst|Reg.state.WaitForFirstBaud~q\ : std_logic;
SIGNAL \fsksender_inst|Selector2~0_combout\ : std_logic;
SIGNAL \fsksender_inst|Reg.state.Send~q\ : std_logic;
SIGNAL \fsksender_inst|Reg.SendCounter[3]~0_combout\ : std_logic;
SIGNAL \fsksender_inst|Reg.SendCounter[1]~2_combout\ : std_logic;
SIGNAL \fsksender_inst|Equal0~0_combout\ : std_logic;
SIGNAL \fsksender_inst|Reg.Data~0_combout\ : std_logic;
SIGNAL \fsksender_inst|Reg.Data~q\ : std_logic;
SIGNAL \TheTxDataSync|Metastable[0]~feeder_combout\ : std_logic;
SIGNAL \GenClks|MclkCounter[0]~0_combout\ : std_logic;
SIGNAL \GenClks|Mclk~0_combout\ : std_logic;
SIGNAL \GenClks|Mclk~q\ : std_logic;
SIGNAL \GenClks|Add1~9_sumout\ : std_logic;
SIGNAL \GenClks|Add1~10\ : std_logic;
SIGNAL \GenClks|Add1~5_sumout\ : std_logic;
SIGNAL \GenClks|Add1~6\ : std_logic;
SIGNAL \GenClks|Add1~1_sumout\ : std_logic;
SIGNAL \GenClks|Add1~2\ : std_logic;
SIGNAL \GenClks|Add1~29_sumout\ : std_logic;
SIGNAL \GenClks|ADCCounter~1_combout\ : std_logic;
SIGNAL \GenClks|Add1~30\ : std_logic;
SIGNAL \GenClks|Add1~25_sumout\ : std_logic;
SIGNAL \GenClks|Add1~26\ : std_logic;
SIGNAL \GenClks|Add1~21_sumout\ : std_logic;
SIGNAL \GenClks|Add1~22\ : std_logic;
SIGNAL \GenClks|Add1~17_sumout\ : std_logic;
SIGNAL \GenClks|ADCCounter[6]~feeder_combout\ : std_logic;
SIGNAL \GenClks|Add1~18\ : std_logic;
SIGNAL \GenClks|Add1~13_sumout\ : std_logic;
SIGNAL \GenClks|ADCCounter~0_combout\ : std_logic;
SIGNAL \GenClks|Equal0~0_combout\ : std_logic;
SIGNAL \GenClks|ADClrc~0_combout\ : std_logic;
SIGNAL \GenClks|ADClrc~feeder_combout\ : std_logic;
SIGNAL \GenClks|ADClrc~q\ : std_logic;
SIGNAL \oldADClrc~q\ : std_logic;
SIGNAL \PhaseStrobe~combout\ : std_logic;
SIGNAL \ValWetR~feeder_combout\ : std_logic;
SIGNAL \ValWetR~q\ : std_logic;
SIGNAL \TheParToI2s|BclkDlyd~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2s|State.SendingL~q\ : std_logic;
SIGNAL \TheParToI2s|State.FirstBitEmptyL~q\ : std_logic;
SIGNAL \TheParToI2s|Selector3~0_combout\ : std_logic;
SIGNAL \TheParToI2s|State.SendingL~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2s|Selector4~0_combout\ : std_logic;
SIGNAL \TheParToI2s|State.FirstBitEmptyR~q\ : std_logic;
SIGNAL \TheParToI2s|Selector5~0_combout\ : std_logic;
SIGNAL \TheParToI2s|State.SendingR~q\ : std_logic;
SIGNAL \TheParToI2s|Selector10~0_combout\ : std_logic;
SIGNAL \TheParToI2s|State.FirstBitEmptyR~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2s|Selector7~0_combout\ : std_logic;
SIGNAL \TheParToI2s|BclkDlyd~q\ : std_logic;
SIGNAL \TheParToI2s|Selector6~1_combout\ : std_logic;
SIGNAL \TheParToI2s|NextBclkCtr~0_combout\ : std_logic;
SIGNAL \TheParToI2s|Selector6~0_combout\ : std_logic;
SIGNAL \TheParToI2s|Selector6~2_combout\ : std_logic;
SIGNAL \TheParToI2s|NextBclkCtr~1_combout\ : std_logic;
SIGNAL \TheParToI2s|Add0~0_combout\ : std_logic;
SIGNAL \TheParToI2s|Selector7~1_combout\ : std_logic;
SIGNAL \TheParToI2s|BclkCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2s|NextState~6_combout\ : std_logic;
SIGNAL \TheParToI2s|Selector0~0_combout\ : std_logic;
SIGNAL \TheParToI2s|State.WaitingValL~q\ : std_logic;
SIGNAL \TheParToI2s|Selector1~0_combout\ : std_logic;
SIGNAL \TheParToI2s|State.SyncingToBclk~q\ : std_logic;
SIGNAL \TheParToI2s|State.FirstBitEmptyL~0_combout\ : std_logic;
SIGNAL \TheParToI2s|State.FirstBitEmptyL~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2s|Selector9~0_combout\ : std_logic;
SIGNAL \TheParToI2s|Selector9~1_combout\ : std_logic;
SIGNAL \TheParToI2s|Selector8~0_combout\ : std_logic;
SIGNAL \TheParToI2s|Selector8~1_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RegsLFSR[0]~0_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RegsLFSR[3]~DUPLICATE_q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RegsLFSR[5]~feeder_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RegsLFSR[18]~feeder_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RegsLFSR[25]~feeder_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RegsLFSR[26]~feeder_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-1]~0_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-1]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-2]~1_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-2]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-3]~2_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-3]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-4]~3_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-4]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-5]~4_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-5]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-6]~5_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-6]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-7]~6_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-7]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-8]~7_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|RandomValue[-8]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[0]~77_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[0]~78\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[0]~79\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[1]~73_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[1]~74\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[1]~75\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[2]~69_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[2]~70\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[2]~71\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[3]~65_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[3]~66\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[3]~67\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[4]~61_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[4]~62\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[4]~63\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[5]~57_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[5]~58\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[5]~59\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[6]~53_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[6]~54\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[6]~55\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[7]~49_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[7]~50\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[7]~51\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[8]~9_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[8]~10\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[8]~11\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[9]~13_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[9]~14\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[9]~15\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[10]~17_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[10]~18\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[10]~19\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[11]~21_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[11]~22\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[11]~23\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[12]~25_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[12]~26\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[12]~27\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[13]~29_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[13]~30\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[13]~31\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[14]~33_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[14]~34\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[14]~35\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[15]~37_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[15]~38\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[15]~39\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[16]~41_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[16]~42\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[16]~43\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[17]~45_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[17]~46\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[17]~47\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[18]~6\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[18]~7\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtPhaseAddr[19]~1_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtAddress[0]~0_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtAddress[1]~1_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtAddress[2]~2_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtAddress[3]~3_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtAddress[4]~4_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtAddress[5]~5_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtAddress[6]~6_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtAddress[7]~7_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtAddress[8]~8_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|NxtAddress[9]~9_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a1~portadataout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~30\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~2\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~38\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~14\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~46\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~21_sumout\ : std_logic;
SIGNAL \iSwitch[0]~input_o\ : std_logic;
SIGNAL \DwetL[-9]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a11\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a10\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a9\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a8\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~22\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~54\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~6\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~34\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~10\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~42\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~17_sumout\ : std_logic;
SIGNAL \DwetL[-3]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a13\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a12\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~18\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~50\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~25_sumout\ : std_logic;
SIGNAL \DwetL[-1]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~13_sumout\ : std_logic;
SIGNAL \DwetL[-11]~q\ : std_logic;
SIGNAL \TheParToI2s|Mux1~1_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~45_sumout\ : std_logic;
SIGNAL \DwetL[-10]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~53_sumout\ : std_logic;
SIGNAL \DwetL[-8]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~49_sumout\ : std_logic;
SIGNAL \DwetL[-2]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~26\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~57_sumout\ : std_logic;
SIGNAL \TheParToI2s|Mux1~3_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~33_sumout\ : std_logic;
SIGNAL \DwetL[-6]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~37_sumout\ : std_logic;
SIGNAL \DwetL[-12]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~41_sumout\ : std_logic;
SIGNAL \DwetL[-4]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~29_sumout\ : std_logic;
SIGNAL \DwetL[-14]~q\ : std_logic;
SIGNAL \TheParToI2s|Mux1~2_combout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~1_sumout\ : std_logic;
SIGNAL \DwetL[-13]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~9_sumout\ : std_logic;
SIGNAL \DwetL[-5]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Add2~5_sumout\ : std_logic;
SIGNAL \DwetL[-7]~q\ : std_logic;
SIGNAL \TheParToI2s|Mux1~0_combout\ : std_logic;
SIGNAL \TheParToI2s|Selector10~1_combout\ : std_logic;
SIGNAL \TheParToI2s|oLrc~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \TheParToI2s|BclkCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TheTxDataSync|Metastable\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \TheChannelSelSync|Metastable\ : std_logic_vector(1 DOWNTO 0);
SIGNAL DwetL : std_logic_vector(0 DOWNTO 0);
SIGNAL \GenStrobeI2C|ClkCounter\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \fsksender_inst|Reg.WaitCounter\ : std_logic_vector(13 DOWNTO 0);
SIGNAL WaitCtr : std_logic_vector(1 DOWNTO 0);
SIGNAL \TheParToI2s|LastValidDL\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \GenClks|MclkCounter\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \GenClks|ADCCounter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ConfigureCodec|R.BitCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \fsksender_inst|Reg.SendCounter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TheTxFsk|TheDDS|PhaseAddr\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \ConfigureCodec|R.Data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \fsksender_inst|baudrate_generator|ClkCounter\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \TheTxFsk|TheDDS|Address\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \fsksender_inst|msstrobe_generator|ClkCounter\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \TheTxFsk|TheDDS|RandomValue\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \TheTxFsk|TheDDS|RegsLFSR\ : std_logic_vector(29 DOWNTO 0);
SIGNAL \TheTxFsk|TheDDS|NextRegsLFSR\ : std_logic_vector(29 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|fboutclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|locked_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \TheTxFsk|TheDDS|ALT_INV_RandomValue\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~3_combout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_the_comp~0_combout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_oStrobe~q\ : std_logic;
SIGNAL \ALT_INV_StartSending~q\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_LessThan0~11_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_LessThan0~10_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_LessThan0~9_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_LessThan0~8_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_Selector1~0_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_LessThan0~7_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_LessThan0~6_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_LessThan0~5_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_LessThan0~4_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_LessThan0~3_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_LessThan0~2_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_Equal0~3_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_Reg.state.WaitForFirstBaud~q\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_Reg.SendCounter[3]~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector13~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector12~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextR~11_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector11~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~6_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector11~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector11~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector10~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector5~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector10~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Add1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector13~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector1~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Address~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_Mux9~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_Reg.state.WaitForSend~q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_oStrobe~q\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_Reg.state.Send~q\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_Reg.SendCounter\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextR~10_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextR~9_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextR~8_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Sdin~q\ : std_logic;
SIGNAL \fsksender_inst|ALT_INV_Reg.Data~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Start~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector0~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AckError~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector16~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~3_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \TheParToI2s|ALT_INV_NextState~6_combout\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_Selector9~0_combout\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_Selector7~0_combout\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_Selector8~0_combout\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_NextBclkCtr~1_combout\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_Selector6~1_combout\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_NextBclkCtr~0_combout\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_State.SyncingToBclk~q\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_State.WaitingValL~q\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_Selector6~0_combout\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_BclkDlyd~q\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_State.FirstBitEmptyR~q\ : std_logic;
SIGNAL \ALT_INV_ValWetR~q\ : std_logic;
SIGNAL \GenClks|ALT_INV_ADClrc~0_combout\ : std_logic;
SIGNAL \GenClks|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \GenClks|ALT_INV_ADCCounter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \GenClks|ALT_INV_MclkCounter\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Sclk~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Activity~q\ : std_logic;
SIGNAL ALT_INV_WaitCtr : std_logic_vector(1 DOWNTO 0);
SIGNAL \GenStrobeI2C|ALT_INV_oStrobe~q\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_oLrc~0_combout\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_State.FirstBitEmptyL~q\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_Selector10~0_combout\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_State.SendingR~q\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_State.SendingL~q\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_BclkCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TheParToI2s|ALT_INV_Mux1~3_combout\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_LastValidDL\ : std_logic_vector(15 DOWNTO 1);
SIGNAL \TheParToI2s|ALT_INV_Mux1~2_combout\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_Mux1~1_combout\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \ALT_INV_PhaseStrobe~combout\ : std_logic;
SIGNAL \ALT_INV_oldADClrc~q\ : std_logic;
SIGNAL \GenClks|ALT_INV_ADClrc~q\ : std_logic;
SIGNAL \GenClks|ALT_INV_Mclk~q\ : std_logic;
SIGNAL \TheTxDataSync|ALT_INV_Metastable\ : std_logic_vector(1 DOWNTO 1);
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~q\ : std_logic;
SIGNAL \ALT_INV_Start~q\ : std_logic;
SIGNAL \TheChannelSelSync|ALT_INV_Metastable\ : std_logic_vector(1 DOWNTO 1);
SIGNAL \fsksender_inst|ALT_INV_Reg.WaitCounter\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_Add0~53_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_Add0~49_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_Add0~45_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[17]~45_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[16]~41_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[15]~37_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[14]~33_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[13]~29_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[12]~25_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[11]~21_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[10]~17_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[9]~13_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[8]~9_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[18]~5_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_Add0~65_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_Add0~61_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_Add0~53_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a6\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a10\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a12\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a1~portadataout\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a2\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a3\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a4\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a5\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a7\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a8\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a9\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a11\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a13\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a0~portadataout\ : std_logic;
SIGNAL \GenClks|ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \GenClks|ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \GenClks|ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \TheTxFsk|TheDDS|ALT_INV_RegsLFSR[3]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[5]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[6]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[12]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[4]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[10]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[7]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[8]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[11]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[13]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[14]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[15]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[16]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[17]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[6]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[12]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Address~DUPLICATE_q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\ : std_logic;
SIGNAL \fsksender_inst|baudrate_generator|ALT_INV_oStrobe~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter[1]~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_BclkDlyd~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_State.FirstBitEmptyR~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Stop~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_State.FirstBitEmptyL~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_State.SendingL~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2s|ALT_INV_BclkCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_Start~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[5]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_iSwitch[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_iSwitch[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_iSwitch[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_inButton[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_ioI2cSdin~input_o\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\ : std_logic_vector(29 DOWNTO 0);
SIGNAL \TheTxFsk|TheDDS|ALT_INV_RandomValue[-8]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_RandomValue[-7]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_RandomValue[-6]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_RandomValue[-5]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_RandomValue[-4]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_RandomValue[-3]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_RandomValue[-2]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_RandomValue[-1]~q\ : std_logic;
SIGNAL \TheTxFsk|TheDDS|ALT_INV_NextRegsLFSR\ : std_logic_vector(0 DOWNTO 0);

BEGIN

ww_iClk <= iClk;
ww_inResetAsync <= inResetAsync;
ww_iSwitch <= IEEE.STD_LOGIC_1164.TO_STDLOGICVECTOR(iSwitch);
ww_inButton <= IEEE.STD_LOGIC_1164.TO_STDLOGICVECTOR(inButton);
oSEG0 <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_oSEG0);
oSEG1 <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_oSEG1);
oSEG2 <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_oSEG2);
oSEG3 <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_oSEG3);
oSEG4 <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_oSEG4);
oSEG5 <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_oSEG5);
oLed <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_oLed);
GPIO_0 <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_GPIO_0);
oI2cSclk <= ww_oI2cSclk;
oMclk <= ww_oMclk;
oBclk <= ww_oBclk;
ww_iADCdat <= iADCdat;
oDACdat <= ww_oDACdat;
oADClrc <= ww_oADClrc;
oDAClrc <= ww_oDAClrc;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\TheTxFsk|TheDDS|Address\(9) & \TheTxFsk|TheDDS|Address\(8) & \TheTxFsk|TheDDS|Address\(7) & \TheTxFsk|TheDDS|Address\(6) & \TheTxFsk|TheDDS|Address\(5) & 
\TheTxFsk|TheDDS|Address\(4) & \TheTxFsk|TheDDS|Address\(3) & \TheTxFsk|TheDDS|Address\(2) & \TheTxFsk|TheDDS|Address\(1) & \TheTxFsk|TheDDS|Address\(0));

\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0~portadataout\ <= \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a2\ <= \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a3\ <= \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a4\ <= \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a5\ <= \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a7\ <= \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a8\ <= \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a9\ <= \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a11\ <= \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(8);
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a13\ <= \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(9);

\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\TheTxFsk|TheDDS|Address\(9) & \TheTxFsk|TheDDS|Address\(8) & \TheTxFsk|TheDDS|Address\(7) & \TheTxFsk|TheDDS|Address\(6) & \TheTxFsk|TheDDS|Address\(5) & 
\TheTxFsk|TheDDS|Address\(4) & \TheTxFsk|TheDDS|Address\(3) & \TheTxFsk|TheDDS|Address\(2) & \TheTxFsk|TheDDS|Address\(1) & \TheTxFsk|TheDDS|Address\(0));

\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a1~portadataout\ <= \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\(0);
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a6\ <= \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\(1);
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a10\ <= \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\(2);
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a12\ <= \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\(3);

\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(0);
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(1);
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(2);
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(3);
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(4);
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(5);
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(6);
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(7);

\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(0);
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(1);
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(2);
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(3);
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(4);
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(5);
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(6);
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(7);

\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ <= (gnd & gnd & gnd & \iClk~input_o\);

\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ <= (
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ & 
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ & 
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ & 
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ & 
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ & 
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ & 
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ & 
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\);

\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ <= \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\(6);

\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ <= (
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ & 
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ & 
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ & 
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ & 
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ & 
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ & 
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ & 
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\);
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(10) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(10);
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(9) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(9);
\TheTxFsk|TheDDS|ALT_INV_RandomValue\(0) <= NOT \TheTxFsk|TheDDS|RandomValue\(0);
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(8) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(8);
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(18) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(18);
\fsksender_inst|msstrobe_generator|ALT_INV_Equal0~3_combout\ <= NOT \fsksender_inst|msstrobe_generator|Equal0~3_combout\;
\fsksender_inst|msstrobe_generator|ALT_INV_Equal0~2_combout\ <= NOT \fsksender_inst|msstrobe_generator|Equal0~2_combout\;
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(5) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(5);
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(6) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(6);
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(7) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(7);
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(8) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(8);
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(9) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(9);
\fsksender_inst|msstrobe_generator|ALT_INV_Equal0~1_combout\ <= NOT \fsksender_inst|msstrobe_generator|Equal0~1_combout\;
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(11) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(11);
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(12) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(12);
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(13) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(13);
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(14) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(14);
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(15) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(15);
\fsksender_inst|msstrobe_generator|ALT_INV_Equal0~0_combout\ <= NOT \fsksender_inst|msstrobe_generator|Equal0~0_combout\;
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(0) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(0);
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(1) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(1);
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(2) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(2);
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(3) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(3);
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(4) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(4);
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(10) <= NOT \fsksender_inst|msstrobe_generator|ClkCounter\(10);
\fsksender_inst|ALT_INV_the_comp~0_combout\ <= NOT \fsksender_inst|the_comp~0_combout\;
\fsksender_inst|msstrobe_generator|ALT_INV_oStrobe~q\ <= NOT \fsksender_inst|msstrobe_generator|oStrobe~q\;
\ALT_INV_StartSending~q\ <= NOT \StartSending~q\;
\fsksender_inst|ALT_INV_LessThan0~11_combout\ <= NOT \fsksender_inst|LessThan0~11_combout\;
\fsksender_inst|ALT_INV_LessThan0~10_combout\ <= NOT \fsksender_inst|LessThan0~10_combout\;
\fsksender_inst|ALT_INV_LessThan0~9_combout\ <= NOT \fsksender_inst|LessThan0~9_combout\;
\fsksender_inst|ALT_INV_LessThan0~8_combout\ <= NOT \fsksender_inst|LessThan0~8_combout\;
\fsksender_inst|ALT_INV_Selector1~0_combout\ <= NOT \fsksender_inst|Selector1~0_combout\;
\fsksender_inst|ALT_INV_Selector0~0_combout\ <= NOT \fsksender_inst|Selector0~0_combout\;
\fsksender_inst|ALT_INV_LessThan0~7_combout\ <= NOT \fsksender_inst|LessThan0~7_combout\;
\fsksender_inst|ALT_INV_LessThan0~6_combout\ <= NOT \fsksender_inst|LessThan0~6_combout\;
\fsksender_inst|ALT_INV_LessThan0~5_combout\ <= NOT \fsksender_inst|LessThan0~5_combout\;
\fsksender_inst|ALT_INV_LessThan0~4_combout\ <= NOT \fsksender_inst|LessThan0~4_combout\;
\fsksender_inst|ALT_INV_LessThan0~3_combout\ <= NOT \fsksender_inst|LessThan0~3_combout\;
\fsksender_inst|ALT_INV_LessThan0~2_combout\ <= NOT \fsksender_inst|LessThan0~2_combout\;
\fsksender_inst|ALT_INV_LessThan0~1_combout\ <= NOT \fsksender_inst|LessThan0~1_combout\;
\fsksender_inst|ALT_INV_LessThan0~0_combout\ <= NOT \fsksender_inst|LessThan0~0_combout\;
\fsksender_inst|baudrate_generator|ALT_INV_Equal0~3_combout\ <= NOT \fsksender_inst|baudrate_generator|Equal0~3_combout\;
\fsksender_inst|baudrate_generator|ALT_INV_Equal0~2_combout\ <= NOT \fsksender_inst|baudrate_generator|Equal0~2_combout\;
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(7) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(7);
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(8) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(8);
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(9) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(9);
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(10) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(10);
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(11) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(11);
\fsksender_inst|baudrate_generator|ALT_INV_Equal0~1_combout\ <= NOT \fsksender_inst|baudrate_generator|Equal0~1_combout\;
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(13) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(13);
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(14) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(14);
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(15) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(15);
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(16) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(16);
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(17) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(17);
\fsksender_inst|baudrate_generator|ALT_INV_Equal0~0_combout\ <= NOT \fsksender_inst|baudrate_generator|Equal0~0_combout\;
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(0) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(0);
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(1) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(1);
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(2) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(2);
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(3) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(3);
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(4) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(4);
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(5) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(5);
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(6) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(6);
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(12) <= NOT \fsksender_inst|baudrate_generator|ClkCounter\(12);
\fsksender_inst|ALT_INV_Reg.state.WaitForFirstBaud~q\ <= NOT \fsksender_inst|Reg.state.WaitForFirstBaud~q\;
\fsksender_inst|ALT_INV_Reg.SendCounter[3]~0_combout\ <= NOT \fsksender_inst|Reg.SendCounter[3]~0_combout\;
\ConfigureCodec|ALT_INV_Selector13~1_combout\ <= NOT \ConfigureCodec|Selector13~1_combout\;
\ConfigureCodec|ALT_INV_Selector12~0_combout\ <= NOT \ConfigureCodec|Selector12~0_combout\;
\ConfigureCodec|ALT_INV_NextR~11_combout\ <= NOT \ConfigureCodec|NextR~11_combout\;
\ConfigureCodec|ALT_INV_Selector11~2_combout\ <= NOT \ConfigureCodec|Selector11~2_combout\;
\ConfigureCodec|ALT_INV_Selector15~6_combout\ <= NOT \ConfigureCodec|Selector15~6_combout\;
\ConfigureCodec|ALT_INV_Selector11~1_combout\ <= NOT \ConfigureCodec|Selector11~1_combout\;
\ConfigureCodec|ALT_INV_Selector11~0_combout\ <= NOT \ConfigureCodec|Selector11~0_combout\;
\ConfigureCodec|ALT_INV_Selector10~1_combout\ <= NOT \ConfigureCodec|Selector10~1_combout\;
\ConfigureCodec|ALT_INV_Selector5~0_combout\ <= NOT \ConfigureCodec|Selector5~0_combout\;
\ConfigureCodec|ALT_INV_Selector10~0_combout\ <= NOT \ConfigureCodec|Selector10~0_combout\;
\ConfigureCodec|ALT_INV_Add1~0_combout\ <= NOT \ConfigureCodec|Add1~0_combout\;
\ConfigureCodec|ALT_INV_Selector13~0_combout\ <= NOT \ConfigureCodec|Selector13~0_combout\;
\ConfigureCodec|ALT_INV_Selector1~1_combout\ <= NOT \ConfigureCodec|Selector1~1_combout\;
\ConfigureCodec|ALT_INV_Selector15~4_combout\ <= NOT \ConfigureCodec|Selector15~4_combout\;
\ConfigureCodec|ALT_INV_Selector15~3_combout\ <= NOT \ConfigureCodec|Selector15~3_combout\;
\ConfigureCodec|ALT_INV_Selector15~2_combout\ <= NOT \ConfigureCodec|Selector15~2_combout\;
\ConfigureCodec|ALT_INV_Selector15~1_combout\ <= NOT \ConfigureCodec|Selector15~1_combout\;
\ConfigureCodec|ALT_INV_Selector15~0_combout\ <= NOT \ConfigureCodec|Selector15~0_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Address~q\ <= NOT \ConfigureCodec|R.FrameState.Address~q\;
\ConfigureCodec|ALT_INV_Mux9~4_combout\ <= NOT \ConfigureCodec|Mux9~4_combout\;
\ConfigureCodec|ALT_INV_Mux9~3_combout\ <= NOT \ConfigureCodec|Mux9~3_combout\;
\ConfigureCodec|ALT_INV_R.Data\(15) <= NOT \ConfigureCodec|R.Data\(15);
\ConfigureCodec|ALT_INV_R.Data\(7) <= NOT \ConfigureCodec|R.Data\(7);
\ConfigureCodec|ALT_INV_R.Data\(13) <= NOT \ConfigureCodec|R.Data\(13);
\ConfigureCodec|ALT_INV_R.Data\(5) <= NOT \ConfigureCodec|R.Data\(5);
\ConfigureCodec|ALT_INV_Mux9~2_combout\ <= NOT \ConfigureCodec|Mux9~2_combout\;
\ConfigureCodec|ALT_INV_R.Data\(11) <= NOT \ConfigureCodec|R.Data\(11);
\ConfigureCodec|ALT_INV_R.Data\(3) <= NOT \ConfigureCodec|R.Data\(3);
\ConfigureCodec|ALT_INV_R.Data\(9) <= NOT \ConfigureCodec|R.Data\(9);
\ConfigureCodec|ALT_INV_R.Data\(1) <= NOT \ConfigureCodec|R.Data\(1);
\ConfigureCodec|ALT_INV_Mux9~1_combout\ <= NOT \ConfigureCodec|Mux9~1_combout\;
\ConfigureCodec|ALT_INV_R.Data\(14) <= NOT \ConfigureCodec|R.Data\(14);
\ConfigureCodec|ALT_INV_R.Data\(6) <= NOT \ConfigureCodec|R.Data\(6);
\ConfigureCodec|ALT_INV_R.Data\(12) <= NOT \ConfigureCodec|R.Data\(12);
\ConfigureCodec|ALT_INV_R.Data\(4) <= NOT \ConfigureCodec|R.Data\(4);
\ConfigureCodec|ALT_INV_Mux9~0_combout\ <= NOT \ConfigureCodec|Mux9~0_combout\;
\ConfigureCodec|ALT_INV_R.Data\(2) <= NOT \ConfigureCodec|R.Data\(2);
\ConfigureCodec|ALT_INV_R.Data\(0) <= NOT \ConfigureCodec|R.Data\(0);
\ConfigureCodec|ALT_INV_R.Data\(10) <= NOT \ConfigureCodec|R.Data\(10);
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(19) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(19);
\fsksender_inst|ALT_INV_Reg.state.WaitForSend~q\ <= NOT \fsksender_inst|Reg.state.WaitForSend~q\;
\fsksender_inst|baudrate_generator|ALT_INV_oStrobe~q\ <= NOT \fsksender_inst|baudrate_generator|oStrobe~q\;
\fsksender_inst|ALT_INV_Reg.state.Send~q\ <= NOT \fsksender_inst|Reg.state.Send~q\;
\fsksender_inst|ALT_INV_Equal0~0_combout\ <= NOT \fsksender_inst|Equal0~0_combout\;
\fsksender_inst|ALT_INV_Reg.SendCounter\(0) <= NOT \fsksender_inst|Reg.SendCounter\(0);
\fsksender_inst|ALT_INV_Reg.SendCounter\(1) <= NOT \fsksender_inst|Reg.SendCounter\(1);
\fsksender_inst|ALT_INV_Reg.SendCounter\(2) <= NOT \fsksender_inst|Reg.SendCounter\(2);
\ConfigureCodec|ALT_INV_R.FrameState.Data1~q\ <= NOT \ConfigureCodec|R.FrameState.Data1~q\;
\ConfigureCodec|ALT_INV_NextR~10_combout\ <= NOT \ConfigureCodec|NextR~10_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\ <= NOT \ConfigureCodec|R.FrameState.RWBit~q\;
\ConfigureCodec|ALT_INV_NextR~9_combout\ <= NOT \ConfigureCodec|NextR~9_combout\;
\ConfigureCodec|ALT_INV_R.BitCtr\(0) <= NOT \ConfigureCodec|R.BitCtr\(0);
\ConfigureCodec|ALT_INV_R.BitCtr\(1) <= NOT \ConfigureCodec|R.BitCtr\(1);
\ConfigureCodec|ALT_INV_R.BitCtr\(2) <= NOT \ConfigureCodec|R.BitCtr\(2);
\ConfigureCodec|ALT_INV_R.BitCtr\(3) <= NOT \ConfigureCodec|R.BitCtr\(3);
\ConfigureCodec|ALT_INV_R.FrameState.Data2~q\ <= NOT \ConfigureCodec|R.FrameState.Data2~q\;
\ConfigureCodec|ALT_INV_NextR~8_combout\ <= NOT \ConfigureCodec|NextR~8_combout\;
\ConfigureCodec|ALT_INV_R.Sdin~q\ <= NOT \ConfigureCodec|R.Sdin~q\;
\fsksender_inst|ALT_INV_Reg.Data~q\ <= NOT \fsksender_inst|Reg.Data~q\;
\ConfigureCodec|ALT_INV_R.FrameState.Start~q\ <= NOT \ConfigureCodec|R.FrameState.Start~q\;
\ConfigureCodec|ALT_INV_Selector0~1_combout\ <= NOT \ConfigureCodec|Selector0~1_combout\;
\ConfigureCodec|ALT_INV_R.AckError~q\ <= NOT \ConfigureCodec|R.AckError~q\;
\ConfigureCodec|ALT_INV_Selector16~0_combout\ <= NOT \ConfigureCodec|Selector16~0_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\ <= NOT \ConfigureCodec|R.FrameState.Ack2~q\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\ <= NOT \ConfigureCodec|R.FrameState.Ack1~q\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\ <= NOT \ConfigureCodec|R.FrameState.Ack3~q\;
\ConfigureCodec|ALT_INV_Selector0~0_combout\ <= NOT \ConfigureCodec|Selector0~0_combout\;
\ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\ <= NOT \ConfigureCodec|NextStateAndOutput~2_combout\;
\ConfigureCodec|ALT_INV_R.Configured~4_combout\ <= NOT \ConfigureCodec|R.Configured~4_combout\;
\ConfigureCodec|ALT_INV_R.Configured~3_combout\ <= NOT \ConfigureCodec|R.Configured~3_combout\;
\GenStrobeI2C|ALT_INV_Equal0~0_combout\ <= NOT \GenStrobeI2C|Equal0~0_combout\;
\GenStrobeI2C|ALT_INV_ClkCounter\(0) <= NOT \GenStrobeI2C|ClkCounter\(0);
\GenStrobeI2C|ALT_INV_ClkCounter\(1) <= NOT \GenStrobeI2C|ClkCounter\(1);
\GenStrobeI2C|ALT_INV_ClkCounter\(2) <= NOT \GenStrobeI2C|ClkCounter\(2);
\GenStrobeI2C|ALT_INV_ClkCounter\(3) <= NOT \GenStrobeI2C|ClkCounter\(3);
\GenStrobeI2C|ALT_INV_ClkCounter\(4) <= NOT \GenStrobeI2C|ClkCounter\(4);
\GenStrobeI2C|ALT_INV_ClkCounter\(5) <= NOT \GenStrobeI2C|ClkCounter\(5);
\TheParToI2s|ALT_INV_NextState~6_combout\ <= NOT \TheParToI2s|NextState~6_combout\;
\TheParToI2s|ALT_INV_Selector9~0_combout\ <= NOT \TheParToI2s|Selector9~0_combout\;
\TheParToI2s|ALT_INV_Selector7~0_combout\ <= NOT \TheParToI2s|Selector7~0_combout\;
\TheParToI2s|ALT_INV_Add0~0_combout\ <= NOT \TheParToI2s|Add0~0_combout\;
\TheParToI2s|ALT_INV_Selector8~0_combout\ <= NOT \TheParToI2s|Selector8~0_combout\;
\TheParToI2s|ALT_INV_NextBclkCtr~1_combout\ <= NOT \TheParToI2s|NextBclkCtr~1_combout\;
\TheParToI2s|ALT_INV_Selector6~1_combout\ <= NOT \TheParToI2s|Selector6~1_combout\;
\TheParToI2s|ALT_INV_NextBclkCtr~0_combout\ <= NOT \TheParToI2s|NextBclkCtr~0_combout\;
\TheParToI2s|ALT_INV_State.SyncingToBclk~q\ <= NOT \TheParToI2s|State.SyncingToBclk~q\;
\TheParToI2s|ALT_INV_State.WaitingValL~q\ <= NOT \TheParToI2s|State.WaitingValL~q\;
\TheParToI2s|ALT_INV_Selector6~0_combout\ <= NOT \TheParToI2s|Selector6~0_combout\;
\TheParToI2s|ALT_INV_BclkDlyd~q\ <= NOT \TheParToI2s|BclkDlyd~q\;
\TheParToI2s|ALT_INV_State.FirstBitEmptyR~q\ <= NOT \TheParToI2s|State.FirstBitEmptyR~q\;
\ALT_INV_ValWetR~q\ <= NOT \ValWetR~q\;
\GenClks|ALT_INV_ADClrc~0_combout\ <= NOT \GenClks|ADClrc~0_combout\;
\GenClks|ALT_INV_Equal0~0_combout\ <= NOT \GenClks|Equal0~0_combout\;
\GenClks|ALT_INV_ADCCounter\(3) <= NOT \GenClks|ADCCounter\(3);
\GenClks|ALT_INV_ADCCounter\(4) <= NOT \GenClks|ADCCounter\(4);
\GenClks|ALT_INV_ADCCounter\(5) <= NOT \GenClks|ADCCounter\(5);
\GenClks|ALT_INV_ADCCounter\(6) <= NOT \GenClks|ADCCounter\(6);
\GenClks|ALT_INV_ADCCounter\(7) <= NOT \GenClks|ADCCounter\(7);
\GenClks|ALT_INV_ADCCounter\(0) <= NOT \GenClks|ADCCounter\(0);
\GenClks|ALT_INV_ADCCounter\(1) <= NOT \GenClks|ADCCounter\(1);
\GenClks|ALT_INV_ADCCounter\(2) <= NOT \GenClks|ADCCounter\(2);
\GenClks|ALT_INV_MclkCounter\(0) <= NOT \GenClks|MclkCounter\(0);
\ConfigureCodec|ALT_INV_R.Configured~1_combout\ <= NOT \ConfigureCodec|R.Configured~1_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Stop~q\ <= NOT \ConfigureCodec|R.FrameState.Stop~q\;
\ConfigureCodec|ALT_INV_R.Sclk~q\ <= NOT \ConfigureCodec|R.Sclk~q\;
\ConfigureCodec|ALT_INV_Equal0~0_combout\ <= NOT \ConfigureCodec|Equal0~0_combout\;
\ConfigureCodec|ALT_INV_R.Configured~0_combout\ <= NOT \ConfigureCodec|R.Configured~0_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Idle~q\ <= NOT \ConfigureCodec|R.FrameState.Idle~q\;
\ConfigureCodec|ALT_INV_R.Activity~q\ <= NOT \ConfigureCodec|R.Activity~q\;
ALT_INV_WaitCtr(0) <= NOT WaitCtr(0);
ALT_INV_WaitCtr(1) <= NOT WaitCtr(1);
\GenStrobeI2C|ALT_INV_oStrobe~q\ <= NOT \GenStrobeI2C|oStrobe~q\;
\TheParToI2s|ALT_INV_oLrc~0_combout\ <= NOT \TheParToI2s|oLrc~0_combout\;
\TheParToI2s|ALT_INV_State.FirstBitEmptyL~q\ <= NOT \TheParToI2s|State.FirstBitEmptyL~q\;
\TheParToI2s|ALT_INV_Selector10~0_combout\ <= NOT \TheParToI2s|Selector10~0_combout\;
\TheParToI2s|ALT_INV_State.SendingR~q\ <= NOT \TheParToI2s|State.SendingR~q\;
\TheParToI2s|ALT_INV_State.SendingL~q\ <= NOT \TheParToI2s|State.SendingL~q\;
\TheParToI2s|ALT_INV_BclkCtr\(0) <= NOT \TheParToI2s|BclkCtr\(0);
\TheParToI2s|ALT_INV_BclkCtr\(2) <= NOT \TheParToI2s|BclkCtr\(2);
\TheParToI2s|ALT_INV_Mux1~3_combout\ <= NOT \TheParToI2s|Mux1~3_combout\;
\TheParToI2s|ALT_INV_LastValidDL\(15) <= NOT \TheParToI2s|LastValidDL\(15);
\TheParToI2s|ALT_INV_LastValidDL\(7) <= NOT \TheParToI2s|LastValidDL\(7);
\TheParToI2s|ALT_INV_LastValidDL\(13) <= NOT \TheParToI2s|LastValidDL\(13);
\TheParToI2s|ALT_INV_LastValidDL\(5) <= NOT \TheParToI2s|LastValidDL\(5);
\TheParToI2s|ALT_INV_Mux1~2_combout\ <= NOT \TheParToI2s|Mux1~2_combout\;
\TheParToI2s|ALT_INV_LastValidDL\(11) <= NOT \TheParToI2s|LastValidDL\(11);
\TheParToI2s|ALT_INV_LastValidDL\(3) <= NOT \TheParToI2s|LastValidDL\(3);
\TheParToI2s|ALT_INV_LastValidDL\(9) <= NOT \TheParToI2s|LastValidDL\(9);
\TheParToI2s|ALT_INV_LastValidDL\(1) <= NOT \TheParToI2s|LastValidDL\(1);
\TheParToI2s|ALT_INV_Mux1~1_combout\ <= NOT \TheParToI2s|Mux1~1_combout\;
\TheParToI2s|ALT_INV_LastValidDL\(14) <= NOT \TheParToI2s|LastValidDL\(14);
\TheParToI2s|ALT_INV_LastValidDL\(6) <= NOT \TheParToI2s|LastValidDL\(6);
\TheParToI2s|ALT_INV_LastValidDL\(12) <= NOT \TheParToI2s|LastValidDL\(12);
\TheParToI2s|ALT_INV_LastValidDL\(4) <= NOT \TheParToI2s|LastValidDL\(4);
\TheParToI2s|ALT_INV_Mux1~0_combout\ <= NOT \TheParToI2s|Mux1~0_combout\;
\TheParToI2s|ALT_INV_LastValidDL\(10) <= NOT \TheParToI2s|LastValidDL\(10);
\TheParToI2s|ALT_INV_LastValidDL\(8) <= NOT \TheParToI2s|LastValidDL\(8);
\TheParToI2s|ALT_INV_BclkCtr\(1) <= NOT \TheParToI2s|BclkCtr\(1);
\TheParToI2s|ALT_INV_BclkCtr\(3) <= NOT \TheParToI2s|BclkCtr\(3);
\TheParToI2s|ALT_INV_LastValidDL\(2) <= NOT \TheParToI2s|LastValidDL\(2);
\ALT_INV_PhaseStrobe~combout\ <= NOT \PhaseStrobe~combout\;
\ALT_INV_oldADClrc~q\ <= NOT \oldADClrc~q\;
\GenClks|ALT_INV_ADClrc~q\ <= NOT \GenClks|ADClrc~q\;
\GenClks|ALT_INV_Mclk~q\ <= NOT \GenClks|Mclk~q\;
\TheTxDataSync|ALT_INV_Metastable\(1) <= NOT \TheTxDataSync|Metastable\(1);
\ConfigureCodec|ALT_INV_R.Configured~q\ <= NOT \ConfigureCodec|R.Configured~q\;
\ALT_INV_Start~q\ <= NOT \Start~q\;
\TheChannelSelSync|ALT_INV_Metastable\(1) <= NOT \TheChannelSelSync|Metastable\(1);
\fsksender_inst|ALT_INV_Reg.WaitCounter\(0) <= NOT \fsksender_inst|Reg.WaitCounter\(0);
\fsksender_inst|ALT_INV_Reg.WaitCounter\(1) <= NOT \fsksender_inst|Reg.WaitCounter\(1);
\fsksender_inst|msstrobe_generator|ALT_INV_Add0~53_sumout\ <= NOT \fsksender_inst|msstrobe_generator|Add0~53_sumout\;
\fsksender_inst|msstrobe_generator|ALT_INV_Add0~49_sumout\ <= NOT \fsksender_inst|msstrobe_generator|Add0~49_sumout\;
\fsksender_inst|msstrobe_generator|ALT_INV_Add0~45_sumout\ <= NOT \fsksender_inst|msstrobe_generator|Add0~45_sumout\;
\fsksender_inst|msstrobe_generator|ALT_INV_Add0~41_sumout\ <= NOT \fsksender_inst|msstrobe_generator|Add0~41_sumout\;
\fsksender_inst|msstrobe_generator|ALT_INV_Add0~37_sumout\ <= NOT \fsksender_inst|msstrobe_generator|Add0~37_sumout\;
\fsksender_inst|msstrobe_generator|ALT_INV_Add0~33_sumout\ <= NOT \fsksender_inst|msstrobe_generator|Add0~33_sumout\;
\fsksender_inst|msstrobe_generator|ALT_INV_Add0~25_sumout\ <= NOT \fsksender_inst|msstrobe_generator|Add0~25_sumout\;
\TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[17]~45_sumout\ <= NOT \TheTxFsk|TheDDS|NxtPhaseAddr[17]~45_sumout\;
\TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[16]~41_sumout\ <= NOT \TheTxFsk|TheDDS|NxtPhaseAddr[16]~41_sumout\;
\TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[15]~37_sumout\ <= NOT \TheTxFsk|TheDDS|NxtPhaseAddr[15]~37_sumout\;
\TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[14]~33_sumout\ <= NOT \TheTxFsk|TheDDS|NxtPhaseAddr[14]~33_sumout\;
\TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[13]~29_sumout\ <= NOT \TheTxFsk|TheDDS|NxtPhaseAddr[13]~29_sumout\;
\TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[12]~25_sumout\ <= NOT \TheTxFsk|TheDDS|NxtPhaseAddr[12]~25_sumout\;
\TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[11]~21_sumout\ <= NOT \TheTxFsk|TheDDS|NxtPhaseAddr[11]~21_sumout\;
\TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[10]~17_sumout\ <= NOT \TheTxFsk|TheDDS|NxtPhaseAddr[10]~17_sumout\;
\TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[9]~13_sumout\ <= NOT \TheTxFsk|TheDDS|NxtPhaseAddr[9]~13_sumout\;
\TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[8]~9_sumout\ <= NOT \TheTxFsk|TheDDS|NxtPhaseAddr[8]~9_sumout\;
\TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[18]~5_sumout\ <= NOT \TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\;
\fsksender_inst|baudrate_generator|ALT_INV_Add0~65_sumout\ <= NOT \fsksender_inst|baudrate_generator|Add0~65_sumout\;
\fsksender_inst|baudrate_generator|ALT_INV_Add0~61_sumout\ <= NOT \fsksender_inst|baudrate_generator|Add0~61_sumout\;
\fsksender_inst|baudrate_generator|ALT_INV_Add0~53_sumout\ <= NOT \fsksender_inst|baudrate_generator|Add0~53_sumout\;
\fsksender_inst|baudrate_generator|ALT_INV_Add0~41_sumout\ <= NOT \fsksender_inst|baudrate_generator|Add0~41_sumout\;
\fsksender_inst|baudrate_generator|ALT_INV_Add0~33_sumout\ <= NOT \fsksender_inst|baudrate_generator|Add0~33_sumout\;
\fsksender_inst|baudrate_generator|ALT_INV_Add0~25_sumout\ <= NOT \fsksender_inst|baudrate_generator|Add0~25_sumout\;
\fsksender_inst|baudrate_generator|ALT_INV_Add0~5_sumout\ <= NOT \fsksender_inst|baudrate_generator|Add0~5_sumout\;
\fsksender_inst|baudrate_generator|ALT_INV_Add0~1_sumout\ <= NOT \fsksender_inst|baudrate_generator|Add0~1_sumout\;
\fsksender_inst|ALT_INV_Reg.WaitCounter\(10) <= NOT \fsksender_inst|Reg.WaitCounter\(10);
\fsksender_inst|ALT_INV_Reg.WaitCounter\(11) <= NOT \fsksender_inst|Reg.WaitCounter\(11);
\fsksender_inst|ALT_INV_Reg.WaitCounter\(2) <= NOT \fsksender_inst|Reg.WaitCounter\(2);
\fsksender_inst|ALT_INV_Reg.WaitCounter\(12) <= NOT \fsksender_inst|Reg.WaitCounter\(12);
\fsksender_inst|ALT_INV_Reg.WaitCounter\(13) <= NOT \fsksender_inst|Reg.WaitCounter\(13);
\fsksender_inst|ALT_INV_Reg.WaitCounter\(7) <= NOT \fsksender_inst|Reg.WaitCounter\(7);
\fsksender_inst|ALT_INV_Reg.WaitCounter\(8) <= NOT \fsksender_inst|Reg.WaitCounter\(8);
\fsksender_inst|ALT_INV_Reg.WaitCounter\(9) <= NOT \fsksender_inst|Reg.WaitCounter\(9);
\fsksender_inst|ALT_INV_Reg.WaitCounter\(5) <= NOT \fsksender_inst|Reg.WaitCounter\(5);
\fsksender_inst|ALT_INV_Reg.WaitCounter\(6) <= NOT \fsksender_inst|Reg.WaitCounter\(6);
\fsksender_inst|ALT_INV_Reg.WaitCounter\(3) <= NOT \fsksender_inst|Reg.WaitCounter\(3);
\fsksender_inst|ALT_INV_Reg.WaitCounter\(4) <= NOT \fsksender_inst|Reg.WaitCounter\(4);
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a6\ <= NOT \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a6\;
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a10\ <= NOT \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a10\;
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a12\ <= NOT \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a12\;
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a1~portadataout\ <= NOT \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a1~portadataout\;
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a2\ <= NOT \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a2\;
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a3\ <= NOT \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a3\;
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a4\ <= NOT \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a4\;
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a5\ <= NOT \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a5\;
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a7\ <= NOT \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a7\;
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a8\ <= NOT \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a8\;
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a9\ <= NOT \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a9\;
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a11\ <= NOT \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a11\;
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a13\ <= NOT \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a13\;
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a0~portadataout\ <= NOT \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0~portadataout\;
\GenClks|ALT_INV_Add1~29_sumout\ <= NOT \GenClks|Add1~29_sumout\;
\GenClks|ALT_INV_Add1~17_sumout\ <= NOT \GenClks|Add1~17_sumout\;
\GenClks|ALT_INV_Add1~13_sumout\ <= NOT \GenClks|Add1~13_sumout\;
\ConfigureCodec|ALT_INV_R.AddrCtr\(1) <= NOT \ConfigureCodec|R.AddrCtr\(1);
\ConfigureCodec|ALT_INV_R.AddrCtr\(2) <= NOT \ConfigureCodec|R.AddrCtr\(2);
\ConfigureCodec|ALT_INV_R.AddrCtr\(3) <= NOT \ConfigureCodec|R.AddrCtr\(3);
\ConfigureCodec|ALT_INV_R.AddrCtr\(4) <= NOT \ConfigureCodec|R.AddrCtr\(4);
\ConfigureCodec|ALT_INV_R.AddrCtr\(5) <= NOT \ConfigureCodec|R.AddrCtr\(5);
\ConfigureCodec|ALT_INV_R.AddrCtr\(6) <= NOT \ConfigureCodec|R.AddrCtr\(6);
\ConfigureCodec|ALT_INV_R.AddrCtr\(0) <= NOT \ConfigureCodec|R.AddrCtr\(0);
\TheTxFsk|TheDDS|ALT_INV_RegsLFSR[3]~DUPLICATE_q\ <= NOT \TheTxFsk|TheDDS|RegsLFSR[3]~DUPLICATE_q\;
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[5]~DUPLICATE_q\ <= NOT \fsksender_inst|msstrobe_generator|ClkCounter[5]~DUPLICATE_q\;
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[6]~DUPLICATE_q\ <= NOT \fsksender_inst|msstrobe_generator|ClkCounter[6]~DUPLICATE_q\;
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[12]~DUPLICATE_q\ <= NOT \fsksender_inst|msstrobe_generator|ClkCounter[12]~DUPLICATE_q\;
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[2]~DUPLICATE_q\ <= NOT \fsksender_inst|msstrobe_generator|ClkCounter[2]~DUPLICATE_q\;
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[4]~DUPLICATE_q\ <= NOT \fsksender_inst|msstrobe_generator|ClkCounter[4]~DUPLICATE_q\;
\fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[10]~DUPLICATE_q\ <= NOT \fsksender_inst|msstrobe_generator|ClkCounter[10]~DUPLICATE_q\;
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[7]~DUPLICATE_q\ <= NOT \fsksender_inst|baudrate_generator|ClkCounter[7]~DUPLICATE_q\;
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[8]~DUPLICATE_q\ <= NOT \fsksender_inst|baudrate_generator|ClkCounter[8]~DUPLICATE_q\;
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[11]~DUPLICATE_q\ <= NOT \fsksender_inst|baudrate_generator|ClkCounter[11]~DUPLICATE_q\;
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[13]~DUPLICATE_q\ <= NOT \fsksender_inst|baudrate_generator|ClkCounter[13]~DUPLICATE_q\;
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[14]~DUPLICATE_q\ <= NOT \fsksender_inst|baudrate_generator|ClkCounter[14]~DUPLICATE_q\;
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[15]~DUPLICATE_q\ <= NOT \fsksender_inst|baudrate_generator|ClkCounter[15]~DUPLICATE_q\;
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[16]~DUPLICATE_q\ <= NOT \fsksender_inst|baudrate_generator|ClkCounter[16]~DUPLICATE_q\;
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[17]~DUPLICATE_q\ <= NOT \fsksender_inst|baudrate_generator|ClkCounter[17]~DUPLICATE_q\;
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[2]~DUPLICATE_q\ <= NOT \fsksender_inst|baudrate_generator|ClkCounter[2]~DUPLICATE_q\;
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[6]~DUPLICATE_q\ <= NOT \fsksender_inst|baudrate_generator|ClkCounter[6]~DUPLICATE_q\;
\fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[12]~DUPLICATE_q\ <= NOT \fsksender_inst|baudrate_generator|ClkCounter[12]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.FrameState.Address~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Address~DUPLICATE_q\;
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\ <= NOT \TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\;
\fsksender_inst|baudrate_generator|ALT_INV_oStrobe~DUPLICATE_q\ <= NOT \fsksender_inst|baudrate_generator|oStrobe~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\ <= NOT \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_ClkCounter[1]~DUPLICATE_q\ <= NOT \GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\;
\TheParToI2s|ALT_INV_BclkDlyd~DUPLICATE_q\ <= NOT \TheParToI2s|BclkDlyd~DUPLICATE_q\;
\TheParToI2s|ALT_INV_State.FirstBitEmptyR~DUPLICATE_q\ <= NOT \TheParToI2s|State.FirstBitEmptyR~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.FrameState.Stop~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Stop~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\ <= NOT \ConfigureCodec|R.Sclk~DUPLICATE_q\;
\TheParToI2s|ALT_INV_State.FirstBitEmptyL~DUPLICATE_q\ <= NOT \TheParToI2s|State.FirstBitEmptyL~DUPLICATE_q\;
\TheParToI2s|ALT_INV_State.SendingL~DUPLICATE_q\ <= NOT \TheParToI2s|State.SendingL~DUPLICATE_q\;
\TheParToI2s|ALT_INV_BclkCtr[0]~DUPLICATE_q\ <= NOT \TheParToI2s|BclkCtr[0]~DUPLICATE_q\;
\ALT_INV_Start~DUPLICATE_q\ <= NOT \Start~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.AddrCtr[2]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.AddrCtr[2]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.AddrCtr[5]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.AddrCtr[5]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\;
\ALT_INV_iSwitch[2]~input_o\ <= NOT \iSwitch[2]~input_o\;
\ALT_INV_iSwitch[1]~input_o\ <= NOT \iSwitch[1]~input_o\;
\ALT_INV_iSwitch[0]~input_o\ <= NOT \iSwitch[0]~input_o\;
\ALT_INV_inButton[1]~input_o\ <= NOT \inButton[1]~input_o\;
\ALT_INV_ioI2cSdin~input_o\ <= NOT \ioI2cSdin~input_o\;
\TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(17) <= NOT \TheTxFsk|TheDDS|RegsLFSR\(17);
\TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(7) <= NOT \TheTxFsk|TheDDS|RegsLFSR\(7);
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(0) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(0);
\TheTxFsk|TheDDS|ALT_INV_RandomValue[-8]~q\ <= NOT \TheTxFsk|TheDDS|RandomValue[-8]~q\;
\TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(6) <= NOT \TheTxFsk|TheDDS|RegsLFSR\(6);
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(1) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(1);
\TheTxFsk|TheDDS|ALT_INV_RandomValue[-7]~q\ <= NOT \TheTxFsk|TheDDS|RandomValue[-7]~q\;
\TheTxFsk|TheDDS|ALT_INV_RandomValue[-6]~q\ <= NOT \TheTxFsk|TheDDS|RandomValue[-6]~q\;
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(2) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(2);
\TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(24) <= NOT \TheTxFsk|TheDDS|RegsLFSR\(24);
\TheTxFsk|TheDDS|ALT_INV_RandomValue[-5]~q\ <= NOT \TheTxFsk|TheDDS|RandomValue[-5]~q\;
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(3) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(3);
\TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(25) <= NOT \TheTxFsk|TheDDS|RegsLFSR\(25);
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(4) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(4);
\TheTxFsk|TheDDS|ALT_INV_RandomValue[-4]~q\ <= NOT \TheTxFsk|TheDDS|RandomValue[-4]~q\;
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(5) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(5);
\TheTxFsk|TheDDS|ALT_INV_RandomValue[-3]~q\ <= NOT \TheTxFsk|TheDDS|RandomValue[-3]~q\;
\TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(1) <= NOT \TheTxFsk|TheDDS|RegsLFSR\(1);
\TheTxFsk|TheDDS|ALT_INV_RandomValue[-2]~q\ <= NOT \TheTxFsk|TheDDS|RandomValue[-2]~q\;
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(6) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(6);
\TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(2) <= NOT \TheTxFsk|TheDDS|RegsLFSR\(2);
\TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(4) <= NOT \TheTxFsk|TheDDS|RegsLFSR\(4);
\TheTxFsk|TheDDS|ALT_INV_RandomValue[-1]~q\ <= NOT \TheTxFsk|TheDDS|RandomValue[-1]~q\;
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(7) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(7);
\TheTxFsk|TheDDS|ALT_INV_NextRegsLFSR\(0) <= NOT \TheTxFsk|TheDDS|NextRegsLFSR\(0);
\TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(0) <= NOT \TheTxFsk|TheDDS|RegsLFSR\(0);
\TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(3) <= NOT \TheTxFsk|TheDDS|RegsLFSR\(3);
\TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(5) <= NOT \TheTxFsk|TheDDS|RegsLFSR\(5);
\TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(29) <= NOT \TheTxFsk|TheDDS|RegsLFSR\(29);
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(17) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(17);
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(16) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(16);
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(15) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(15);
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(14) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(14);
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(13) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(13);
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(12) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(12);
\TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(11) <= NOT \TheTxFsk|TheDDS|PhaseAddr\(11);

-- Location: IOOBUF_X12_Y81_N19
\oI2cSclk~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	devoe => ww_devoe,
	o => ww_oI2cSclk);

-- Location: IOOBUF_X89_Y8_N39
\oSEG0[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG0(0));

-- Location: IOOBUF_X89_Y11_N79
\oSEG0[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG0(1));

-- Location: IOOBUF_X89_Y11_N96
\oSEG0[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG0(2));

-- Location: IOOBUF_X89_Y4_N79
\oSEG0[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG0(3));

-- Location: IOOBUF_X89_Y13_N56
\oSEG0[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG0(4));

-- Location: IOOBUF_X89_Y13_N39
\oSEG0[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG0(5));

-- Location: IOOBUF_X89_Y4_N96
\oSEG0[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG0(6));

-- Location: IOOBUF_X89_Y6_N39
\oSEG1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG1(0));

-- Location: IOOBUF_X89_Y6_N56
\oSEG1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG1(1));

-- Location: IOOBUF_X89_Y16_N39
\oSEG1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG1(2));

-- Location: IOOBUF_X89_Y16_N56
\oSEG1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG1(3));

-- Location: IOOBUF_X89_Y15_N39
\oSEG1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG1(4));

-- Location: IOOBUF_X89_Y15_N56
\oSEG1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG1(5));

-- Location: IOOBUF_X89_Y8_N56
\oSEG1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG1(6));

-- Location: IOOBUF_X89_Y9_N22
\oSEG2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TheChannelSelSync|Metastable\(1),
	devoe => ww_devoe,
	o => ww_oSEG2(0));

-- Location: IOOBUF_X89_Y23_N39
\oSEG2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG2(1));

-- Location: IOOBUF_X89_Y23_N56
\oSEG2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG2(2));

-- Location: IOOBUF_X89_Y20_N79
\oSEG2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TheChannelSelSync|Metastable\(1),
	devoe => ww_devoe,
	o => ww_oSEG2(3));

-- Location: IOOBUF_X89_Y25_N39
\oSEG2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TheChannelSelSync|Metastable\(1),
	devoe => ww_devoe,
	o => ww_oSEG2(4));

-- Location: IOOBUF_X89_Y20_N96
\oSEG2[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG2(5));

-- Location: IOOBUF_X89_Y25_N56
\oSEG2[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG2(6));

-- Location: IOOBUF_X89_Y16_N5
\oSEG3[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TheChannelSelSync|Metastable\(1),
	devoe => ww_devoe,
	o => ww_oSEG3(0));

-- Location: IOOBUF_X89_Y16_N22
\oSEG3[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG3(1));

-- Location: IOOBUF_X89_Y4_N45
\oSEG3[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG3(2));

-- Location: IOOBUF_X89_Y4_N62
\oSEG3[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TheChannelSelSync|Metastable\(1),
	devoe => ww_devoe,
	o => ww_oSEG3(3));

-- Location: IOOBUF_X89_Y21_N39
\oSEG3[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TheChannelSelSync|Metastable\(1),
	devoe => ww_devoe,
	o => ww_oSEG3(4));

-- Location: IOOBUF_X89_Y11_N62
\oSEG3[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG3(5));

-- Location: IOOBUF_X89_Y9_N5
\oSEG3[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG3(6));

-- Location: IOOBUF_X89_Y11_N45
\oSEG4[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG4(0));

-- Location: IOOBUF_X89_Y13_N5
\oSEG4[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG4(1));

-- Location: IOOBUF_X89_Y13_N22
\oSEG4[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG4(2));

-- Location: IOOBUF_X89_Y8_N22
\oSEG4[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG4(3));

-- Location: IOOBUF_X89_Y15_N22
\oSEG4[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG4(4));

-- Location: IOOBUF_X89_Y15_N5
\oSEG4[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG4(5));

-- Location: IOOBUF_X89_Y20_N45
\oSEG4[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG4(6));

-- Location: IOOBUF_X89_Y20_N62
\oSEG5[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG5(0));

-- Location: IOOBUF_X89_Y21_N56
\oSEG5[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG5(1));

-- Location: IOOBUF_X89_Y25_N22
\oSEG5[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG5(2));

-- Location: IOOBUF_X89_Y23_N22
\oSEG5[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG5(3));

-- Location: IOOBUF_X89_Y9_N56
\oSEG5[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG5(4));

-- Location: IOOBUF_X89_Y23_N5
\oSEG5[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG5(5));

-- Location: IOOBUF_X89_Y9_N39
\oSEG5[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oSEG5(6));

-- Location: IOOBUF_X52_Y0_N2
\oLed[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|locked_wire\(0),
	devoe => ww_devoe,
	o => ww_oLed(0));

-- Location: IOOBUF_X52_Y0_N19
\oLed[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Start~q\,
	devoe => ww_devoe,
	o => ww_oLed(1));

-- Location: IOOBUF_X60_Y0_N2
\oLed[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ConfigureCodec|R.Configured~q\,
	devoe => ww_devoe,
	o => ww_oLed(2));

-- Location: IOOBUF_X80_Y0_N2
\oLed[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oLed(3));

-- Location: IOOBUF_X60_Y0_N19
\oLed[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oLed(4));

-- Location: IOOBUF_X80_Y0_N19
\oLed[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TheTxDataSync|Metastable\(1),
	devoe => ww_devoe,
	o => ww_oLed(5));

-- Location: IOOBUF_X84_Y0_N2
\oLed[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TheTxDataSync|Metastable\(1),
	devoe => ww_devoe,
	o => ww_oLed(6));

-- Location: IOOBUF_X89_Y6_N5
\oLed[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TheChannelSelSync|Metastable\(1),
	devoe => ww_devoe,
	o => ww_oLed(7));

-- Location: IOOBUF_X89_Y8_N5
\oLed[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oLed(8));

-- Location: IOOBUF_X89_Y6_N22
\oLed[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_oLed(9));

-- Location: IOOBUF_X64_Y0_N2
\GPIO_0[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GenClks|Mclk~q\,
	devoe => ww_devoe,
	o => ww_GPIO_0(0));

-- Location: IOOBUF_X68_Y0_N2
\GPIO_0[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GenClks|Mclk~q\,
	devoe => ww_devoe,
	o => ww_GPIO_0(1));

-- Location: IOOBUF_X64_Y0_N19
\GPIO_0[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GenClks|ADClrc~q\,
	devoe => ww_devoe,
	o => ww_GPIO_0(2));

-- Location: IOOBUF_X72_Y0_N2
\GPIO_0[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PhaseStrobe~combout\,
	devoe => ww_devoe,
	o => ww_GPIO_0(3));

-- Location: IOOBUF_X54_Y0_N53
\GPIO_0[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(4));

-- Location: IOOBUF_X58_Y0_N59
\GPIO_0[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(5));

-- Location: IOOBUF_X60_Y0_N53
\GPIO_0[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(6));

-- Location: IOOBUF_X60_Y0_N36
\GPIO_0[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(7));

-- Location: IOOBUF_X58_Y0_N42
\GPIO_0[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(8));

-- Location: IOOBUF_X54_Y0_N36
\GPIO_0[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(9));

-- Location: IOOBUF_X56_Y0_N53
\GPIO_0[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(10));

-- Location: IOOBUF_X56_Y0_N36
\GPIO_0[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(11));

-- Location: IOOBUF_X50_Y0_N76
\GPIO_0[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(12));

-- Location: IOOBUF_X52_Y0_N36
\GPIO_0[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(13));

-- Location: IOOBUF_X52_Y0_N53
\GPIO_0[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(14));

-- Location: IOOBUF_X50_Y0_N93
\GPIO_0[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(15));

-- Location: IOOBUF_X68_Y0_N19
\GPIO_0[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(16));

-- Location: IOOBUF_X72_Y0_N19
\GPIO_0[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(17));

-- Location: IOOBUF_X50_Y0_N42
\GPIO_0[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(18));

-- Location: IOOBUF_X76_Y0_N2
\GPIO_0[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(19));

-- Location: IOOBUF_X58_Y0_N93
\GPIO_0[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(20));

-- Location: IOOBUF_X62_Y0_N36
\GPIO_0[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(21));

-- Location: IOOBUF_X54_Y0_N19
\GPIO_0[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(22));

-- Location: IOOBUF_X68_Y0_N36
\GPIO_0[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(23));

-- Location: IOOBUF_X76_Y0_N19
\GPIO_0[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(24));

-- Location: IOOBUF_X82_Y0_N42
\GPIO_0[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(25));

-- Location: IOOBUF_X66_Y0_N42
\GPIO_0[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(26));

-- Location: IOOBUF_X66_Y0_N59
\GPIO_0[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(27));

-- Location: IOOBUF_X70_Y0_N2
\GPIO_0[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(28));

-- Location: IOOBUF_X70_Y0_N19
\GPIO_0[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(29));

-- Location: IOOBUF_X62_Y0_N2
\GPIO_0[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(30));

-- Location: IOOBUF_X54_Y0_N2
\GPIO_0[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(31));

-- Location: IOOBUF_X50_Y0_N59
\GPIO_0[32]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(32));

-- Location: IOOBUF_X62_Y0_N19
\GPIO_0[33]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(33));

-- Location: IOOBUF_X58_Y0_N76
\GPIO_0[34]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(34));

-- Location: IOOBUF_X62_Y0_N53
\GPIO_0[35]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_GPIO_0(35));

-- Location: IOOBUF_X2_Y81_N76
\oMclk~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GenClks|Mclk~q\,
	devoe => ww_devoe,
	o => ww_oMclk);

-- Location: IOOBUF_X16_Y81_N19
\oBclk~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GenClks|Mclk~q\,
	devoe => ww_devoe,
	o => ww_oBclk);

-- Location: IOOBUF_X16_Y81_N2
\oDACdat~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TheParToI2s|Selector10~1_combout\,
	devoe => ww_devoe,
	o => ww_oDACdat);

-- Location: IOOBUF_X8_Y81_N19
\oADClrc~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GenClks|ADClrc~q\,
	devoe => ww_devoe,
	o => ww_oADClrc);

-- Location: IOOBUF_X24_Y81_N2
\oDAClrc~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TheParToI2s|ALT_INV_oLrc~0_combout\,
	devoe => ww_devoe,
	o => ww_oDAClrc);

-- Location: IOOBUF_X12_Y81_N2
\ioI2cSdin~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ConfigureCodec|ALT_INV_R.Sdin~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => ioI2cSdin);

-- Location: IOIBUF_X32_Y0_N1
\iClk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iClk,
	o => \iClk~input_o\);

-- Location: PLLREFCLKSELECT_X0_Y21_N0
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT\ : cyclonev_pll_refclk_select
-- pragma translate_off
GENERIC MAP (
	pll_auto_clk_sw_en => "false",
	pll_clk_loss_edge => "both_edges",
	pll_clk_loss_sw_en => "false",
	pll_clk_sw_dly => 0,
	pll_clkin_0_src => "clk_0",
	pll_clkin_1_src => "ref_clk1",
	pll_manu_clk_sw_en => "false",
	pll_sw_refclk_src => "clk_0")
-- pragma translate_on
PORT MAP (
	clkin => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\,
	clkout => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	extswitchbuf => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\);

-- Location: IOIBUF_X36_Y0_N18
\inButton[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inButton(1),
	o => \inButton[1]~input_o\);

-- Location: FRACTIONALPLL_X0_Y15_N0
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL\ : cyclonev_fractional_pll
-- pragma translate_off
GENERIC MAP (
	dsm_accumulator_reset_value => 0,
	forcelock => "false",
	mimic_fbclk_type => "none",
	nreset_invert => "true",
	output_clock_frequency => "480.0 mhz",
	pll_atb => 0,
	pll_bwctrl => 10000,
	pll_cmp_buf_dly => "0 ps",
	pll_cp_comp => "true",
	pll_cp_current => 20,
	pll_ctrl_override_setting => "false",
	pll_dsm_dither => "disable",
	pll_dsm_out_sel => "disable",
	pll_dsm_reset => "false",
	pll_ecn_bypass => "false",
	pll_ecn_test_en => "false",
	pll_enable => "true",
	pll_fbclk_mux_1 => "glb",
	pll_fbclk_mux_2 => "m_cnt",
	pll_fractional_carry_out => 32,
	pll_fractional_division => 1,
	pll_fractional_division_string => "'0'",
	pll_fractional_value_ready => "true",
	pll_lf_testen => "false",
	pll_lock_fltr_cfg => 25,
	pll_lock_fltr_test => "false",
	pll_m_cnt_bypass_en => "false",
	pll_m_cnt_coarse_dly => "0 ps",
	pll_m_cnt_fine_dly => "0 ps",
	pll_m_cnt_hi_div => 24,
	pll_m_cnt_in_src => "ph_mux_clk",
	pll_m_cnt_lo_div => 24,
	pll_m_cnt_odd_div_duty_en => "false",
	pll_m_cnt_ph_mux_prst => 6,
	pll_m_cnt_prst => 5,
	pll_n_cnt_bypass_en => "false",
	pll_n_cnt_coarse_dly => "0 ps",
	pll_n_cnt_fine_dly => "0 ps",
	pll_n_cnt_hi_div => 3,
	pll_n_cnt_lo_div => 2,
	pll_n_cnt_odd_div_duty_en => "false",
	pll_ref_buf_dly => "0 ps",
	pll_reg_boost => 0,
	pll_regulator_bypass => "false",
	pll_ripplecap_ctrl => 0,
	pll_slf_rst => "false",
	pll_tclk_mux_en => "false",
	pll_tclk_sel => "n_src",
	pll_test_enable => "false",
	pll_testdn_enable => "false",
	pll_testup_enable => "false",
	pll_unlock_fltr_cfg => 2,
	pll_vco_div => 2,
	pll_vco_ph0_en => "true",
	pll_vco_ph1_en => "true",
	pll_vco_ph2_en => "true",
	pll_vco_ph3_en => "true",
	pll_vco_ph4_en => "true",
	pll_vco_ph5_en => "true",
	pll_vco_ph6_en => "true",
	pll_vco_ph7_en => "true",
	pll_vctrl_test_voltage => 750,
	reference_clock_frequency => "50.0 mhz",
	vccd0g_atb => "disable",
	vccd0g_output => 0,
	vccd1g_atb => "disable",
	vccd1g_output => 0,
	vccm1g_tap => 2,
	vccr_pd => "false",
	vcodiv_override => "false",
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	coreclkfb => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|fboutclk_wire\(0),
	ecnc1test => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\,
	nresync => \ALT_INV_inButton[1]~input_o\,
	refclkin => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	shift => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftdonein => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	cntnen => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	fbclk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|fboutclk_wire\(0),
	lock => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|locked_wire\(0),
	tclk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	vcoph => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\,
	mhi => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\);

-- Location: PLLRECONFIG_X0_Y19_N0
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG\ : cyclonev_pll_reconfig
-- pragma translate_off
GENERIC MAP (
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	cntnen => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	mhi => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\,
	shift => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftenm => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	shiften => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\);

-- Location: PLLOUTPUTCOUNTER_X0_Y20_N1
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER\ : cyclonev_pll_output_counter
-- pragma translate_off
GENERIC MAP (
	c_cnt_coarse_dly => "0 ps",
	c_cnt_fine_dly => "0 ps",
	c_cnt_in_src => "ph_mux_clk",
	c_cnt_ph_mux_prst => 0,
	c_cnt_prst => 1,
	cnt_fpll_src => "fpll_0",
	dprio0_cnt_bypass_en => "false",
	dprio0_cnt_hi_div => 5,
	dprio0_cnt_lo_div => 5,
	dprio0_cnt_odd_div_even_duty_en => "false",
	duty_cycle => 50,
	output_clock_frequency => "48.0 mhz",
	phase_shift => "0 ps",
  fractional_pll_index => 0,
  output_counter_index => 6)
-- pragma translate_on
PORT MAP (
	nen0 => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	shift0 => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\,
	tclk0 => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	up0 => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	vco0ph => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\,
	divclk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire\(0));

-- Location: CLKCTRL_G0
\PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire\(0),
	outclk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\);

-- Location: IOIBUF_X12_Y81_N1
\ioI2cSdin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ioI2cSdin,
	o => \ioI2cSdin~input_o\);

-- Location: CLKCTRL_G5
\inButton[1]~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \inButton[1]~input_o\,
	outclk => \inButton[1]~inputCLKENA0_outclk\);

-- Location: FF_X33_Y55_N38
\GenStrobeI2C|ClkCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[1]~4_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(1));

-- Location: FF_X33_Y55_N47
\GenStrobeI2C|ClkCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[0]~5_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(0));

-- Location: LABCELL_X33_Y55_N45
\GenStrobeI2C|ClkCounter[0]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[0]~5_combout\ = ( !\GenStrobeI2C|ClkCounter\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \GenStrobeI2C|ALT_INV_ClkCounter\(0),
	combout => \GenStrobeI2C|ClkCounter[0]~5_combout\);

-- Location: FF_X33_Y55_N46
\GenStrobeI2C|ClkCounter[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[0]~5_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\);

-- Location: LABCELL_X33_Y55_N36
\GenStrobeI2C|ClkCounter[1]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[1]~4_combout\ = ( !\GenStrobeI2C|ClkCounter\(1) & ( \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ ) ) # ( \GenStrobeI2C|ClkCounter\(1) & ( !\GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \GenStrobeI2C|ALT_INV_ClkCounter\(1),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\,
	combout => \GenStrobeI2C|ClkCounter[1]~4_combout\);

-- Location: FF_X33_Y55_N37
\GenStrobeI2C|ClkCounter[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[1]~4_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\);

-- Location: LABCELL_X33_Y55_N57
\GenStrobeI2C|ClkCounter[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[2]~3_combout\ = ( \GenStrobeI2C|ClkCounter\(2) & ( \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ & ( !\GenStrobeI2C|ClkCounter\(1) ) ) ) # ( !\GenStrobeI2C|ClkCounter\(2) & ( \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ & ( 
-- \GenStrobeI2C|ClkCounter\(1) ) ) ) # ( \GenStrobeI2C|ClkCounter\(2) & ( !\GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000111111111111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(1),
	datae => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\,
	combout => \GenStrobeI2C|ClkCounter[2]~3_combout\);

-- Location: FF_X33_Y55_N58
\GenStrobeI2C|ClkCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[2]~3_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(2));

-- Location: LABCELL_X33_Y55_N12
\GenStrobeI2C|ClkCounter[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[3]~2_combout\ = ( \GenStrobeI2C|ClkCounter\(2) & ( !\GenStrobeI2C|ClkCounter\(3) $ (((!\GenStrobeI2C|ClkCounter\(0)) # (!\GenStrobeI2C|ClkCounter\(1)))) ) ) # ( !\GenStrobeI2C|ClkCounter\(2) & ( \GenStrobeI2C|ClkCounter\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000011111111000000001111111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_ClkCounter\(0),
	datac => \GenStrobeI2C|ALT_INV_ClkCounter\(1),
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(3),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	combout => \GenStrobeI2C|ClkCounter[3]~2_combout\);

-- Location: FF_X33_Y55_N14
\GenStrobeI2C|ClkCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[3]~2_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(3));

-- Location: LABCELL_X33_Y55_N15
\GenStrobeI2C|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|Equal0~0_combout\ = ( \GenStrobeI2C|ClkCounter\(3) & ( (\GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\ & (\GenStrobeI2C|ClkCounter\(0) & \GenStrobeI2C|ClkCounter\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_ClkCounter[1]~DUPLICATE_q\,
	datab => \GenStrobeI2C|ALT_INV_ClkCounter\(0),
	datac => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter\(3),
	combout => \GenStrobeI2C|Equal0~0_combout\);

-- Location: LABCELL_X33_Y55_N30
\GenStrobeI2C|ClkCounter[4]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[4]~1_combout\ = ( !\GenStrobeI2C|ClkCounter\(4) & ( \GenStrobeI2C|Equal0~0_combout\ ) ) # ( \GenStrobeI2C|ClkCounter\(4) & ( !\GenStrobeI2C|Equal0~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \GenStrobeI2C|ALT_INV_ClkCounter\(4),
	dataf => \GenStrobeI2C|ALT_INV_Equal0~0_combout\,
	combout => \GenStrobeI2C|ClkCounter[4]~1_combout\);

-- Location: FF_X33_Y55_N32
\GenStrobeI2C|ClkCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[4]~1_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(4));

-- Location: LABCELL_X33_Y55_N51
\GenStrobeI2C|ClkCounter[5]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[5]~0_combout\ = ( \GenStrobeI2C|Equal0~0_combout\ & ( !\GenStrobeI2C|ClkCounter\(4) $ (!\GenStrobeI2C|ClkCounter\(5)) ) ) # ( !\GenStrobeI2C|Equal0~0_combout\ & ( \GenStrobeI2C|ClkCounter\(5) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenStrobeI2C|ALT_INV_ClkCounter\(4),
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(5),
	dataf => \GenStrobeI2C|ALT_INV_Equal0~0_combout\,
	combout => \GenStrobeI2C|ClkCounter[5]~0_combout\);

-- Location: FF_X33_Y55_N53
\GenStrobeI2C|ClkCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[5]~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(5));

-- Location: LABCELL_X33_Y55_N48
\GenStrobeI2C|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|Equal0~1_combout\ = ( \GenStrobeI2C|Equal0~0_combout\ & ( (\GenStrobeI2C|ClkCounter\(4) & \GenStrobeI2C|ClkCounter\(5)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_ClkCounter\(4),
	datac => \GenStrobeI2C|ALT_INV_ClkCounter\(5),
	dataf => \GenStrobeI2C|ALT_INV_Equal0~0_combout\,
	combout => \GenStrobeI2C|Equal0~1_combout\);

-- Location: FF_X33_Y55_N49
\GenStrobeI2C|oStrobe\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|Equal0~1_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|oStrobe~q\);

-- Location: FF_X30_Y55_N23
\ConfigureCodec|R.FrameState.Address\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector2~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Address~q\);

-- Location: LABCELL_X30_Y55_N21
\ConfigureCodec|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector2~0_combout\ = ( \ConfigureCodec|R.FrameState.Start~q\ & ( ((!\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Address~q\)) # (\GenStrobeI2C|oStrobe~q\) ) ) # ( !\ConfigureCodec|R.FrameState.Start~q\ & ( 
-- (!\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Address~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000110011111100110011001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datac => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	combout => \ConfigureCodec|Selector2~0_combout\);

-- Location: FF_X30_Y55_N22
\ConfigureCodec|R.FrameState.Address~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector2~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Address~DUPLICATE_q\);

-- Location: FF_X31_Y55_N20
\ConfigureCodec|R.FrameState.Start~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector1~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\);

-- Location: LABCELL_X31_Y55_N42
\ConfigureCodec|Selector1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector1~1_combout\ = ( \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ & ( !\GenStrobeI2C|oStrobe~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector1~1_combout\);

-- Location: FF_X31_Y55_N26
\ConfigureCodec|R.Sclk~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector14~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Sclk~DUPLICATE_q\);

-- Location: LABCELL_X31_Y55_N12
\ConfigureCodec|NextStateAndOutput~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextStateAndOutput~2_combout\ = ( !\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( \GenStrobeI2C|oStrobe~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	combout => \ConfigureCodec|NextStateAndOutput~2_combout\);

-- Location: LABCELL_X30_Y55_N0
\ConfigureCodec|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector3~0_combout\ = ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( (\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Address~q\) ) ) # ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( 
-- ((\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Address~q\)) # (\ConfigureCodec|R.FrameState.RWBit~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111111111000000111111111100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\,
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	combout => \ConfigureCodec|Selector3~0_combout\);

-- Location: FF_X30_Y55_N2
\ConfigureCodec|R.FrameState.RWBit\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector3~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.RWBit~q\);

-- Location: LABCELL_X30_Y55_N48
\ConfigureCodec|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector4~0_combout\ = ( \ConfigureCodec|R.FrameState.Ack1~q\ & ( \ConfigureCodec|R.Sclk~q\ & ( (!\GenStrobeI2C|oStrobe~q\) # (!\ioI2cSdin~input_o\) ) ) ) # ( \ConfigureCodec|R.FrameState.Ack1~q\ & ( !\ConfigureCodec|R.Sclk~q\ & ( 
-- ((!\GenStrobeI2C|oStrobe~q\) # (\ConfigureCodec|R.AckError~q\)) # (\ConfigureCodec|R.FrameState.RWBit~q\) ) ) ) # ( !\ConfigureCodec|R.FrameState.Ack1~q\ & ( !\ConfigureCodec|R.Sclk~q\ & ( (\ConfigureCodec|R.FrameState.RWBit~q\ & \GenStrobeI2C|oStrobe~q\) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001110111011111111100000000000000001111110011111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\,
	datab => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datac => \ALT_INV_ioI2cSdin~input_o\,
	datad => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	combout => \ConfigureCodec|Selector4~0_combout\);

-- Location: FF_X30_Y55_N50
\ConfigureCodec|R.FrameState.Ack1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector4~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Ack1~q\);

-- Location: LABCELL_X30_Y55_N39
\ConfigureCodec|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector5~0_combout\ = ( !\ConfigureCodec|R.Sclk~q\ & ( (\ConfigureCodec|R.FrameState.Ack1~q\ & (!\ConfigureCodec|R.AckError~q\ & \GenStrobeI2C|oStrobe~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000100000000000100010000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	datab => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	combout => \ConfigureCodec|Selector5~0_combout\);

-- Location: LABCELL_X29_Y55_N27
\ConfigureCodec|Selector5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector5~1_combout\ = ( \ConfigureCodec|Selector5~0_combout\ ) # ( !\ConfigureCodec|Selector5~0_combout\ & ( (!\ConfigureCodec|NextR~10_combout\ & \ConfigureCodec|R.FrameState.Data1~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_NextR~10_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	dataf => \ConfigureCodec|ALT_INV_Selector5~0_combout\,
	combout => \ConfigureCodec|Selector5~1_combout\);

-- Location: FF_X29_Y55_N29
\ConfigureCodec|R.FrameState.Data1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector5~1_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Data1~q\);

-- Location: FF_X29_Y55_N28
\ConfigureCodec|R.FrameState.Data1~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector5~1_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\);

-- Location: FF_X30_Y55_N5
\ConfigureCodec|R.FrameState.Stop~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector9~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Stop~DUPLICATE_q\);

-- Location: LABCELL_X30_Y55_N42
\ConfigureCodec|Selector13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector13~0_combout\ = ( !\ConfigureCodec|R.FrameState.Stop~DUPLICATE_q\ & ( !\ConfigureCodec|R.FrameState.Ack1~q\ & ( (!\ConfigureCodec|R.FrameState.Ack3~q\ & (!\ConfigureCodec|R.FrameState.Ack2~q\ & 
-- (!\ConfigureCodec|R.FrameState.RWBit~q\ & \ConfigureCodec|R.FrameState.Idle~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Stop~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	combout => \ConfigureCodec|Selector13~0_combout\);

-- Location: MLABCELL_X28_Y55_N12
\ConfigureCodec|Selector11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector11~0_combout\ = (!\ConfigureCodec|R.FrameState.Start~q\ & (\ConfigureCodec|Selector13~0_combout\ & ((!\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\) # (\ConfigureCodec|NextStateAndOutput~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011010000000000001101000000000000110100000000000011010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datad => \ConfigureCodec|ALT_INV_Selector13~0_combout\,
	combout => \ConfigureCodec|Selector11~0_combout\);

-- Location: LABCELL_X30_Y55_N36
\ConfigureCodec|Selector11~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector11~1_combout\ = ( \ConfigureCodec|R.Sclk~q\ & ( (\ConfigureCodec|R.FrameState.Start~q\ & \GenStrobeI2C|oStrobe~q\) ) ) # ( !\ConfigureCodec|R.Sclk~q\ & ( (\GenStrobeI2C|oStrobe~q\ & (((\ConfigureCodec|R.FrameState.Ack1~q\ & 
-- !\ConfigureCodec|R.AckError~q\)) # (\ConfigureCodec|R.FrameState.Start~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001001111000000000100111100000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	datab => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	combout => \ConfigureCodec|Selector11~1_combout\);

-- Location: FF_X29_Y55_N43
\ConfigureCodec|R.BitCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector13~2_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(0));

-- Location: LABCELL_X30_Y55_N6
\ConfigureCodec|Selector13~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector13~1_combout\ = ( \GenStrobeI2C|oStrobe~q\ & ( \ConfigureCodec|R.Sclk~q\ & ( (\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & \ConfigureCodec|R.BitCtr\(0)) ) ) ) # ( !\GenStrobeI2C|oStrobe~q\ & ( \ConfigureCodec|R.Sclk~q\ & ( 
-- (\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & \ConfigureCodec|R.BitCtr\(0)) ) ) ) # ( \GenStrobeI2C|oStrobe~q\ & ( !\ConfigureCodec|R.Sclk~q\ & ( (!\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & (!\ConfigureCodec|R.AckError~q\ & 
-- (\ConfigureCodec|R.FrameState.Ack1~q\))) # (\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & ((!\ConfigureCodec|R.BitCtr\(0)) # ((!\ConfigureCodec|R.AckError~q\ & \ConfigureCodec|R.FrameState.Ack1~q\)))) ) ) ) # ( !\GenStrobeI2C|oStrobe~q\ & ( 
-- !\ConfigureCodec|R.Sclk~q\ & ( (\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & \ConfigureCodec|R.BitCtr\(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101010111010000110000000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datae => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	combout => \ConfigureCodec|Selector13~1_combout\);

-- Location: LABCELL_X29_Y55_N18
\ConfigureCodec|NextR~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextR~11_combout\ = ( !\ConfigureCodec|R.Sclk~q\ & ( \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( \GenStrobeI2C|oStrobe~q\ ) ) ) # ( !\ConfigureCodec|R.Sclk~q\ & ( !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( (\GenStrobeI2C|oStrobe~q\ & 
-- (((\ConfigureCodec|R.BitCtr\(1)) # (\ConfigureCodec|R.BitCtr\(3))) # (\ConfigureCodec|R.BitCtr\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001111111000000000000000000000000111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datad => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datae => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|NextR~11_combout\);

-- Location: LABCELL_X29_Y55_N42
\ConfigureCodec|Selector13~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector13~2_combout\ = ( \ConfigureCodec|R.BitCtr\(0) & ( \ConfigureCodec|NextR~11_combout\ & ( ((!\ConfigureCodec|Selector13~0_combout\) # (\ConfigureCodec|Selector1~1_combout\)) # (\ConfigureCodec|Selector13~1_combout\) ) ) ) # ( 
-- !\ConfigureCodec|R.BitCtr\(0) & ( \ConfigureCodec|NextR~11_combout\ & ( (!\ConfigureCodec|Selector10~0_combout\) # (\ConfigureCodec|Selector13~1_combout\) ) ) ) # ( \ConfigureCodec|R.BitCtr\(0) & ( !\ConfigureCodec|NextR~11_combout\ & ( 
-- (((!\ConfigureCodec|Selector13~0_combout\) # (!\ConfigureCodec|Selector10~0_combout\)) # (\ConfigureCodec|Selector1~1_combout\)) # (\ConfigureCodec|Selector13~1_combout\) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(0) & ( !\ConfigureCodec|NextR~11_combout\ & ( 
-- \ConfigureCodec|Selector13~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101111111111111011111111111010101011111011111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector13~1_combout\,
	datab => \ConfigureCodec|ALT_INV_Selector1~1_combout\,
	datac => \ConfigureCodec|ALT_INV_Selector13~0_combout\,
	datad => \ConfigureCodec|ALT_INV_Selector10~0_combout\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_NextR~11_combout\,
	combout => \ConfigureCodec|Selector13~2_combout\);

-- Location: FF_X29_Y55_N44
\ConfigureCodec|R.BitCtr[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector13~2_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y55_N21
\ConfigureCodec|Selector15~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~6_combout\ = ( !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( !\ConfigureCodec|R.BitCtr\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector15~6_combout\);

-- Location: MLABCELL_X28_Y55_N42
\ConfigureCodec|Selector11~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector11~2_combout\ = ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( \ConfigureCodec|Selector10~0_combout\ & ( (\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & (!\ConfigureCodec|R.BitCtr\(2) $ 
-- (!\ConfigureCodec|Selector15~6_combout\))) ) ) ) # ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( !\ConfigureCodec|Selector10~0_combout\ & ( (!\ConfigureCodec|R.BitCtr\(2) & (\ConfigureCodec|Selector15~6_combout\ & 
-- ((\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\) # (\ConfigureCodec|R.BitCtr\(3))))) # (\ConfigureCodec|R.BitCtr\(2) & (((!\ConfigureCodec|Selector15~6_combout\)))) ) ) ) # ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( 
-- !\ConfigureCodec|Selector10~0_combout\ & ( \ConfigureCodec|R.BitCtr\(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010100100101101000000000000000000000000001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datac => \ConfigureCodec|ALT_INV_Selector15~6_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	dataf => \ConfigureCodec|ALT_INV_Selector10~0_combout\,
	combout => \ConfigureCodec|Selector11~2_combout\);

-- Location: MLABCELL_X28_Y55_N57
\ConfigureCodec|Selector11~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector11~3_combout\ = ( \ConfigureCodec|Selector11~2_combout\ ) # ( !\ConfigureCodec|Selector11~2_combout\ & ( ((!\ConfigureCodec|Selector11~0_combout\ & \ConfigureCodec|R.BitCtr\(2))) # (\ConfigureCodec|Selector11~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111001111000011111100111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_Selector11~0_combout\,
	datac => \ConfigureCodec|ALT_INV_Selector11~1_combout\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_Selector11~2_combout\,
	combout => \ConfigureCodec|Selector11~3_combout\);

-- Location: FF_X28_Y55_N58
\ConfigureCodec|R.BitCtr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector11~3_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(2));

-- Location: MLABCELL_X28_Y55_N18
\ConfigureCodec|Add1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add1~0_combout\ = ( !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(1) & !\ConfigureCodec|R.BitCtr\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000101000001010000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Add1~0_combout\);

-- Location: LABCELL_X29_Y55_N12
\ConfigureCodec|Selector10~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector10~1_combout\ = ( \ConfigureCodec|R.BitCtr\(3) & ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( (!\ConfigureCodec|Selector5~0_combout\ & (((\ConfigureCodec|Selector10~0_combout\ & !\ConfigureCodec|R.FrameState.Data1~q\)) # 
-- (\ConfigureCodec|Add1~0_combout\))) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(3) & ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( (!\ConfigureCodec|Selector5~0_combout\ & ((!\ConfigureCodec|R.FrameState.Data1~q\) # (!\ConfigureCodec|Add1~0_combout\))) ) ) 
-- ) # ( \ConfigureCodec|R.BitCtr\(3) & ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( (!\ConfigureCodec|Selector5~0_combout\ & \ConfigureCodec|Selector10~0_combout\) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(3) & ( 
-- !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( !\ConfigureCodec|Selector5~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010001000100010001010101010101000000010000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector5~0_combout\,
	datab => \ConfigureCodec|ALT_INV_Selector10~0_combout\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datad => \ConfigureCodec|ALT_INV_Add1~0_combout\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	combout => \ConfigureCodec|Selector10~1_combout\);

-- Location: MLABCELL_X28_Y55_N48
\ConfigureCodec|Selector10~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector10~2_combout\ = ( \ConfigureCodec|R.BitCtr\(3) & ( \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & ( ((!\ConfigureCodec|Selector10~1_combout\) # ((!\ConfigureCodec|NextStateAndOutput~2_combout\) # 
-- (!\ConfigureCodec|Selector13~0_combout\))) # (\ConfigureCodec|Selector1~1_combout\) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(3) & ( \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & ( !\ConfigureCodec|Selector10~1_combout\ ) ) ) # ( 
-- \ConfigureCodec|R.BitCtr\(3) & ( !\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & ( ((!\ConfigureCodec|Selector10~1_combout\) # (!\ConfigureCodec|Selector13~0_combout\)) # (\ConfigureCodec|Selector1~1_combout\) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(3) & 
-- ( !\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & ( !\ConfigureCodec|Selector10~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100111111111101110111001100110011001111111111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector1~1_combout\,
	datab => \ConfigureCodec|ALT_INV_Selector10~1_combout\,
	datac => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datad => \ConfigureCodec|ALT_INV_Selector13~0_combout\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector10~2_combout\);

-- Location: FF_X28_Y55_N49
\ConfigureCodec|R.BitCtr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector10~2_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(3));

-- Location: LABCELL_X29_Y55_N30
\ConfigureCodec|NextR~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextR~10_combout\ = ( !\ConfigureCodec|R.Sclk~q\ & ( !\ConfigureCodec|R.BitCtr\(2) & ( (!\ConfigureCodec|R.BitCtr\(1) & (\ConfigureCodec|R.BitCtr\(3) & (\GenStrobeI2C|oStrobe~q\ & !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datac => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	combout => \ConfigureCodec|NextR~10_combout\);

-- Location: LABCELL_X30_Y55_N24
\ConfigureCodec|NextR~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextR~8_combout\ = ( \ConfigureCodec|R.Sclk~q\ & ( (\ioI2cSdin~input_o\ & \GenStrobeI2C|oStrobe~q\) ) ) # ( !\ConfigureCodec|R.Sclk~q\ & ( (!\ConfigureCodec|R.AckError~q\ & \GenStrobeI2C|oStrobe~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datac => \ALT_INV_ioI2cSdin~input_o\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	combout => \ConfigureCodec|NextR~8_combout\);

-- Location: LABCELL_X30_Y55_N57
\ConfigureCodec|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector6~0_combout\ = ( \ConfigureCodec|NextR~8_combout\ & ( (\ConfigureCodec|NextR~10_combout\ & \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\) ) ) # ( !\ConfigureCodec|NextR~8_combout\ & ( ((\ConfigureCodec|NextR~10_combout\ & 
-- \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\)) # (\ConfigureCodec|R.FrameState.Ack2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111111111000001011111111100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextR~10_combout\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	dataf => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	combout => \ConfigureCodec|Selector6~0_combout\);

-- Location: FF_X30_Y55_N59
\ConfigureCodec|R.FrameState.Ack2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector6~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Ack2~q\);

-- Location: LABCELL_X30_Y55_N27
\ConfigureCodec|Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector7~0_combout\ = ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( (!\ConfigureCodec|NextR~9_combout\ & (((!\ConfigureCodec|R.AckError~q\ & \ConfigureCodec|R.FrameState.Ack2~q\)) # (\ConfigureCodec|R.FrameState.Data2~q\))) # 
-- (\ConfigureCodec|NextR~9_combout\ & (!\ConfigureCodec|R.AckError~q\ & (\ConfigureCodec|R.FrameState.Ack2~q\))) ) ) # ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( (!\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Data2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000001100101011100000110010101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	datab => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	combout => \ConfigureCodec|Selector7~0_combout\);

-- Location: FF_X30_Y55_N29
\ConfigureCodec|R.FrameState.Data2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector7~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Data2~q\);

-- Location: LABCELL_X29_Y55_N39
\ConfigureCodec|Selector10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector10~0_combout\ = ( !\ConfigureCodec|R.FrameState.Data2~q\ & ( !\ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Address~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	combout => \ConfigureCodec|Selector10~0_combout\);

-- Location: MLABCELL_X28_Y55_N15
\ConfigureCodec|Selector12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector12~0_combout\ = ( \ConfigureCodec|R.BitCtr\(1) & ( (!\ConfigureCodec|Selector11~1_combout\ & ((!\ConfigureCodec|NextStateAndOutput~2_combout\) # ((!\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\) # 
-- (!\ConfigureCodec|R.BitCtr\(0))))) ) ) # ( !\ConfigureCodec|R.BitCtr\(1) & ( (!\ConfigureCodec|Selector11~1_combout\ & ((!\ConfigureCodec|NextStateAndOutput~2_combout\) # ((!\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\) # 
-- (\ConfigureCodec|R.BitCtr\(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111100000000111011110000000011111110000000001111111000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datad => \ConfigureCodec|ALT_INV_Selector11~1_combout\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	combout => \ConfigureCodec|Selector12~0_combout\);

-- Location: MLABCELL_X28_Y55_N24
\ConfigureCodec|Selector12~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector12~1_combout\ = ( \ConfigureCodec|R.BitCtr\(1) & ( \ConfigureCodec|NextR~11_combout\ & ( (!\ConfigureCodec|Selector11~0_combout\) # ((!\ConfigureCodec|Selector12~0_combout\) # ((!\ConfigureCodec|Selector10~0_combout\ & 
-- \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\))) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(1) & ( \ConfigureCodec|NextR~11_combout\ & ( (!\ConfigureCodec|Selector12~0_combout\) # ((!\ConfigureCodec|Selector10~0_combout\ & !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\)) 
-- ) ) ) # ( \ConfigureCodec|R.BitCtr\(1) & ( !\ConfigureCodec|NextR~11_combout\ & ( (!\ConfigureCodec|Selector10~0_combout\) # ((!\ConfigureCodec|Selector11~0_combout\) # (!\ConfigureCodec|Selector12~0_combout\)) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(1) & ( 
-- !\ConfigureCodec|NextR~11_combout\ & ( !\ConfigureCodec|Selector12~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111111110111011111111101000001111111111001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector10~0_combout\,
	datab => \ConfigureCodec|ALT_INV_Selector11~0_combout\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_Selector12~0_combout\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_NextR~11_combout\,
	combout => \ConfigureCodec|Selector12~1_combout\);

-- Location: FF_X28_Y55_N26
\ConfigureCodec|R.BitCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector12~1_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(1));

-- Location: LABCELL_X29_Y55_N0
\ConfigureCodec|NextR~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextR~9_combout\ = ( !\ConfigureCodec|R.BitCtr\(3) & ( !\ConfigureCodec|R.BitCtr\(2) & ( (!\ConfigureCodec|R.BitCtr\(1) & (!\ConfigureCodec|R.Sclk~q\ & (!\ConfigureCodec|R.BitCtr\(0) & \GenStrobeI2C|oStrobe~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datad => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	combout => \ConfigureCodec|NextR~9_combout\);

-- Location: LABCELL_X30_Y55_N54
\ConfigureCodec|Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector8~0_combout\ = ( \ConfigureCodec|NextR~8_combout\ & ( (\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Data2~q\) ) ) # ( !\ConfigureCodec|NextR~8_combout\ & ( ((\ConfigureCodec|NextR~9_combout\ & 
-- \ConfigureCodec|R.FrameState.Data2~q\)) # (\ConfigureCodec|R.FrameState.Ack3~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111111111000000111111111100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	dataf => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	combout => \ConfigureCodec|Selector8~0_combout\);

-- Location: FF_X30_Y55_N56
\ConfigureCodec|R.FrameState.Ack3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector8~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Ack3~q\);

-- Location: LABCELL_X30_Y55_N3
\ConfigureCodec|Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector9~0_combout\ = ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( (\ConfigureCodec|R.FrameState.Ack3~q\ & !\ConfigureCodec|R.AckError~q\) ) ) # ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( 
-- \ConfigureCodec|R.FrameState.Stop~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111101010000010100000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	datac => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	combout => \ConfigureCodec|Selector9~0_combout\);

-- Location: FF_X30_Y55_N4
\ConfigureCodec|R.FrameState.Stop\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector9~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Stop~q\);

-- Location: LABCELL_X31_Y55_N21
\ConfigureCodec|R.Configured~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~1_combout\ = ( !\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( (\ConfigureCodec|R.Activity~q\ & (\GenStrobeI2C|oStrobe~q\ & \ConfigureCodec|R.FrameState.Stop~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datab => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	combout => \ConfigureCodec|R.Configured~1_combout\);

-- Location: LABCELL_X27_Y55_N30
\ConfigureCodec|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~1_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(0) ) + ( VCC ) + ( !VCC ))
-- \ConfigureCodec|Add0~2\ = CARRY(( \ConfigureCodec|R.AddrCtr\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	cin => GND,
	sumout => \ConfigureCodec|Add0~1_sumout\,
	cout => \ConfigureCodec|Add0~2\);

-- Location: LABCELL_X31_Y55_N36
\ConfigureCodec|R.Configured~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~4_combout\ = ( \ConfigureCodec|R.FrameState.Stop~q\ & ( (\ConfigureCodec|R.Activity~q\ & !\ConfigureCodec|R.Sclk~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datad => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	combout => \ConfigureCodec|R.Configured~4_combout\);

-- Location: FF_X27_Y55_N31
\ConfigureCodec|R.AddrCtr[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~1_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\);

-- Location: LABCELL_X31_Y55_N33
\ConfigureCodec|R.Configured~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~0_combout\ = ( \GenStrobeI2C|oStrobe~q\ & ( !\ConfigureCodec|R.Activity~q\ & ( (!\ConfigureCodec|R.FrameState.Idle~q\ & \Start~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datad => \ALT_INV_Start~DUPLICATE_q\,
	datae => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Activity~q\,
	combout => \ConfigureCodec|R.Configured~0_combout\);

-- Location: LABCELL_X31_Y55_N6
\ConfigureCodec|R.Configured~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~2_combout\ = ( \ConfigureCodec|R.Configured~q\ & ( \ConfigureCodec|R.Configured~0_combout\ & ( \ConfigureCodec|R.Activity~q\ ) ) ) # ( !\ConfigureCodec|R.Configured~q\ & ( \ConfigureCodec|R.Configured~0_combout\ & ( 
-- \ConfigureCodec|R.Activity~q\ ) ) ) # ( \ConfigureCodec|R.Configured~q\ & ( !\ConfigureCodec|R.Configured~0_combout\ & ( (!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\) # ((!\ConfigureCodec|R.Configured~1_combout\) # ((!\ConfigureCodec|Equal0~0_combout\) # 
-- (\ConfigureCodec|R.Activity~q\))) ) ) ) # ( !\ConfigureCodec|R.Configured~q\ & ( !\ConfigureCodec|R.Configured~0_combout\ & ( (\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & (\ConfigureCodec|R.Configured~1_combout\ & (\ConfigureCodec|R.Activity~q\ & 
-- \ConfigureCodec|Equal0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001111111111110111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.Configured~1_combout\,
	datac => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datad => \ConfigureCodec|ALT_INV_Equal0~0_combout\,
	datae => \ConfigureCodec|ALT_INV_R.Configured~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Configured~0_combout\,
	combout => \ConfigureCodec|R.Configured~2_combout\);

-- Location: FF_X31_Y55_N8
\ConfigureCodec|R.Configured\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Configured~2_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Configured~q\);

-- Location: LABCELL_X31_Y55_N15
\WaitCtr[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WaitCtr[1]~0_combout\ = ( WaitCtr(0) & ( ((\GenStrobeI2C|oStrobe~q\ & !\ConfigureCodec|R.Configured~q\)) # (WaitCtr(1)) ) ) # ( !WaitCtr(0) & ( WaitCtr(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100110000111111110011000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datac => \ConfigureCodec|ALT_INV_R.Configured~q\,
	datad => ALT_INV_WaitCtr(1),
	dataf => ALT_INV_WaitCtr(0),
	combout => \WaitCtr[1]~0_combout\);

-- Location: FF_X31_Y55_N17
\WaitCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \WaitCtr[1]~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => WaitCtr(1));

-- Location: LABCELL_X31_Y55_N57
\WaitCtr[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \WaitCtr[0]~1_combout\ = ( WaitCtr(0) & ( \ConfigureCodec|R.Configured~q\ ) ) # ( WaitCtr(0) & ( !\ConfigureCodec|R.Configured~q\ & ( (!\GenStrobeI2C|oStrobe~q\) # (WaitCtr(1)) ) ) ) # ( !WaitCtr(0) & ( !\ConfigureCodec|R.Configured~q\ & ( 
-- \GenStrobeI2C|oStrobe~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011110011111100111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datac => ALT_INV_WaitCtr(1),
	datae => ALT_INV_WaitCtr(0),
	dataf => \ConfigureCodec|ALT_INV_R.Configured~q\,
	combout => \WaitCtr[0]~1_combout\);

-- Location: FF_X31_Y55_N58
\WaitCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \WaitCtr[0]~1_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => WaitCtr(0));

-- Location: FF_X31_Y55_N1
Start : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Start~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Start~q\);

-- Location: LABCELL_X31_Y55_N0
\Start~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Start~0_combout\ = ( !\ConfigureCodec|R.Configured~q\ & ( (!\GenStrobeI2C|oStrobe~q\ & (((\Start~q\)))) # (\GenStrobeI2C|oStrobe~q\ & (WaitCtr(0) & (WaitCtr(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111110001000000011111000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_WaitCtr(0),
	datab => ALT_INV_WaitCtr(1),
	datac => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datad => \ALT_INV_Start~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Configured~q\,
	combout => \Start~0_combout\);

-- Location: FF_X31_Y55_N2
\Start~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Start~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Start~DUPLICATE_q\);

-- Location: LABCELL_X31_Y55_N3
\ConfigureCodec|R.Configured~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~3_combout\ = ( !\ConfigureCodec|R.FrameState.Idle~q\ & ( (!\ConfigureCodec|R.Activity~q\ & \Start~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datad => \ALT_INV_Start~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	combout => \ConfigureCodec|R.Configured~3_combout\);

-- Location: LABCELL_X31_Y55_N39
\ConfigureCodec|R.AddrCtr[6]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.AddrCtr[6]~0_combout\ = ( \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (\GenStrobeI2C|oStrobe~q\ & (((\ConfigureCodec|R.Configured~4_combout\ & !\ConfigureCodec|Equal0~0_combout\)) # (\ConfigureCodec|R.Configured~3_combout\))) ) ) # ( 
-- !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (\GenStrobeI2C|oStrobe~q\ & ((\ConfigureCodec|R.Configured~3_combout\) # (\ConfigureCodec|R.Configured~4_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100001111000001010000111100000100000011110000010000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Configured~4_combout\,
	datab => \ConfigureCodec|ALT_INV_Equal0~0_combout\,
	datac => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datad => \ConfigureCodec|ALT_INV_R.Configured~3_combout\,
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|R.AddrCtr[6]~0_combout\);

-- Location: FF_X27_Y55_N32
\ConfigureCodec|R.AddrCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~1_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(0));

-- Location: LABCELL_X27_Y55_N33
\ConfigureCodec|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~25_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(1) ) + ( GND ) + ( \ConfigureCodec|Add0~2\ ))
-- \ConfigureCodec|Add0~26\ = CARRY(( \ConfigureCodec|R.AddrCtr\(1) ) + ( GND ) + ( \ConfigureCodec|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	cin => \ConfigureCodec|Add0~2\,
	sumout => \ConfigureCodec|Add0~25_sumout\,
	cout => \ConfigureCodec|Add0~26\);

-- Location: FF_X27_Y55_N35
\ConfigureCodec|R.AddrCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~25_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(1));

-- Location: LABCELL_X27_Y55_N36
\ConfigureCodec|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~21_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(2) ) + ( GND ) + ( \ConfigureCodec|Add0~26\ ))
-- \ConfigureCodec|Add0~22\ = CARRY(( \ConfigureCodec|R.AddrCtr\(2) ) + ( GND ) + ( \ConfigureCodec|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	cin => \ConfigureCodec|Add0~26\,
	sumout => \ConfigureCodec|Add0~21_sumout\,
	cout => \ConfigureCodec|Add0~22\);

-- Location: FF_X27_Y55_N37
\ConfigureCodec|R.AddrCtr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~21_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(2));

-- Location: LABCELL_X27_Y55_N39
\ConfigureCodec|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~17_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(3) ) + ( GND ) + ( \ConfigureCodec|Add0~22\ ))
-- \ConfigureCodec|Add0~18\ = CARRY(( \ConfigureCodec|R.AddrCtr\(3) ) + ( GND ) + ( \ConfigureCodec|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	cin => \ConfigureCodec|Add0~22\,
	sumout => \ConfigureCodec|Add0~17_sumout\,
	cout => \ConfigureCodec|Add0~18\);

-- Location: FF_X27_Y55_N41
\ConfigureCodec|R.AddrCtr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~17_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(3));

-- Location: LABCELL_X27_Y55_N42
\ConfigureCodec|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~13_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(4) ) + ( GND ) + ( \ConfigureCodec|Add0~18\ ))
-- \ConfigureCodec|Add0~14\ = CARRY(( \ConfigureCodec|R.AddrCtr\(4) ) + ( GND ) + ( \ConfigureCodec|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(4),
	cin => \ConfigureCodec|Add0~18\,
	sumout => \ConfigureCodec|Add0~13_sumout\,
	cout => \ConfigureCodec|Add0~14\);

-- Location: FF_X27_Y55_N43
\ConfigureCodec|R.AddrCtr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~13_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(4));

-- Location: FF_X27_Y55_N38
\ConfigureCodec|R.AddrCtr[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~21_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr[2]~DUPLICATE_q\);

-- Location: LABCELL_X27_Y55_N45
\ConfigureCodec|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~9_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(5) ) + ( GND ) + ( \ConfigureCodec|Add0~14\ ))
-- \ConfigureCodec|Add0~10\ = CARRY(( \ConfigureCodec|R.AddrCtr\(5) ) + ( GND ) + ( \ConfigureCodec|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(5),
	cin => \ConfigureCodec|Add0~14\,
	sumout => \ConfigureCodec|Add0~9_sumout\,
	cout => \ConfigureCodec|Add0~10\);

-- Location: FF_X27_Y55_N46
\ConfigureCodec|R.AddrCtr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~9_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(5));

-- Location: LABCELL_X27_Y55_N48
\ConfigureCodec|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~5_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(6) ) + ( GND ) + ( \ConfigureCodec|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(6),
	cin => \ConfigureCodec|Add0~10\,
	sumout => \ConfigureCodec|Add0~5_sumout\);

-- Location: FF_X27_Y55_N49
\ConfigureCodec|R.AddrCtr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~5_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(6));

-- Location: FF_X27_Y55_N47
\ConfigureCodec|R.AddrCtr[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~9_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr[5]~DUPLICATE_q\);

-- Location: LABCELL_X27_Y55_N12
\ConfigureCodec|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Equal0~0_combout\ = ( !\ConfigureCodec|R.AddrCtr[5]~DUPLICATE_q\ & ( \ConfigureCodec|R.AddrCtr\(3) & ( (!\ConfigureCodec|R.AddrCtr\(1) & (!\ConfigureCodec|R.AddrCtr\(4) & (!\ConfigureCodec|R.AddrCtr[2]~DUPLICATE_q\ & 
-- !\ConfigureCodec|R.AddrCtr\(6)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(4),
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[2]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(6),
	datae => \ConfigureCodec|ALT_INV_R.AddrCtr[5]~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	combout => \ConfigureCodec|Equal0~0_combout\);

-- Location: LABCELL_X31_Y55_N48
\ConfigureCodec|R.Activity~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Activity~0_combout\ = ( \ConfigureCodec|R.Configured~0_combout\ & ( !\ConfigureCodec|R.Activity~q\ ) ) # ( !\ConfigureCodec|R.Configured~0_combout\ & ( !\ConfigureCodec|R.Activity~q\ $ (((!\ConfigureCodec|R.Configured~1_combout\) # 
-- ((!\ConfigureCodec|Equal0~0_combout\) # (!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111110000000011111111011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Configured~1_combout\,
	datab => \ConfigureCodec|ALT_INV_Equal0~0_combout\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Activity~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Configured~0_combout\,
	combout => \ConfigureCodec|R.Activity~0_combout\);

-- Location: FF_X31_Y55_N50
\ConfigureCodec|R.Activity\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Activity~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Activity~q\);

-- Location: LABCELL_X31_Y55_N18
\ConfigureCodec|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector1~0_combout\ = ( \ConfigureCodec|R.Activity~q\ & ( (!\GenStrobeI2C|oStrobe~q\ & ((\ConfigureCodec|R.FrameState.Start~q\))) # (\GenStrobeI2C|oStrobe~q\ & (!\ConfigureCodec|R.FrameState.Idle~q\)) ) ) # ( 
-- !\ConfigureCodec|R.Activity~q\ & ( (!\GenStrobeI2C|oStrobe~q\ & \ConfigureCodec|R.FrameState.Start~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110000111111000011000011111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Activity~q\,
	combout => \ConfigureCodec|Selector1~0_combout\);

-- Location: FF_X31_Y55_N19
\ConfigureCodec|R.FrameState.Start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector1~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Start~q\);

-- Location: LABCELL_X30_Y55_N33
\ConfigureCodec|Selector16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector16~0_combout\ = ( !\ConfigureCodec|R.FrameState.Ack3~q\ & ( (!\ConfigureCodec|R.FrameState.Ack2~q\ & !\ConfigureCodec|R.FrameState.Ack1~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	combout => \ConfigureCodec|Selector16~0_combout\);

-- Location: LABCELL_X30_Y55_N12
\ConfigureCodec|Selector16~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector16~1_combout\ = ( !\ConfigureCodec|Selector16~0_combout\ & ( (!\GenStrobeI2C|oStrobe~q\ & (((\ConfigureCodec|R.AckError~q\ & ((!\ConfigureCodec|R.Configured~0_combout\)))))) # (\GenStrobeI2C|oStrobe~q\ & 
-- ((!\ConfigureCodec|R.Sclk~q\ & (((\ConfigureCodec|R.AckError~q\ & !\ConfigureCodec|R.Configured~0_combout\)))) # (\ConfigureCodec|R.Sclk~q\ & (\ioI2cSdin~input_o\)))) ) ) # ( \ConfigureCodec|Selector16~0_combout\ & ( ((\ConfigureCodec|R.AckError~q\ & 
-- (!\ConfigureCodec|R.FrameState.Start~q\ & ((!\ConfigureCodec|R.Configured~0_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0011001100110101001100000011000000000000000001010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ioI2cSdin~input_o\,
	datab => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datad => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datae => \ConfigureCodec|ALT_INV_Selector16~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_R.Configured~0_combout\,
	datag => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	combout => \ConfigureCodec|Selector16~1_combout\);

-- Location: FF_X30_Y55_N14
\ConfigureCodec|R.AckError\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector16~1_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AckError~q\);

-- Location: LABCELL_X30_Y55_N18
\ConfigureCodec|Selector0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector0~1_combout\ = ( \ConfigureCodec|R.AckError~q\ & ( (!\ConfigureCodec|R.FrameState.Idle~q\) # ((\ioI2cSdin~input_o\ & (\GenStrobeI2C|oStrobe~q\ & \ConfigureCodec|R.Sclk~q\))) ) ) # ( !\ConfigureCodec|R.AckError~q\ & ( 
-- (!\GenStrobeI2C|oStrobe~q\ & (((!\ConfigureCodec|R.FrameState.Idle~q\)))) # (\GenStrobeI2C|oStrobe~q\ & (\ConfigureCodec|R.Sclk~q\ & ((!\ConfigureCodec|R.FrameState.Idle~q\) # (\ioI2cSdin~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100111100000001110011110000000111111111000000011111111100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ioI2cSdin~input_o\,
	datab => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datac => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	dataf => \ConfigureCodec|ALT_INV_R.AckError~q\,
	combout => \ConfigureCodec|Selector0~1_combout\);

-- Location: LABCELL_X31_Y55_N45
\ConfigureCodec|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector0~0_combout\ = ( \ConfigureCodec|R.Activity~q\ & ( (!\ConfigureCodec|R.FrameState.Idle~q\ & !\GenStrobeI2C|oStrobe~q\) ) ) # ( !\ConfigureCodec|R.Activity~q\ & ( !\ConfigureCodec|R.FrameState.Idle~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datab => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Activity~q\,
	combout => \ConfigureCodec|Selector0~0_combout\);

-- Location: LABCELL_X30_Y55_N30
\ConfigureCodec|Selector0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector0~2_combout\ = ( !\ConfigureCodec|Selector0~0_combout\ & ( (!\ConfigureCodec|Selector0~1_combout\ & ((!\ConfigureCodec|NextStateAndOutput~2_combout\) # ((!\ConfigureCodec|R.FrameState.Stop~DUPLICATE_q\)))) # 
-- (\ConfigureCodec|Selector0~1_combout\ & (\ConfigureCodec|Selector16~0_combout\ & ((!\ConfigureCodec|NextStateAndOutput~2_combout\) # (!\ConfigureCodec|R.FrameState.Stop~DUPLICATE_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010100011111100101010001111110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector0~1_combout\,
	datab => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Stop~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_Selector16~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_Selector0~0_combout\,
	combout => \ConfigureCodec|Selector0~2_combout\);

-- Location: FF_X30_Y55_N32
\ConfigureCodec|R.FrameState.Idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector0~2_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Idle~q\);

-- Location: LABCELL_X31_Y55_N24
\ConfigureCodec|Selector14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector14~0_combout\ = ( \ConfigureCodec|R.Sclk~q\ & ( \ConfigureCodec|R.Activity~q\ & ( (!\GenStrobeI2C|oStrobe~q\ & (((\ConfigureCodec|R.FrameState.Idle~q\ & !\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\)) # 
-- (\ConfigureCodec|R.FrameState.Stop~q\))) # (\GenStrobeI2C|oStrobe~q\ & (((\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\)))) ) ) ) # ( !\ConfigureCodec|R.Sclk~q\ & ( \ConfigureCodec|R.Activity~q\ & ( (\GenStrobeI2C|oStrobe~q\ & 
-- (((\ConfigureCodec|R.FrameState.Idle~q\ & !\ConfigureCodec|R.FrameState.Stop~q\)) # (\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\))) ) ) ) # ( \ConfigureCodec|R.Sclk~q\ & ( !\ConfigureCodec|R.Activity~q\ & ( 
-- ((!\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ & (\ConfigureCodec|R.FrameState.Idle~q\)) # (\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ & ((\GenStrobeI2C|oStrobe~q\)))) # (\ConfigureCodec|R.FrameState.Stop~q\) ) ) ) # ( !\ConfigureCodec|R.Sclk~q\ 
-- & ( !\ConfigureCodec|R.Activity~q\ & ( (\GenStrobeI2C|oStrobe~q\ & \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011010100111111111100010011000000110100001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datab => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	datae => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Activity~q\,
	combout => \ConfigureCodec|Selector14~0_combout\);

-- Location: FF_X31_Y55_N25
\ConfigureCodec|R.Sclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector14~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Sclk~q\);

-- Location: LABCELL_X29_Y55_N36
\ConfigureCodec|Selector15~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~2_combout\ = ( \ConfigureCodec|R.BitCtr\(2) & ( (\ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ & (((\ConfigureCodec|R.BitCtr\(1) & \ConfigureCodec|R.BitCtr\(0))) # (\ConfigureCodec|R.BitCtr\(3)))) ) ) # ( 
-- !\ConfigureCodec|R.BitCtr\(2) & ( (\ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ & \ConfigureCodec|R.BitCtr\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000101010001000100010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Address~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	combout => \ConfigureCodec|Selector15~2_combout\);

-- Location: MLABCELL_X28_Y55_N0
\ConfigureCodec|Selector15~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~3_combout\ = ( \ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ & ( \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( (\ConfigureCodec|R.Sclk~q\ & (!\ConfigureCodec|R.BitCtr\(2) & !\ConfigureCodec|R.BitCtr\(3))) ) ) ) # ( 
-- \ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ & ( !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(1) & (\ConfigureCodec|R.Sclk~q\ & (\ConfigureCodec|R.BitCtr\(2) & !\ConfigureCodec|R.BitCtr\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000000000000000000000011000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Address~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector15~3_combout\);

-- Location: LABCELL_X29_Y55_N6
\ConfigureCodec|Selector15~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~4_combout\ = ( \ConfigureCodec|Selector15~2_combout\ & ( !\ConfigureCodec|Selector15~3_combout\ & ( (!\ConfigureCodec|Selector0~0_combout\ & \ConfigureCodec|R.Sdin~q\) ) ) ) # ( !\ConfigureCodec|Selector15~2_combout\ & ( 
-- !\ConfigureCodec|Selector15~3_combout\ & ( (!\ConfigureCodec|Selector0~0_combout\ & (((!\ConfigureCodec|R.FrameState.Start~q\ & \ConfigureCodec|Selector16~0_combout\)) # (\ConfigureCodec|R.Sdin~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101010001010000010100000101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector0~0_combout\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datac => \ConfigureCodec|ALT_INV_R.Sdin~q\,
	datad => \ConfigureCodec|ALT_INV_Selector16~0_combout\,
	datae => \ConfigureCodec|ALT_INV_Selector15~2_combout\,
	dataf => \ConfigureCodec|ALT_INV_Selector15~3_combout\,
	combout => \ConfigureCodec|Selector15~4_combout\);

-- Location: LABCELL_X29_Y55_N54
\ConfigureCodec|Selector15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~0_combout\ = ( \ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ & ( \ConfigureCodec|R.FrameState.Data2~q\ & ( (\ConfigureCodec|R.Sdin~q\ & ((!\ConfigureCodec|R.FrameState.RWBit~q\) # (!\GenStrobeI2C|oStrobe~q\))) ) ) ) # ( 
-- !\ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ & ( \ConfigureCodec|R.FrameState.Data2~q\ & ( (\ConfigureCodec|R.Sdin~q\ & ((!\ConfigureCodec|R.FrameState.RWBit~q\) # (!\GenStrobeI2C|oStrobe~q\))) ) ) ) # ( 
-- \ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ & ( !\ConfigureCodec|R.FrameState.Data2~q\ & ( (\ConfigureCodec|R.Sdin~q\ & ((!\ConfigureCodec|R.FrameState.RWBit~q\) # (!\GenStrobeI2C|oStrobe~q\))) ) ) ) # ( 
-- !\ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ & ( !\ConfigureCodec|R.FrameState.Data2~q\ & ( (!\ConfigureCodec|R.FrameState.RWBit~q\ & (((!\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\) # (\ConfigureCodec|R.Sdin~q\)))) # 
-- (\ConfigureCodec|R.FrameState.RWBit~q\ & (!\GenStrobeI2C|oStrobe~q\ & (\ConfigureCodec|R.Sdin~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010111000001110000011100000111000001110000011100000111000001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\,
	datab => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datac => \ConfigureCodec|ALT_INV_R.Sdin~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Address~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	combout => \ConfigureCodec|Selector15~0_combout\);

-- Location: LABCELL_X29_Y55_N24
\ConfigureCodec|Selector15~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~1_combout\ = ( \ConfigureCodec|R.FrameState.Data2~q\ & ( (\ConfigureCodec|Selector15~0_combout\ & (!\ConfigureCodec|NextR~9_combout\ & ((!\ConfigureCodec|NextR~10_combout\) # (!\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\)))) 
-- ) ) # ( !\ConfigureCodec|R.FrameState.Data2~q\ & ( (\ConfigureCodec|Selector15~0_combout\ & ((!\ConfigureCodec|NextR~10_combout\) # (!\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111000001110000011100000111000001110000000000000111000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextR~10_combout\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_Selector15~0_combout\,
	datad => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	combout => \ConfigureCodec|Selector15~1_combout\);

-- Location: LABCELL_X27_Y55_N0
\ConfigureCodec|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux7~0_combout\ = ( \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.AddrCtr[2]~DUPLICATE_q\ $ (!\ConfigureCodec|R.AddrCtr\(1))) # (\ConfigureCodec|R.AddrCtr\(3)) ) ) # ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( 
-- (\ConfigureCodec|R.AddrCtr\(1)) # (\ConfigureCodec|R.AddrCtr\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111001111110011111101111011011110110111101101111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[2]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux7~0_combout\);

-- Location: LABCELL_X31_Y55_N51
\ConfigureCodec|R.Data[15]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[15]~0_combout\ = ( \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ & ( (\GenStrobeI2C|oStrobe~q\ & \ConfigureCodec|R.Activity~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datad => \ConfigureCodec|ALT_INV_R.Activity~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\,
	combout => \ConfigureCodec|R.Data[15]~0_combout\);

-- Location: FF_X27_Y55_N2
\ConfigureCodec|R.Data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux7~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(0));

-- Location: LABCELL_X27_Y55_N6
\ConfigureCodec|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux5~0_combout\ = ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (\ConfigureCodec|R.AddrCtr\(2) & !\ConfigureCodec|R.AddrCtr\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux5~0_combout\);

-- Location: FF_X27_Y55_N8
\ConfigureCodec|R.Data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux5~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(2));

-- Location: FF_X27_Y55_N59
\ConfigureCodec|R.Data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(1),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(10));

-- Location: LABCELL_X27_Y55_N57
\ConfigureCodec|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~0_combout\ = ( \ConfigureCodec|R.BitCtr\(3) & ( (\ConfigureCodec|R.BitCtr\(1) & \ConfigureCodec|R.Data\(10)) ) ) # ( !\ConfigureCodec|R.BitCtr\(3) & ( (!\ConfigureCodec|R.BitCtr\(1) & (\ConfigureCodec|R.Data\(0))) # 
-- (\ConfigureCodec|R.BitCtr\(1) & ((\ConfigureCodec|R.Data\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100011101000111010001110100011100000000001100110000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data\(0),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datac => \ConfigureCodec|ALT_INV_R.Data\(2),
	datad => \ConfigureCodec|ALT_INV_R.Data\(10),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	combout => \ConfigureCodec|Mux9~0_combout\);

-- Location: MLABCELL_X28_Y55_N54
\ConfigureCodec|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux1~0_combout\ = ( \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.AddrCtr\(2) & \ConfigureCodec|R.AddrCtr\(1)) ) ) # ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (\ConfigureCodec|R.AddrCtr\(1)) # 
-- (\ConfigureCodec|R.AddrCtr\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111100000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux1~0_combout\);

-- Location: FF_X28_Y55_N41
\ConfigureCodec|R.Data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Mux1~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(6));

-- Location: FF_X28_Y55_N10
\ConfigureCodec|R.Data[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(5),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(14));

-- Location: FF_X28_Y55_N8
\ConfigureCodec|R.Data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(3),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(12));

-- Location: LABCELL_X27_Y55_N9
\ConfigureCodec|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux3~0_combout\ = ( \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (\ConfigureCodec|R.AddrCtr\(1) & !\ConfigureCodec|R.AddrCtr\(2)) ) ) # ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( !\ConfigureCodec|R.AddrCtr\(1) $ 
-- (!\ConfigureCodec|R.AddrCtr\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux3~0_combout\);

-- Location: FF_X27_Y55_N10
\ConfigureCodec|R.Data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux3~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(4));

-- Location: MLABCELL_X28_Y55_N6
\ConfigureCodec|Mux9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~1_combout\ = ( \ConfigureCodec|R.Data\(12) & ( \ConfigureCodec|R.Data\(4) & ( (!\ConfigureCodec|R.BitCtr\(1)) # ((!\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(6))) # (\ConfigureCodec|R.BitCtr\(3) & 
-- ((\ConfigureCodec|R.Data\(14))))) ) ) ) # ( !\ConfigureCodec|R.Data\(12) & ( \ConfigureCodec|R.Data\(4) & ( (!\ConfigureCodec|R.BitCtr\(1) & (((!\ConfigureCodec|R.BitCtr\(3))))) # (\ConfigureCodec|R.BitCtr\(1) & ((!\ConfigureCodec|R.BitCtr\(3) & 
-- (\ConfigureCodec|R.Data\(6))) # (\ConfigureCodec|R.BitCtr\(3) & ((\ConfigureCodec|R.Data\(14)))))) ) ) ) # ( \ConfigureCodec|R.Data\(12) & ( !\ConfigureCodec|R.Data\(4) & ( (!\ConfigureCodec|R.BitCtr\(1) & (((\ConfigureCodec|R.BitCtr\(3))))) # 
-- (\ConfigureCodec|R.BitCtr\(1) & ((!\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(6))) # (\ConfigureCodec|R.BitCtr\(3) & ((\ConfigureCodec|R.Data\(14)))))) ) ) ) # ( !\ConfigureCodec|R.Data\(12) & ( !\ConfigureCodec|R.Data\(4) & ( 
-- (\ConfigureCodec|R.BitCtr\(1) & ((!\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(6))) # (\ConfigureCodec|R.BitCtr\(3) & ((\ConfigureCodec|R.Data\(14)))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100000101000100011010111110111011000001011011101110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.Data\(6),
	datac => \ConfigureCodec|ALT_INV_R.Data\(14),
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datae => \ConfigureCodec|ALT_INV_R.Data\(12),
	dataf => \ConfigureCodec|ALT_INV_R.Data\(4),
	combout => \ConfigureCodec|Mux9~1_combout\);

-- Location: FF_X28_Y55_N35
\ConfigureCodec|R.Data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr[2]~DUPLICATE_q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(11));

-- Location: LABCELL_X27_Y55_N54
\ConfigureCodec|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux4~0_combout\ = (\ConfigureCodec|R.AddrCtr\(1) & !\ConfigureCodec|R.AddrCtr\(2))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	combout => \ConfigureCodec|Mux4~0_combout\);

-- Location: FF_X27_Y55_N55
\ConfigureCodec|R.Data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux4~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(3));

-- Location: LABCELL_X27_Y55_N3
\ConfigureCodec|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux6~0_combout\ = ( \ConfigureCodec|R.AddrCtr\(1) & ( (\ConfigureCodec|R.AddrCtr[2]~DUPLICATE_q\ & (!\ConfigureCodec|R.AddrCtr\(3) & \ConfigureCodec|R.AddrCtr\(0))) ) ) # ( !\ConfigureCodec|R.AddrCtr\(1) & ( 
-- (!\ConfigureCodec|R.AddrCtr[2]~DUPLICATE_q\ & (\ConfigureCodec|R.AddrCtr\(3) & !\ConfigureCodec|R.AddrCtr\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000100000001000000010000000000100000001000000010000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[2]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	combout => \ConfigureCodec|Mux6~0_combout\);

-- Location: FF_X27_Y55_N4
\ConfigureCodec|R.Data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux6~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(1));

-- Location: FF_X28_Y55_N38
\ConfigureCodec|R.Data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(9));

-- Location: MLABCELL_X28_Y55_N36
\ConfigureCodec|Mux9~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~2_combout\ = ( \ConfigureCodec|R.Data\(9) & ( \ConfigureCodec|R.BitCtr\(1) & ( (!\ConfigureCodec|R.BitCtr\(3) & ((\ConfigureCodec|R.Data\(3)))) # (\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(11))) ) ) ) # ( 
-- !\ConfigureCodec|R.Data\(9) & ( \ConfigureCodec|R.BitCtr\(1) & ( (!\ConfigureCodec|R.BitCtr\(3) & ((\ConfigureCodec|R.Data\(3)))) # (\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(11))) ) ) ) # ( \ConfigureCodec|R.Data\(9) & ( 
-- !\ConfigureCodec|R.BitCtr\(1) & ( (\ConfigureCodec|R.Data\(1)) # (\ConfigureCodec|R.BitCtr\(3)) ) ) ) # ( !\ConfigureCodec|R.Data\(9) & ( !\ConfigureCodec|R.BitCtr\(1) & ( (!\ConfigureCodec|R.BitCtr\(3) & \ConfigureCodec|R.Data\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100001100111111111100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data\(11),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datac => \ConfigureCodec|ALT_INV_R.Data\(3),
	datad => \ConfigureCodec|ALT_INV_R.Data\(1),
	datae => \ConfigureCodec|ALT_INV_R.Data\(9),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	combout => \ConfigureCodec|Mux9~2_combout\);

-- Location: FF_X27_Y55_N23
\ConfigureCodec|R.Data[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(4),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(13));

-- Location: LABCELL_X27_Y55_N27
\ConfigureCodec|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux0~0_combout\ = ( !\ConfigureCodec|R.AddrCtr\(1) & ( (!\ConfigureCodec|R.AddrCtr\(3) & ((!\ConfigureCodec|R.AddrCtr[2]~DUPLICATE_q\) # (!\ConfigureCodec|R.AddrCtr\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100100011001000110010001100100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[2]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	combout => \ConfigureCodec|Mux0~0_combout\);

-- Location: FF_X27_Y55_N28
\ConfigureCodec|R.Data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux0~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(7));

-- Location: FF_X27_Y55_N20
\ConfigureCodec|R.Data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(6),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(15));

-- Location: LABCELL_X27_Y55_N24
\ConfigureCodec|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux2~0_combout\ = ( \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.AddrCtr[2]~DUPLICATE_q\ & (!\ConfigureCodec|R.AddrCtr\(3) & \ConfigureCodec|R.AddrCtr\(1))) ) ) # ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( 
-- (!\ConfigureCodec|R.AddrCtr\(3) & ((\ConfigureCodec|R.AddrCtr\(1)))) # (\ConfigureCodec|R.AddrCtr\(3) & (!\ConfigureCodec|R.AddrCtr[2]~DUPLICATE_q\ & !\ConfigureCodec|R.AddrCtr\(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010110000101100001011000010110000001000000010000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[2]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux2~0_combout\);

-- Location: FF_X27_Y55_N26
\ConfigureCodec|R.Data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux2~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(5));

-- Location: LABCELL_X27_Y55_N18
\ConfigureCodec|Mux9~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~3_combout\ = ( \ConfigureCodec|R.Data\(15) & ( \ConfigureCodec|R.Data\(5) & ( (!\ConfigureCodec|R.BitCtr\(3) & (((!\ConfigureCodec|R.BitCtr\(1)) # (\ConfigureCodec|R.Data\(7))))) # (\ConfigureCodec|R.BitCtr\(3) & 
-- (((\ConfigureCodec|R.BitCtr\(1))) # (\ConfigureCodec|R.Data\(13)))) ) ) ) # ( !\ConfigureCodec|R.Data\(15) & ( \ConfigureCodec|R.Data\(5) & ( (!\ConfigureCodec|R.BitCtr\(3) & (((!\ConfigureCodec|R.BitCtr\(1)) # (\ConfigureCodec|R.Data\(7))))) # 
-- (\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(13) & ((!\ConfigureCodec|R.BitCtr\(1))))) ) ) ) # ( \ConfigureCodec|R.Data\(15) & ( !\ConfigureCodec|R.Data\(5) & ( (!\ConfigureCodec|R.BitCtr\(3) & (((\ConfigureCodec|R.Data\(7) & 
-- \ConfigureCodec|R.BitCtr\(1))))) # (\ConfigureCodec|R.BitCtr\(3) & (((\ConfigureCodec|R.BitCtr\(1))) # (\ConfigureCodec|R.Data\(13)))) ) ) ) # ( !\ConfigureCodec|R.Data\(15) & ( !\ConfigureCodec|R.Data\(5) & ( (!\ConfigureCodec|R.BitCtr\(3) & 
-- (((\ConfigureCodec|R.Data\(7) & \ConfigureCodec|R.BitCtr\(1))))) # (\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(13) & ((!\ConfigureCodec|R.BitCtr\(1))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100110000000001010011111111110101001100001111010100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data\(13),
	datab => \ConfigureCodec|ALT_INV_R.Data\(7),
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datae => \ConfigureCodec|ALT_INV_R.Data\(15),
	dataf => \ConfigureCodec|ALT_INV_R.Data\(5),
	combout => \ConfigureCodec|Mux9~3_combout\);

-- Location: MLABCELL_X28_Y55_N30
\ConfigureCodec|Mux9~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~4_combout\ = ( \ConfigureCodec|Mux9~2_combout\ & ( \ConfigureCodec|Mux9~3_combout\ & ( ((!\ConfigureCodec|R.BitCtr\(2) & (\ConfigureCodec|Mux9~0_combout\)) # (\ConfigureCodec|R.BitCtr\(2) & ((\ConfigureCodec|Mux9~1_combout\)))) # 
-- (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\) ) ) ) # ( !\ConfigureCodec|Mux9~2_combout\ & ( \ConfigureCodec|Mux9~3_combout\ & ( (!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ((!\ConfigureCodec|R.BitCtr\(2) & (\ConfigureCodec|Mux9~0_combout\)) # 
-- (\ConfigureCodec|R.BitCtr\(2) & ((\ConfigureCodec|Mux9~1_combout\))))) # (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & (((\ConfigureCodec|R.BitCtr\(2))))) ) ) ) # ( \ConfigureCodec|Mux9~2_combout\ & ( !\ConfigureCodec|Mux9~3_combout\ & ( 
-- (!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ((!\ConfigureCodec|R.BitCtr\(2) & (\ConfigureCodec|Mux9~0_combout\)) # (\ConfigureCodec|R.BitCtr\(2) & ((\ConfigureCodec|Mux9~1_combout\))))) # (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & 
-- (((!\ConfigureCodec|R.BitCtr\(2))))) ) ) ) # ( !\ConfigureCodec|Mux9~2_combout\ & ( !\ConfigureCodec|Mux9~3_combout\ & ( (!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ((!\ConfigureCodec|R.BitCtr\(2) & (\ConfigureCodec|Mux9~0_combout\)) # 
-- (\ConfigureCodec|R.BitCtr\(2) & ((\ConfigureCodec|Mux9~1_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000101010011100000111101000100101001011110111010101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_Mux9~0_combout\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	datad => \ConfigureCodec|ALT_INV_Mux9~1_combout\,
	datae => \ConfigureCodec|ALT_INV_Mux9~2_combout\,
	dataf => \ConfigureCodec|ALT_INV_Mux9~3_combout\,
	combout => \ConfigureCodec|Mux9~4_combout\);

-- Location: LABCELL_X29_Y55_N48
\ConfigureCodec|Selector15~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~5_combout\ = ( \ConfigureCodec|R.FrameState.Data2~q\ & ( \ConfigureCodec|Mux9~4_combout\ & ( (\ConfigureCodec|Selector15~4_combout\ & (\ConfigureCodec|Selector15~1_combout\ & !\ConfigureCodec|R.Sclk~q\)) ) ) ) # ( 
-- !\ConfigureCodec|R.FrameState.Data2~q\ & ( \ConfigureCodec|Mux9~4_combout\ & ( (\ConfigureCodec|Selector15~4_combout\ & ((!\ConfigureCodec|R.Sclk~q\ & ((\ConfigureCodec|Selector15~1_combout\))) # (\ConfigureCodec|R.Sclk~q\ & 
-- (!\ConfigureCodec|R.FrameState.Data1~q\)))) ) ) ) # ( \ConfigureCodec|R.FrameState.Data2~q\ & ( !\ConfigureCodec|Mux9~4_combout\ & ( (\ConfigureCodec|Selector15~4_combout\ & ((\ConfigureCodec|R.Sclk~q\) # (\ConfigureCodec|Selector15~1_combout\))) ) ) ) # 
-- ( !\ConfigureCodec|R.FrameState.Data2~q\ & ( !\ConfigureCodec|Mux9~4_combout\ & ( (\ConfigureCodec|Selector15~4_combout\ & ((\ConfigureCodec|R.Sclk~q\) # (\ConfigureCodec|Selector15~1_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100110011000000110011001100000011001000100000001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datab => \ConfigureCodec|ALT_INV_Selector15~4_combout\,
	datac => \ConfigureCodec|ALT_INV_Selector15~1_combout\,
	datad => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	dataf => \ConfigureCodec|ALT_INV_Mux9~4_combout\,
	combout => \ConfigureCodec|Selector15~5_combout\);

-- Location: FF_X29_Y55_N50
\ConfigureCodec|R.Sdin\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector15~5_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Sdin~q\);

-- Location: IOIBUF_X2_Y0_N58
\iSwitch[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSwitch(9),
	o => \iSwitch[9]~input_o\);

-- Location: DDIOINCELL_X2_Y0_N71
\TheChannelSelSync|Metastable[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \iSwitch[9]~input_o\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheChannelSelSync|Metastable\(0));

-- Location: FF_X33_Y3_N37
\TheChannelSelSync|Metastable[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheChannelSelSync|Metastable\(0),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheChannelSelSync|Metastable\(1));

-- Location: IOIBUF_X36_Y0_N1
\inResetAsync~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inResetAsync,
	o => \inResetAsync~input_o\);

-- Location: FF_X28_Y4_N8
\fsksender_inst|baudrate_generator|ClkCounter[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|Add0~21_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter[2]~DUPLICATE_q\);

-- Location: FF_X28_Y4_N44
\fsksender_inst|baudrate_generator|ClkCounter[14]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|Add0~45_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter[14]~DUPLICATE_q\);

-- Location: FF_X28_Y4_N23
\fsksender_inst|baudrate_generator|ClkCounter[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|Add0~69_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter[7]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y4_N6
\fsksender_inst|baudrate_generator|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~21_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter[2]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~26\ ))
-- \fsksender_inst|baudrate_generator|Add0~22\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter[2]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[2]~DUPLICATE_q\,
	cin => \fsksender_inst|baudrate_generator|Add0~26\,
	sumout => \fsksender_inst|baudrate_generator|Add0~21_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~22\);

-- Location: MLABCELL_X28_Y4_N9
\fsksender_inst|baudrate_generator|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~17_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter\(3) ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~22\ ))
-- \fsksender_inst|baudrate_generator|Add0~18\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter\(3) ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(3),
	cin => \fsksender_inst|baudrate_generator|Add0~22\,
	sumout => \fsksender_inst|baudrate_generator|Add0~17_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~18\);

-- Location: FF_X28_Y4_N11
\fsksender_inst|baudrate_generator|ClkCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|Add0~17_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(3));

-- Location: MLABCELL_X28_Y4_N12
\fsksender_inst|baudrate_generator|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~13_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter\(4) ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~18\ ))
-- \fsksender_inst|baudrate_generator|Add0~14\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter\(4) ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(4),
	cin => \fsksender_inst|baudrate_generator|Add0~18\,
	sumout => \fsksender_inst|baudrate_generator|Add0~13_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~14\);

-- Location: FF_X28_Y4_N14
\fsksender_inst|baudrate_generator|ClkCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|Add0~13_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(4));

-- Location: MLABCELL_X28_Y4_N15
\fsksender_inst|baudrate_generator|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~9_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter\(5) ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~14\ ))
-- \fsksender_inst|baudrate_generator|Add0~10\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter\(5) ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(5),
	cin => \fsksender_inst|baudrate_generator|Add0~14\,
	sumout => \fsksender_inst|baudrate_generator|Add0~9_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~10\);

-- Location: FF_X28_Y4_N17
\fsksender_inst|baudrate_generator|ClkCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|Add0~9_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(5));

-- Location: MLABCELL_X28_Y4_N18
\fsksender_inst|baudrate_generator|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~5_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter[6]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~10\ ))
-- \fsksender_inst|baudrate_generator|Add0~6\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter[6]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[6]~DUPLICATE_q\,
	cin => \fsksender_inst|baudrate_generator|Add0~10\,
	sumout => \fsksender_inst|baudrate_generator|Add0~5_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~6\);

-- Location: MLABCELL_X28_Y4_N21
\fsksender_inst|baudrate_generator|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~69_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter[7]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~6\ ))
-- \fsksender_inst|baudrate_generator|Add0~70\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter[7]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[7]~DUPLICATE_q\,
	cin => \fsksender_inst|baudrate_generator|Add0~6\,
	sumout => \fsksender_inst|baudrate_generator|Add0~69_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~70\);

-- Location: FF_X28_Y4_N22
\fsksender_inst|baudrate_generator|ClkCounter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|Add0~69_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(7));

-- Location: FF_X29_Y4_N52
\fsksender_inst|baudrate_generator|ClkCounter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|ClkCounter~5_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(11));

-- Location: FF_X29_Y4_N23
\fsksender_inst|baudrate_generator|ClkCounter[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|ClkCounter~7_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter[8]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y4_N24
\fsksender_inst|baudrate_generator|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~65_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter[8]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~70\ ))
-- \fsksender_inst|baudrate_generator|Add0~66\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter[8]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[8]~DUPLICATE_q\,
	cin => \fsksender_inst|baudrate_generator|Add0~70\,
	sumout => \fsksender_inst|baudrate_generator|Add0~65_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~66\);

-- Location: LABCELL_X29_Y4_N21
\fsksender_inst|baudrate_generator|ClkCounter~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|ClkCounter~7_combout\ = ( \fsksender_inst|baudrate_generator|Equal0~2_combout\ & ( \fsksender_inst|baudrate_generator|Add0~65_sumout\ & ( (!\fsksender_inst|baudrate_generator|ClkCounter[6]~DUPLICATE_q\) # 
-- ((!\fsksender_inst|baudrate_generator|ClkCounter[12]~DUPLICATE_q\) # ((!\fsksender_inst|baudrate_generator|Equal0~0_combout\) # (!\fsksender_inst|baudrate_generator|Equal0~1_combout\))) ) ) ) # ( !\fsksender_inst|baudrate_generator|Equal0~2_combout\ & ( 
-- \fsksender_inst|baudrate_generator|Add0~65_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[6]~DUPLICATE_q\,
	datab => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[12]~DUPLICATE_q\,
	datac => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~0_combout\,
	datad => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~1_combout\,
	datae => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~2_combout\,
	dataf => \fsksender_inst|baudrate_generator|ALT_INV_Add0~65_sumout\,
	combout => \fsksender_inst|baudrate_generator|ClkCounter~7_combout\);

-- Location: FF_X29_Y4_N22
\fsksender_inst|baudrate_generator|ClkCounter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|ClkCounter~7_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(8));

-- Location: LABCELL_X29_Y4_N24
\fsksender_inst|baudrate_generator|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Equal0~2_combout\ = ( \fsksender_inst|baudrate_generator|ClkCounter\(11) & ( \fsksender_inst|baudrate_generator|ClkCounter\(8) & ( (!\fsksender_inst|baudrate_generator|ClkCounter\(10) & 
-- (!\fsksender_inst|baudrate_generator|ClkCounter\(7) & \fsksender_inst|baudrate_generator|ClkCounter\(9))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(10),
	datab => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(7),
	datac => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(9),
	datae => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(11),
	dataf => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(8),
	combout => \fsksender_inst|baudrate_generator|Equal0~2_combout\);

-- Location: FF_X29_Y4_N1
\fsksender_inst|baudrate_generator|ClkCounter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|ClkCounter~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(6));

-- Location: LABCELL_X29_Y4_N0
\fsksender_inst|baudrate_generator|ClkCounter~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|ClkCounter~1_combout\ = ( \fsksender_inst|baudrate_generator|ClkCounter\(6) & ( \fsksender_inst|baudrate_generator|Add0~5_sumout\ & ( (!\fsksender_inst|baudrate_generator|Equal0~1_combout\) # 
-- ((!\fsksender_inst|baudrate_generator|Equal0~2_combout\) # ((!\fsksender_inst|baudrate_generator|Equal0~0_combout\) # (!\fsksender_inst|baudrate_generator|ClkCounter[12]~DUPLICATE_q\))) ) ) ) # ( !\fsksender_inst|baudrate_generator|ClkCounter\(6) & ( 
-- \fsksender_inst|baudrate_generator|Add0~5_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~1_combout\,
	datab => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~2_combout\,
	datac => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~0_combout\,
	datad => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[12]~DUPLICATE_q\,
	datae => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(6),
	dataf => \fsksender_inst|baudrate_generator|ALT_INV_Add0~5_sumout\,
	combout => \fsksender_inst|baudrate_generator|ClkCounter~1_combout\);

-- Location: FF_X29_Y4_N2
\fsksender_inst|baudrate_generator|ClkCounter[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|ClkCounter~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter[6]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y4_N27
\fsksender_inst|baudrate_generator|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~61_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter\(9) ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~66\ ))
-- \fsksender_inst|baudrate_generator|Add0~62\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter\(9) ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(9),
	cin => \fsksender_inst|baudrate_generator|Add0~66\,
	sumout => \fsksender_inst|baudrate_generator|Add0~61_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~62\);

-- Location: LABCELL_X29_Y4_N18
\fsksender_inst|baudrate_generator|ClkCounter~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|ClkCounter~6_combout\ = ( \fsksender_inst|baudrate_generator|Equal0~2_combout\ & ( \fsksender_inst|baudrate_generator|Add0~61_sumout\ & ( (!\fsksender_inst|baudrate_generator|ClkCounter[6]~DUPLICATE_q\) # 
-- ((!\fsksender_inst|baudrate_generator|ClkCounter[12]~DUPLICATE_q\) # ((!\fsksender_inst|baudrate_generator|Equal0~1_combout\) # (!\fsksender_inst|baudrate_generator|Equal0~0_combout\))) ) ) ) # ( !\fsksender_inst|baudrate_generator|Equal0~2_combout\ & ( 
-- \fsksender_inst|baudrate_generator|Add0~61_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[6]~DUPLICATE_q\,
	datab => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[12]~DUPLICATE_q\,
	datac => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~1_combout\,
	datad => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~0_combout\,
	datae => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~2_combout\,
	dataf => \fsksender_inst|baudrate_generator|ALT_INV_Add0~61_sumout\,
	combout => \fsksender_inst|baudrate_generator|ClkCounter~6_combout\);

-- Location: FF_X29_Y4_N20
\fsksender_inst|baudrate_generator|ClkCounter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|ClkCounter~6_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(9));

-- Location: MLABCELL_X28_Y4_N30
\fsksender_inst|baudrate_generator|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~57_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter\(10) ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~62\ ))
-- \fsksender_inst|baudrate_generator|Add0~58\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter\(10) ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(10),
	cin => \fsksender_inst|baudrate_generator|Add0~62\,
	sumout => \fsksender_inst|baudrate_generator|Add0~57_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~58\);

-- Location: FF_X28_Y4_N31
\fsksender_inst|baudrate_generator|ClkCounter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|Add0~57_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(10));

-- Location: MLABCELL_X28_Y4_N33
\fsksender_inst|baudrate_generator|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~53_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter[11]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~58\ ))
-- \fsksender_inst|baudrate_generator|Add0~54\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter[11]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[11]~DUPLICATE_q\,
	cin => \fsksender_inst|baudrate_generator|Add0~58\,
	sumout => \fsksender_inst|baudrate_generator|Add0~53_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~54\);

-- Location: LABCELL_X29_Y4_N51
\fsksender_inst|baudrate_generator|ClkCounter~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|ClkCounter~5_combout\ = ( !\fsksender_inst|baudrate_generator|Equal0~3_combout\ & ( \fsksender_inst|baudrate_generator|Add0~53_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \fsksender_inst|baudrate_generator|ALT_INV_Add0~53_sumout\,
	dataf => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~3_combout\,
	combout => \fsksender_inst|baudrate_generator|ClkCounter~5_combout\);

-- Location: FF_X29_Y4_N53
\fsksender_inst|baudrate_generator|ClkCounter[11]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|ClkCounter~5_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter[11]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y4_N36
\fsksender_inst|baudrate_generator|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~1_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter[12]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~54\ ))
-- \fsksender_inst|baudrate_generator|Add0~2\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter[12]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[12]~DUPLICATE_q\,
	cin => \fsksender_inst|baudrate_generator|Add0~54\,
	sumout => \fsksender_inst|baudrate_generator|Add0~1_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~2\);

-- Location: LABCELL_X29_Y4_N57
\fsksender_inst|baudrate_generator|ClkCounter~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|ClkCounter~0_combout\ = ( !\fsksender_inst|baudrate_generator|Equal0~3_combout\ & ( \fsksender_inst|baudrate_generator|Add0~1_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \fsksender_inst|baudrate_generator|ALT_INV_Add0~1_sumout\,
	dataf => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~3_combout\,
	combout => \fsksender_inst|baudrate_generator|ClkCounter~0_combout\);

-- Location: FF_X29_Y4_N59
\fsksender_inst|baudrate_generator|ClkCounter[12]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|ClkCounter~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter[12]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y4_N39
\fsksender_inst|baudrate_generator|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~49_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter[13]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~2\ ))
-- \fsksender_inst|baudrate_generator|Add0~50\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter[13]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[13]~DUPLICATE_q\,
	cin => \fsksender_inst|baudrate_generator|Add0~2\,
	sumout => \fsksender_inst|baudrate_generator|Add0~49_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~50\);

-- Location: FF_X28_Y4_N41
\fsksender_inst|baudrate_generator|ClkCounter[13]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|Add0~49_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter[13]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y4_N42
\fsksender_inst|baudrate_generator|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~45_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter[14]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~50\ ))
-- \fsksender_inst|baudrate_generator|Add0~46\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter[14]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[14]~DUPLICATE_q\,
	cin => \fsksender_inst|baudrate_generator|Add0~50\,
	sumout => \fsksender_inst|baudrate_generator|Add0~45_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~46\);

-- Location: FF_X28_Y4_N43
\fsksender_inst|baudrate_generator|ClkCounter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|Add0~45_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(14));

-- Location: FF_X29_Y4_N31
\fsksender_inst|baudrate_generator|ClkCounter[17]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|ClkCounter~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter[17]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y4_N45
\fsksender_inst|baudrate_generator|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~41_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter[15]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~46\ ))
-- \fsksender_inst|baudrate_generator|Add0~42\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter[15]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[15]~DUPLICATE_q\,
	cin => \fsksender_inst|baudrate_generator|Add0~46\,
	sumout => \fsksender_inst|baudrate_generator|Add0~41_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~42\);

-- Location: LABCELL_X29_Y4_N33
\fsksender_inst|baudrate_generator|ClkCounter~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|ClkCounter~4_combout\ = ( !\fsksender_inst|baudrate_generator|Equal0~3_combout\ & ( \fsksender_inst|baudrate_generator|Add0~41_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|baudrate_generator|ALT_INV_Add0~41_sumout\,
	dataf => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~3_combout\,
	combout => \fsksender_inst|baudrate_generator|ClkCounter~4_combout\);

-- Location: FF_X29_Y4_N34
\fsksender_inst|baudrate_generator|ClkCounter[15]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|ClkCounter~4_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter[15]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y4_N48
\fsksender_inst|baudrate_generator|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~37_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter[16]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~42\ ))
-- \fsksender_inst|baudrate_generator|Add0~38\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter[16]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[16]~DUPLICATE_q\,
	cin => \fsksender_inst|baudrate_generator|Add0~42\,
	sumout => \fsksender_inst|baudrate_generator|Add0~37_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~38\);

-- Location: FF_X28_Y4_N50
\fsksender_inst|baudrate_generator|ClkCounter[16]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|Add0~37_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter[16]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y4_N51
\fsksender_inst|baudrate_generator|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~33_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter[17]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[17]~DUPLICATE_q\,
	cin => \fsksender_inst|baudrate_generator|Add0~38\,
	sumout => \fsksender_inst|baudrate_generator|Add0~33_sumout\);

-- Location: LABCELL_X29_Y4_N30
\fsksender_inst|baudrate_generator|ClkCounter~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|ClkCounter~3_combout\ = ( !\fsksender_inst|baudrate_generator|Equal0~3_combout\ & ( \fsksender_inst|baudrate_generator|Add0~33_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|baudrate_generator|ALT_INV_Add0~33_sumout\,
	dataf => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~3_combout\,
	combout => \fsksender_inst|baudrate_generator|ClkCounter~3_combout\);

-- Location: FF_X29_Y4_N32
\fsksender_inst|baudrate_generator|ClkCounter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|ClkCounter~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(17));

-- Location: FF_X28_Y4_N40
\fsksender_inst|baudrate_generator|ClkCounter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|Add0~49_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(13));

-- Location: FF_X28_Y4_N49
\fsksender_inst|baudrate_generator|ClkCounter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|Add0~37_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(16));

-- Location: FF_X29_Y4_N35
\fsksender_inst|baudrate_generator|ClkCounter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|ClkCounter~4_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(15));

-- Location: LABCELL_X29_Y4_N48
\fsksender_inst|baudrate_generator|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Equal0~1_combout\ = ( \fsksender_inst|baudrate_generator|ClkCounter\(15) & ( (!\fsksender_inst|baudrate_generator|ClkCounter\(14) & (\fsksender_inst|baudrate_generator|ClkCounter\(17) & 
-- (!\fsksender_inst|baudrate_generator|ClkCounter\(13) & !\fsksender_inst|baudrate_generator|ClkCounter\(16)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000100000000000000010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(14),
	datab => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(17),
	datac => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(13),
	datad => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(16),
	dataf => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(15),
	combout => \fsksender_inst|baudrate_generator|Equal0~1_combout\);

-- Location: MLABCELL_X28_Y4_N0
\fsksender_inst|baudrate_generator|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~29_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter\(0) ) + ( VCC ) + ( !VCC ))
-- \fsksender_inst|baudrate_generator|Add0~30\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(0),
	cin => GND,
	sumout => \fsksender_inst|baudrate_generator|Add0~29_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~30\);

-- Location: FF_X28_Y4_N2
\fsksender_inst|baudrate_generator|ClkCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|Add0~29_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(0));

-- Location: MLABCELL_X28_Y4_N3
\fsksender_inst|baudrate_generator|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Add0~25_sumout\ = SUM(( \fsksender_inst|baudrate_generator|ClkCounter\(1) ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~30\ ))
-- \fsksender_inst|baudrate_generator|Add0~26\ = CARRY(( \fsksender_inst|baudrate_generator|ClkCounter\(1) ) + ( GND ) + ( \fsksender_inst|baudrate_generator|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(1),
	cin => \fsksender_inst|baudrate_generator|Add0~30\,
	sumout => \fsksender_inst|baudrate_generator|Add0~25_sumout\,
	cout => \fsksender_inst|baudrate_generator|Add0~26\);

-- Location: LABCELL_X29_Y4_N3
\fsksender_inst|baudrate_generator|ClkCounter~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|ClkCounter~2_combout\ = ( \fsksender_inst|baudrate_generator|ClkCounter\(6) & ( \fsksender_inst|baudrate_generator|Add0~25_sumout\ & ( (!\fsksender_inst|baudrate_generator|Equal0~1_combout\) # 
-- ((!\fsksender_inst|baudrate_generator|Equal0~2_combout\) # ((!\fsksender_inst|baudrate_generator|ClkCounter[12]~DUPLICATE_q\) # (!\fsksender_inst|baudrate_generator|Equal0~0_combout\))) ) ) ) # ( !\fsksender_inst|baudrate_generator|ClkCounter\(6) & ( 
-- \fsksender_inst|baudrate_generator|Add0~25_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~1_combout\,
	datab => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~2_combout\,
	datac => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[12]~DUPLICATE_q\,
	datad => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~0_combout\,
	datae => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(6),
	dataf => \fsksender_inst|baudrate_generator|ALT_INV_Add0~25_sumout\,
	combout => \fsksender_inst|baudrate_generator|ClkCounter~2_combout\);

-- Location: FF_X29_Y4_N5
\fsksender_inst|baudrate_generator|ClkCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|ClkCounter~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(1));

-- Location: FF_X28_Y4_N7
\fsksender_inst|baudrate_generator|ClkCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|Add0~21_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(2));

-- Location: MLABCELL_X28_Y4_N54
\fsksender_inst|baudrate_generator|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Equal0~0_combout\ = ( !\fsksender_inst|baudrate_generator|ClkCounter\(1) & ( !\fsksender_inst|baudrate_generator|ClkCounter\(5) & ( (!\fsksender_inst|baudrate_generator|ClkCounter\(2) & 
-- (!\fsksender_inst|baudrate_generator|ClkCounter\(3) & (\fsksender_inst|baudrate_generator|ClkCounter\(0) & !\fsksender_inst|baudrate_generator|ClkCounter\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(2),
	datab => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(3),
	datac => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(0),
	datad => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(4),
	datae => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(1),
	dataf => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(5),
	combout => \fsksender_inst|baudrate_generator|Equal0~0_combout\);

-- Location: FF_X29_Y4_N58
\fsksender_inst|baudrate_generator|ClkCounter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|baudrate_generator|ClkCounter~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|ClkCounter\(12));

-- Location: LABCELL_X29_Y4_N54
\fsksender_inst|baudrate_generator|Equal0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|baudrate_generator|Equal0~3_combout\ = ( \fsksender_inst|baudrate_generator|ClkCounter\(12) & ( (\fsksender_inst|baudrate_generator|Equal0~0_combout\ & (\fsksender_inst|baudrate_generator|Equal0~2_combout\ & 
-- (\fsksender_inst|baudrate_generator|Equal0~1_combout\ & \fsksender_inst|baudrate_generator|ClkCounter[6]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~0_combout\,
	datab => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~2_combout\,
	datac => \fsksender_inst|baudrate_generator|ALT_INV_Equal0~1_combout\,
	datad => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter[6]~DUPLICATE_q\,
	dataf => \fsksender_inst|baudrate_generator|ALT_INV_ClkCounter\(12),
	combout => \fsksender_inst|baudrate_generator|Equal0~3_combout\);

-- Location: FF_X29_Y4_N29
\fsksender_inst|baudrate_generator|oStrobe~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \fsksender_inst|baudrate_generator|Equal0~3_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|oStrobe~DUPLICATE_q\);

-- Location: IOIBUF_X16_Y0_N1
\iSwitch[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSwitch(1),
	o => \iSwitch[1]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\iSwitch[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSwitch(2),
	o => \iSwitch[2]~input_o\);

-- Location: LABCELL_X31_Y4_N0
\fsksender_inst|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Add0~53_sumout\ = SUM(( \fsksender_inst|Reg.WaitCounter\(0) ) + ( VCC ) + ( !VCC ))
-- \fsksender_inst|Add0~54\ = CARRY(( \fsksender_inst|Reg.WaitCounter\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|ALT_INV_Reg.WaitCounter\(0),
	cin => GND,
	sumout => \fsksender_inst|Add0~53_sumout\,
	cout => \fsksender_inst|Add0~54\);

-- Location: LABCELL_X29_Y4_N12
\fsksender_inst|Reg.SendCounter[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Reg.SendCounter[0]~3_combout\ = !\fsksender_inst|Reg.SendCounter\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \fsksender_inst|ALT_INV_Reg.SendCounter\(0),
	combout => \fsksender_inst|Reg.SendCounter[0]~3_combout\);

-- Location: FF_X29_Y4_N14
\fsksender_inst|Reg.SendCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Reg.SendCounter[0]~3_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \fsksender_inst|Reg.SendCounter[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.SendCounter\(0));

-- Location: LABCELL_X29_Y4_N45
\fsksender_inst|Reg.SendCounter[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Reg.SendCounter[2]~1_combout\ = ( \fsksender_inst|Reg.SendCounter\(1) & ( !\fsksender_inst|Reg.SendCounter\(2) $ (((!\fsksender_inst|Reg.SendCounter[3]~0_combout\) # (!\fsksender_inst|Reg.SendCounter\(0)))) ) ) # ( 
-- !\fsksender_inst|Reg.SendCounter\(1) & ( \fsksender_inst|Reg.SendCounter\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000011111111000000001111111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \fsksender_inst|ALT_INV_Reg.SendCounter[3]~0_combout\,
	datac => \fsksender_inst|ALT_INV_Reg.SendCounter\(0),
	datad => \fsksender_inst|ALT_INV_Reg.SendCounter\(2),
	dataf => \fsksender_inst|ALT_INV_Reg.SendCounter\(1),
	combout => \fsksender_inst|Reg.SendCounter[2]~1_combout\);

-- Location: FF_X29_Y4_N47
\fsksender_inst|Reg.SendCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Reg.SendCounter[2]~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.SendCounter\(2));

-- Location: LABCELL_X29_Y4_N15
\fsksender_inst|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Selector0~0_combout\ = ( \fsksender_inst|Reg.SendCounter\(1) & ( (\fsksender_inst|Reg.state.Send~q\ & (\fsksender_inst|Reg.SendCounter\(0) & (\fsksender_inst|baudrate_generator|oStrobe~DUPLICATE_q\ & \fsksender_inst|Reg.SendCounter\(2)))) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|ALT_INV_Reg.state.Send~q\,
	datab => \fsksender_inst|ALT_INV_Reg.SendCounter\(0),
	datac => \fsksender_inst|baudrate_generator|ALT_INV_oStrobe~DUPLICATE_q\,
	datad => \fsksender_inst|ALT_INV_Reg.SendCounter\(2),
	dataf => \fsksender_inst|ALT_INV_Reg.SendCounter\(1),
	combout => \fsksender_inst|Selector0~0_combout\);

-- Location: LABCELL_X30_Y4_N33
\fsksender_inst|LessThan0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|LessThan0~4_combout\ = ( \fsksender_inst|Reg.WaitCounter\(8) & ( (!\iSwitch[1]~input_o\ & (!\iSwitch[2]~input_o\)) # (\iSwitch[1]~input_o\ & ((\fsksender_inst|Reg.WaitCounter\(9)))) ) ) # ( !\fsksender_inst|Reg.WaitCounter\(8) & ( 
-- (!\iSwitch[1]~input_o\ & (!\iSwitch[2]~input_o\ & ((\fsksender_inst|Reg.WaitCounter\(9)) # (\fsksender_inst|Reg.WaitCounter\(7))))) # (\iSwitch[1]~input_o\ & (((\fsksender_inst|Reg.WaitCounter\(9))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000011001111010000001100111111000000110011111100000011001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|ALT_INV_Reg.WaitCounter\(7),
	datab => \ALT_INV_iSwitch[2]~input_o\,
	datac => \ALT_INV_iSwitch[1]~input_o\,
	datad => \fsksender_inst|ALT_INV_Reg.WaitCounter\(9),
	dataf => \fsksender_inst|ALT_INV_Reg.WaitCounter\(8),
	combout => \fsksender_inst|LessThan0~4_combout\);

-- Location: LABCELL_X31_Y4_N42
\fsksender_inst|LessThan0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|LessThan0~5_combout\ = ( \fsksender_inst|Reg.WaitCounter\(7) & ( \fsksender_inst|Reg.WaitCounter\(4) & ( (\iSwitch[1]~input_o\ & ((!\fsksender_inst|Reg.WaitCounter\(8)) # ((!\fsksender_inst|Reg.WaitCounter\(3) & 
-- !\fsksender_inst|Reg.WaitCounter\(2))))) ) ) ) # ( !\fsksender_inst|Reg.WaitCounter\(7) & ( \fsksender_inst|Reg.WaitCounter\(4) & ( \iSwitch[1]~input_o\ ) ) ) # ( \fsksender_inst|Reg.WaitCounter\(7) & ( !\fsksender_inst|Reg.WaitCounter\(4) & ( 
-- \iSwitch[1]~input_o\ ) ) ) # ( !\fsksender_inst|Reg.WaitCounter\(7) & ( !\fsksender_inst|Reg.WaitCounter\(4) & ( ((!\fsksender_inst|Reg.WaitCounter\(3) & (!\fsksender_inst|Reg.WaitCounter\(8) & !\fsksender_inst|Reg.WaitCounter\(2)))) # 
-- (\iSwitch[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101010101010101010101010101010101010101010101010101010001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iSwitch[1]~input_o\,
	datab => \fsksender_inst|ALT_INV_Reg.WaitCounter\(3),
	datac => \fsksender_inst|ALT_INV_Reg.WaitCounter\(8),
	datad => \fsksender_inst|ALT_INV_Reg.WaitCounter\(2),
	datae => \fsksender_inst|ALT_INV_Reg.WaitCounter\(7),
	dataf => \fsksender_inst|ALT_INV_Reg.WaitCounter\(4),
	combout => \fsksender_inst|LessThan0~5_combout\);

-- Location: LABCELL_X30_Y4_N24
\fsksender_inst|LessThan0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|LessThan0~6_combout\ = ( \fsksender_inst|LessThan0~5_combout\ & ( (\fsksender_inst|Reg.WaitCounter\(9) & (((\fsksender_inst|Reg.WaitCounter\(5) & \fsksender_inst|Reg.WaitCounter\(6))) # (\fsksender_inst|LessThan0~4_combout\))) ) ) # ( 
-- !\fsksender_inst|LessThan0~5_combout\ & ( ((\fsksender_inst|Reg.WaitCounter\(5) & \fsksender_inst|Reg.WaitCounter\(6))) # (\fsksender_inst|LessThan0~4_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111100011111000111110001111100000000000111110000000000011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|ALT_INV_Reg.WaitCounter\(5),
	datab => \fsksender_inst|ALT_INV_Reg.WaitCounter\(6),
	datac => \fsksender_inst|ALT_INV_LessThan0~4_combout\,
	datad => \fsksender_inst|ALT_INV_Reg.WaitCounter\(9),
	dataf => \fsksender_inst|ALT_INV_LessThan0~5_combout\,
	combout => \fsksender_inst|LessThan0~6_combout\);

-- Location: LABCELL_X31_Y4_N36
\fsksender_inst|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Add0~33_sumout\ = SUM(( \fsksender_inst|Reg.WaitCounter\(12) ) + ( GND ) + ( \fsksender_inst|Add0~42\ ))
-- \fsksender_inst|Add0~34\ = CARRY(( \fsksender_inst|Reg.WaitCounter\(12) ) + ( GND ) + ( \fsksender_inst|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|ALT_INV_Reg.WaitCounter\(12),
	cin => \fsksender_inst|Add0~42\,
	sumout => \fsksender_inst|Add0~33_sumout\,
	cout => \fsksender_inst|Add0~34\);

-- Location: LABCELL_X31_Y4_N39
\fsksender_inst|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Add0~29_sumout\ = SUM(( \fsksender_inst|Reg.WaitCounter\(13) ) + ( GND ) + ( \fsksender_inst|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|ALT_INV_Reg.WaitCounter\(13),
	cin => \fsksender_inst|Add0~34\,
	sumout => \fsksender_inst|Add0~29_sumout\);

-- Location: LABCELL_X30_Y4_N45
\fsksender_inst|LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|LessThan0~1_combout\ = ( \fsksender_inst|Reg.WaitCounter\(8) & ( (\fsksender_inst|Reg.WaitCounter\(9) & \fsksender_inst|Reg.WaitCounter\(7)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|ALT_INV_Reg.WaitCounter\(9),
	datad => \fsksender_inst|ALT_INV_Reg.WaitCounter\(7),
	dataf => \fsksender_inst|ALT_INV_Reg.WaitCounter\(8),
	combout => \fsksender_inst|LessThan0~1_combout\);

-- Location: LABCELL_X30_Y4_N51
\fsksender_inst|LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|LessThan0~0_combout\ = ( !\fsksender_inst|Reg.WaitCounter\(6) & ( !\fsksender_inst|Reg.WaitCounter\(5) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \fsksender_inst|ALT_INV_Reg.WaitCounter\(5),
	dataf => \fsksender_inst|ALT_INV_Reg.WaitCounter\(6),
	combout => \fsksender_inst|LessThan0~0_combout\);

-- Location: LABCELL_X30_Y4_N12
\fsksender_inst|LessThan0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|LessThan0~2_combout\ = ( \fsksender_inst|Reg.WaitCounter\(3) & ( \fsksender_inst|LessThan0~0_combout\ & ( (\iSwitch[2]~input_o\ & !\fsksender_inst|LessThan0~1_combout\) ) ) ) # ( !\fsksender_inst|Reg.WaitCounter\(3) & ( 
-- \fsksender_inst|LessThan0~0_combout\ & ( (\iSwitch[2]~input_o\ & ((!\fsksender_inst|Reg.WaitCounter\(4)) # (!\fsksender_inst|LessThan0~1_combout\))) ) ) ) # ( \fsksender_inst|Reg.WaitCounter\(3) & ( !\fsksender_inst|LessThan0~0_combout\ & ( 
-- (\iSwitch[2]~input_o\ & !\fsksender_inst|LessThan0~1_combout\) ) ) ) # ( !\fsksender_inst|Reg.WaitCounter\(3) & ( !\fsksender_inst|LessThan0~0_combout\ & ( (\iSwitch[2]~input_o\ & ((!\fsksender_inst|LessThan0~1_combout\) # ((!\iSwitch[1]~input_o\ & 
-- !\fsksender_inst|Reg.WaitCounter\(4))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101000000010101010000000001010101010100000101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iSwitch[2]~input_o\,
	datab => \ALT_INV_iSwitch[1]~input_o\,
	datac => \fsksender_inst|ALT_INV_Reg.WaitCounter\(4),
	datad => \fsksender_inst|ALT_INV_LessThan0~1_combout\,
	datae => \fsksender_inst|ALT_INV_Reg.WaitCounter\(3),
	dataf => \fsksender_inst|ALT_INV_LessThan0~0_combout\,
	combout => \fsksender_inst|LessThan0~2_combout\);

-- Location: LABCELL_X31_Y4_N48
\StartSending~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \StartSending~0_combout\ = ( \ConfigureCodec|R.Configured~q\ ) # ( !\ConfigureCodec|R.Configured~q\ & ( \StartSending~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_StartSending~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Configured~q\,
	combout => \StartSending~0_combout\);

-- Location: FF_X31_Y4_N49
StartSending : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \StartSending~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \StartSending~q\);

-- Location: LABCELL_X33_Y1_N0
\fsksender_inst|msstrobe_generator|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~21_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter\(0) ) + ( VCC ) + ( !VCC ))
-- \fsksender_inst|msstrobe_generator|Add0~22\ = CARRY(( \fsksender_inst|msstrobe_generator|ClkCounter\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(0),
	cin => GND,
	sumout => \fsksender_inst|msstrobe_generator|Add0~21_sumout\,
	cout => \fsksender_inst|msstrobe_generator|Add0~22\);

-- Location: FF_X33_Y1_N2
\fsksender_inst|msstrobe_generator|ClkCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|Add0~21_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(0));

-- Location: LABCELL_X33_Y1_N3
\fsksender_inst|msstrobe_generator|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~17_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter\(1) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~22\ ))
-- \fsksender_inst|msstrobe_generator|Add0~18\ = CARRY(( \fsksender_inst|msstrobe_generator|ClkCounter\(1) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(1),
	cin => \fsksender_inst|msstrobe_generator|Add0~22\,
	sumout => \fsksender_inst|msstrobe_generator|Add0~17_sumout\,
	cout => \fsksender_inst|msstrobe_generator|Add0~18\);

-- Location: FF_X33_Y1_N5
\fsksender_inst|msstrobe_generator|ClkCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|Add0~17_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(1));

-- Location: LABCELL_X33_Y1_N6
\fsksender_inst|msstrobe_generator|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~13_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter[2]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~18\ ))
-- \fsksender_inst|msstrobe_generator|Add0~14\ = CARRY(( \fsksender_inst|msstrobe_generator|ClkCounter[2]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[2]~DUPLICATE_q\,
	cin => \fsksender_inst|msstrobe_generator|Add0~18\,
	sumout => \fsksender_inst|msstrobe_generator|Add0~13_sumout\,
	cout => \fsksender_inst|msstrobe_generator|Add0~14\);

-- Location: FF_X33_Y1_N8
\fsksender_inst|msstrobe_generator|ClkCounter[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|Add0~13_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter[2]~DUPLICATE_q\);

-- Location: LABCELL_X33_Y1_N9
\fsksender_inst|msstrobe_generator|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~9_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter\(3) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~14\ ))
-- \fsksender_inst|msstrobe_generator|Add0~10\ = CARRY(( \fsksender_inst|msstrobe_generator|ClkCounter\(3) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(3),
	cin => \fsksender_inst|msstrobe_generator|Add0~14\,
	sumout => \fsksender_inst|msstrobe_generator|Add0~9_sumout\,
	cout => \fsksender_inst|msstrobe_generator|Add0~10\);

-- Location: FF_X33_Y1_N11
\fsksender_inst|msstrobe_generator|ClkCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|Add0~9_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(3));

-- Location: FF_X33_Y1_N7
\fsksender_inst|msstrobe_generator|ClkCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|Add0~13_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(2));

-- Location: LABCELL_X33_Y1_N48
\fsksender_inst|msstrobe_generator|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Equal0~0_combout\ = (\fsksender_inst|msstrobe_generator|ClkCounter\(0) & (\fsksender_inst|msstrobe_generator|ClkCounter\(3) & (\fsksender_inst|msstrobe_generator|ClkCounter\(1) & 
-- \fsksender_inst|msstrobe_generator|ClkCounter\(2))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(0),
	datab => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(3),
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(1),
	datad => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(2),
	combout => \fsksender_inst|msstrobe_generator|Equal0~0_combout\);

-- Location: FF_X33_Y1_N31
\fsksender_inst|msstrobe_generator|ClkCounter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|Add0~1_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(10));

-- Location: FF_X33_Y1_N14
\fsksender_inst|msstrobe_generator|ClkCounter[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|Add0~5_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter[4]~DUPLICATE_q\);

-- Location: LABCELL_X33_Y1_N12
\fsksender_inst|msstrobe_generator|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~5_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter[4]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~10\ ))
-- \fsksender_inst|msstrobe_generator|Add0~6\ = CARRY(( \fsksender_inst|msstrobe_generator|ClkCounter[4]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[4]~DUPLICATE_q\,
	cin => \fsksender_inst|msstrobe_generator|Add0~10\,
	sumout => \fsksender_inst|msstrobe_generator|Add0~5_sumout\,
	cout => \fsksender_inst|msstrobe_generator|Add0~6\);

-- Location: FF_X33_Y1_N13
\fsksender_inst|msstrobe_generator|ClkCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|Add0~5_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(4));

-- Location: LABCELL_X33_Y1_N15
\fsksender_inst|msstrobe_generator|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~61_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter[5]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~6\ ))
-- \fsksender_inst|msstrobe_generator|Add0~62\ = CARRY(( \fsksender_inst|msstrobe_generator|ClkCounter[5]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[5]~DUPLICATE_q\,
	cin => \fsksender_inst|msstrobe_generator|Add0~6\,
	sumout => \fsksender_inst|msstrobe_generator|Add0~61_sumout\,
	cout => \fsksender_inst|msstrobe_generator|Add0~62\);

-- Location: FF_X33_Y1_N17
\fsksender_inst|msstrobe_generator|ClkCounter[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|Add0~61_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter[5]~DUPLICATE_q\);

-- Location: LABCELL_X33_Y1_N18
\fsksender_inst|msstrobe_generator|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~57_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter[6]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~62\ ))
-- \fsksender_inst|msstrobe_generator|Add0~58\ = CARRY(( \fsksender_inst|msstrobe_generator|ClkCounter[6]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[6]~DUPLICATE_q\,
	cin => \fsksender_inst|msstrobe_generator|Add0~62\,
	sumout => \fsksender_inst|msstrobe_generator|Add0~57_sumout\,
	cout => \fsksender_inst|msstrobe_generator|Add0~58\);

-- Location: FF_X33_Y1_N20
\fsksender_inst|msstrobe_generator|ClkCounter[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|Add0~57_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter[6]~DUPLICATE_q\);

-- Location: LABCELL_X33_Y1_N21
\fsksender_inst|msstrobe_generator|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~53_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter\(7) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~58\ ))
-- \fsksender_inst|msstrobe_generator|Add0~54\ = CARRY(( \fsksender_inst|msstrobe_generator|ClkCounter\(7) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(7),
	cin => \fsksender_inst|msstrobe_generator|Add0~58\,
	sumout => \fsksender_inst|msstrobe_generator|Add0~53_sumout\,
	cout => \fsksender_inst|msstrobe_generator|Add0~54\);

-- Location: MLABCELL_X34_Y1_N42
\fsksender_inst|msstrobe_generator|ClkCounter~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|ClkCounter~6_combout\ = ( \fsksender_inst|msstrobe_generator|Equal0~2_combout\ & ( \fsksender_inst|msstrobe_generator|ClkCounter\(10) & ( \fsksender_inst|msstrobe_generator|Add0~53_sumout\ ) ) ) # ( 
-- !\fsksender_inst|msstrobe_generator|Equal0~2_combout\ & ( \fsksender_inst|msstrobe_generator|ClkCounter\(10) & ( \fsksender_inst|msstrobe_generator|Add0~53_sumout\ ) ) ) # ( \fsksender_inst|msstrobe_generator|Equal0~2_combout\ & ( 
-- !\fsksender_inst|msstrobe_generator|ClkCounter\(10) & ( (\fsksender_inst|msstrobe_generator|Add0~53_sumout\ & ((!\fsksender_inst|msstrobe_generator|ClkCounter\(4)) # ((!\fsksender_inst|msstrobe_generator|Equal0~1_combout\) # 
-- (!\fsksender_inst|msstrobe_generator|Equal0~0_combout\)))) ) ) ) # ( !\fsksender_inst|msstrobe_generator|Equal0~2_combout\ & ( !\fsksender_inst|msstrobe_generator|ClkCounter\(10) & ( \fsksender_inst|msstrobe_generator|Add0~53_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|msstrobe_generator|ALT_INV_Add0~53_sumout\,
	datab => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(4),
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~1_combout\,
	datad => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~0_combout\,
	datae => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~2_combout\,
	dataf => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(10),
	combout => \fsksender_inst|msstrobe_generator|ClkCounter~6_combout\);

-- Location: FF_X34_Y1_N44
\fsksender_inst|msstrobe_generator|ClkCounter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|ClkCounter~6_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(7));

-- Location: FF_X33_Y1_N16
\fsksender_inst|msstrobe_generator|ClkCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|Add0~61_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(5));

-- Location: LABCELL_X33_Y1_N24
\fsksender_inst|msstrobe_generator|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~49_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter\(8) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~54\ ))
-- \fsksender_inst|msstrobe_generator|Add0~50\ = CARRY(( \fsksender_inst|msstrobe_generator|ClkCounter\(8) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(8),
	cin => \fsksender_inst|msstrobe_generator|Add0~54\,
	sumout => \fsksender_inst|msstrobe_generator|Add0~49_sumout\,
	cout => \fsksender_inst|msstrobe_generator|Add0~50\);

-- Location: MLABCELL_X34_Y1_N3
\fsksender_inst|msstrobe_generator|ClkCounter~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|ClkCounter~5_combout\ = ( \fsksender_inst|msstrobe_generator|Equal0~2_combout\ & ( \fsksender_inst|msstrobe_generator|Add0~49_sumout\ & ( (!\fsksender_inst|msstrobe_generator|Equal0~1_combout\) # 
-- ((!\fsksender_inst|msstrobe_generator|Equal0~0_combout\) # ((!\fsksender_inst|msstrobe_generator|ClkCounter\(4)) # (\fsksender_inst|msstrobe_generator|ClkCounter\(10)))) ) ) ) # ( !\fsksender_inst|msstrobe_generator|Equal0~2_combout\ & ( 
-- \fsksender_inst|msstrobe_generator|Add0~49_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~1_combout\,
	datab => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~0_combout\,
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(4),
	datad => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(10),
	datae => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~2_combout\,
	dataf => \fsksender_inst|msstrobe_generator|ALT_INV_Add0~49_sumout\,
	combout => \fsksender_inst|msstrobe_generator|ClkCounter~5_combout\);

-- Location: FF_X34_Y1_N5
\fsksender_inst|msstrobe_generator|ClkCounter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|ClkCounter~5_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(8));

-- Location: FF_X33_Y1_N19
\fsksender_inst|msstrobe_generator|ClkCounter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|Add0~57_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(6));

-- Location: MLABCELL_X34_Y1_N48
\fsksender_inst|msstrobe_generator|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Equal0~2_combout\ = ( \fsksender_inst|msstrobe_generator|ClkCounter\(8) & ( \fsksender_inst|msstrobe_generator|ClkCounter\(6) & ( (\fsksender_inst|msstrobe_generator|ClkCounter\(9) & 
-- (!\fsksender_inst|msstrobe_generator|ClkCounter\(7) & \fsksender_inst|msstrobe_generator|ClkCounter\(5))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(9),
	datab => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(7),
	datad => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(5),
	datae => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(8),
	dataf => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(6),
	combout => \fsksender_inst|msstrobe_generator|Equal0~2_combout\);

-- Location: LABCELL_X33_Y1_N27
\fsksender_inst|msstrobe_generator|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~45_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter\(9) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~50\ ))
-- \fsksender_inst|msstrobe_generator|Add0~46\ = CARRY(( \fsksender_inst|msstrobe_generator|ClkCounter\(9) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(9),
	cin => \fsksender_inst|msstrobe_generator|Add0~50\,
	sumout => \fsksender_inst|msstrobe_generator|Add0~45_sumout\,
	cout => \fsksender_inst|msstrobe_generator|Add0~46\);

-- Location: MLABCELL_X34_Y1_N0
\fsksender_inst|msstrobe_generator|ClkCounter~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|ClkCounter~4_combout\ = ( \fsksender_inst|msstrobe_generator|Equal0~2_combout\ & ( \fsksender_inst|msstrobe_generator|Add0~45_sumout\ & ( (!\fsksender_inst|msstrobe_generator|Equal0~1_combout\) # 
-- ((!\fsksender_inst|msstrobe_generator|Equal0~0_combout\) # ((!\fsksender_inst|msstrobe_generator|ClkCounter\(4)) # (\fsksender_inst|msstrobe_generator|ClkCounter\(10)))) ) ) ) # ( !\fsksender_inst|msstrobe_generator|Equal0~2_combout\ & ( 
-- \fsksender_inst|msstrobe_generator|Add0~45_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~1_combout\,
	datab => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~0_combout\,
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(10),
	datad => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(4),
	datae => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~2_combout\,
	dataf => \fsksender_inst|msstrobe_generator|ALT_INV_Add0~45_sumout\,
	combout => \fsksender_inst|msstrobe_generator|ClkCounter~4_combout\);

-- Location: FF_X34_Y1_N1
\fsksender_inst|msstrobe_generator|ClkCounter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|ClkCounter~4_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(9));

-- Location: LABCELL_X33_Y1_N30
\fsksender_inst|msstrobe_generator|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~1_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter[10]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~46\ ))
-- \fsksender_inst|msstrobe_generator|Add0~2\ = CARRY(( \fsksender_inst|msstrobe_generator|ClkCounter[10]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[10]~DUPLICATE_q\,
	cin => \fsksender_inst|msstrobe_generator|Add0~46\,
	sumout => \fsksender_inst|msstrobe_generator|Add0~1_sumout\,
	cout => \fsksender_inst|msstrobe_generator|Add0~2\);

-- Location: FF_X33_Y1_N32
\fsksender_inst|msstrobe_generator|ClkCounter[10]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|Add0~1_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter[10]~DUPLICATE_q\);

-- Location: LABCELL_X33_Y1_N33
\fsksender_inst|msstrobe_generator|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~41_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter\(11) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~2\ ))
-- \fsksender_inst|msstrobe_generator|Add0~42\ = CARRY(( \fsksender_inst|msstrobe_generator|ClkCounter\(11) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(11),
	cin => \fsksender_inst|msstrobe_generator|Add0~2\,
	sumout => \fsksender_inst|msstrobe_generator|Add0~41_sumout\,
	cout => \fsksender_inst|msstrobe_generator|Add0~42\);

-- Location: LABCELL_X33_Y1_N51
\fsksender_inst|msstrobe_generator|ClkCounter~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|ClkCounter~3_combout\ = ( \fsksender_inst|msstrobe_generator|Add0~41_sumout\ & ( !\fsksender_inst|msstrobe_generator|Equal0~3_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~3_combout\,
	dataf => \fsksender_inst|msstrobe_generator|ALT_INV_Add0~41_sumout\,
	combout => \fsksender_inst|msstrobe_generator|ClkCounter~3_combout\);

-- Location: FF_X33_Y1_N53
\fsksender_inst|msstrobe_generator|ClkCounter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|ClkCounter~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(11));

-- Location: LABCELL_X33_Y1_N36
\fsksender_inst|msstrobe_generator|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~37_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter[12]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~42\ ))
-- \fsksender_inst|msstrobe_generator|Add0~38\ = CARRY(( \fsksender_inst|msstrobe_generator|ClkCounter[12]~DUPLICATE_q\ ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter[12]~DUPLICATE_q\,
	cin => \fsksender_inst|msstrobe_generator|Add0~42\,
	sumout => \fsksender_inst|msstrobe_generator|Add0~37_sumout\,
	cout => \fsksender_inst|msstrobe_generator|Add0~38\);

-- Location: LABCELL_X33_Y1_N57
\fsksender_inst|msstrobe_generator|ClkCounter~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|ClkCounter~2_combout\ = ( !\fsksender_inst|msstrobe_generator|Equal0~3_combout\ & ( \fsksender_inst|msstrobe_generator|Add0~37_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \fsksender_inst|msstrobe_generator|ALT_INV_Add0~37_sumout\,
	dataf => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~3_combout\,
	combout => \fsksender_inst|msstrobe_generator|ClkCounter~2_combout\);

-- Location: FF_X33_Y1_N58
\fsksender_inst|msstrobe_generator|ClkCounter[12]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|ClkCounter~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter[12]~DUPLICATE_q\);

-- Location: LABCELL_X33_Y1_N39
\fsksender_inst|msstrobe_generator|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~33_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter\(13) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~38\ ))
-- \fsksender_inst|msstrobe_generator|Add0~34\ = CARRY(( \fsksender_inst|msstrobe_generator|ClkCounter\(13) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(13),
	cin => \fsksender_inst|msstrobe_generator|Add0~38\,
	sumout => \fsksender_inst|msstrobe_generator|Add0~33_sumout\,
	cout => \fsksender_inst|msstrobe_generator|Add0~34\);

-- Location: MLABCELL_X34_Y1_N57
\fsksender_inst|msstrobe_generator|ClkCounter~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|ClkCounter~1_combout\ = ( !\fsksender_inst|msstrobe_generator|Equal0~3_combout\ & ( \fsksender_inst|msstrobe_generator|Add0~33_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|msstrobe_generator|ALT_INV_Add0~33_sumout\,
	dataf => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~3_combout\,
	combout => \fsksender_inst|msstrobe_generator|ClkCounter~1_combout\);

-- Location: FF_X34_Y1_N59
\fsksender_inst|msstrobe_generator|ClkCounter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|ClkCounter~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(13));

-- Location: LABCELL_X33_Y1_N42
\fsksender_inst|msstrobe_generator|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~29_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter\(14) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~34\ ))
-- \fsksender_inst|msstrobe_generator|Add0~30\ = CARRY(( \fsksender_inst|msstrobe_generator|ClkCounter\(14) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(14),
	cin => \fsksender_inst|msstrobe_generator|Add0~34\,
	sumout => \fsksender_inst|msstrobe_generator|Add0~29_sumout\,
	cout => \fsksender_inst|msstrobe_generator|Add0~30\);

-- Location: FF_X33_Y1_N44
\fsksender_inst|msstrobe_generator|ClkCounter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|Add0~29_sumout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(14));

-- Location: LABCELL_X33_Y1_N45
\fsksender_inst|msstrobe_generator|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Add0~25_sumout\ = SUM(( \fsksender_inst|msstrobe_generator|ClkCounter\(15) ) + ( GND ) + ( \fsksender_inst|msstrobe_generator|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(15),
	cin => \fsksender_inst|msstrobe_generator|Add0~30\,
	sumout => \fsksender_inst|msstrobe_generator|Add0~25_sumout\);

-- Location: MLABCELL_X34_Y1_N39
\fsksender_inst|msstrobe_generator|ClkCounter~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|ClkCounter~0_combout\ = ( !\fsksender_inst|msstrobe_generator|Equal0~3_combout\ & ( \fsksender_inst|msstrobe_generator|Add0~25_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|msstrobe_generator|ALT_INV_Add0~25_sumout\,
	dataf => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~3_combout\,
	combout => \fsksender_inst|msstrobe_generator|ClkCounter~0_combout\);

-- Location: FF_X34_Y1_N40
\fsksender_inst|msstrobe_generator|ClkCounter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|ClkCounter~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(15));

-- Location: FF_X33_Y1_N59
\fsksender_inst|msstrobe_generator|ClkCounter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|msstrobe_generator|ClkCounter~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|ClkCounter\(12));

-- Location: LABCELL_X33_Y1_N54
\fsksender_inst|msstrobe_generator|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Equal0~1_combout\ = ( !\fsksender_inst|msstrobe_generator|ClkCounter\(14) & ( (\fsksender_inst|msstrobe_generator|ClkCounter\(15) & (\fsksender_inst|msstrobe_generator|ClkCounter\(12) & 
-- (\fsksender_inst|msstrobe_generator|ClkCounter\(11) & \fsksender_inst|msstrobe_generator|ClkCounter\(13)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(15),
	datab => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(12),
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(11),
	datad => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(13),
	dataf => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(14),
	combout => \fsksender_inst|msstrobe_generator|Equal0~1_combout\);

-- Location: MLABCELL_X34_Y1_N30
\fsksender_inst|msstrobe_generator|Equal0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|msstrobe_generator|Equal0~3_combout\ = ( \fsksender_inst|msstrobe_generator|Equal0~2_combout\ & ( !\fsksender_inst|msstrobe_generator|ClkCounter\(10) & ( (\fsksender_inst|msstrobe_generator|Equal0~0_combout\ & 
-- (\fsksender_inst|msstrobe_generator|Equal0~1_combout\ & \fsksender_inst|msstrobe_generator|ClkCounter\(4))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~0_combout\,
	datac => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~1_combout\,
	datad => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(4),
	datae => \fsksender_inst|msstrobe_generator|ALT_INV_Equal0~2_combout\,
	dataf => \fsksender_inst|msstrobe_generator|ALT_INV_ClkCounter\(10),
	combout => \fsksender_inst|msstrobe_generator|Equal0~3_combout\);

-- Location: FF_X33_Y1_N29
\fsksender_inst|msstrobe_generator|oStrobe\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \fsksender_inst|msstrobe_generator|Equal0~3_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|msstrobe_generator|oStrobe~q\);

-- Location: LABCELL_X30_Y4_N30
\fsksender_inst|the_comp~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|the_comp~0_combout\ = ( \fsksender_inst|msstrobe_generator|oStrobe~q\ & ( \StartSending~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_StartSending~q\,
	dataf => \fsksender_inst|msstrobe_generator|ALT_INV_oStrobe~q\,
	combout => \fsksender_inst|the_comp~0_combout\);

-- Location: LABCELL_X30_Y4_N6
\fsksender_inst|Reg.WaitCounter[13]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Reg.WaitCounter[13]~0_combout\ = ( \fsksender_inst|LessThan0~7_combout\ & ( \fsksender_inst|the_comp~0_combout\ ) ) # ( !\fsksender_inst|LessThan0~7_combout\ & ( \fsksender_inst|the_comp~0_combout\ ) ) # ( 
-- \fsksender_inst|LessThan0~7_combout\ & ( !\fsksender_inst|the_comp~0_combout\ & ( (!\fsksender_inst|LessThan0~3_combout\ & (\fsksender_inst|LessThan0~6_combout\ & (!\fsksender_inst|Reg.state.WaitForSend~q\ & !\fsksender_inst|LessThan0~2_combout\))) ) ) ) 
-- # ( !\fsksender_inst|LessThan0~7_combout\ & ( !\fsksender_inst|the_comp~0_combout\ & ( (!\fsksender_inst|LessThan0~3_combout\ & !\fsksender_inst|Reg.state.WaitForSend~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000001000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|ALT_INV_LessThan0~3_combout\,
	datab => \fsksender_inst|ALT_INV_LessThan0~6_combout\,
	datac => \fsksender_inst|ALT_INV_Reg.state.WaitForSend~q\,
	datad => \fsksender_inst|ALT_INV_LessThan0~2_combout\,
	datae => \fsksender_inst|ALT_INV_LessThan0~7_combout\,
	dataf => \fsksender_inst|ALT_INV_the_comp~0_combout\,
	combout => \fsksender_inst|Reg.WaitCounter[13]~0_combout\);

-- Location: FF_X31_Y4_N41
\fsksender_inst|Reg.WaitCounter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Add0~29_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \fsksender_inst|Selector1~2_combout\,
	ena => \fsksender_inst|Reg.WaitCounter[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.WaitCounter\(13));

-- Location: LABCELL_X30_Y4_N18
\fsksender_inst|LessThan0~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|LessThan0~7_combout\ = ( \fsksender_inst|Reg.WaitCounter\(12) & ( !\fsksender_inst|Reg.WaitCounter\(13) & ( (\iSwitch[2]~input_o\ & (\iSwitch[1]~input_o\ & (!\fsksender_inst|Reg.WaitCounter\(10) & !\fsksender_inst|Reg.WaitCounter\(11)))) ) 
-- ) ) # ( !\fsksender_inst|Reg.WaitCounter\(12) & ( !\fsksender_inst|Reg.WaitCounter\(13) & ( (!\fsksender_inst|Reg.WaitCounter\(10) & (!\fsksender_inst|Reg.WaitCounter\(11) & ((!\iSwitch[2]~input_o\) # (!\iSwitch[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110000000000000000100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iSwitch[2]~input_o\,
	datab => \ALT_INV_iSwitch[1]~input_o\,
	datac => \fsksender_inst|ALT_INV_Reg.WaitCounter\(10),
	datad => \fsksender_inst|ALT_INV_Reg.WaitCounter\(11),
	datae => \fsksender_inst|ALT_INV_Reg.WaitCounter\(12),
	dataf => \fsksender_inst|ALT_INV_Reg.WaitCounter\(13),
	combout => \fsksender_inst|LessThan0~7_combout\);

-- Location: LABCELL_X30_Y4_N0
\fsksender_inst|Selector0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Selector0~1_combout\ = ( \fsksender_inst|Reg.state.WaitForSend~q\ & ( \fsksender_inst|LessThan0~2_combout\ & ( !\fsksender_inst|Selector0~0_combout\ ) ) ) # ( !\fsksender_inst|Reg.state.WaitForSend~q\ & ( 
-- \fsksender_inst|LessThan0~2_combout\ & ( (!\fsksender_inst|LessThan0~3_combout\ & (!\fsksender_inst|Selector0~0_combout\ & !\fsksender_inst|LessThan0~7_combout\)) ) ) ) # ( \fsksender_inst|Reg.state.WaitForSend~q\ & ( !\fsksender_inst|LessThan0~2_combout\ 
-- & ( !\fsksender_inst|Selector0~0_combout\ ) ) ) # ( !\fsksender_inst|Reg.state.WaitForSend~q\ & ( !\fsksender_inst|LessThan0~2_combout\ & ( (!\fsksender_inst|LessThan0~3_combout\ & (!\fsksender_inst|Selector0~0_combout\ & 
-- ((!\fsksender_inst|LessThan0~7_combout\) # (\fsksender_inst|LessThan0~6_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100000001000110011001100110010001000000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|ALT_INV_LessThan0~3_combout\,
	datab => \fsksender_inst|ALT_INV_Selector0~0_combout\,
	datac => \fsksender_inst|ALT_INV_LessThan0~6_combout\,
	datad => \fsksender_inst|ALT_INV_LessThan0~7_combout\,
	datae => \fsksender_inst|ALT_INV_Reg.state.WaitForSend~q\,
	dataf => \fsksender_inst|ALT_INV_LessThan0~2_combout\,
	combout => \fsksender_inst|Selector0~1_combout\);

-- Location: FF_X30_Y4_N2
\fsksender_inst|Reg.state.WaitForSend\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Selector0~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.state.WaitForSend~q\);

-- Location: LABCELL_X31_Y4_N51
\fsksender_inst|LessThan0~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|LessThan0~10_combout\ = ( !\fsksender_inst|Reg.WaitCounter\(3) & ( !\fsksender_inst|Reg.WaitCounter\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|ALT_INV_Reg.WaitCounter\(2),
	dataf => \fsksender_inst|ALT_INV_Reg.WaitCounter\(3),
	combout => \fsksender_inst|LessThan0~10_combout\);

-- Location: LABCELL_X31_Y4_N54
\fsksender_inst|LessThan0~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|LessThan0~11_combout\ = ( !\fsksender_inst|Reg.WaitCounter\(9) & ( \fsksender_inst|LessThan0~10_combout\ & ( ((!\fsksender_inst|Reg.WaitCounter\(7) & (!\fsksender_inst|Reg.WaitCounter\(8) & !\fsksender_inst|Reg.WaitCounter\(4)))) # 
-- (\iSwitch[1]~input_o\) ) ) ) # ( !\fsksender_inst|Reg.WaitCounter\(9) & ( !\fsksender_inst|LessThan0~10_combout\ & ( (\iSwitch[1]~input_o\ & ((!\fsksender_inst|Reg.WaitCounter\(7)) # ((!\fsksender_inst|Reg.WaitCounter\(8)) # 
-- (!\fsksender_inst|Reg.WaitCounter\(4))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110010000000000000000010110011001100110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|ALT_INV_Reg.WaitCounter\(7),
	datab => \ALT_INV_iSwitch[1]~input_o\,
	datac => \fsksender_inst|ALT_INV_Reg.WaitCounter\(8),
	datad => \fsksender_inst|ALT_INV_Reg.WaitCounter\(4),
	datae => \fsksender_inst|ALT_INV_Reg.WaitCounter\(9),
	dataf => \fsksender_inst|ALT_INV_LessThan0~10_combout\,
	combout => \fsksender_inst|LessThan0~11_combout\);

-- Location: LABCELL_X30_Y4_N27
\fsksender_inst|LessThan0~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|LessThan0~8_combout\ = ( !\fsksender_inst|Reg.WaitCounter\(8) & ( !\fsksender_inst|Reg.WaitCounter\(7) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \fsksender_inst|ALT_INV_Reg.WaitCounter\(7),
	dataf => \fsksender_inst|ALT_INV_Reg.WaitCounter\(8),
	combout => \fsksender_inst|LessThan0~8_combout\);

-- Location: LABCELL_X30_Y4_N36
\fsksender_inst|LessThan0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|LessThan0~9_combout\ = ( \fsksender_inst|Reg.WaitCounter\(5) & ( \iSwitch[2]~input_o\ & ( (!\fsksender_inst|Reg.WaitCounter\(6) & ((!\fsksender_inst|Reg.WaitCounter\(9)) # (!\iSwitch[1]~input_o\))) ) ) ) # ( 
-- !\fsksender_inst|Reg.WaitCounter\(5) & ( \iSwitch[2]~input_o\ & ( (!\fsksender_inst|Reg.WaitCounter\(9)) # (!\iSwitch[1]~input_o\) ) ) ) # ( \fsksender_inst|Reg.WaitCounter\(5) & ( !\iSwitch[2]~input_o\ & ( (!\fsksender_inst|Reg.WaitCounter\(9) & 
-- (!\fsksender_inst|Reg.WaitCounter\(6) & ((\fsksender_inst|LessThan0~8_combout\) # (\iSwitch[1]~input_o\)))) ) ) ) # ( !\fsksender_inst|Reg.WaitCounter\(5) & ( !\iSwitch[2]~input_o\ & ( (!\fsksender_inst|Reg.WaitCounter\(9) & 
-- ((\fsksender_inst|LessThan0~8_combout\) # (\iSwitch[1]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101000101010001010100000000011101110111011101110111000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|ALT_INV_Reg.WaitCounter\(9),
	datab => \ALT_INV_iSwitch[1]~input_o\,
	datac => \fsksender_inst|ALT_INV_LessThan0~8_combout\,
	datad => \fsksender_inst|ALT_INV_Reg.WaitCounter\(6),
	datae => \fsksender_inst|ALT_INV_Reg.WaitCounter\(5),
	dataf => \ALT_INV_iSwitch[2]~input_o\,
	combout => \fsksender_inst|LessThan0~9_combout\);

-- Location: LABCELL_X30_Y4_N54
\fsksender_inst|Selector1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Selector1~2_combout\ = ( !\fsksender_inst|LessThan0~9_combout\ & ( \fsksender_inst|LessThan0~7_combout\ & ( (!\fsksender_inst|Reg.state.WaitForSend~q\ & (!\fsksender_inst|LessThan0~11_combout\ & (!\fsksender_inst|LessThan0~3_combout\ & 
-- !\fsksender_inst|LessThan0~2_combout\))) ) ) ) # ( \fsksender_inst|LessThan0~9_combout\ & ( !\fsksender_inst|LessThan0~7_combout\ & ( (!\fsksender_inst|Reg.state.WaitForSend~q\ & !\fsksender_inst|LessThan0~3_combout\) ) ) ) # ( 
-- !\fsksender_inst|LessThan0~9_combout\ & ( !\fsksender_inst|LessThan0~7_combout\ & ( (!\fsksender_inst|Reg.state.WaitForSend~q\ & !\fsksender_inst|LessThan0~3_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000101000001010000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|ALT_INV_Reg.state.WaitForSend~q\,
	datab => \fsksender_inst|ALT_INV_LessThan0~11_combout\,
	datac => \fsksender_inst|ALT_INV_LessThan0~3_combout\,
	datad => \fsksender_inst|ALT_INV_LessThan0~2_combout\,
	datae => \fsksender_inst|ALT_INV_LessThan0~9_combout\,
	dataf => \fsksender_inst|ALT_INV_LessThan0~7_combout\,
	combout => \fsksender_inst|Selector1~2_combout\);

-- Location: FF_X31_Y4_N2
\fsksender_inst|Reg.WaitCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Add0~53_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \fsksender_inst|Selector1~2_combout\,
	ena => \fsksender_inst|Reg.WaitCounter[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.WaitCounter\(0));

-- Location: LABCELL_X31_Y4_N3
\fsksender_inst|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Add0~49_sumout\ = SUM(( \fsksender_inst|Reg.WaitCounter\(1) ) + ( GND ) + ( \fsksender_inst|Add0~54\ ))
-- \fsksender_inst|Add0~50\ = CARRY(( \fsksender_inst|Reg.WaitCounter\(1) ) + ( GND ) + ( \fsksender_inst|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \fsksender_inst|ALT_INV_Reg.WaitCounter\(1),
	cin => \fsksender_inst|Add0~54\,
	sumout => \fsksender_inst|Add0~49_sumout\,
	cout => \fsksender_inst|Add0~50\);

-- Location: FF_X31_Y4_N5
\fsksender_inst|Reg.WaitCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Add0~49_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \fsksender_inst|Selector1~2_combout\,
	ena => \fsksender_inst|Reg.WaitCounter[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.WaitCounter\(1));

-- Location: LABCELL_X31_Y4_N6
\fsksender_inst|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Add0~37_sumout\ = SUM(( \fsksender_inst|Reg.WaitCounter\(2) ) + ( GND ) + ( \fsksender_inst|Add0~50\ ))
-- \fsksender_inst|Add0~38\ = CARRY(( \fsksender_inst|Reg.WaitCounter\(2) ) + ( GND ) + ( \fsksender_inst|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \fsksender_inst|ALT_INV_Reg.WaitCounter\(2),
	cin => \fsksender_inst|Add0~50\,
	sumout => \fsksender_inst|Add0~37_sumout\,
	cout => \fsksender_inst|Add0~38\);

-- Location: FF_X31_Y4_N8
\fsksender_inst|Reg.WaitCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Add0~37_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \fsksender_inst|Selector1~2_combout\,
	ena => \fsksender_inst|Reg.WaitCounter[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.WaitCounter\(2));

-- Location: LABCELL_X31_Y4_N9
\fsksender_inst|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Add0~5_sumout\ = SUM(( \fsksender_inst|Reg.WaitCounter\(3) ) + ( GND ) + ( \fsksender_inst|Add0~38\ ))
-- \fsksender_inst|Add0~6\ = CARRY(( \fsksender_inst|Reg.WaitCounter\(3) ) + ( GND ) + ( \fsksender_inst|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|ALT_INV_Reg.WaitCounter\(3),
	cin => \fsksender_inst|Add0~38\,
	sumout => \fsksender_inst|Add0~5_sumout\,
	cout => \fsksender_inst|Add0~6\);

-- Location: FF_X31_Y4_N11
\fsksender_inst|Reg.WaitCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Add0~5_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \fsksender_inst|Selector1~2_combout\,
	ena => \fsksender_inst|Reg.WaitCounter[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.WaitCounter\(3));

-- Location: LABCELL_X31_Y4_N12
\fsksender_inst|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Add0~1_sumout\ = SUM(( \fsksender_inst|Reg.WaitCounter\(4) ) + ( GND ) + ( \fsksender_inst|Add0~6\ ))
-- \fsksender_inst|Add0~2\ = CARRY(( \fsksender_inst|Reg.WaitCounter\(4) ) + ( GND ) + ( \fsksender_inst|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \fsksender_inst|ALT_INV_Reg.WaitCounter\(4),
	cin => \fsksender_inst|Add0~6\,
	sumout => \fsksender_inst|Add0~1_sumout\,
	cout => \fsksender_inst|Add0~2\);

-- Location: FF_X31_Y4_N14
\fsksender_inst|Reg.WaitCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Add0~1_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \fsksender_inst|Selector1~2_combout\,
	ena => \fsksender_inst|Reg.WaitCounter[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.WaitCounter\(4));

-- Location: LABCELL_X31_Y4_N15
\fsksender_inst|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Add0~13_sumout\ = SUM(( \fsksender_inst|Reg.WaitCounter\(5) ) + ( GND ) + ( \fsksender_inst|Add0~2\ ))
-- \fsksender_inst|Add0~14\ = CARRY(( \fsksender_inst|Reg.WaitCounter\(5) ) + ( GND ) + ( \fsksender_inst|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|ALT_INV_Reg.WaitCounter\(5),
	cin => \fsksender_inst|Add0~2\,
	sumout => \fsksender_inst|Add0~13_sumout\,
	cout => \fsksender_inst|Add0~14\);

-- Location: FF_X31_Y4_N17
\fsksender_inst|Reg.WaitCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Add0~13_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \fsksender_inst|Selector1~2_combout\,
	ena => \fsksender_inst|Reg.WaitCounter[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.WaitCounter\(5));

-- Location: LABCELL_X31_Y4_N18
\fsksender_inst|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Add0~9_sumout\ = SUM(( \fsksender_inst|Reg.WaitCounter\(6) ) + ( GND ) + ( \fsksender_inst|Add0~14\ ))
-- \fsksender_inst|Add0~10\ = CARRY(( \fsksender_inst|Reg.WaitCounter\(6) ) + ( GND ) + ( \fsksender_inst|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|ALT_INV_Reg.WaitCounter\(6),
	cin => \fsksender_inst|Add0~14\,
	sumout => \fsksender_inst|Add0~9_sumout\,
	cout => \fsksender_inst|Add0~10\);

-- Location: FF_X31_Y4_N20
\fsksender_inst|Reg.WaitCounter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Add0~9_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \fsksender_inst|Selector1~2_combout\,
	ena => \fsksender_inst|Reg.WaitCounter[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.WaitCounter\(6));

-- Location: LABCELL_X31_Y4_N21
\fsksender_inst|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Add0~25_sumout\ = SUM(( \fsksender_inst|Reg.WaitCounter\(7) ) + ( GND ) + ( \fsksender_inst|Add0~10\ ))
-- \fsksender_inst|Add0~26\ = CARRY(( \fsksender_inst|Reg.WaitCounter\(7) ) + ( GND ) + ( \fsksender_inst|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|ALT_INV_Reg.WaitCounter\(7),
	cin => \fsksender_inst|Add0~10\,
	sumout => \fsksender_inst|Add0~25_sumout\,
	cout => \fsksender_inst|Add0~26\);

-- Location: FF_X31_Y4_N23
\fsksender_inst|Reg.WaitCounter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Add0~25_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \fsksender_inst|Selector1~2_combout\,
	ena => \fsksender_inst|Reg.WaitCounter[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.WaitCounter\(7));

-- Location: LABCELL_X31_Y4_N24
\fsksender_inst|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Add0~21_sumout\ = SUM(( \fsksender_inst|Reg.WaitCounter\(8) ) + ( GND ) + ( \fsksender_inst|Add0~26\ ))
-- \fsksender_inst|Add0~22\ = CARRY(( \fsksender_inst|Reg.WaitCounter\(8) ) + ( GND ) + ( \fsksender_inst|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|ALT_INV_Reg.WaitCounter\(8),
	cin => \fsksender_inst|Add0~26\,
	sumout => \fsksender_inst|Add0~21_sumout\,
	cout => \fsksender_inst|Add0~22\);

-- Location: FF_X31_Y4_N26
\fsksender_inst|Reg.WaitCounter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Add0~21_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \fsksender_inst|Selector1~2_combout\,
	ena => \fsksender_inst|Reg.WaitCounter[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.WaitCounter\(8));

-- Location: LABCELL_X31_Y4_N27
\fsksender_inst|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Add0~17_sumout\ = SUM(( \fsksender_inst|Reg.WaitCounter\(9) ) + ( GND ) + ( \fsksender_inst|Add0~22\ ))
-- \fsksender_inst|Add0~18\ = CARRY(( \fsksender_inst|Reg.WaitCounter\(9) ) + ( GND ) + ( \fsksender_inst|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|ALT_INV_Reg.WaitCounter\(9),
	cin => \fsksender_inst|Add0~22\,
	sumout => \fsksender_inst|Add0~17_sumout\,
	cout => \fsksender_inst|Add0~18\);

-- Location: FF_X31_Y4_N29
\fsksender_inst|Reg.WaitCounter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Add0~17_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \fsksender_inst|Selector1~2_combout\,
	ena => \fsksender_inst|Reg.WaitCounter[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.WaitCounter\(9));

-- Location: LABCELL_X31_Y4_N30
\fsksender_inst|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Add0~45_sumout\ = SUM(( \fsksender_inst|Reg.WaitCounter\(10) ) + ( GND ) + ( \fsksender_inst|Add0~18\ ))
-- \fsksender_inst|Add0~46\ = CARRY(( \fsksender_inst|Reg.WaitCounter\(10) ) + ( GND ) + ( \fsksender_inst|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \fsksender_inst|ALT_INV_Reg.WaitCounter\(10),
	cin => \fsksender_inst|Add0~18\,
	sumout => \fsksender_inst|Add0~45_sumout\,
	cout => \fsksender_inst|Add0~46\);

-- Location: FF_X31_Y4_N32
\fsksender_inst|Reg.WaitCounter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Add0~45_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \fsksender_inst|Selector1~2_combout\,
	ena => \fsksender_inst|Reg.WaitCounter[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.WaitCounter\(10));

-- Location: LABCELL_X31_Y4_N33
\fsksender_inst|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Add0~41_sumout\ = SUM(( \fsksender_inst|Reg.WaitCounter\(11) ) + ( GND ) + ( \fsksender_inst|Add0~46\ ))
-- \fsksender_inst|Add0~42\ = CARRY(( \fsksender_inst|Reg.WaitCounter\(11) ) + ( GND ) + ( \fsksender_inst|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|ALT_INV_Reg.WaitCounter\(11),
	cin => \fsksender_inst|Add0~46\,
	sumout => \fsksender_inst|Add0~41_sumout\,
	cout => \fsksender_inst|Add0~42\);

-- Location: FF_X31_Y4_N35
\fsksender_inst|Reg.WaitCounter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Add0~41_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \fsksender_inst|Selector1~2_combout\,
	ena => \fsksender_inst|Reg.WaitCounter[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.WaitCounter\(11));

-- Location: FF_X31_Y4_N38
\fsksender_inst|Reg.WaitCounter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Add0~33_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \fsksender_inst|Selector1~2_combout\,
	ena => \fsksender_inst|Reg.WaitCounter[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.WaitCounter\(12));

-- Location: LABCELL_X30_Y4_N48
\fsksender_inst|LessThan0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|LessThan0~3_combout\ = ( !\fsksender_inst|Reg.WaitCounter\(13) & ( (\iSwitch[1]~input_o\ & (\iSwitch[2]~input_o\ & !\fsksender_inst|Reg.WaitCounter\(12))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000000000000110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_iSwitch[1]~input_o\,
	datac => \ALT_INV_iSwitch[2]~input_o\,
	datad => \fsksender_inst|ALT_INV_Reg.WaitCounter\(12),
	dataf => \fsksender_inst|ALT_INV_Reg.WaitCounter\(13),
	combout => \fsksender_inst|LessThan0~3_combout\);

-- Location: FF_X29_Y4_N28
\fsksender_inst|baudrate_generator|oStrobe\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \fsksender_inst|baudrate_generator|Equal0~3_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|baudrate_generator|oStrobe~q\);

-- Location: LABCELL_X30_Y4_N42
\fsksender_inst|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Selector1~0_combout\ = ( \fsksender_inst|Reg.state.WaitForFirstBaud~q\ & ( !\fsksender_inst|baudrate_generator|oStrobe~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsksender_inst|baudrate_generator|ALT_INV_oStrobe~q\,
	dataf => \fsksender_inst|ALT_INV_Reg.state.WaitForFirstBaud~q\,
	combout => \fsksender_inst|Selector1~0_combout\);

-- Location: LABCELL_X30_Y4_N9
\fsksender_inst|Selector1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Selector1~1_combout\ = ( \fsksender_inst|LessThan0~7_combout\ & ( \fsksender_inst|Selector1~0_combout\ ) ) # ( !\fsksender_inst|LessThan0~7_combout\ & ( \fsksender_inst|Selector1~0_combout\ ) ) # ( \fsksender_inst|LessThan0~7_combout\ & ( 
-- !\fsksender_inst|Selector1~0_combout\ & ( (!\fsksender_inst|LessThan0~3_combout\ & (\fsksender_inst|LessThan0~6_combout\ & (!\fsksender_inst|LessThan0~2_combout\ & !\fsksender_inst|Reg.state.WaitForSend~q\))) ) ) ) # ( 
-- !\fsksender_inst|LessThan0~7_combout\ & ( !\fsksender_inst|Selector1~0_combout\ & ( (!\fsksender_inst|LessThan0~3_combout\ & !\fsksender_inst|Reg.state.WaitForSend~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000001000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|ALT_INV_LessThan0~3_combout\,
	datab => \fsksender_inst|ALT_INV_LessThan0~6_combout\,
	datac => \fsksender_inst|ALT_INV_LessThan0~2_combout\,
	datad => \fsksender_inst|ALT_INV_Reg.state.WaitForSend~q\,
	datae => \fsksender_inst|ALT_INV_LessThan0~7_combout\,
	dataf => \fsksender_inst|ALT_INV_Selector1~0_combout\,
	combout => \fsksender_inst|Selector1~1_combout\);

-- Location: FF_X30_Y4_N11
\fsksender_inst|Reg.state.WaitForFirstBaud\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Selector1~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.state.WaitForFirstBaud~q\);

-- Location: LABCELL_X29_Y4_N39
\fsksender_inst|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Selector2~0_combout\ = ( \fsksender_inst|baudrate_generator|oStrobe~DUPLICATE_q\ & ( ((!\fsksender_inst|Equal0~0_combout\ & \fsksender_inst|Reg.state.Send~q\)) # (\fsksender_inst|Reg.state.WaitForFirstBaud~q\) ) ) # ( 
-- !\fsksender_inst|baudrate_generator|oStrobe~DUPLICATE_q\ & ( \fsksender_inst|Reg.state.Send~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111110011110000111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \fsksender_inst|ALT_INV_Equal0~0_combout\,
	datac => \fsksender_inst|ALT_INV_Reg.state.WaitForFirstBaud~q\,
	datad => \fsksender_inst|ALT_INV_Reg.state.Send~q\,
	dataf => \fsksender_inst|baudrate_generator|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \fsksender_inst|Selector2~0_combout\);

-- Location: FF_X29_Y4_N41
\fsksender_inst|Reg.state.Send\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Selector2~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.state.Send~q\);

-- Location: LABCELL_X29_Y4_N6
\fsksender_inst|Reg.SendCounter[3]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Reg.SendCounter[3]~0_combout\ = ( \fsksender_inst|Reg.state.Send~q\ & ( \fsksender_inst|baudrate_generator|oStrobe~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \fsksender_inst|baudrate_generator|ALT_INV_oStrobe~DUPLICATE_q\,
	dataf => \fsksender_inst|ALT_INV_Reg.state.Send~q\,
	combout => \fsksender_inst|Reg.SendCounter[3]~0_combout\);

-- Location: LABCELL_X29_Y4_N42
\fsksender_inst|Reg.SendCounter[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Reg.SendCounter[1]~2_combout\ = ( \fsksender_inst|Reg.SendCounter\(0) & ( !\fsksender_inst|Reg.SendCounter[3]~0_combout\ $ (!\fsksender_inst|Reg.SendCounter\(1)) ) ) # ( !\fsksender_inst|Reg.SendCounter\(0) & ( 
-- \fsksender_inst|Reg.SendCounter\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100110011110011000011001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \fsksender_inst|ALT_INV_Reg.SendCounter[3]~0_combout\,
	datad => \fsksender_inst|ALT_INV_Reg.SendCounter\(1),
	dataf => \fsksender_inst|ALT_INV_Reg.SendCounter\(0),
	combout => \fsksender_inst|Reg.SendCounter[1]~2_combout\);

-- Location: FF_X29_Y4_N43
\fsksender_inst|Reg.SendCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Reg.SendCounter[1]~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.SendCounter\(1));

-- Location: LABCELL_X29_Y4_N9
\fsksender_inst|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Equal0~0_combout\ = ( \fsksender_inst|Reg.SendCounter\(0) & ( (\fsksender_inst|Reg.SendCounter\(1) & \fsksender_inst|Reg.SendCounter\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|ALT_INV_Reg.SendCounter\(1),
	datad => \fsksender_inst|ALT_INV_Reg.SendCounter\(2),
	dataf => \fsksender_inst|ALT_INV_Reg.SendCounter\(0),
	combout => \fsksender_inst|Equal0~0_combout\);

-- Location: LABCELL_X29_Y4_N36
\fsksender_inst|Reg.Data~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsksender_inst|Reg.Data~0_combout\ = ( \fsksender_inst|Reg.state.Send~q\ & ( (!\fsksender_inst|baudrate_generator|oStrobe~DUPLICATE_q\ & (((\fsksender_inst|Reg.Data~q\)))) # (\fsksender_inst|baudrate_generator|oStrobe~DUPLICATE_q\ & 
-- ((!\fsksender_inst|Reg.state.WaitForSend~q\ & ((\fsksender_inst|Reg.Data~q\))) # (\fsksender_inst|Reg.state.WaitForSend~q\ & (!\fsksender_inst|Equal0~0_combout\)))) ) ) # ( !\fsksender_inst|Reg.state.Send~q\ & ( 
-- ((\fsksender_inst|baudrate_generator|oStrobe~DUPLICATE_q\ & \fsksender_inst|Reg.state.WaitForSend~q\)) # (\fsksender_inst|Reg.Data~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111111111000001011111111100000100111111100000010011111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsksender_inst|baudrate_generator|ALT_INV_oStrobe~DUPLICATE_q\,
	datab => \fsksender_inst|ALT_INV_Equal0~0_combout\,
	datac => \fsksender_inst|ALT_INV_Reg.state.WaitForSend~q\,
	datad => \fsksender_inst|ALT_INV_Reg.Data~q\,
	dataf => \fsksender_inst|ALT_INV_Reg.state.Send~q\,
	combout => \fsksender_inst|Reg.Data~0_combout\);

-- Location: FF_X29_Y4_N37
\fsksender_inst|Reg.Data\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \fsksender_inst|Reg.Data~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsksender_inst|Reg.Data~q\);

-- Location: LABCELL_X36_Y3_N27
\TheTxDataSync|Metastable[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxDataSync|Metastable[0]~feeder_combout\ = ( \fsksender_inst|Reg.Data~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \fsksender_inst|ALT_INV_Reg.Data~q\,
	combout => \TheTxDataSync|Metastable[0]~feeder_combout\);

-- Location: FF_X36_Y3_N28
\TheTxDataSync|Metastable[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxDataSync|Metastable[0]~feeder_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxDataSync|Metastable\(0));

-- Location: FF_X48_Y3_N5
\TheTxDataSync|Metastable[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxDataSync|Metastable\(0),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxDataSync|Metastable\(1));

-- Location: LABCELL_X42_Y4_N27
\GenClks|MclkCounter[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|MclkCounter[0]~0_combout\ = !\GenClks|MclkCounter\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \GenClks|ALT_INV_MclkCounter\(0),
	combout => \GenClks|MclkCounter[0]~0_combout\);

-- Location: FF_X42_Y4_N28
\GenClks|MclkCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|MclkCounter[0]~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|MclkCounter\(0));

-- Location: LABCELL_X42_Y4_N18
\GenClks|Mclk~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Mclk~0_combout\ = ( \GenClks|Mclk~q\ & ( !\GenClks|MclkCounter\(0) ) ) # ( !\GenClks|Mclk~q\ & ( \GenClks|MclkCounter\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011110011001100110000110011001100111100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenClks|ALT_INV_MclkCounter\(0),
	datae => \GenClks|ALT_INV_Mclk~q\,
	combout => \GenClks|Mclk~0_combout\);

-- Location: FF_X42_Y4_N23
\GenClks|Mclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \GenClks|Mclk~0_combout\,
	clrn => \inButton[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|Mclk~q\);

-- Location: LABCELL_X42_Y4_N30
\GenClks|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add1~9_sumout\ = SUM(( \GenClks|ADCCounter\(0) ) + ( VCC ) + ( !VCC ))
-- \GenClks|Add1~10\ = CARRY(( \GenClks|ADCCounter\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenClks|ALT_INV_ADCCounter\(0),
	cin => GND,
	sumout => \GenClks|Add1~9_sumout\,
	cout => \GenClks|Add1~10\);

-- Location: FF_X42_Y4_N35
\GenClks|ADCCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenClks|ALT_INV_Mclk~q\,
	asdata => \GenClks|Add1~9_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|ADCCounter\(0));

-- Location: LABCELL_X42_Y4_N33
\GenClks|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add1~5_sumout\ = SUM(( \GenClks|ADCCounter\(1) ) + ( GND ) + ( \GenClks|Add1~10\ ))
-- \GenClks|Add1~6\ = CARRY(( \GenClks|ADCCounter\(1) ) + ( GND ) + ( \GenClks|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenClks|ALT_INV_ADCCounter\(1),
	cin => \GenClks|Add1~10\,
	sumout => \GenClks|Add1~5_sumout\,
	cout => \GenClks|Add1~6\);

-- Location: FF_X42_Y4_N58
\GenClks|ADCCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenClks|ALT_INV_Mclk~q\,
	asdata => \GenClks|Add1~5_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|ADCCounter\(1));

-- Location: LABCELL_X42_Y4_N36
\GenClks|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add1~1_sumout\ = SUM(( \GenClks|ADCCounter\(2) ) + ( GND ) + ( \GenClks|Add1~6\ ))
-- \GenClks|Add1~2\ = CARRY(( \GenClks|ADCCounter\(2) ) + ( GND ) + ( \GenClks|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenClks|ALT_INV_ADCCounter\(2),
	cin => \GenClks|Add1~6\,
	sumout => \GenClks|Add1~1_sumout\,
	cout => \GenClks|Add1~2\);

-- Location: FF_X42_Y4_N56
\GenClks|ADCCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenClks|ALT_INV_Mclk~q\,
	asdata => \GenClks|Add1~1_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|ADCCounter\(2));

-- Location: LABCELL_X42_Y4_N39
\GenClks|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add1~29_sumout\ = SUM(( \GenClks|ADCCounter\(3) ) + ( GND ) + ( \GenClks|Add1~2\ ))
-- \GenClks|Add1~30\ = CARRY(( \GenClks|ADCCounter\(3) ) + ( GND ) + ( \GenClks|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenClks|ALT_INV_ADCCounter\(3),
	cin => \GenClks|Add1~2\,
	sumout => \GenClks|Add1~29_sumout\,
	cout => \GenClks|Add1~30\);

-- Location: LABCELL_X42_Y4_N3
\GenClks|ADCCounter~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|ADCCounter~1_combout\ = ( \GenClks|ADCCounter\(1) & ( (\GenClks|Add1~29_sumout\ & ((!\GenClks|ADCCounter\(0)) # ((!\GenClks|Equal0~0_combout\) # (!\GenClks|ADCCounter\(2))))) ) ) # ( !\GenClks|ADCCounter\(1) & ( \GenClks|Add1~29_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011100000111100001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenClks|ALT_INV_ADCCounter\(0),
	datab => \GenClks|ALT_INV_Equal0~0_combout\,
	datac => \GenClks|ALT_INV_Add1~29_sumout\,
	datad => \GenClks|ALT_INV_ADCCounter\(2),
	dataf => \GenClks|ALT_INV_ADCCounter\(1),
	combout => \GenClks|ADCCounter~1_combout\);

-- Location: FF_X42_Y4_N5
\GenClks|ADCCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenClks|ALT_INV_Mclk~q\,
	d => \GenClks|ADCCounter~1_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|ADCCounter\(3));

-- Location: LABCELL_X42_Y4_N42
\GenClks|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add1~25_sumout\ = SUM(( \GenClks|ADCCounter\(4) ) + ( GND ) + ( \GenClks|Add1~30\ ))
-- \GenClks|Add1~26\ = CARRY(( \GenClks|ADCCounter\(4) ) + ( GND ) + ( \GenClks|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenClks|ALT_INV_ADCCounter\(4),
	cin => \GenClks|Add1~30\,
	sumout => \GenClks|Add1~25_sumout\,
	cout => \GenClks|Add1~26\);

-- Location: FF_X42_Y4_N38
\GenClks|ADCCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenClks|ALT_INV_Mclk~q\,
	asdata => \GenClks|Add1~25_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|ADCCounter\(4));

-- Location: LABCELL_X42_Y4_N45
\GenClks|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add1~21_sumout\ = SUM(( \GenClks|ADCCounter\(5) ) + ( GND ) + ( \GenClks|Add1~26\ ))
-- \GenClks|Add1~22\ = CARRY(( \GenClks|ADCCounter\(5) ) + ( GND ) + ( \GenClks|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenClks|ALT_INV_ADCCounter\(5),
	cin => \GenClks|Add1~26\,
	sumout => \GenClks|Add1~21_sumout\,
	cout => \GenClks|Add1~22\);

-- Location: FF_X42_Y4_N32
\GenClks|ADCCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenClks|ALT_INV_Mclk~q\,
	asdata => \GenClks|Add1~21_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|ADCCounter\(5));

-- Location: LABCELL_X42_Y4_N48
\GenClks|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add1~17_sumout\ = SUM(( \GenClks|ADCCounter\(6) ) + ( GND ) + ( \GenClks|Add1~22\ ))
-- \GenClks|Add1~18\ = CARRY(( \GenClks|ADCCounter\(6) ) + ( GND ) + ( \GenClks|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenClks|ALT_INV_ADCCounter\(6),
	cin => \GenClks|Add1~22\,
	sumout => \GenClks|Add1~17_sumout\,
	cout => \GenClks|Add1~18\);

-- Location: LABCELL_X42_Y4_N15
\GenClks|ADCCounter[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|ADCCounter[6]~feeder_combout\ = ( \GenClks|Add1~17_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \GenClks|ALT_INV_Add1~17_sumout\,
	combout => \GenClks|ADCCounter[6]~feeder_combout\);

-- Location: FF_X42_Y4_N17
\GenClks|ADCCounter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenClks|ALT_INV_Mclk~q\,
	d => \GenClks|ADCCounter[6]~feeder_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|ADCCounter\(6));

-- Location: LABCELL_X42_Y4_N51
\GenClks|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add1~13_sumout\ = SUM(( \GenClks|ADCCounter\(7) ) + ( GND ) + ( \GenClks|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenClks|ALT_INV_ADCCounter\(7),
	cin => \GenClks|Add1~18\,
	sumout => \GenClks|Add1~13_sumout\);

-- Location: LABCELL_X42_Y4_N0
\GenClks|ADCCounter~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|ADCCounter~0_combout\ = ( \GenClks|ADCCounter\(1) & ( (\GenClks|Add1~13_sumout\ & ((!\GenClks|ADCCounter\(0)) # ((!\GenClks|Equal0~0_combout\) # (!\GenClks|ADCCounter\(2))))) ) ) # ( !\GenClks|ADCCounter\(1) & ( \GenClks|Add1~13_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011100000111100001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenClks|ALT_INV_ADCCounter\(0),
	datab => \GenClks|ALT_INV_Equal0~0_combout\,
	datac => \GenClks|ALT_INV_Add1~13_sumout\,
	datad => \GenClks|ALT_INV_ADCCounter\(2),
	dataf => \GenClks|ALT_INV_ADCCounter\(1),
	combout => \GenClks|ADCCounter~0_combout\);

-- Location: FF_X42_Y4_N2
\GenClks|ADCCounter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenClks|ALT_INV_Mclk~q\,
	d => \GenClks|ADCCounter~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|ADCCounter\(7));

-- Location: LABCELL_X42_Y4_N6
\GenClks|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Equal0~0_combout\ = ( !\GenClks|ADCCounter\(4) & ( !\GenClks|ADCCounter\(6) & ( (\GenClks|ADCCounter\(7) & (!\GenClks|ADCCounter\(5) & !\GenClks|ADCCounter\(3))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenClks|ALT_INV_ADCCounter\(7),
	datab => \GenClks|ALT_INV_ADCCounter\(5),
	datac => \GenClks|ALT_INV_ADCCounter\(3),
	datae => \GenClks|ALT_INV_ADCCounter\(4),
	dataf => \GenClks|ALT_INV_ADCCounter\(6),
	combout => \GenClks|Equal0~0_combout\);

-- Location: LABCELL_X42_Y4_N24
\GenClks|ADClrc~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|ADClrc~0_combout\ = ( \GenClks|ADCCounter\(0) & ( !\GenClks|ADClrc~q\ $ (((!\GenClks|ADCCounter\(1)) # ((!\GenClks|Equal0~0_combout\) # (!\GenClks|ADCCounter\(2))))) ) ) # ( !\GenClks|ADCCounter\(0) & ( \GenClks|ADClrc~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000001111111100000000111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenClks|ALT_INV_ADCCounter\(1),
	datab => \GenClks|ALT_INV_Equal0~0_combout\,
	datac => \GenClks|ALT_INV_ADCCounter\(2),
	datad => \GenClks|ALT_INV_ADClrc~q\,
	dataf => \GenClks|ALT_INV_ADCCounter\(0),
	combout => \GenClks|ADClrc~0_combout\);

-- Location: LABCELL_X42_Y4_N12
\GenClks|ADClrc~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|ADClrc~feeder_combout\ = ( \GenClks|ADClrc~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \GenClks|ALT_INV_ADClrc~0_combout\,
	combout => \GenClks|ADClrc~feeder_combout\);

-- Location: FF_X42_Y4_N14
\GenClks|ADClrc\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenClks|ALT_INV_Mclk~q\,
	d => \GenClks|ADClrc~feeder_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|ADClrc~q\);

-- Location: FF_X65_Y1_N50
oldADClrc : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \GenClks|ADClrc~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \oldADClrc~q\);

-- Location: MLABCELL_X65_Y1_N48
PhaseStrobe : cyclonev_lcell_comb
-- Equation(s):
-- \PhaseStrobe~combout\ = ( \GenClks|ADClrc~q\ & ( !\oldADClrc~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \GenClks|ALT_INV_ADClrc~q\,
	dataf => \ALT_INV_oldADClrc~q\,
	combout => \PhaseStrobe~combout\);

-- Location: LABCELL_X56_Y2_N39
\ValWetR~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \ValWetR~feeder_combout\ = ( \PhaseStrobe~combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_PhaseStrobe~combout\,
	combout => \ValWetR~feeder_combout\);

-- Location: FF_X56_Y2_N41
ValWetR : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ValWetR~feeder_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ValWetR~q\);

-- Location: FF_X47_Y2_N44
\TheParToI2s|BclkDlyd~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \GenClks|Mclk~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|BclkDlyd~DUPLICATE_q\);

-- Location: FF_X47_Y2_N55
\TheParToI2s|State.SendingL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2s|Selector3~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|State.SendingL~q\);

-- Location: FF_X47_Y2_N40
\TheParToI2s|State.FirstBitEmptyL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2s|State.FirstBitEmptyL~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|State.FirstBitEmptyL~q\);

-- Location: MLABCELL_X47_Y2_N54
\TheParToI2s|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector3~0_combout\ = ( \TheParToI2s|State.FirstBitEmptyL~q\ & ( (!\TheParToI2s|NextState~6_combout\ & (((\TheParToI2s|BclkDlyd~DUPLICATE_q\ & !\GenClks|Mclk~q\)) # (\TheParToI2s|State.SendingL~q\))) # (\TheParToI2s|NextState~6_combout\ & 
-- (\TheParToI2s|BclkDlyd~DUPLICATE_q\ & (!\GenClks|Mclk~q\))) ) ) # ( !\TheParToI2s|State.FirstBitEmptyL~q\ & ( (!\TheParToI2s|NextState~6_combout\ & \TheParToI2s|State.SendingL~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000110000101110100011000010111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_NextState~6_combout\,
	datab => \TheParToI2s|ALT_INV_BclkDlyd~DUPLICATE_q\,
	datac => \GenClks|ALT_INV_Mclk~q\,
	datad => \TheParToI2s|ALT_INV_State.SendingL~q\,
	dataf => \TheParToI2s|ALT_INV_State.FirstBitEmptyL~q\,
	combout => \TheParToI2s|Selector3~0_combout\);

-- Location: FF_X47_Y2_N56
\TheParToI2s|State.SendingL~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2s|Selector3~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|State.SendingL~DUPLICATE_q\);

-- Location: MLABCELL_X47_Y2_N27
\TheParToI2s|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector4~0_combout\ = ( \TheParToI2s|State.SendingL~q\ & ( ((\TheParToI2s|State.FirstBitEmptyR~q\ & ((!\TheParToI2s|BclkDlyd~DUPLICATE_q\) # (\GenClks|Mclk~q\)))) # (\TheParToI2s|NextState~6_combout\) ) ) # ( !\TheParToI2s|State.SendingL~q\ 
-- & ( (\TheParToI2s|State.FirstBitEmptyR~q\ & ((!\TheParToI2s|BclkDlyd~DUPLICATE_q\) # (\GenClks|Mclk~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001111000000001100111101010101110111110101010111011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_NextState~6_combout\,
	datab => \TheParToI2s|ALT_INV_BclkDlyd~DUPLICATE_q\,
	datac => \GenClks|ALT_INV_Mclk~q\,
	datad => \TheParToI2s|ALT_INV_State.FirstBitEmptyR~q\,
	dataf => \TheParToI2s|ALT_INV_State.SendingL~q\,
	combout => \TheParToI2s|Selector4~0_combout\);

-- Location: FF_X47_Y2_N28
\TheParToI2s|State.FirstBitEmptyR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2s|Selector4~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|State.FirstBitEmptyR~q\);

-- Location: MLABCELL_X47_Y2_N24
\TheParToI2s|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector5~0_combout\ = ( \TheParToI2s|State.FirstBitEmptyR~q\ & ( (!\TheParToI2s|NextState~6_combout\ & (((\TheParToI2s|BclkDlyd~DUPLICATE_q\ & !\GenClks|Mclk~q\)) # (\TheParToI2s|State.SendingR~q\))) # (\TheParToI2s|NextState~6_combout\ & 
-- (\TheParToI2s|BclkDlyd~DUPLICATE_q\ & (!\GenClks|Mclk~q\))) ) ) # ( !\TheParToI2s|State.FirstBitEmptyR~q\ & ( (!\TheParToI2s|NextState~6_combout\ & \TheParToI2s|State.SendingR~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000110000101110100011000010111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_NextState~6_combout\,
	datab => \TheParToI2s|ALT_INV_BclkDlyd~DUPLICATE_q\,
	datac => \GenClks|ALT_INV_Mclk~q\,
	datad => \TheParToI2s|ALT_INV_State.SendingR~q\,
	dataf => \TheParToI2s|ALT_INV_State.FirstBitEmptyR~q\,
	combout => \TheParToI2s|Selector5~0_combout\);

-- Location: FF_X47_Y2_N25
\TheParToI2s|State.SendingR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2s|Selector5~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|State.SendingR~q\);

-- Location: MLABCELL_X47_Y2_N45
\TheParToI2s|Selector10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector10~0_combout\ = ( \TheParToI2s|State.SendingL~DUPLICATE_q\ & ( \TheParToI2s|State.SendingR~q\ ) ) # ( !\TheParToI2s|State.SendingL~DUPLICATE_q\ & ( \TheParToI2s|State.SendingR~q\ ) ) # ( \TheParToI2s|State.SendingL~DUPLICATE_q\ & ( 
-- !\TheParToI2s|State.SendingR~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \TheParToI2s|ALT_INV_State.SendingL~DUPLICATE_q\,
	dataf => \TheParToI2s|ALT_INV_State.SendingR~q\,
	combout => \TheParToI2s|Selector10~0_combout\);

-- Location: FF_X47_Y2_N29
\TheParToI2s|State.FirstBitEmptyR~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2s|Selector4~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|State.FirstBitEmptyR~DUPLICATE_q\);

-- Location: LABCELL_X46_Y2_N12
\TheParToI2s|Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector7~0_combout\ = ( \GenClks|Mclk~q\ & ( (\TheParToI2s|BclkCtr\(2) & ((\TheParToI2s|State.FirstBitEmptyR~DUPLICATE_q\) # (\TheParToI2s|State.FirstBitEmptyL~DUPLICATE_q\))) ) ) # ( !\GenClks|Mclk~q\ & ( (!\TheParToI2s|BclkCtr\(2) & 
-- (\TheParToI2s|BclkDlyd~DUPLICATE_q\ & ((\TheParToI2s|State.FirstBitEmptyR~DUPLICATE_q\) # (\TheParToI2s|State.FirstBitEmptyL~DUPLICATE_q\)))) # (\TheParToI2s|BclkCtr\(2) & (((\TheParToI2s|State.FirstBitEmptyR~DUPLICATE_q\) # 
-- (\TheParToI2s|State.FirstBitEmptyL~DUPLICATE_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011101110111000001110111011100000101010101010000010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_BclkCtr\(2),
	datab => \TheParToI2s|ALT_INV_BclkDlyd~DUPLICATE_q\,
	datac => \TheParToI2s|ALT_INV_State.FirstBitEmptyL~DUPLICATE_q\,
	datad => \TheParToI2s|ALT_INV_State.FirstBitEmptyR~DUPLICATE_q\,
	dataf => \GenClks|ALT_INV_Mclk~q\,
	combout => \TheParToI2s|Selector7~0_combout\);

-- Location: FF_X47_Y2_N43
\TheParToI2s|BclkDlyd\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \GenClks|Mclk~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|BclkDlyd~q\);

-- Location: LABCELL_X46_Y2_N33
\TheParToI2s|Selector6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector6~1_combout\ = ( !\TheParToI2s|BclkCtr\(0) & ( (\TheParToI2s|BclkDlyd~q\ & (!\GenClks|Mclk~q\ & (!\TheParToI2s|BclkCtr\(1) & !\TheParToI2s|BclkCtr\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000010000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_BclkDlyd~q\,
	datab => \GenClks|ALT_INV_Mclk~q\,
	datac => \TheParToI2s|ALT_INV_BclkCtr\(1),
	datad => \TheParToI2s|ALT_INV_BclkCtr\(2),
	dataf => \TheParToI2s|ALT_INV_BclkCtr\(0),
	combout => \TheParToI2s|Selector6~1_combout\);

-- Location: MLABCELL_X47_Y2_N18
\TheParToI2s|NextBclkCtr~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|NextBclkCtr~0_combout\ = ( !\TheParToI2s|State.SyncingToBclk~q\ & ( \TheParToI2s|State.WaitingValL~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \TheParToI2s|ALT_INV_State.SyncingToBclk~q\,
	dataf => \TheParToI2s|ALT_INV_State.WaitingValL~q\,
	combout => \TheParToI2s|NextBclkCtr~0_combout\);

-- Location: LABCELL_X46_Y2_N30
\TheParToI2s|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector6~0_combout\ = ( \TheParToI2s|State.FirstBitEmptyL~DUPLICATE_q\ & ( ((\TheParToI2s|BclkDlyd~q\ & !\GenClks|Mclk~q\)) # (\TheParToI2s|BclkCtr\(3)) ) ) # ( !\TheParToI2s|State.FirstBitEmptyL~DUPLICATE_q\ & ( 
-- (\TheParToI2s|State.FirstBitEmptyR~DUPLICATE_q\ & (((\TheParToI2s|BclkDlyd~q\ & !\GenClks|Mclk~q\)) # (\TheParToI2s|BclkCtr\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000001111000001000000111101000100111111110100010011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_BclkDlyd~q\,
	datab => \GenClks|ALT_INV_Mclk~q\,
	datac => \TheParToI2s|ALT_INV_State.FirstBitEmptyR~DUPLICATE_q\,
	datad => \TheParToI2s|ALT_INV_BclkCtr\(3),
	dataf => \TheParToI2s|ALT_INV_State.FirstBitEmptyL~DUPLICATE_q\,
	combout => \TheParToI2s|Selector6~0_combout\);

-- Location: LABCELL_X46_Y2_N48
\TheParToI2s|Selector6~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector6~2_combout\ = ( \TheParToI2s|BclkCtr\(3) & ( \TheParToI2s|Selector6~0_combout\ ) ) # ( !\TheParToI2s|BclkCtr\(3) & ( \TheParToI2s|Selector6~0_combout\ ) ) # ( \TheParToI2s|BclkCtr\(3) & ( !\TheParToI2s|Selector6~0_combout\ & ( 
-- (!\TheParToI2s|NextBclkCtr~0_combout\) # ((\TheParToI2s|Selector10~0_combout\ & !\TheParToI2s|Selector6~1_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110101000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_Selector10~0_combout\,
	datac => \TheParToI2s|ALT_INV_Selector6~1_combout\,
	datad => \TheParToI2s|ALT_INV_NextBclkCtr~0_combout\,
	datae => \TheParToI2s|ALT_INV_BclkCtr\(3),
	dataf => \TheParToI2s|ALT_INV_Selector6~0_combout\,
	combout => \TheParToI2s|Selector6~2_combout\);

-- Location: FF_X46_Y2_N49
\TheParToI2s|BclkCtr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2s|Selector6~2_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|BclkCtr\(3));

-- Location: LABCELL_X46_Y2_N24
\TheParToI2s|NextBclkCtr~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|NextBclkCtr~1_combout\ = ( \TheParToI2s|BclkCtr\(1) & ( !\GenClks|Mclk~q\ & ( \TheParToI2s|BclkDlyd~DUPLICATE_q\ ) ) ) # ( !\TheParToI2s|BclkCtr\(1) & ( !\GenClks|Mclk~q\ & ( (\TheParToI2s|BclkDlyd~DUPLICATE_q\ & (((\TheParToI2s|BclkCtr\(3)) 
-- # (\TheParToI2s|BclkCtr\(2))) # (\TheParToI2s|BclkCtr\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001100110011001100110011001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_BclkCtr\(0),
	datab => \TheParToI2s|ALT_INV_BclkDlyd~DUPLICATE_q\,
	datac => \TheParToI2s|ALT_INV_BclkCtr\(2),
	datad => \TheParToI2s|ALT_INV_BclkCtr\(3),
	datae => \TheParToI2s|ALT_INV_BclkCtr\(1),
	dataf => \GenClks|ALT_INV_Mclk~q\,
	combout => \TheParToI2s|NextBclkCtr~1_combout\);

-- Location: LABCELL_X46_Y2_N15
\TheParToI2s|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Add0~0_combout\ = ( !\TheParToI2s|BclkCtr\(0) & ( !\TheParToI2s|BclkCtr\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheParToI2s|ALT_INV_BclkCtr\(1),
	dataf => \TheParToI2s|ALT_INV_BclkCtr\(0),
	combout => \TheParToI2s|Add0~0_combout\);

-- Location: LABCELL_X46_Y2_N0
\TheParToI2s|Selector7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector7~1_combout\ = ( \TheParToI2s|BclkCtr\(2) & ( \TheParToI2s|NextBclkCtr~0_combout\ & ( ((\TheParToI2s|Selector10~0_combout\ & ((!\TheParToI2s|NextBclkCtr~1_combout\) # (!\TheParToI2s|Add0~0_combout\)))) # 
-- (\TheParToI2s|Selector7~0_combout\) ) ) ) # ( !\TheParToI2s|BclkCtr\(2) & ( \TheParToI2s|NextBclkCtr~0_combout\ & ( ((\TheParToI2s|Selector10~0_combout\ & (\TheParToI2s|NextBclkCtr~1_combout\ & \TheParToI2s|Add0~0_combout\))) # 
-- (\TheParToI2s|Selector7~0_combout\) ) ) ) # ( \TheParToI2s|BclkCtr\(2) & ( !\TheParToI2s|NextBclkCtr~0_combout\ ) ) # ( !\TheParToI2s|BclkCtr\(2) & ( !\TheParToI2s|NextBclkCtr~0_combout\ & ( ((\TheParToI2s|Selector10~0_combout\ & 
-- (\TheParToI2s|NextBclkCtr~1_combout\ & \TheParToI2s|Add0~0_combout\))) # (\TheParToI2s|Selector7~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110111111111111111111100110011001101110111011101110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_Selector10~0_combout\,
	datab => \TheParToI2s|ALT_INV_Selector7~0_combout\,
	datac => \TheParToI2s|ALT_INV_NextBclkCtr~1_combout\,
	datad => \TheParToI2s|ALT_INV_Add0~0_combout\,
	datae => \TheParToI2s|ALT_INV_BclkCtr\(2),
	dataf => \TheParToI2s|ALT_INV_NextBclkCtr~0_combout\,
	combout => \TheParToI2s|Selector7~1_combout\);

-- Location: FF_X46_Y2_N1
\TheParToI2s|BclkCtr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2s|Selector7~1_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|BclkCtr\(2));

-- Location: FF_X46_Y2_N19
\TheParToI2s|BclkCtr[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2s|Selector9~1_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|BclkCtr[0]~DUPLICATE_q\);

-- Location: MLABCELL_X47_Y2_N33
\TheParToI2s|NextState~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|NextState~6_combout\ = ( !\TheParToI2s|BclkCtr\(3) & ( \TheParToI2s|BclkDlyd~DUPLICATE_q\ & ( (!\TheParToI2s|BclkCtr\(1) & (!\TheParToI2s|BclkCtr\(2) & (!\TheParToI2s|BclkCtr[0]~DUPLICATE_q\ & !\GenClks|Mclk~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_BclkCtr\(1),
	datab => \TheParToI2s|ALT_INV_BclkCtr\(2),
	datac => \TheParToI2s|ALT_INV_BclkCtr[0]~DUPLICATE_q\,
	datad => \GenClks|ALT_INV_Mclk~q\,
	datae => \TheParToI2s|ALT_INV_BclkCtr\(3),
	dataf => \TheParToI2s|ALT_INV_BclkDlyd~DUPLICATE_q\,
	combout => \TheParToI2s|NextState~6_combout\);

-- Location: MLABCELL_X47_Y2_N57
\TheParToI2s|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector0~0_combout\ = ( \TheParToI2s|State.SendingR~q\ & ( (!\TheParToI2s|NextState~6_combout\ & ((\TheParToI2s|State.WaitingValL~q\) # (\ValWetR~q\))) ) ) # ( !\TheParToI2s|State.SendingR~q\ & ( (\TheParToI2s|State.WaitingValL~q\) # 
-- (\ValWetR~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111100001010101010100000101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_NextState~6_combout\,
	datac => \ALT_INV_ValWetR~q\,
	datad => \TheParToI2s|ALT_INV_State.WaitingValL~q\,
	dataf => \TheParToI2s|ALT_INV_State.SendingR~q\,
	combout => \TheParToI2s|Selector0~0_combout\);

-- Location: FF_X47_Y2_N58
\TheParToI2s|State.WaitingValL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2s|Selector0~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|State.WaitingValL~q\);

-- Location: MLABCELL_X47_Y2_N36
\TheParToI2s|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector1~0_combout\ = ( \TheParToI2s|BclkDlyd~q\ & ( (!\ValWetR~q\ & (\GenClks|Mclk~q\ & ((\TheParToI2s|State.SyncingToBclk~q\)))) # (\ValWetR~q\ & ((!\TheParToI2s|State.WaitingValL~q\) # ((\GenClks|Mclk~q\ & 
-- \TheParToI2s|State.SyncingToBclk~q\)))) ) ) # ( !\TheParToI2s|BclkDlyd~q\ & ( ((\ValWetR~q\ & !\TheParToI2s|State.WaitingValL~q\)) # (\TheParToI2s|State.SyncingToBclk~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000011111111010100001111111101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ValWetR~q\,
	datab => \GenClks|ALT_INV_Mclk~q\,
	datac => \TheParToI2s|ALT_INV_State.WaitingValL~q\,
	datad => \TheParToI2s|ALT_INV_State.SyncingToBclk~q\,
	dataf => \TheParToI2s|ALT_INV_BclkDlyd~q\,
	combout => \TheParToI2s|Selector1~0_combout\);

-- Location: FF_X47_Y2_N37
\TheParToI2s|State.SyncingToBclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2s|Selector1~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|State.SyncingToBclk~q\);

-- Location: MLABCELL_X47_Y2_N39
\TheParToI2s|State.FirstBitEmptyL~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|State.FirstBitEmptyL~0_combout\ = ( \TheParToI2s|BclkDlyd~q\ & ( (!\GenClks|Mclk~q\ & (\TheParToI2s|State.SyncingToBclk~q\)) # (\GenClks|Mclk~q\ & ((\TheParToI2s|State.FirstBitEmptyL~q\))) ) ) # ( !\TheParToI2s|BclkDlyd~q\ & ( 
-- \TheParToI2s|State.FirstBitEmptyL~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001100001111110000110000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenClks|ALT_INV_Mclk~q\,
	datac => \TheParToI2s|ALT_INV_State.SyncingToBclk~q\,
	datad => \TheParToI2s|ALT_INV_State.FirstBitEmptyL~q\,
	dataf => \TheParToI2s|ALT_INV_BclkDlyd~q\,
	combout => \TheParToI2s|State.FirstBitEmptyL~0_combout\);

-- Location: FF_X47_Y2_N41
\TheParToI2s|State.FirstBitEmptyL~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2s|State.FirstBitEmptyL~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|State.FirstBitEmptyL~DUPLICATE_q\);

-- Location: LABCELL_X46_Y2_N9
\TheParToI2s|Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector9~0_combout\ = ( \TheParToI2s|State.FirstBitEmptyR~DUPLICATE_q\ & ( \TheParToI2s|BclkCtr\(0) ) ) # ( !\TheParToI2s|State.FirstBitEmptyR~DUPLICATE_q\ & ( \TheParToI2s|BclkCtr\(0) & ( \TheParToI2s|State.FirstBitEmptyL~DUPLICATE_q\ ) ) ) 
-- # ( \TheParToI2s|State.FirstBitEmptyR~DUPLICATE_q\ & ( !\TheParToI2s|BclkCtr\(0) & ( (\TheParToI2s|BclkDlyd~DUPLICATE_q\ & !\GenClks|Mclk~q\) ) ) ) # ( !\TheParToI2s|State.FirstBitEmptyR~DUPLICATE_q\ & ( !\TheParToI2s|BclkCtr\(0) & ( 
-- (\TheParToI2s|State.FirstBitEmptyL~DUPLICATE_q\ & (\TheParToI2s|BclkDlyd~DUPLICATE_q\ & !\GenClks|Mclk~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010000001100000011000001010101010101011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_State.FirstBitEmptyL~DUPLICATE_q\,
	datab => \TheParToI2s|ALT_INV_BclkDlyd~DUPLICATE_q\,
	datac => \GenClks|ALT_INV_Mclk~q\,
	datae => \TheParToI2s|ALT_INV_State.FirstBitEmptyR~DUPLICATE_q\,
	dataf => \TheParToI2s|ALT_INV_BclkCtr\(0),
	combout => \TheParToI2s|Selector9~0_combout\);

-- Location: LABCELL_X46_Y2_N18
\TheParToI2s|Selector9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector9~1_combout\ = ( \TheParToI2s|BclkCtr\(0) & ( \TheParToI2s|NextBclkCtr~1_combout\ & ( (!\TheParToI2s|NextBclkCtr~0_combout\) # (\TheParToI2s|Selector9~0_combout\) ) ) ) # ( !\TheParToI2s|BclkCtr\(0) & ( 
-- \TheParToI2s|NextBclkCtr~1_combout\ & ( (\TheParToI2s|Selector10~0_combout\) # (\TheParToI2s|Selector9~0_combout\) ) ) ) # ( \TheParToI2s|BclkCtr\(0) & ( !\TheParToI2s|NextBclkCtr~1_combout\ & ( ((!\TheParToI2s|NextBclkCtr~0_combout\) # 
-- (\TheParToI2s|Selector10~0_combout\)) # (\TheParToI2s|Selector9~0_combout\) ) ) ) # ( !\TheParToI2s|BclkCtr\(0) & ( !\TheParToI2s|NextBclkCtr~1_combout\ & ( \TheParToI2s|Selector9~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011111111110011111100111111001111111111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheParToI2s|ALT_INV_Selector9~0_combout\,
	datac => \TheParToI2s|ALT_INV_Selector10~0_combout\,
	datad => \TheParToI2s|ALT_INV_NextBclkCtr~0_combout\,
	datae => \TheParToI2s|ALT_INV_BclkCtr\(0),
	dataf => \TheParToI2s|ALT_INV_NextBclkCtr~1_combout\,
	combout => \TheParToI2s|Selector9~1_combout\);

-- Location: FF_X46_Y2_N20
\TheParToI2s|BclkCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2s|Selector9~1_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|BclkCtr\(0));

-- Location: LABCELL_X46_Y2_N42
\TheParToI2s|Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector8~0_combout\ = ( \TheParToI2s|BclkDlyd~DUPLICATE_q\ & ( \GenClks|Mclk~q\ & ( (\TheParToI2s|BclkCtr\(1) & ((\TheParToI2s|State.FirstBitEmptyR~DUPLICATE_q\) # (\TheParToI2s|State.FirstBitEmptyL~DUPLICATE_q\))) ) ) ) # ( 
-- !\TheParToI2s|BclkDlyd~DUPLICATE_q\ & ( \GenClks|Mclk~q\ & ( (\TheParToI2s|BclkCtr\(1) & ((\TheParToI2s|State.FirstBitEmptyR~DUPLICATE_q\) # (\TheParToI2s|State.FirstBitEmptyL~DUPLICATE_q\))) ) ) ) # ( \TheParToI2s|BclkDlyd~DUPLICATE_q\ & ( 
-- !\GenClks|Mclk~q\ & ( (\TheParToI2s|State.FirstBitEmptyR~DUPLICATE_q\) # (\TheParToI2s|State.FirstBitEmptyL~DUPLICATE_q\) ) ) ) # ( !\TheParToI2s|BclkDlyd~DUPLICATE_q\ & ( !\GenClks|Mclk~q\ & ( (\TheParToI2s|BclkCtr\(1) & 
-- ((\TheParToI2s|State.FirstBitEmptyR~DUPLICATE_q\) # (\TheParToI2s|State.FirstBitEmptyL~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001100010011010111110101111100010011000100110001001100010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_State.FirstBitEmptyL~DUPLICATE_q\,
	datab => \TheParToI2s|ALT_INV_BclkCtr\(1),
	datac => \TheParToI2s|ALT_INV_State.FirstBitEmptyR~DUPLICATE_q\,
	datae => \TheParToI2s|ALT_INV_BclkDlyd~DUPLICATE_q\,
	dataf => \GenClks|ALT_INV_Mclk~q\,
	combout => \TheParToI2s|Selector8~0_combout\);

-- Location: LABCELL_X46_Y2_N54
\TheParToI2s|Selector8~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector8~1_combout\ = ( \TheParToI2s|BclkCtr\(1) & ( \TheParToI2s|NextBclkCtr~0_combout\ & ( ((\TheParToI2s|Selector10~0_combout\ & ((!\TheParToI2s|NextBclkCtr~1_combout\) # (\TheParToI2s|BclkCtr\(0))))) # (\TheParToI2s|Selector8~0_combout\) 
-- ) ) ) # ( !\TheParToI2s|BclkCtr\(1) & ( \TheParToI2s|NextBclkCtr~0_combout\ & ( ((!\TheParToI2s|BclkCtr\(0) & (\TheParToI2s|Selector10~0_combout\ & \TheParToI2s|NextBclkCtr~1_combout\))) # (\TheParToI2s|Selector8~0_combout\) ) ) ) # ( 
-- \TheParToI2s|BclkCtr\(1) & ( !\TheParToI2s|NextBclkCtr~0_combout\ ) ) # ( !\TheParToI2s|BclkCtr\(1) & ( !\TheParToI2s|NextBclkCtr~0_combout\ & ( ((!\TheParToI2s|BclkCtr\(0) & (\TheParToI2s|Selector10~0_combout\ & \TheParToI2s|NextBclkCtr~1_combout\))) # 
-- (\TheParToI2s|Selector8~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001011111111111111111111111100000010111111110011000111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_BclkCtr\(0),
	datab => \TheParToI2s|ALT_INV_Selector10~0_combout\,
	datac => \TheParToI2s|ALT_INV_NextBclkCtr~1_combout\,
	datad => \TheParToI2s|ALT_INV_Selector8~0_combout\,
	datae => \TheParToI2s|ALT_INV_BclkCtr\(1),
	dataf => \TheParToI2s|ALT_INV_NextBclkCtr~0_combout\,
	combout => \TheParToI2s|Selector8~1_combout\);

-- Location: FF_X46_Y2_N55
\TheParToI2s|BclkCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2s|Selector8~1_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|BclkCtr\(1));

-- Location: FF_X47_Y3_N59
\TheTxFsk|TheDDS|PhaseAddr[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[19]~1_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(19));

-- Location: LABCELL_X46_Y3_N45
\TheTxFsk|TheDDS|RegsLFSR[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|RegsLFSR[0]~0_combout\ = !\TheTxFsk|TheDDS|NextRegsLFSR\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheTxFsk|TheDDS|ALT_INV_NextRegsLFSR\(0),
	combout => \TheTxFsk|TheDDS|RegsLFSR[0]~0_combout\);

-- Location: FF_X46_Y3_N46
\TheTxFsk|TheDDS|RegsLFSR[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|RegsLFSR[0]~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(0));

-- Location: FF_X46_Y3_N25
\TheTxFsk|TheDDS|RegsLFSR[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(0),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(1));

-- Location: FF_X46_Y3_N32
\TheTxFsk|TheDDS|RegsLFSR[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(1),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(2));

-- Location: FF_X46_Y3_N38
\TheTxFsk|TheDDS|RegsLFSR[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(2),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR[3]~DUPLICATE_q\);

-- Location: FF_X46_Y3_N56
\TheTxFsk|TheDDS|RegsLFSR[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR[3]~DUPLICATE_q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(4));

-- Location: LABCELL_X46_Y3_N57
\TheTxFsk|TheDDS|RegsLFSR[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|RegsLFSR[5]~feeder_combout\ = ( \TheTxFsk|TheDDS|RegsLFSR\(4) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(4),
	combout => \TheTxFsk|TheDDS|RegsLFSR[5]~feeder_combout\);

-- Location: FF_X46_Y3_N59
\TheTxFsk|TheDDS|RegsLFSR[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|RegsLFSR[5]~feeder_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(5));

-- Location: FF_X46_Y3_N22
\TheTxFsk|TheDDS|RegsLFSR[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(5),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(6));

-- Location: FF_X46_Y3_N10
\TheTxFsk|TheDDS|RegsLFSR[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(6),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(7));

-- Location: FF_X46_Y3_N43
\TheTxFsk|TheDDS|RegsLFSR[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(7),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(8));

-- Location: FF_X50_Y3_N25
\TheTxFsk|TheDDS|RegsLFSR[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(8),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(9));

-- Location: FF_X50_Y3_N20
\TheTxFsk|TheDDS|RegsLFSR[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(9),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(10));

-- Location: FF_X50_Y3_N23
\TheTxFsk|TheDDS|RegsLFSR[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(10),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(11));

-- Location: FF_X50_Y3_N50
\TheTxFsk|TheDDS|RegsLFSR[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(11),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(12));

-- Location: FF_X50_Y3_N53
\TheTxFsk|TheDDS|RegsLFSR[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(12),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(13));

-- Location: FF_X50_Y3_N44
\TheTxFsk|TheDDS|RegsLFSR[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(13),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(14));

-- Location: FF_X50_Y3_N47
\TheTxFsk|TheDDS|RegsLFSR[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(14),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(15));

-- Location: FF_X50_Y3_N56
\TheTxFsk|TheDDS|RegsLFSR[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(15),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(16));

-- Location: FF_X50_Y3_N35
\TheTxFsk|TheDDS|RegsLFSR[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(16),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(17));

-- Location: LABCELL_X50_Y3_N27
\TheTxFsk|TheDDS|RegsLFSR[18]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|RegsLFSR[18]~feeder_combout\ = \TheTxFsk|TheDDS|RegsLFSR\(17)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(17),
	combout => \TheTxFsk|TheDDS|RegsLFSR[18]~feeder_combout\);

-- Location: FF_X50_Y3_N29
\TheTxFsk|TheDDS|RegsLFSR[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|RegsLFSR[18]~feeder_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(18));

-- Location: FF_X50_Y3_N2
\TheTxFsk|TheDDS|RegsLFSR[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(18),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(19));

-- Location: FF_X50_Y3_N38
\TheTxFsk|TheDDS|RegsLFSR[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(19),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(20));

-- Location: FF_X50_Y3_N32
\TheTxFsk|TheDDS|RegsLFSR[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(20),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(21));

-- Location: FF_X50_Y3_N14
\TheTxFsk|TheDDS|RegsLFSR[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(21),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(22));

-- Location: FF_X50_Y3_N17
\TheTxFsk|TheDDS|RegsLFSR[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(22),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(23));

-- Location: FF_X50_Y3_N59
\TheTxFsk|TheDDS|RegsLFSR[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(23),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(24));

-- Location: LABCELL_X50_Y3_N39
\TheTxFsk|TheDDS|RegsLFSR[25]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|RegsLFSR[25]~feeder_combout\ = \TheTxFsk|TheDDS|RegsLFSR\(24)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(24),
	combout => \TheTxFsk|TheDDS|RegsLFSR[25]~feeder_combout\);

-- Location: FF_X50_Y3_N40
\TheTxFsk|TheDDS|RegsLFSR[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|RegsLFSR[25]~feeder_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(25));

-- Location: LABCELL_X50_Y3_N36
\TheTxFsk|TheDDS|RegsLFSR[26]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|RegsLFSR[26]~feeder_combout\ = ( \TheTxFsk|TheDDS|RegsLFSR\(25) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(25),
	combout => \TheTxFsk|TheDDS|RegsLFSR[26]~feeder_combout\);

-- Location: FF_X50_Y3_N37
\TheTxFsk|TheDDS|RegsLFSR[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|RegsLFSR[26]~feeder_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(26));

-- Location: FF_X50_Y3_N41
\TheTxFsk|TheDDS|RegsLFSR[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(26),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(27));

-- Location: FF_X50_Y3_N8
\TheTxFsk|TheDDS|RegsLFSR[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(27),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(28));

-- Location: FF_X50_Y3_N4
\TheTxFsk|TheDDS|RegsLFSR[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(28),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(29));

-- Location: LABCELL_X46_Y3_N48
\TheTxFsk|TheDDS|NextRegsLFSR[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NextRegsLFSR\(0) = ( \TheTxFsk|TheDDS|RegsLFSR\(0) & ( !\TheTxFsk|TheDDS|RegsLFSR[3]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|RegsLFSR\(5) $ (!\TheTxFsk|TheDDS|RegsLFSR\(29))) ) ) # ( !\TheTxFsk|TheDDS|RegsLFSR\(0) & ( 
-- !\TheTxFsk|TheDDS|RegsLFSR[3]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|RegsLFSR\(5) $ (\TheTxFsk|TheDDS|RegsLFSR\(29))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100110010110100101101001011010010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR[3]~DUPLICATE_q\,
	datab => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(5),
	datac => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(29),
	dataf => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(0),
	combout => \TheTxFsk|TheDDS|NextRegsLFSR\(0));

-- Location: FF_X46_Y3_N50
\TheTxFsk|TheDDS|RandomValue[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NextRegsLFSR\(0),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RandomValue\(0));

-- Location: LABCELL_X46_Y3_N3
\TheTxFsk|TheDDS|RandomValue[-1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|RandomValue[-1]~0_combout\ = ( !\TheTxFsk|TheDDS|RegsLFSR\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(0),
	combout => \TheTxFsk|TheDDS|RandomValue[-1]~0_combout\);

-- Location: FF_X46_Y3_N4
\TheTxFsk|TheDDS|RandomValue[-1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|RandomValue[-1]~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RandomValue[-1]~q\);

-- Location: LABCELL_X46_Y3_N33
\TheTxFsk|TheDDS|RandomValue[-2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|RandomValue[-2]~1_combout\ = ( !\TheTxFsk|TheDDS|RegsLFSR\(1) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(1),
	combout => \TheTxFsk|TheDDS|RandomValue[-2]~1_combout\);

-- Location: FF_X46_Y3_N34
\TheTxFsk|TheDDS|RandomValue[-2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|RandomValue[-2]~1_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RandomValue[-2]~q\);

-- Location: LABCELL_X46_Y3_N39
\TheTxFsk|TheDDS|RandomValue[-3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|RandomValue[-3]~2_combout\ = !\TheTxFsk|TheDDS|RegsLFSR\(2)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100110011001100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(2),
	combout => \TheTxFsk|TheDDS|RandomValue[-3]~2_combout\);

-- Location: FF_X46_Y3_N40
\TheTxFsk|TheDDS|RandomValue[-3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|RandomValue[-3]~2_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RandomValue[-3]~q\);

-- Location: FF_X46_Y3_N37
\TheTxFsk|TheDDS|RegsLFSR[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|RegsLFSR\(2),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RegsLFSR\(3));

-- Location: LABCELL_X46_Y3_N51
\TheTxFsk|TheDDS|RandomValue[-4]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|RandomValue[-4]~3_combout\ = ( !\TheTxFsk|TheDDS|RegsLFSR\(3) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(3),
	combout => \TheTxFsk|TheDDS|RandomValue[-4]~3_combout\);

-- Location: FF_X46_Y3_N52
\TheTxFsk|TheDDS|RandomValue[-4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|RandomValue[-4]~3_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RandomValue[-4]~q\);

-- Location: LABCELL_X46_Y3_N18
\TheTxFsk|TheDDS|RandomValue[-5]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|RandomValue[-5]~4_combout\ = ( !\TheTxFsk|TheDDS|RegsLFSR\(4) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(4),
	combout => \TheTxFsk|TheDDS|RandomValue[-5]~4_combout\);

-- Location: FF_X46_Y3_N19
\TheTxFsk|TheDDS|RandomValue[-5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|RandomValue[-5]~4_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RandomValue[-5]~q\);

-- Location: LABCELL_X46_Y3_N12
\TheTxFsk|TheDDS|RandomValue[-6]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|RandomValue[-6]~5_combout\ = ( !\TheTxFsk|TheDDS|RegsLFSR\(5) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(5),
	combout => \TheTxFsk|TheDDS|RandomValue[-6]~5_combout\);

-- Location: FF_X46_Y3_N13
\TheTxFsk|TheDDS|RandomValue[-6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|RandomValue[-6]~5_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RandomValue[-6]~q\);

-- Location: LABCELL_X46_Y3_N6
\TheTxFsk|TheDDS|RandomValue[-7]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|RandomValue[-7]~6_combout\ = ( !\TheTxFsk|TheDDS|RegsLFSR\(6) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(6),
	combout => \TheTxFsk|TheDDS|RandomValue[-7]~6_combout\);

-- Location: FF_X46_Y3_N7
\TheTxFsk|TheDDS|RandomValue[-7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|RandomValue[-7]~6_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RandomValue[-7]~q\);

-- Location: LABCELL_X46_Y3_N27
\TheTxFsk|TheDDS|RandomValue[-8]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|RandomValue[-8]~7_combout\ = ( !\TheTxFsk|TheDDS|RegsLFSR\(7) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \TheTxFsk|TheDDS|ALT_INV_RegsLFSR\(7),
	combout => \TheTxFsk|TheDDS|RandomValue[-8]~7_combout\);

-- Location: FF_X46_Y3_N28
\TheTxFsk|TheDDS|RandomValue[-8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|RandomValue[-8]~7_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|RandomValue[-8]~q\);

-- Location: MLABCELL_X47_Y3_N0
\TheTxFsk|TheDDS|NxtPhaseAddr[0]~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[0]~77_sumout\ = SUM(( !\TheTxFsk|TheDDS|RandomValue[-8]~q\ $ (!\TheTxFsk|TheDDS|PhaseAddr\(0) $ (\TheChannelSelSync|Metastable\(1))) ) + ( !VCC ) + ( !VCC ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[0]~78\ = CARRY(( !\TheTxFsk|TheDDS|RandomValue[-8]~q\ $ (!\TheTxFsk|TheDDS|PhaseAddr\(0) $ (\TheChannelSelSync|Metastable\(1))) ) + ( !VCC ) + ( !VCC ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[0]~79\ = SHARE((!\TheTxFsk|TheDDS|RandomValue[-8]~q\ & (\TheTxFsk|TheDDS|PhaseAddr\(0) & \TheChannelSelSync|Metastable\(1))) # (\TheTxFsk|TheDDS|RandomValue[-8]~q\ & ((\TheChannelSelSync|Metastable\(1)) # 
-- (\TheTxFsk|TheDDS|PhaseAddr\(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000110011111100000000000000000011110011000011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_RandomValue[-8]~q\,
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(0),
	datad => \TheChannelSelSync|ALT_INV_Metastable\(1),
	cin => GND,
	sharein => GND,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[0]~77_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[0]~78\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[0]~79\);

-- Location: FF_X47_Y3_N2
\TheTxFsk|TheDDS|PhaseAddr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[0]~77_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(0));

-- Location: MLABCELL_X47_Y3_N3
\TheTxFsk|TheDDS|NxtPhaseAddr[1]~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[1]~73_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr\(1) $ (!\TheTxFsk|TheDDS|RandomValue[-7]~q\) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[0]~79\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[0]~78\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[1]~74\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr\(1) $ (!\TheTxFsk|TheDDS|RandomValue[-7]~q\) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[0]~79\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[0]~78\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[1]~75\ = SHARE((\TheTxFsk|TheDDS|PhaseAddr\(1) & \TheTxFsk|TheDDS|RandomValue[-7]~q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000101010100000000000000000101010110101010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(1),
	datad => \TheTxFsk|TheDDS|ALT_INV_RandomValue[-7]~q\,
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[0]~78\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[0]~79\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[1]~73_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[1]~74\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[1]~75\);

-- Location: FF_X47_Y3_N5
\TheTxFsk|TheDDS|PhaseAddr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[1]~73_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(1));

-- Location: MLABCELL_X47_Y3_N6
\TheTxFsk|TheDDS|NxtPhaseAddr[2]~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[2]~69_sumout\ = SUM(( !\TheChannelSelSync|Metastable\(1) $ (!\TheTxFsk|TheDDS|PhaseAddr\(2) $ (\TheTxFsk|TheDDS|RandomValue[-6]~q\)) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[1]~75\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[1]~74\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[2]~70\ = CARRY(( !\TheChannelSelSync|Metastable\(1) $ (!\TheTxFsk|TheDDS|PhaseAddr\(2) $ (\TheTxFsk|TheDDS|RandomValue[-6]~q\)) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[1]~75\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[1]~74\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[2]~71\ = SHARE((!\TheChannelSelSync|Metastable\(1) & (\TheTxFsk|TheDDS|PhaseAddr\(2) & \TheTxFsk|TheDDS|RandomValue[-6]~q\)) # (\TheChannelSelSync|Metastable\(1) & ((\TheTxFsk|TheDDS|RandomValue[-6]~q\) # 
-- (\TheTxFsk|TheDDS|PhaseAddr\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010101111100000000000000000101101010100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheChannelSelSync|ALT_INV_Metastable\(1),
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(2),
	datad => \TheTxFsk|TheDDS|ALT_INV_RandomValue[-6]~q\,
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[1]~74\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[1]~75\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[2]~69_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[2]~70\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[2]~71\);

-- Location: FF_X47_Y3_N7
\TheTxFsk|TheDDS|PhaseAddr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[2]~69_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(2));

-- Location: MLABCELL_X47_Y3_N9
\TheTxFsk|TheDDS|NxtPhaseAddr[3]~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[3]~65_sumout\ = SUM(( !\TheTxFsk|TheDDS|RandomValue[-5]~q\ $ (!\TheTxFsk|TheDDS|PhaseAddr\(3) $ (((\TheChannelSelSync|Metastable\(1) & \TheTxDataSync|Metastable\(1))))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[2]~71\ ) + ( 
-- \TheTxFsk|TheDDS|NxtPhaseAddr[2]~70\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[3]~66\ = CARRY(( !\TheTxFsk|TheDDS|RandomValue[-5]~q\ $ (!\TheTxFsk|TheDDS|PhaseAddr\(3) $ (((\TheChannelSelSync|Metastable\(1) & \TheTxDataSync|Metastable\(1))))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[2]~71\ ) + ( 
-- \TheTxFsk|TheDDS|NxtPhaseAddr[2]~70\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[3]~67\ = SHARE((!\TheTxFsk|TheDDS|RandomValue[-5]~q\ & (\TheChannelSelSync|Metastable\(1) & (\TheTxFsk|TheDDS|PhaseAddr\(3) & \TheTxDataSync|Metastable\(1)))) # (\TheTxFsk|TheDDS|RandomValue[-5]~q\ & 
-- (((\TheChannelSelSync|Metastable\(1) & \TheTxDataSync|Metastable\(1))) # (\TheTxFsk|TheDDS|PhaseAddr\(3)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000110001011100000000000000000011110001101001",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheChannelSelSync|ALT_INV_Metastable\(1),
	datab => \TheTxFsk|TheDDS|ALT_INV_RandomValue[-5]~q\,
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(3),
	datad => \TheTxDataSync|ALT_INV_Metastable\(1),
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[2]~70\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[2]~71\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[3]~65_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[3]~66\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[3]~67\);

-- Location: FF_X47_Y3_N11
\TheTxFsk|TheDDS|PhaseAddr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[3]~65_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(3));

-- Location: MLABCELL_X47_Y3_N12
\TheTxFsk|TheDDS|NxtPhaseAddr[4]~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[4]~61_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr\(4) $ (!\TheTxFsk|TheDDS|RandomValue[-4]~q\) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[3]~67\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[3]~66\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[4]~62\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr\(4) $ (!\TheTxFsk|TheDDS|RandomValue[-4]~q\) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[3]~67\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[3]~66\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[4]~63\ = SHARE((\TheTxFsk|TheDDS|PhaseAddr\(4) & \TheTxFsk|TheDDS|RandomValue[-4]~q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000110000001100000000000000000011110000111100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(4),
	datac => \TheTxFsk|TheDDS|ALT_INV_RandomValue[-4]~q\,
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[3]~66\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[3]~67\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[4]~61_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[4]~62\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[4]~63\);

-- Location: FF_X47_Y3_N14
\TheTxFsk|TheDDS|PhaseAddr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[4]~61_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(4));

-- Location: MLABCELL_X47_Y3_N15
\TheTxFsk|TheDDS|NxtPhaseAddr[5]~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[5]~57_sumout\ = SUM(( !\TheTxFsk|TheDDS|RandomValue[-3]~q\ $ (!\TheTxFsk|TheDDS|PhaseAddr\(5)) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[4]~63\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[4]~62\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[5]~58\ = CARRY(( !\TheTxFsk|TheDDS|RandomValue[-3]~q\ $ (!\TheTxFsk|TheDDS|PhaseAddr\(5)) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[4]~63\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[4]~62\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[5]~59\ = SHARE((\TheTxFsk|TheDDS|RandomValue[-3]~q\ & \TheTxFsk|TheDDS|PhaseAddr\(5)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010100000000000000000101101001011010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheTxFsk|TheDDS|ALT_INV_RandomValue[-3]~q\,
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(5),
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[4]~62\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[4]~63\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[5]~57_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[5]~58\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[5]~59\);

-- Location: FF_X47_Y3_N17
\TheTxFsk|TheDDS|PhaseAddr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[5]~57_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(5));

-- Location: MLABCELL_X47_Y3_N18
\TheTxFsk|TheDDS|NxtPhaseAddr[6]~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[6]~53_sumout\ = SUM(( !\TheChannelSelSync|Metastable\(1) $ (!\TheTxFsk|TheDDS|PhaseAddr\(6) $ (\TheTxFsk|TheDDS|RandomValue[-2]~q\)) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[5]~59\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[5]~58\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[6]~54\ = CARRY(( !\TheChannelSelSync|Metastable\(1) $ (!\TheTxFsk|TheDDS|PhaseAddr\(6) $ (\TheTxFsk|TheDDS|RandomValue[-2]~q\)) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[5]~59\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[5]~58\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[6]~55\ = SHARE((!\TheChannelSelSync|Metastable\(1) & (\TheTxFsk|TheDDS|PhaseAddr\(6) & \TheTxFsk|TheDDS|RandomValue[-2]~q\)) # (\TheChannelSelSync|Metastable\(1) & ((\TheTxFsk|TheDDS|RandomValue[-2]~q\) # 
-- (\TheTxFsk|TheDDS|PhaseAddr\(6)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010101111100000000000000000101101010100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheChannelSelSync|ALT_INV_Metastable\(1),
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(6),
	datad => \TheTxFsk|TheDDS|ALT_INV_RandomValue[-2]~q\,
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[5]~58\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[5]~59\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[6]~53_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[6]~54\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[6]~55\);

-- Location: FF_X47_Y3_N20
\TheTxFsk|TheDDS|PhaseAddr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[6]~53_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(6));

-- Location: MLABCELL_X47_Y3_N21
\TheTxFsk|TheDDS|NxtPhaseAddr[7]~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[7]~49_sumout\ = SUM(( !\TheTxFsk|TheDDS|RandomValue[-1]~q\ $ (!\TheTxFsk|TheDDS|PhaseAddr\(7) $ (((\TheChannelSelSync|Metastable\(1) & !\TheTxDataSync|Metastable\(1))))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[6]~55\ ) + ( 
-- \TheTxFsk|TheDDS|NxtPhaseAddr[6]~54\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[7]~50\ = CARRY(( !\TheTxFsk|TheDDS|RandomValue[-1]~q\ $ (!\TheTxFsk|TheDDS|PhaseAddr\(7) $ (((\TheChannelSelSync|Metastable\(1) & !\TheTxDataSync|Metastable\(1))))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[6]~55\ ) + ( 
-- \TheTxFsk|TheDDS|NxtPhaseAddr[6]~54\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[7]~51\ = SHARE((!\TheTxFsk|TheDDS|RandomValue[-1]~q\ & (\TheChannelSelSync|Metastable\(1) & (\TheTxFsk|TheDDS|PhaseAddr\(7) & !\TheTxDataSync|Metastable\(1)))) # (\TheTxFsk|TheDDS|RandomValue[-1]~q\ & 
-- (((\TheChannelSelSync|Metastable\(1) & !\TheTxDataSync|Metastable\(1))) # (\TheTxFsk|TheDDS|PhaseAddr\(7)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000101110000001100000000000000000110100100111100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheChannelSelSync|ALT_INV_Metastable\(1),
	datab => \TheTxFsk|TheDDS|ALT_INV_RandomValue[-1]~q\,
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(7),
	datad => \TheTxDataSync|ALT_INV_Metastable\(1),
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[6]~54\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[6]~55\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[7]~49_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[7]~50\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[7]~51\);

-- Location: FF_X47_Y3_N22
\TheTxFsk|TheDDS|PhaseAddr[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[7]~49_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(7));

-- Location: MLABCELL_X47_Y3_N24
\TheTxFsk|TheDDS|NxtPhaseAddr[8]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[8]~9_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr\(8) $ (!\TheTxFsk|TheDDS|RandomValue\(0) $ (((\TheTxDataSync|Metastable\(1) & \TheChannelSelSync|Metastable\(1))))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[7]~51\ ) + ( 
-- \TheTxFsk|TheDDS|NxtPhaseAddr[7]~50\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[8]~10\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr\(8) $ (!\TheTxFsk|TheDDS|RandomValue\(0) $ (((\TheTxDataSync|Metastable\(1) & \TheChannelSelSync|Metastable\(1))))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[7]~51\ ) + ( 
-- \TheTxFsk|TheDDS|NxtPhaseAddr[7]~50\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[8]~11\ = SHARE((!\TheTxFsk|TheDDS|PhaseAddr\(8) & (\TheTxDataSync|Metastable\(1) & (\TheChannelSelSync|Metastable\(1) & \TheTxFsk|TheDDS|RandomValue\(0)))) # (\TheTxFsk|TheDDS|PhaseAddr\(8) & (((\TheTxDataSync|Metastable\(1) 
-- & \TheChannelSelSync|Metastable\(1))) # (\TheTxFsk|TheDDS|RandomValue\(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000010001111100000000000000000001111011100001",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheTxDataSync|ALT_INV_Metastable\(1),
	datab => \TheChannelSelSync|ALT_INV_Metastable\(1),
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(8),
	datad => \TheTxFsk|TheDDS|ALT_INV_RandomValue\(0),
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[7]~50\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[7]~51\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[8]~9_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[8]~10\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[8]~11\);

-- Location: FF_X47_Y3_N26
\TheTxFsk|TheDDS|PhaseAddr[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[8]~9_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(8));

-- Location: MLABCELL_X47_Y3_N27
\TheTxFsk|TheDDS|NxtPhaseAddr[9]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[9]~13_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr\(9) $ (((!\TheTxDataSync|Metastable\(1)) # (!\TheChannelSelSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[8]~11\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[8]~10\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[9]~14\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr\(9) $ (((!\TheTxDataSync|Metastable\(1)) # (!\TheChannelSelSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[8]~11\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[8]~10\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[9]~15\ = SHARE((\TheTxDataSync|Metastable\(1) & (\TheChannelSelSync|Metastable\(1) & \TheTxFsk|TheDDS|PhaseAddr\(9))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000001000100000000000000000001000111101110",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheTxDataSync|ALT_INV_Metastable\(1),
	datab => \TheChannelSelSync|ALT_INV_Metastable\(1),
	datad => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(9),
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[8]~10\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[8]~11\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[9]~13_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[9]~14\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[9]~15\);

-- Location: FF_X47_Y3_N29
\TheTxFsk|TheDDS|PhaseAddr[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[9]~13_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(9));

-- Location: MLABCELL_X47_Y3_N30
\TheTxFsk|TheDDS|NxtPhaseAddr[10]~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[10]~17_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr\(10) $ (((!\TheChannelSelSync|Metastable\(1)) # (!\TheTxDataSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[9]~15\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[9]~14\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[10]~18\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr\(10) $ (((!\TheChannelSelSync|Metastable\(1)) # (!\TheTxDataSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[9]~15\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[9]~14\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[10]~19\ = SHARE((\TheTxFsk|TheDDS|PhaseAddr\(10) & (\TheChannelSelSync|Metastable\(1) & \TheTxDataSync|Metastable\(1))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000001100000000000000000011001100111100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(10),
	datac => \TheChannelSelSync|ALT_INV_Metastable\(1),
	datad => \TheTxDataSync|ALT_INV_Metastable\(1),
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[9]~14\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[9]~15\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[10]~17_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[10]~18\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[10]~19\);

-- Location: FF_X47_Y3_N32
\TheTxFsk|TheDDS|PhaseAddr[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[10]~17_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(10));

-- Location: MLABCELL_X47_Y3_N33
\TheTxFsk|TheDDS|NxtPhaseAddr[11]~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[11]~21_sumout\ = SUM(( !\TheChannelSelSync|Metastable\(1) $ (!\TheTxFsk|TheDDS|PhaseAddr\(11)) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[10]~19\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[10]~18\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[11]~22\ = CARRY(( !\TheChannelSelSync|Metastable\(1) $ (!\TheTxFsk|TheDDS|PhaseAddr\(11)) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[10]~19\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[10]~18\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[11]~23\ = SHARE((\TheChannelSelSync|Metastable\(1) & \TheTxFsk|TheDDS|PhaseAddr\(11)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010100000000000000000101101001011010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheChannelSelSync|ALT_INV_Metastable\(1),
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(11),
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[10]~18\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[10]~19\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[11]~21_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[11]~22\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[11]~23\);

-- Location: FF_X47_Y3_N35
\TheTxFsk|TheDDS|PhaseAddr[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[11]~21_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(11));

-- Location: MLABCELL_X47_Y3_N36
\TheTxFsk|TheDDS|NxtPhaseAddr[12]~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[12]~25_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr\(12) $ (((\TheChannelSelSync|Metastable\(1) & \TheTxDataSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[11]~23\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[11]~22\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[12]~26\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr\(12) $ (((\TheChannelSelSync|Metastable\(1) & \TheTxDataSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[11]~23\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[11]~22\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[12]~27\ = SHARE((\TheTxFsk|TheDDS|PhaseAddr\(12) & ((!\TheChannelSelSync|Metastable\(1)) # (!\TheTxDataSync|Metastable\(1)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000101000000000000000001111000010100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheChannelSelSync|ALT_INV_Metastable\(1),
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(12),
	datad => \TheTxDataSync|ALT_INV_Metastable\(1),
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[11]~22\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[11]~23\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[12]~25_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[12]~26\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[12]~27\);

-- Location: FF_X47_Y3_N44
\TheTxFsk|TheDDS|PhaseAddr[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|NxtPhaseAddr[12]~25_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(12));

-- Location: MLABCELL_X47_Y3_N39
\TheTxFsk|TheDDS|NxtPhaseAddr[13]~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[13]~29_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr\(13) $ (((\TheChannelSelSync|Metastable\(1) & !\TheTxDataSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[12]~27\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[12]~26\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[13]~30\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr\(13) $ (((\TheChannelSelSync|Metastable\(1) & !\TheTxDataSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[12]~27\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[12]~26\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[13]~31\ = SHARE((\TheTxFsk|TheDDS|PhaseAddr\(13) & ((!\TheChannelSelSync|Metastable\(1)) # (\TheTxDataSync|Metastable\(1)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010100000111100000000000000001010010111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheChannelSelSync|ALT_INV_Metastable\(1),
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(13),
	datad => \TheTxDataSync|ALT_INV_Metastable\(1),
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[12]~26\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[12]~27\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[13]~29_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[13]~30\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[13]~31\);

-- Location: FF_X47_Y3_N41
\TheTxFsk|TheDDS|PhaseAddr[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[13]~29_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(13));

-- Location: MLABCELL_X47_Y3_N42
\TheTxFsk|TheDDS|NxtPhaseAddr[14]~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[14]~33_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr\(14) $ (((!\TheChannelSelSync|Metastable\(1) & \TheTxDataSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[13]~31\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[13]~30\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[14]~34\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr\(14) $ (((!\TheChannelSelSync|Metastable\(1) & \TheTxDataSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[13]~31\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[13]~30\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[14]~35\ = SHARE((\TheTxFsk|TheDDS|PhaseAddr\(14) & ((!\TheTxDataSync|Metastable\(1)) # (\TheChannelSelSync|Metastable\(1)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100010011000100000000000000001100011011000110",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheChannelSelSync|ALT_INV_Metastable\(1),
	datab => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(14),
	datac => \TheTxDataSync|ALT_INV_Metastable\(1),
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[13]~30\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[13]~31\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[14]~33_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[14]~34\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[14]~35\);

-- Location: FF_X47_Y3_N38
\TheTxFsk|TheDDS|PhaseAddr[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheTxFsk|TheDDS|NxtPhaseAddr[14]~33_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(14));

-- Location: MLABCELL_X47_Y3_N45
\TheTxFsk|TheDDS|NxtPhaseAddr[15]~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[15]~37_sumout\ = SUM(( !\TheChannelSelSync|Metastable\(1) $ (\TheTxFsk|TheDDS|PhaseAddr\(15)) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[14]~35\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[14]~34\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[15]~38\ = CARRY(( !\TheChannelSelSync|Metastable\(1) $ (\TheTxFsk|TheDDS|PhaseAddr\(15)) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[14]~35\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[14]~34\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[15]~39\ = SHARE((!\TheChannelSelSync|Metastable\(1) & \TheTxFsk|TheDDS|PhaseAddr\(15)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001010101000000000000000001010101001010101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheChannelSelSync|ALT_INV_Metastable\(1),
	datad => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(15),
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[14]~34\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[14]~35\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[15]~37_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[15]~38\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[15]~39\);

-- Location: FF_X47_Y3_N47
\TheTxFsk|TheDDS|PhaseAddr[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[15]~37_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(15));

-- Location: MLABCELL_X47_Y3_N48
\TheTxFsk|TheDDS|NxtPhaseAddr[16]~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[16]~41_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr\(16) $ (((!\TheChannelSelSync|Metastable\(1)) # (!\TheTxDataSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[15]~39\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[15]~38\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[16]~42\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr\(16) $ (((!\TheChannelSelSync|Metastable\(1)) # (!\TheTxDataSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[15]~39\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[15]~38\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[16]~43\ = SHARE((\TheChannelSelSync|Metastable\(1) & (\TheTxFsk|TheDDS|PhaseAddr\(16) & \TheTxDataSync|Metastable\(1))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000010100000000000000000000111101011010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheChannelSelSync|ALT_INV_Metastable\(1),
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(16),
	datad => \TheTxDataSync|ALT_INV_Metastable\(1),
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[15]~38\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[15]~39\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[16]~41_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[16]~42\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[16]~43\);

-- Location: FF_X47_Y3_N50
\TheTxFsk|TheDDS|PhaseAddr[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[16]~41_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(16));

-- Location: MLABCELL_X47_Y3_N51
\TheTxFsk|TheDDS|NxtPhaseAddr[17]~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[17]~45_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr\(17) $ (((!\TheChannelSelSync|Metastable\(1) & \TheTxDataSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[16]~43\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[16]~42\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[17]~46\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr\(17) $ (((!\TheChannelSelSync|Metastable\(1) & \TheTxDataSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[16]~43\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[16]~42\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[17]~47\ = SHARE((\TheTxFsk|TheDDS|PhaseAddr\(17) & ((!\TheTxDataSync|Metastable\(1)) # (\TheChannelSelSync|Metastable\(1)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000010100000000000000001111000001011010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheChannelSelSync|ALT_INV_Metastable\(1),
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(17),
	datad => \TheTxDataSync|ALT_INV_Metastable\(1),
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[16]~42\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[16]~43\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[17]~45_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[17]~46\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[17]~47\);

-- Location: FF_X47_Y3_N53
\TheTxFsk|TheDDS|PhaseAddr[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[17]~45_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(17));

-- Location: MLABCELL_X47_Y3_N54
\TheTxFsk|TheDDS|NxtPhaseAddr[18]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr\(18) $ (((!\TheChannelSelSync|Metastable\(1) & !\TheTxDataSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[17]~47\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[17]~46\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[18]~6\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr\(18) $ (((!\TheChannelSelSync|Metastable\(1) & !\TheTxDataSync|Metastable\(1)))) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[17]~47\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[17]~46\ ))
-- \TheTxFsk|TheDDS|NxtPhaseAddr[18]~7\ = SHARE((\TheTxFsk|TheDDS|PhaseAddr\(18) & ((\TheTxDataSync|Metastable\(1)) # (\TheChannelSelSync|Metastable\(1)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010101010100000000000000000101101010101010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(18),
	datac => \TheChannelSelSync|ALT_INV_Metastable\(1),
	datad => \TheTxDataSync|ALT_INV_Metastable\(1),
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[17]~46\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[17]~47\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\,
	cout => \TheTxFsk|TheDDS|NxtPhaseAddr[18]~6\,
	shareout => \TheTxFsk|TheDDS|NxtPhaseAddr[18]~7\);

-- Location: FF_X47_Y3_N56
\TheTxFsk|TheDDS|PhaseAddr[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr\(18));

-- Location: MLABCELL_X47_Y3_N57
\TheTxFsk|TheDDS|NxtPhaseAddr[19]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtPhaseAddr[19]~1_sumout\ = SUM(( \TheTxFsk|TheDDS|PhaseAddr\(19) ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[18]~7\ ) + ( \TheTxFsk|TheDDS|NxtPhaseAddr[18]~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr\(19),
	cin => \TheTxFsk|TheDDS|NxtPhaseAddr[18]~6\,
	sharein => \TheTxFsk|TheDDS|NxtPhaseAddr[18]~7\,
	sumout => \TheTxFsk|TheDDS|NxtPhaseAddr[19]~1_sumout\);

-- Location: FF_X47_Y3_N58
\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtPhaseAddr[19]~1_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	ena => \PhaseStrobe~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\);

-- Location: LABCELL_X48_Y3_N6
\TheTxFsk|TheDDS|NxtAddress[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtAddress[0]~0_combout\ = ( \TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ & ( !\TheTxFsk|TheDDS|NxtPhaseAddr[8]~9_sumout\ ) ) # ( !\TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ & ( \TheTxFsk|TheDDS|NxtPhaseAddr[8]~9_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[8]~9_sumout\,
	dataf => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[18]~5_sumout\,
	combout => \TheTxFsk|TheDDS|NxtAddress[0]~0_combout\);

-- Location: FF_X48_Y3_N7
\TheTxFsk|TheDDS|Address[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtAddress[0]~0_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|Address\(0));

-- Location: LABCELL_X48_Y3_N39
\TheTxFsk|TheDDS|NxtAddress[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtAddress[1]~1_combout\ = ( !\TheTxFsk|TheDDS|NxtPhaseAddr[9]~13_sumout\ & ( \TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ ) ) # ( \TheTxFsk|TheDDS|NxtPhaseAddr[9]~13_sumout\ & ( !\TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[9]~13_sumout\,
	dataf => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[18]~5_sumout\,
	combout => \TheTxFsk|TheDDS|NxtAddress[1]~1_combout\);

-- Location: FF_X48_Y3_N40
\TheTxFsk|TheDDS|Address[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtAddress[1]~1_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|Address\(1));

-- Location: LABCELL_X48_Y3_N54
\TheTxFsk|TheDDS|NxtAddress[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtAddress[2]~2_combout\ = ( \TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ & ( !\TheTxFsk|TheDDS|NxtPhaseAddr[10]~17_sumout\ ) ) # ( !\TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ & ( \TheTxFsk|TheDDS|NxtPhaseAddr[10]~17_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[10]~17_sumout\,
	dataf => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[18]~5_sumout\,
	combout => \TheTxFsk|TheDDS|NxtAddress[2]~2_combout\);

-- Location: FF_X48_Y3_N55
\TheTxFsk|TheDDS|Address[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtAddress[2]~2_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|Address\(2));

-- Location: LABCELL_X48_Y3_N51
\TheTxFsk|TheDDS|NxtAddress[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtAddress[3]~3_combout\ = ( !\TheTxFsk|TheDDS|NxtPhaseAddr[11]~21_sumout\ & ( \TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ ) ) # ( \TheTxFsk|TheDDS|NxtPhaseAddr[11]~21_sumout\ & ( !\TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[11]~21_sumout\,
	dataf => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[18]~5_sumout\,
	combout => \TheTxFsk|TheDDS|NxtAddress[3]~3_combout\);

-- Location: FF_X48_Y3_N52
\TheTxFsk|TheDDS|Address[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtAddress[3]~3_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|Address\(3));

-- Location: LABCELL_X48_Y3_N42
\TheTxFsk|TheDDS|NxtAddress[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtAddress[4]~4_combout\ = ( \TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ & ( !\TheTxFsk|TheDDS|NxtPhaseAddr[12]~25_sumout\ ) ) # ( !\TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ & ( \TheTxFsk|TheDDS|NxtPhaseAddr[12]~25_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[12]~25_sumout\,
	dataf => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[18]~5_sumout\,
	combout => \TheTxFsk|TheDDS|NxtAddress[4]~4_combout\);

-- Location: FF_X48_Y3_N43
\TheTxFsk|TheDDS|Address[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtAddress[4]~4_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|Address\(4));

-- Location: LABCELL_X48_Y3_N15
\TheTxFsk|TheDDS|NxtAddress[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtAddress[5]~5_combout\ = ( \TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ & ( !\TheTxFsk|TheDDS|NxtPhaseAddr[13]~29_sumout\ ) ) # ( !\TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ & ( \TheTxFsk|TheDDS|NxtPhaseAddr[13]~29_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[13]~29_sumout\,
	dataf => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[18]~5_sumout\,
	combout => \TheTxFsk|TheDDS|NxtAddress[5]~5_combout\);

-- Location: FF_X48_Y3_N16
\TheTxFsk|TheDDS|Address[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtAddress[5]~5_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|Address\(5));

-- Location: LABCELL_X48_Y3_N0
\TheTxFsk|TheDDS|NxtAddress[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtAddress[6]~6_combout\ = ( !\TheTxFsk|TheDDS|NxtPhaseAddr[14]~33_sumout\ & ( \TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ ) ) # ( \TheTxFsk|TheDDS|NxtPhaseAddr[14]~33_sumout\ & ( !\TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[14]~33_sumout\,
	dataf => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[18]~5_sumout\,
	combout => \TheTxFsk|TheDDS|NxtAddress[6]~6_combout\);

-- Location: FF_X48_Y3_N1
\TheTxFsk|TheDDS|Address[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtAddress[6]~6_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|Address\(6));

-- Location: LABCELL_X48_Y3_N21
\TheTxFsk|TheDDS|NxtAddress[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtAddress[7]~7_combout\ = ( \TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ & ( !\TheTxFsk|TheDDS|NxtPhaseAddr[15]~37_sumout\ ) ) # ( !\TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ & ( \TheTxFsk|TheDDS|NxtPhaseAddr[15]~37_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[15]~37_sumout\,
	dataf => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[18]~5_sumout\,
	combout => \TheTxFsk|TheDDS|NxtAddress[7]~7_combout\);

-- Location: FF_X48_Y3_N22
\TheTxFsk|TheDDS|Address[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtAddress[7]~7_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|Address\(7));

-- Location: LABCELL_X48_Y3_N24
\TheTxFsk|TheDDS|NxtAddress[8]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtAddress[8]~8_combout\ = ( !\TheTxFsk|TheDDS|NxtPhaseAddr[16]~41_sumout\ & ( \TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ ) ) # ( \TheTxFsk|TheDDS|NxtPhaseAddr[16]~41_sumout\ & ( !\TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[16]~41_sumout\,
	dataf => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[18]~5_sumout\,
	combout => \TheTxFsk|TheDDS|NxtAddress[8]~8_combout\);

-- Location: FF_X48_Y3_N25
\TheTxFsk|TheDDS|Address[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtAddress[8]~8_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|Address\(8));

-- Location: LABCELL_X48_Y3_N33
\TheTxFsk|TheDDS|NxtAddress[9]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|NxtAddress[9]~9_combout\ = ( \TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ & ( !\TheTxFsk|TheDDS|NxtPhaseAddr[17]~45_sumout\ ) ) # ( !\TheTxFsk|TheDDS|NxtPhaseAddr[18]~5_sumout\ & ( \TheTxFsk|TheDDS|NxtPhaseAddr[17]~45_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[17]~45_sumout\,
	dataf => \TheTxFsk|TheDDS|ALT_INV_NxtPhaseAddr[18]~5_sumout\,
	combout => \TheTxFsk|TheDDS|NxtAddress[9]~9_combout\);

-- Location: FF_X48_Y3_N34
\TheTxFsk|TheDDS|Address[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|NxtAddress[9]~9_combout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheTxFsk|TheDDS|Address\(9));

-- Location: M10K_X58_Y2_N0
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => "FFFFFFFFFFFFFFFFFFEFFBFEFFDFF7F9FE7FEFFBFAFEBFCFE3FF7FDFB7F5F97F9FA7F1F87FFFBFE7FEFEBFCFFDFB7E5FE7F1F87EEFDBFAFCBE2FB3E4FA3E0FBBE6FABE2FB3E4FA3E0FBFFBFCFFDF97E9FFFF7FAFE3FD7E9F87F6FABFCFD3E8FFBE6FCBECFE3E0F1FD3F37D9F7FC7F4FD5F27CEF6BDCF13C0F1BD2F53D0F5FD3F57D1F5FD3F57D1F5BD2F53C0F1BC2F63BFEEFADEA7B7E8FA5EFBAAEB3B0E9BBCEA3B7E8FB9EBFB3E97BEEABA4EFBAAE939FE2F85E7F93E178EE0B98E5B9CE439BE3781E2F85E3B82E439AE537FDCF69D9F6DDFB72DA366DD37FD8F71DEF65DDB6CDFB72DA35BD1757D374ED7340D4B48D2F59D1F45D5B54D3B4CCFF3DCFF23C8",
	mem_init3 => "722C8332CC333CC733CC732CC322C8303C071DC7B1CC3B0CC3F15C1F05C6B18C2B10F8FE1FF7EEFD3E6FE3EBFC7E3FFBECFDBF8F2FD1F77CEF53DAF23C3F7FD5F1BC8F0BAFED7BBEC7BCEDBB8ECFBFED7BAEC3BCE5F99E0F8EE1392E7F95E2F81E538AE0375DEF61DD36ADFF75DAF7ED9372D3F59D0F56D434CD6F41D1752D3B48CF73BC8724CCB37CA72DCAB2ECE31DC6F1EC631CC6F1FC671CC6AFFBE6EDBAAEEBA2F5BCEE6B82F8B76CBB3AD0B12C3B6ECEB22D4A8EBBABAB0A92BDAAEB6A82B8A3683A6A8EA0299A3682A6A77986699D27C9CE679BA609E2559765296A5797E51962548F6338EA368BE218A6248D21D80E0A81A1787E0184218B96F5BF2E",
	mem_init2 => "2BCEEBBEAF6B3EDFB06D0B22D9B16C4B52ADAF6A2A8AB3AAEAAAEA9BA1E96A5A97A3E8EA7A7F9FE6198260986619826094651942509064190240886218FA3F8FE3E8BA0F85E1681A0786E1A82BEBFCFE2F8BFDFB7F4FD3C5F67C8F43C1F7BCEEDFA7EEBAAE8FBDEB3B4E1789E4380E3F96E6B6BD8F7CDD365DA760D7F57D6B4AD0F4DD1348C873ECDB3BCCF3CCD319C070EC1F0BC0B0CFE7F1FFBE7FAFE2FD3D9F07CEF6FD3F33C4EC7AEE9BB3EB7A4EC38FE6B82E5789E0377DAF7CD9371DDB6AD7745D434FD2F5CD1331CDB2ACF739C8307C4F14C230FC6B1CBE6E1B9AE3BD6F0B5ED3B32C8B3ECAB32A9ABAAAAB6A9ABA8BA3688A3E8BA52909DE72992619",
	mem_init1 => "9A7C9665E92A4D9465688E258FA3B8B63085E038121F82E14842E7BF2E8BDEE2B92DFB2AD4B06DAB32B1A9AACAC6A6AF289A5A82A2696A0A699DA629A67698A4995A5C926469723189A2C8C63A8D20182A0487E12861F7789E879DEC781CB711CF74DD86DDBD6C1BB695AE60D896198D6058A5E5765F1715A96453D5C5415B5112F48D304ED254B91D4450A41516431E17C9F879DF477DC3741CB715D66B5BE6C9A96E9A465D8C67D836416B5E5665D56E5F1415494856D444DD2D4F93D485324251A46107450F73B4FE3F4E13C8D1328D836CC429CB52D8AD2B8BC27C8220093240731A46A1E47A1E04711047114560D4360D02F0B00F0340E0741E070FF3F0",
	mem_init0 => "FF3F4FE374C1308C1308C028CA028CA12F09F2709F2749E1F47E1F07F1B04F1344E13456150370D027094260141A0601B021EB7A5F27C5F2781C3701DD779CC6BDB46DDA5699856699862D885CD615897F5F14F53556555465613B4A1334C5224051C43D0D459E57E9F87ADF074DC1771CF731B7695BA6E5AA6C1836799D6399459D785ED695C9415714F555464953A4A1334811D4391441D183ACE93C8E13F0CF354C6364CA340A32F8AD2D8A426C8824C812706F1D0671E46A1444217C4D118390A83008C3E034160101B020F3384FC3DCE436CC9348C1370AF2D4A62A4B22809D23895218981AC601F46E1D0471604B1445C0BC3409C390A8110700F05406",
	clk0_core_clock_enable => "ena0",
	clk0_input_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "TbdTxFskFull.TbdTxFskFull0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "TxFsk:TheTxFsk|DspDds:TheDDS|altsyncram:Mux8_rtl_0|altsyncram_gq71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 10,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 10,
	port_b_data_width => 10,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	ena0 => \PhaseStrobe~combout\,
	portaaddr => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: M10K_X58_Y3_N0
\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a1\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => "03C0F03C0F03C0F03C0F03C0F03C0F03C0F03C0F03C0F03C0F03C0F03C0F03C0F03C0F03C0E0380E0380E0380E0380E0380E0380F03C0F03C0F03C0F03C0F0380E0380E0380E0380E0340D0340D0340D0300C0300C0300C0300D0340D0340D0300C0300C0300C03C0F03C0F0380E0380E0380F03C0F03C0F0380E0380E0340D0340D0300C0300C0340D0340D0300C0300F03C0F03C0E0380E03C0F03C0F0380E0380D0340D0300C0300D0340D0300C0300F03C0F0380E0380F03C0F0380E0380D0340D0300C0340D0340C0300F03C0F0380E03C0F03C0E0380D0340D0300C0340D0300C0300F03C0E0380F03C0F0380E0340D0300C0340D0300C03C0F0380E03",
	mem_init3 => "80F03C0E0380D0340C0300D0340C0300F03C0E03C0F0380E0340D0300C0340D0300C02C0B0280B02C0A0280902408024090200802C0B0280B02C0A0280902008024090200B02C0A0280B0280A02408020090240802C0B0280B02C0A0240902008024080200B0280A02C0A02409020090240802C0B0280B02C0A02409020090200802C0A0280B0280902408024080200B0280B02C0A02408020090200F03C0E03C0E0380D0300D0340C03C0E03C0F0380D0300D0340C03C0E03C0F0380D0300D0340C03C0E03C0E0380D0300D0300F03C0E03C0E0340C0340D0300F0380F0380D0300C0340C03C0E03C0E0340D0300D0300F0380F0380D0300C0340C02C0A02C0",
	mem_init2 => "A024080240802C0A0280B02809020090200B0280B02809020090200B0280B02809020090200B0280A02C0A024080240802C0A02C0A024080240802C0A02809020090200B0280B0280902009020070180701805010050100701807018050140401C0601C06014040140401C0601C06010050100701807018050100501C0601C06014040140401C0701805010050100701806014040140400C0200801000010000300802004000040000C0300801000010000200C02004000040300803008010040000C0200C01000010000300C02004000040300803008000040001C06018050100501C0601C06010050100701C06014040100701807014040140401807018050",
	mem_init1 => "140401C07018050100401C06018050100501C0601C05010050100200C02000010000200C02004010000300C02004010000300C02004010000300C02004010000300C02004010000300C02004010000300C02000010000E03C0E0300D0300E03C0D0300D03C0E03C0D0300C03C0E0380D0300C03C0F0380D0340C0380F0380C0340F0380F0340C0300F0380E0340D0300B02C0A0200902C0A02C090200802C0B02809024080280B024080240B0280A024090200B02C0A0200902C0A028090200802C0B028080240F0380E0340C0300F03C0E0300D03C0E0380D0340C0380F0380C0340F0380E0340D0300E03C0D0300C03C0F0380C0340F0380E0340D0300A02C",
	mem_init0 => "090200802C0A02809024080280B024080200A02C090200802C0B028080240B0280A024090200A02C090200802C0B028080240701806014050100601C050140401807014040100701C060100501C06018040140701806014050100601C050100401C07014040100300C020000100C020080000403008020040100002008010040000803004000000300C010000000C03008000040300C020000101C060180501407018060140501006018050140401807014040100601C050100401C07014040100701C060100401C070180401403008020000100C020080100403008020040100002008010040000803004010000200C010000000803004000000300C0100000",
	clk0_core_clock_enable => "ena0",
	clk0_input_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "TbdTxFskFull.TbdTxFskFull0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "TxFsk:TheTxFsk|DspDds:TheDDS|altsyncram:Mux8_rtl_0|altsyncram_gq71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 10,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 10,
	port_b_data_width => 10,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	ena0 => \PhaseStrobe~combout\,
	portaaddr => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\);

-- Location: LABCELL_X57_Y2_N0
\TheTxFsk|TheDDS|Add2~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|Add2~29_sumout\ = SUM(( !\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a5\ $ (!\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\) ) + ( \TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ ) + ( !VCC ))
-- \TheTxFsk|TheDDS|Add2~30\ = CARRY(( !\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a5\ $ (!\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\) ) + ( \TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011110000111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a5\,
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\,
	cin => GND,
	sumout => \TheTxFsk|TheDDS|Add2~29_sumout\,
	cout => \TheTxFsk|TheDDS|Add2~30\);

-- Location: LABCELL_X57_Y2_N3
\TheTxFsk|TheDDS|Add2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|Add2~1_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a4\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~30\ ))
-- \TheTxFsk|TheDDS|Add2~2\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a4\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\,
	datad => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a4\,
	cin => \TheTxFsk|TheDDS|Add2~30\,
	sumout => \TheTxFsk|TheDDS|Add2~1_sumout\,
	cout => \TheTxFsk|TheDDS|Add2~2\);

-- Location: LABCELL_X57_Y2_N6
\TheTxFsk|TheDDS|Add2~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|Add2~37_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a3\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~2\ ))
-- \TheTxFsk|TheDDS|Add2~38\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a3\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\,
	datad => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a3\,
	cin => \TheTxFsk|TheDDS|Add2~2\,
	sumout => \TheTxFsk|TheDDS|Add2~37_sumout\,
	cout => \TheTxFsk|TheDDS|Add2~38\);

-- Location: LABCELL_X57_Y2_N9
\TheTxFsk|TheDDS|Add2~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|Add2~13_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a2\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~38\ ))
-- \TheTxFsk|TheDDS|Add2~14\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a2\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011110000111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\,
	datac => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a2\,
	cin => \TheTxFsk|TheDDS|Add2~38\,
	sumout => \TheTxFsk|TheDDS|Add2~13_sumout\,
	cout => \TheTxFsk|TheDDS|Add2~14\);

-- Location: LABCELL_X57_Y2_N12
\TheTxFsk|TheDDS|Add2~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|Add2~45_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a1~portadataout\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~14\ ))
-- \TheTxFsk|TheDDS|Add2~46\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a1~portadataout\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\,
	datad => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a1~portadataout\,
	cin => \TheTxFsk|TheDDS|Add2~14\,
	sumout => \TheTxFsk|TheDDS|Add2~45_sumout\,
	cout => \TheTxFsk|TheDDS|Add2~46\);

-- Location: LABCELL_X57_Y2_N15
\TheTxFsk|TheDDS|Add2~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|Add2~21_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0~portadataout\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~46\ ))
-- \TheTxFsk|TheDDS|Add2~22\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a0~portadataout\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\,
	datad => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a0~portadataout\,
	cin => \TheTxFsk|TheDDS|Add2~46\,
	sumout => \TheTxFsk|TheDDS|Add2~21_sumout\,
	cout => \TheTxFsk|TheDDS|Add2~22\);

-- Location: IOIBUF_X12_Y0_N18
\iSwitch[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSwitch(0),
	o => \iSwitch[0]~input_o\);

-- Location: FF_X57_Y2_N16
\DwetL[-9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|Add2~21_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ALT_INV_iSwitch[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DwetL[-9]~q\);

-- Location: FF_X47_Y2_N11
\TheParToI2s|LastValidDL[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DwetL[-9]~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ValWetR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|LastValidDL\(6));

-- Location: LABCELL_X57_Y2_N18
\TheTxFsk|TheDDS|Add2~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|Add2~53_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a6\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~22\ ))
-- \TheTxFsk|TheDDS|Add2~54\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a6\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\,
	datad => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a6\,
	cin => \TheTxFsk|TheDDS|Add2~22\,
	sumout => \TheTxFsk|TheDDS|Add2~53_sumout\,
	cout => \TheTxFsk|TheDDS|Add2~54\);

-- Location: LABCELL_X57_Y2_N21
\TheTxFsk|TheDDS|Add2~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|Add2~5_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a7\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~54\ ))
-- \TheTxFsk|TheDDS|Add2~6\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a7\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\,
	datad => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a7\,
	cin => \TheTxFsk|TheDDS|Add2~54\,
	sumout => \TheTxFsk|TheDDS|Add2~5_sumout\,
	cout => \TheTxFsk|TheDDS|Add2~6\);

-- Location: LABCELL_X57_Y2_N24
\TheTxFsk|TheDDS|Add2~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|Add2~33_sumout\ = SUM(( GND ) + ( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a8\) ) + ( \TheTxFsk|TheDDS|Add2~6\ ))
-- \TheTxFsk|TheDDS|Add2~34\ = CARRY(( GND ) + ( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a8\) ) + ( \TheTxFsk|TheDDS|Add2~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011000011001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\,
	dataf => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a8\,
	cin => \TheTxFsk|TheDDS|Add2~6\,
	sumout => \TheTxFsk|TheDDS|Add2~33_sumout\,
	cout => \TheTxFsk|TheDDS|Add2~34\);

-- Location: LABCELL_X57_Y2_N27
\TheTxFsk|TheDDS|Add2~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|Add2~9_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a9\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~34\ ))
-- \TheTxFsk|TheDDS|Add2~10\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a9\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011110000111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\,
	datac => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a9\,
	cin => \TheTxFsk|TheDDS|Add2~34\,
	sumout => \TheTxFsk|TheDDS|Add2~9_sumout\,
	cout => \TheTxFsk|TheDDS|Add2~10\);

-- Location: LABCELL_X57_Y2_N30
\TheTxFsk|TheDDS|Add2~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|Add2~41_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a10\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~10\ ))
-- \TheTxFsk|TheDDS|Add2~42\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a10\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\,
	datad => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a10\,
	cin => \TheTxFsk|TheDDS|Add2~10\,
	sumout => \TheTxFsk|TheDDS|Add2~41_sumout\,
	cout => \TheTxFsk|TheDDS|Add2~42\);

-- Location: LABCELL_X57_Y2_N33
\TheTxFsk|TheDDS|Add2~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|Add2~17_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a11\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~42\ ))
-- \TheTxFsk|TheDDS|Add2~18\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a11\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\,
	datad => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a11\,
	cin => \TheTxFsk|TheDDS|Add2~42\,
	sumout => \TheTxFsk|TheDDS|Add2~17_sumout\,
	cout => \TheTxFsk|TheDDS|Add2~18\);

-- Location: FF_X57_Y2_N34
\DwetL[-3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|Add2~17_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ALT_INV_iSwitch[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DwetL[-3]~q\);

-- Location: FF_X47_Y2_N2
\TheParToI2s|LastValidDL[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DwetL[-3]~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ValWetR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|LastValidDL\(12));

-- Location: LABCELL_X57_Y2_N36
\TheTxFsk|TheDDS|Add2~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|Add2~49_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a12\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~18\ ))
-- \TheTxFsk|TheDDS|Add2~50\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a12\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011110000111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\,
	datac => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a12\,
	cin => \TheTxFsk|TheDDS|Add2~18\,
	sumout => \TheTxFsk|TheDDS|Add2~49_sumout\,
	cout => \TheTxFsk|TheDDS|Add2~50\);

-- Location: LABCELL_X57_Y2_N39
\TheTxFsk|TheDDS|Add2~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|Add2~25_sumout\ = SUM(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a13\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~50\ ))
-- \TheTxFsk|TheDDS|Add2~26\ = CARRY(( !\TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ $ (!\TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ram_block1a13\) ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\,
	datad => \TheTxFsk|TheDDS|Mux8_rtl_0|auto_generated|ALT_INV_ram_block1a13\,
	cin => \TheTxFsk|TheDDS|Add2~50\,
	sumout => \TheTxFsk|TheDDS|Add2~25_sumout\,
	cout => \TheTxFsk|TheDDS|Add2~26\);

-- Location: FF_X57_Y2_N40
\DwetL[-1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|Add2~25_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ALT_INV_iSwitch[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DwetL[-1]~q\);

-- Location: FF_X47_Y2_N5
\TheParToI2s|LastValidDL[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DwetL[-1]~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ValWetR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|LastValidDL\(14));

-- Location: FF_X57_Y2_N10
\DwetL[-11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|Add2~13_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ALT_INV_iSwitch[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DwetL[-11]~q\);

-- Location: FF_X47_Y2_N8
\TheParToI2s|LastValidDL[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DwetL[-11]~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ValWetR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|LastValidDL\(4));

-- Location: MLABCELL_X47_Y2_N3
\TheParToI2s|Mux1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Mux1~1_combout\ = ( \TheParToI2s|LastValidDL\(14) & ( \TheParToI2s|LastValidDL\(4) & ( (!\TheParToI2s|BclkCtr\(1) & (((!\TheParToI2s|BclkCtr\(3)) # (\TheParToI2s|LastValidDL\(12))))) # (\TheParToI2s|BclkCtr\(1) & (((\TheParToI2s|BclkCtr\(3))) 
-- # (\TheParToI2s|LastValidDL\(6)))) ) ) ) # ( !\TheParToI2s|LastValidDL\(14) & ( \TheParToI2s|LastValidDL\(4) & ( (!\TheParToI2s|BclkCtr\(1) & (((!\TheParToI2s|BclkCtr\(3)) # (\TheParToI2s|LastValidDL\(12))))) # (\TheParToI2s|BclkCtr\(1) & 
-- (\TheParToI2s|LastValidDL\(6) & (!\TheParToI2s|BclkCtr\(3)))) ) ) ) # ( \TheParToI2s|LastValidDL\(14) & ( !\TheParToI2s|LastValidDL\(4) & ( (!\TheParToI2s|BclkCtr\(1) & (((\TheParToI2s|BclkCtr\(3) & \TheParToI2s|LastValidDL\(12))))) # 
-- (\TheParToI2s|BclkCtr\(1) & (((\TheParToI2s|BclkCtr\(3))) # (\TheParToI2s|LastValidDL\(6)))) ) ) ) # ( !\TheParToI2s|LastValidDL\(14) & ( !\TheParToI2s|LastValidDL\(4) & ( (!\TheParToI2s|BclkCtr\(1) & (((\TheParToI2s|BclkCtr\(3) & 
-- \TheParToI2s|LastValidDL\(12))))) # (\TheParToI2s|BclkCtr\(1) & (\TheParToI2s|LastValidDL\(6) & (!\TheParToI2s|BclkCtr\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000011010000101010001111110110000101110101011010110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_BclkCtr\(1),
	datab => \TheParToI2s|ALT_INV_LastValidDL\(6),
	datac => \TheParToI2s|ALT_INV_BclkCtr\(3),
	datad => \TheParToI2s|ALT_INV_LastValidDL\(12),
	datae => \TheParToI2s|ALT_INV_LastValidDL\(14),
	dataf => \TheParToI2s|ALT_INV_LastValidDL\(4),
	combout => \TheParToI2s|Mux1~1_combout\);

-- Location: FF_X57_Y2_N14
\DwetL[-10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|Add2~45_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ALT_INV_iSwitch[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DwetL[-10]~q\);

-- Location: FF_X56_Y2_N23
\TheParToI2s|LastValidDL[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DwetL[-10]~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ValWetR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|LastValidDL\(5));

-- Location: FF_X57_Y2_N19
\DwetL[-8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|Add2~53_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ALT_INV_iSwitch[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DwetL[-8]~q\);

-- Location: FF_X56_Y2_N11
\TheParToI2s|LastValidDL[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DwetL[-8]~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ValWetR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|LastValidDL\(7));

-- Location: FF_X57_Y2_N38
\DwetL[-2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|Add2~49_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ALT_INV_iSwitch[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DwetL[-2]~q\);

-- Location: FF_X56_Y2_N26
\TheParToI2s|LastValidDL[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DwetL[-2]~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ValWetR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|LastValidDL\(13));

-- Location: LABCELL_X57_Y2_N42
\TheTxFsk|TheDDS|Add2~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheTxFsk|TheDDS|Add2~57_sumout\ = SUM(( \TheTxFsk|TheDDS|PhaseAddr[19]~DUPLICATE_q\ ) + ( GND ) + ( \TheTxFsk|TheDDS|Add2~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheTxFsk|TheDDS|ALT_INV_PhaseAddr[19]~DUPLICATE_q\,
	cin => \TheTxFsk|TheDDS|Add2~26\,
	sumout => \TheTxFsk|TheDDS|Add2~57_sumout\);

-- Location: FF_X57_Y2_N44
\DwetL[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|Add2~57_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ALT_INV_iSwitch[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => DwetL(0));

-- Location: FF_X56_Y2_N8
\TheParToI2s|LastValidDL[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => DwetL(0),
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ValWetR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|LastValidDL\(15));

-- Location: LABCELL_X56_Y2_N6
\TheParToI2s|Mux1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Mux1~3_combout\ = ( \TheParToI2s|LastValidDL\(15) & ( \TheParToI2s|BclkCtr\(3) & ( (\TheParToI2s|BclkCtr\(1)) # (\TheParToI2s|LastValidDL\(13)) ) ) ) # ( !\TheParToI2s|LastValidDL\(15) & ( \TheParToI2s|BclkCtr\(3) & ( 
-- (\TheParToI2s|LastValidDL\(13) & !\TheParToI2s|BclkCtr\(1)) ) ) ) # ( \TheParToI2s|LastValidDL\(15) & ( !\TheParToI2s|BclkCtr\(3) & ( (!\TheParToI2s|BclkCtr\(1) & (\TheParToI2s|LastValidDL\(5))) # (\TheParToI2s|BclkCtr\(1) & 
-- ((\TheParToI2s|LastValidDL\(7)))) ) ) ) # ( !\TheParToI2s|LastValidDL\(15) & ( !\TheParToI2s|BclkCtr\(3) & ( (!\TheParToI2s|BclkCtr\(1) & (\TheParToI2s|LastValidDL\(5))) # (\TheParToI2s|BclkCtr\(1) & ((\TheParToI2s|LastValidDL\(7)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100110011010101010011001100001111000000000000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_LastValidDL\(5),
	datab => \TheParToI2s|ALT_INV_LastValidDL\(7),
	datac => \TheParToI2s|ALT_INV_LastValidDL\(13),
	datad => \TheParToI2s|ALT_INV_BclkCtr\(1),
	datae => \TheParToI2s|ALT_INV_LastValidDL\(15),
	dataf => \TheParToI2s|ALT_INV_BclkCtr\(3),
	combout => \TheParToI2s|Mux1~3_combout\);

-- Location: FF_X57_Y2_N26
\DwetL[-6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|Add2~33_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ALT_INV_iSwitch[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DwetL[-6]~q\);

-- Location: FF_X56_Y2_N35
\TheParToI2s|LastValidDL[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DwetL[-6]~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ValWetR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|LastValidDL\(9));

-- Location: FF_X57_Y2_N8
\DwetL[-12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|Add2~37_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ALT_INV_iSwitch[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DwetL[-12]~q\);

-- Location: FF_X56_Y2_N17
\TheParToI2s|LastValidDL[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DwetL[-12]~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ValWetR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|LastValidDL\(3));

-- Location: FF_X57_Y2_N32
\DwetL[-4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|Add2~41_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ALT_INV_iSwitch[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DwetL[-4]~q\);

-- Location: FF_X56_Y2_N53
\TheParToI2s|LastValidDL[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DwetL[-4]~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ValWetR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|LastValidDL\(11));

-- Location: FF_X57_Y2_N2
\DwetL[-14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|Add2~29_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ALT_INV_iSwitch[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DwetL[-14]~q\);

-- Location: FF_X56_Y2_N50
\TheParToI2s|LastValidDL[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DwetL[-14]~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ValWetR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|LastValidDL\(1));

-- Location: LABCELL_X56_Y2_N51
\TheParToI2s|Mux1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Mux1~2_combout\ = ( \TheParToI2s|LastValidDL\(11) & ( \TheParToI2s|LastValidDL\(1) & ( (!\TheParToI2s|BclkCtr\(1) & (((!\TheParToI2s|BclkCtr\(3))) # (\TheParToI2s|LastValidDL\(9)))) # (\TheParToI2s|BclkCtr\(1) & (((\TheParToI2s|BclkCtr\(3)) # 
-- (\TheParToI2s|LastValidDL\(3))))) ) ) ) # ( !\TheParToI2s|LastValidDL\(11) & ( \TheParToI2s|LastValidDL\(1) & ( (!\TheParToI2s|BclkCtr\(1) & (((!\TheParToI2s|BclkCtr\(3))) # (\TheParToI2s|LastValidDL\(9)))) # (\TheParToI2s|BclkCtr\(1) & 
-- (((\TheParToI2s|LastValidDL\(3) & !\TheParToI2s|BclkCtr\(3))))) ) ) ) # ( \TheParToI2s|LastValidDL\(11) & ( !\TheParToI2s|LastValidDL\(1) & ( (!\TheParToI2s|BclkCtr\(1) & (\TheParToI2s|LastValidDL\(9) & ((\TheParToI2s|BclkCtr\(3))))) # 
-- (\TheParToI2s|BclkCtr\(1) & (((\TheParToI2s|BclkCtr\(3)) # (\TheParToI2s|LastValidDL\(3))))) ) ) ) # ( !\TheParToI2s|LastValidDL\(11) & ( !\TheParToI2s|LastValidDL\(1) & ( (!\TheParToI2s|BclkCtr\(1) & (\TheParToI2s|LastValidDL\(9) & 
-- ((\TheParToI2s|BclkCtr\(3))))) # (\TheParToI2s|BclkCtr\(1) & (((\TheParToI2s|LastValidDL\(3) & !\TheParToI2s|BclkCtr\(3))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001101000100000000110111011111001111010001001100111101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_LastValidDL\(9),
	datab => \TheParToI2s|ALT_INV_BclkCtr\(1),
	datac => \TheParToI2s|ALT_INV_LastValidDL\(3),
	datad => \TheParToI2s|ALT_INV_BclkCtr\(3),
	datae => \TheParToI2s|ALT_INV_LastValidDL\(11),
	dataf => \TheParToI2s|ALT_INV_LastValidDL\(1),
	combout => \TheParToI2s|Mux1~2_combout\);

-- Location: FF_X57_Y2_N4
\DwetL[-13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|Add2~1_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ALT_INV_iSwitch[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DwetL[-13]~q\);

-- Location: FF_X47_Y2_N23
\TheParToI2s|LastValidDL[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DwetL[-13]~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ValWetR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|LastValidDL\(2));

-- Location: FF_X57_Y2_N29
\DwetL[-5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|Add2~9_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ALT_INV_iSwitch[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DwetL[-5]~q\);

-- Location: FF_X47_Y2_N53
\TheParToI2s|LastValidDL[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DwetL[-5]~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ValWetR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|LastValidDL\(10));

-- Location: FF_X57_Y2_N22
\DwetL[-7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheTxFsk|TheDDS|Add2~5_sumout\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sclr => \ALT_INV_iSwitch[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DwetL[-7]~q\);

-- Location: FF_X47_Y2_N50
\TheParToI2s|LastValidDL[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \DwetL[-7]~q\,
	clrn => \inButton[1]~inputCLKENA0_outclk\,
	sload => VCC,
	ena => \ValWetR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2s|LastValidDL\(8));

-- Location: MLABCELL_X47_Y2_N51
\TheParToI2s|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Mux1~0_combout\ = ( \TheParToI2s|LastValidDL\(10) & ( \TheParToI2s|LastValidDL\(8) & ( ((\TheParToI2s|LastValidDL\(2) & \TheParToI2s|BclkCtr\(1))) # (\TheParToI2s|BclkCtr\(3)) ) ) ) # ( !\TheParToI2s|LastValidDL\(10) & ( 
-- \TheParToI2s|LastValidDL\(8) & ( (!\TheParToI2s|BclkCtr\(3) & (\TheParToI2s|LastValidDL\(2) & \TheParToI2s|BclkCtr\(1))) # (\TheParToI2s|BclkCtr\(3) & ((!\TheParToI2s|BclkCtr\(1)))) ) ) ) # ( \TheParToI2s|LastValidDL\(10) & ( !\TheParToI2s|LastValidDL\(8) 
-- & ( (\TheParToI2s|BclkCtr\(1) & ((\TheParToI2s|BclkCtr\(3)) # (\TheParToI2s|LastValidDL\(2)))) ) ) ) # ( !\TheParToI2s|LastValidDL\(10) & ( !\TheParToI2s|LastValidDL\(8) & ( (\TheParToI2s|LastValidDL\(2) & (!\TheParToI2s|BclkCtr\(3) & 
-- \TheParToI2s|BclkCtr\(1))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010000000000000101111100001111010100000000111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_LastValidDL\(2),
	datac => \TheParToI2s|ALT_INV_BclkCtr\(3),
	datad => \TheParToI2s|ALT_INV_BclkCtr\(1),
	datae => \TheParToI2s|ALT_INV_LastValidDL\(10),
	dataf => \TheParToI2s|ALT_INV_LastValidDL\(8),
	combout => \TheParToI2s|Mux1~0_combout\);

-- Location: MLABCELL_X47_Y2_N12
\TheParToI2s|Selector10~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|Selector10~1_combout\ = ( !\TheParToI2s|BclkCtr[0]~DUPLICATE_q\ & ( ((\TheParToI2s|Selector10~0_combout\ & ((!\TheParToI2s|BclkCtr\(2) & ((\TheParToI2s|Mux1~0_combout\))) # (\TheParToI2s|BclkCtr\(2) & (\TheParToI2s|Mux1~1_combout\))))) ) ) # 
-- ( \TheParToI2s|BclkCtr[0]~DUPLICATE_q\ & ( ((\TheParToI2s|Selector10~0_combout\ & ((!\TheParToI2s|BclkCtr\(2) & ((\TheParToI2s|Mux1~2_combout\))) # (\TheParToI2s|BclkCtr\(2) & (\TheParToI2s|Mux1~3_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111100000000010101010000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_Mux1~1_combout\,
	datab => \TheParToI2s|ALT_INV_Mux1~3_combout\,
	datac => \TheParToI2s|ALT_INV_Mux1~2_combout\,
	datad => \TheParToI2s|ALT_INV_Selector10~0_combout\,
	datae => \TheParToI2s|ALT_INV_BclkCtr[0]~DUPLICATE_q\,
	dataf => \TheParToI2s|ALT_INV_BclkCtr\(2),
	datag => \TheParToI2s|ALT_INV_Mux1~0_combout\,
	combout => \TheParToI2s|Selector10~1_combout\);

-- Location: LABCELL_X46_Y2_N39
\TheParToI2s|oLrc~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2s|oLrc~0_combout\ = ( \TheParToI2s|State.SendingL~q\ ) # ( !\TheParToI2s|State.SendingL~q\ & ( \TheParToI2s|State.FirstBitEmptyL~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2s|ALT_INV_State.FirstBitEmptyL~DUPLICATE_q\,
	dataf => \TheParToI2s|ALT_INV_State.SendingL~q\,
	combout => \TheParToI2s|oLrc~0_combout\);

-- Location: IOIBUF_X4_Y0_N52
\iSwitch[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSwitch(3),
	o => \iSwitch[3]~input_o\);

-- Location: IOIBUF_X2_Y0_N41
\iSwitch[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSwitch(4),
	o => \iSwitch[4]~input_o\);

-- Location: IOIBUF_X16_Y0_N18
\iSwitch[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSwitch(5),
	o => \iSwitch[5]~input_o\);

-- Location: IOIBUF_X4_Y0_N35
\iSwitch[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSwitch(6),
	o => \iSwitch[6]~input_o\);

-- Location: IOIBUF_X4_Y0_N1
\iSwitch[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSwitch(7),
	o => \iSwitch[7]~input_o\);

-- Location: IOIBUF_X4_Y0_N18
\iSwitch[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSwitch(8),
	o => \iSwitch[8]~input_o\);

-- Location: IOIBUF_X40_Y0_N1
\inButton[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inButton(2),
	o => \inButton[2]~input_o\);

-- Location: IOIBUF_X40_Y0_N18
\inButton[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inButton(3),
	o => \inButton[3]~input_o\);

-- Location: IOIBUF_X8_Y81_N1
\iADCdat~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iADCdat,
	o => \iADCdat~input_o\);

-- Location: LABCELL_X24_Y47_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;


pll_reconfig_inst_tasks : altera_pll_reconfig_tasks
-- pragma translate_off
GENERIC MAP (
      number_of_fplls => 1);
-- pragma translate_on
END structure;

