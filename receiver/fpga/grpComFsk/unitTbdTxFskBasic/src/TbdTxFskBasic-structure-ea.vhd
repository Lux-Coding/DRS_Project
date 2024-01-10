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

-- DATE "12/12/2021 01:44:36"

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

ENTITY 	TbdTxFskBasic IS
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
	oI2cSclk : OUT std_logic;
	ioI2cSdin : INOUT std_logic;
	oMclk : OUT std_logic;
	oBclk : OUT std_logic;
	iADCdat : IN std_logic;
	oDACdat : OUT std_logic;
	oADClrc : OUT std_logic;
	oDAClrc : OUT std_logic
	);
END TbdTxFskBasic;

-- Design Ports Information
-- iSwitch[0]	=>  Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[1]	=>  Location: PIN_AC12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[2]	=>  Location: PIN_AF9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[3]	=>  Location: PIN_AF10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[4]	=>  Location: PIN_AD11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[5]	=>  Location: PIN_AD12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[6]	=>  Location: PIN_AE11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[7]	=>  Location: PIN_AC9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[8]	=>  Location: PIN_AD10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iSwitch[9]	=>  Location: PIN_AE12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inButton[1]	=>  Location: PIN_AA15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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
-- oI2cSclk	=>  Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oMclk	=>  Location: PIN_G7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oBclk	=>  Location: PIN_H7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- iADCdat	=>  Location: PIN_K7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- oDACdat	=>  Location: PIN_J7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oADClrc	=>  Location: PIN_K8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oDAClrc	=>  Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- ioI2cSdin	=>  Location: PIN_K12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- iClk	=>  Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inResetAsync	=>  Location: PIN_AA14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF TbdTxFskBasic IS
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
SIGNAL ww_oI2cSclk : std_logic;
SIGNAL ww_oMclk : std_logic;
SIGNAL ww_oBclk : std_logic;
SIGNAL ww_iADCdat : std_logic;
SIGNAL ww_oDACdat : std_logic;
SIGNAL ww_oADClrc : std_logic;
SIGNAL ww_oDAClrc : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \iSwitch[0]~input_o\ : std_logic;
SIGNAL \iSwitch[1]~input_o\ : std_logic;
SIGNAL \iSwitch[2]~input_o\ : std_logic;
SIGNAL \iSwitch[3]~input_o\ : std_logic;
SIGNAL \iSwitch[4]~input_o\ : std_logic;
SIGNAL \iSwitch[5]~input_o\ : std_logic;
SIGNAL \iSwitch[6]~input_o\ : std_logic;
SIGNAL \iSwitch[7]~input_o\ : std_logic;
SIGNAL \iSwitch[8]~input_o\ : std_logic;
SIGNAL \iSwitch[9]~input_o\ : std_logic;
SIGNAL \inButton[1]~input_o\ : std_logic;
SIGNAL \inButton[2]~input_o\ : std_logic;
SIGNAL \inButton[3]~input_o\ : std_logic;
SIGNAL \iADCdat~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \iClk~input_o\ : std_logic;
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\ : std_logic;
SIGNAL \inResetAsync~input_o\ : std_logic;
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
SIGNAL \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[0]~5_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[1]~4_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[2]~3_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[3]~2_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[4]~1_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[5]~0_combout\ : std_logic;
SIGNAL \GenStrobeI2C|Equal0~0_combout\ : std_logic;
SIGNAL \GenStrobeI2C|oStrobe~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack1~q\ : std_logic;
SIGNAL \ConfigureCodec|R.Sclk~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|oStrobe~q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Start~q\ : std_logic;
SIGNAL \ConfigureCodec|R.Activity~q\ : std_logic;
SIGNAL \ConfigureCodec|Add0~6\ : std_logic;
SIGNAL \ConfigureCodec|Add0~1_sumout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[1]_OTERM75\ : std_logic;
SIGNAL \ConfigureCodec|Add0~2\ : std_logic;
SIGNAL \ConfigureCodec|Add0~25_sumout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[2]_OTERM60\ : std_logic;
SIGNAL \ConfigureCodec|Add0~26\ : std_logic;
SIGNAL \ConfigureCodec|Add0~21_sumout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[3]_OTERM63\ : std_logic;
SIGNAL \ConfigureCodec|Add0~22\ : std_logic;
SIGNAL \ConfigureCodec|Add0~17_sumout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[4]_OTERM66\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[4]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Add0~18\ : std_logic;
SIGNAL \ConfigureCodec|Add0~13_sumout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[5]_OTERM69\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[5]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Add0~14\ : std_logic;
SIGNAL \ConfigureCodec|Add0~9_sumout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[6]_OTERM57\ : std_logic;
SIGNAL \ConfigureCodec|Equal0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack2~q\ : std_logic;
SIGNAL \ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector5~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Add1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data1~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector11~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector11~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector10~0_RTM013_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector10~0_OTERM11\ : std_logic;
SIGNAL \ConfigureCodec|NextR~10_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector11~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|NextR~9_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector5~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector13~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector10~0_OTERM11DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector13~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector12~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector12~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector12~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|NextR~8_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector7~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data2~q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack3~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector8~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector13~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector13~1_OTERM9\ : std_logic;
SIGNAL \ConfigureCodec|Selector10~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector10~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector6~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector13~0_RTM07_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector13~0_OTERM5\ : std_logic;
SIGNAL \ioI2cSdin~input_o\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~q\ : std_logic;
SIGNAL \WaitCtr[1]~0_combout\ : std_logic;
SIGNAL \WaitCtr[0]~1_combout\ : std_logic;
SIGNAL \WaitCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \Start~0_combout\ : std_logic;
SIGNAL \Start~q\ : std_logic;
SIGNAL \ConfigureCodec|R.Activity~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector16~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AckError~q\ : std_logic;
SIGNAL \ConfigureCodec|R.Activity~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[6]~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[0]_OTERM72\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.Activity~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Activity~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Activity~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector1~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector2~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Address~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector3~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.RWBit~q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack1~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack3~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector9~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Stop~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Idle~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector14~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Sclk~q\ : std_logic;
SIGNAL \ConfigureCodec|R.Sdin~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~1_OTERM1\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[15]~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[15]~0_OTERM3\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[5]_OTERM25\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[1]_OTERM29\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[9]_OTERM27\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[13]_OTERM23\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[7]_OTERM17\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[11]_OTERM19\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[15]_OTERM15\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[3]_OTERM21\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[0]_OTERM41\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[4]_OTERM39\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[12]_OTERM43\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[10]_OTERM35\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[14]_OTERM31\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[2]_OTERM37\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[6]_OTERM33\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Sdin~q\ : std_logic;
SIGNAL \GenClks|BMclk~q\ : std_logic;
SIGNAL \GenClks|ClkCounter[0]~0_combout\ : std_logic;
SIGNAL \GenClks|BMclk~0_combout\ : std_logic;
SIGNAL \GenClks|BMclk~DUPLICATE_q\ : std_logic;
SIGNAL \GenClks|ADClrc~0_combout\ : std_logic;
SIGNAL \GenClks|BitCounter[0]_OTERM51\ : std_logic;
SIGNAL \GenClks|BitCounter[0]~DUPLICATE_q\ : std_logic;
SIGNAL \GenClks|Add0~10\ : std_logic;
SIGNAL \GenClks|Add0~5_sumout\ : std_logic;
SIGNAL \GenClks|BitCounter[1]_OTERM53\ : std_logic;
SIGNAL \GenClks|BitCounter[1]~DUPLICATE_q\ : std_logic;
SIGNAL \GenClks|Add0~6\ : std_logic;
SIGNAL \GenClks|Add0~1_sumout\ : std_logic;
SIGNAL \GenClks|BitCounter[2]_OTERM55\ : std_logic;
SIGNAL \GenClks|BitCounter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \GenClks|Add0~2\ : std_logic;
SIGNAL \GenClks|Add0~29_sumout\ : std_logic;
SIGNAL \GenClks|BitCounter~1_combout\ : std_logic;
SIGNAL \GenClks|Add0~30\ : std_logic;
SIGNAL \GenClks|Add0~25_sumout\ : std_logic;
SIGNAL \GenClks|BitCounter[4]_OTERM45\ : std_logic;
SIGNAL \GenClks|BitCounter[7]~DUPLICATE_q\ : std_logic;
SIGNAL \GenClks|Add0~26\ : std_logic;
SIGNAL \GenClks|Add0~21_sumout\ : std_logic;
SIGNAL \GenClks|BitCounter[5]_OTERM47\ : std_logic;
SIGNAL \GenClks|Add0~22\ : std_logic;
SIGNAL \GenClks|Add0~17_sumout\ : std_logic;
SIGNAL \GenClks|BitCounter[6]_OTERM49\ : std_logic;
SIGNAL \GenClks|Add0~18\ : std_logic;
SIGNAL \GenClks|Add0~13_sumout\ : std_logic;
SIGNAL \GenClks|BitCounter~0_combout\ : std_logic;
SIGNAL \GenClks|Equal0~0_combout\ : std_logic;
SIGNAL \GenClks|ADClrc~1_combout\ : std_logic;
SIGNAL \GenClks|ADClrc~q\ : std_logic;
SIGNAL \GenClks|BitCounter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ConfigureCodec|R.AddrCtr\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \ConfigureCodec|R.Data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL WaitCtr : std_logic_vector(1 DOWNTO 0);
SIGNAL \ConfigureCodec|R.BitCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \GenClks|ClkCounter\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \GenStrobeI2C|ClkCounter\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|fboutclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|locked_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_Selector10~0_OTERM11DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Sdin~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack1~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack3~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter[1]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter[3]~DUPLICATE_q\ : std_logic;
SIGNAL \GenClks|ALT_INV_BitCounter[7]~DUPLICATE_q\ : std_logic;
SIGNAL \GenClks|ALT_INV_BitCounter[0]~DUPLICATE_q\ : std_logic;
SIGNAL \GenClks|ALT_INV_BitCounter[1]~DUPLICATE_q\ : std_logic;
SIGNAL \GenClks|ALT_INV_BitCounter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Activity~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_WaitCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[4]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[5]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector10~0_OTERM11\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector13~1_OTERM9\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector13~0_OTERM5\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~1_OTERM1\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\ : std_logic;
SIGNAL \ALT_INV_inResetAsync~input_o\ : std_logic;
SIGNAL \ALT_INV_ioI2cSdin~input_o\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector1~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector2~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector3~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector13~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector12~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector12~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector11~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector11~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Add1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextR~10_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector10~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector5~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector7~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Start~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Address~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_Mux9~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector6~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextR~9_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector8~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextR~8_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Sdin~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector9~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextStateAndOutput:vSclkFalling~combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Activity~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Activity~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[6]~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Activity~1_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \GenClks|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \GenClks|ALT_INV_BitCounter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \GenClks|ALT_INV_ADClrc~0_combout\ : std_logic;
SIGNAL \GenClks|ALT_INV_ClkCounter\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Sclk~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AckError~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Activity~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Activity~q\ : std_logic;
SIGNAL ALT_INV_WaitCtr : std_logic_vector(1 DOWNTO 0);
SIGNAL \GenStrobeI2C|ALT_INV_oStrobe~q\ : std_logic;
SIGNAL \GenClks|ALT_INV_ADClrc~q\ : std_logic;
SIGNAL \GenClks|ALT_INV_BMclk~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~q\ : std_logic;
SIGNAL \ALT_INV_Start~q\ : std_logic;
SIGNAL \GenClks|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \GenClks|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \GenClks|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \GenClks|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \GenClks|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \GenClks|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \GenClks|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr\ : std_logic_vector(6 DOWNTO 0);

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
\ConfigureCodec|ALT_INV_Selector10~0_OTERM11DUPLICATE_q\ <= NOT \ConfigureCodec|Selector10~0_OTERM11DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.Sdin~DUPLICATE_q\ <= NOT \ConfigureCodec|R.Sdin~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack1~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Ack1~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack3~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Ack3~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\ <= NOT \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_ClkCounter[1]~DUPLICATE_q\ <= NOT \GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_ClkCounter[2]~DUPLICATE_q\ <= NOT \GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_ClkCounter[3]~DUPLICATE_q\ <= NOT \GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\;
\GenClks|ALT_INV_BitCounter[7]~DUPLICATE_q\ <= NOT \GenClks|BitCounter[7]~DUPLICATE_q\;
\GenClks|ALT_INV_BitCounter[0]~DUPLICATE_q\ <= NOT \GenClks|BitCounter[0]~DUPLICATE_q\;
\GenClks|ALT_INV_BitCounter[1]~DUPLICATE_q\ <= NOT \GenClks|BitCounter[1]~DUPLICATE_q\;
\GenClks|ALT_INV_BitCounter[2]~DUPLICATE_q\ <= NOT \GenClks|BitCounter[2]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\ <= NOT \ConfigureCodec|R.Sclk~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.Activity~DUPLICATE_q\ <= NOT \ConfigureCodec|R.Activity~DUPLICATE_q\;
\ALT_INV_WaitCtr[0]~DUPLICATE_q\ <= NOT \WaitCtr[0]~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\ <= NOT \GenStrobeI2C|oStrobe~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.AddrCtr[3]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.AddrCtr[4]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.AddrCtr[4]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.AddrCtr[5]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.AddrCtr[5]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_Selector10~0_OTERM11\ <= NOT \ConfigureCodec|Selector10~0_OTERM11\;
\ConfigureCodec|ALT_INV_Selector13~1_OTERM9\ <= NOT \ConfigureCodec|Selector13~1_OTERM9\;
\ConfigureCodec|ALT_INV_Selector13~0_OTERM5\ <= NOT \ConfigureCodec|Selector13~0_OTERM5\;
\ConfigureCodec|ALT_INV_Selector15~1_OTERM1\ <= NOT \ConfigureCodec|Selector15~1_OTERM1\;
\ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\ <= NOT \ConfigureCodec|R.Data[15]~0_OTERM3\;
\ALT_INV_inResetAsync~input_o\ <= NOT \inResetAsync~input_o\;
\ALT_INV_ioI2cSdin~input_o\ <= NOT \ioI2cSdin~input_o\;
\ConfigureCodec|ALT_INV_Selector1~1_combout\ <= NOT \ConfigureCodec|Selector1~1_combout\;
\ConfigureCodec|ALT_INV_Selector2~0_combout\ <= NOT \ConfigureCodec|Selector2~0_combout\;
\ConfigureCodec|ALT_INV_Selector3~0_combout\ <= NOT \ConfigureCodec|Selector3~0_combout\;
\ConfigureCodec|ALT_INV_Selector13~2_combout\ <= NOT \ConfigureCodec|Selector13~2_combout\;
\ConfigureCodec|ALT_INV_Selector12~1_combout\ <= NOT \ConfigureCodec|Selector12~1_combout\;
\ConfigureCodec|ALT_INV_Selector12~0_combout\ <= NOT \ConfigureCodec|Selector12~0_combout\;
\ConfigureCodec|ALT_INV_Selector11~1_combout\ <= NOT \ConfigureCodec|Selector11~1_combout\;
\ConfigureCodec|ALT_INV_Selector11~0_combout\ <= NOT \ConfigureCodec|Selector11~0_combout\;
\ConfigureCodec|ALT_INV_Add1~0_combout\ <= NOT \ConfigureCodec|Add1~0_combout\;
\ConfigureCodec|ALT_INV_NextR~10_combout\ <= NOT \ConfigureCodec|NextR~10_combout\;
\ConfigureCodec|ALT_INV_Selector10~1_combout\ <= NOT \ConfigureCodec|Selector10~1_combout\;
\ConfigureCodec|ALT_INV_Selector5~0_combout\ <= NOT \ConfigureCodec|Selector5~0_combout\;
\ConfigureCodec|ALT_INV_Selector1~0_combout\ <= NOT \ConfigureCodec|Selector1~0_combout\;
\ConfigureCodec|ALT_INV_Selector7~0_combout\ <= NOT \ConfigureCodec|Selector7~0_combout\;
\ConfigureCodec|ALT_INV_Selector15~2_combout\ <= NOT \ConfigureCodec|Selector15~2_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Start~q\ <= NOT \ConfigureCodec|R.FrameState.Start~q\;
\ConfigureCodec|ALT_INV_Selector15~0_combout\ <= NOT \ConfigureCodec|Selector15~0_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Address~q\ <= NOT \ConfigureCodec|R.FrameState.Address~q\;
\ConfigureCodec|ALT_INV_Mux9~4_combout\ <= NOT \ConfigureCodec|Mux9~4_combout\;
\ConfigureCodec|ALT_INV_Mux9~3_combout\ <= NOT \ConfigureCodec|Mux9~3_combout\;
\ConfigureCodec|ALT_INV_R.Data\(15) <= NOT \ConfigureCodec|R.Data\(15);
\ConfigureCodec|ALT_INV_R.Data\(7) <= NOT \ConfigureCodec|R.Data\(7);
\ConfigureCodec|ALT_INV_R.Data\(11) <= NOT \ConfigureCodec|R.Data\(11);
\ConfigureCodec|ALT_INV_R.Data\(3) <= NOT \ConfigureCodec|R.Data\(3);
\ConfigureCodec|ALT_INV_Mux9~2_combout\ <= NOT \ConfigureCodec|Mux9~2_combout\;
\ConfigureCodec|ALT_INV_R.Data\(13) <= NOT \ConfigureCodec|R.Data\(13);
\ConfigureCodec|ALT_INV_R.Data\(5) <= NOT \ConfigureCodec|R.Data\(5);
\ConfigureCodec|ALT_INV_R.Data\(9) <= NOT \ConfigureCodec|R.Data\(9);
\ConfigureCodec|ALT_INV_R.Data\(1) <= NOT \ConfigureCodec|R.Data\(1);
\ConfigureCodec|ALT_INV_Mux9~1_combout\ <= NOT \ConfigureCodec|Mux9~1_combout\;
\ConfigureCodec|ALT_INV_R.Data\(14) <= NOT \ConfigureCodec|R.Data\(14);
\ConfigureCodec|ALT_INV_R.Data\(6) <= NOT \ConfigureCodec|R.Data\(6);
\ConfigureCodec|ALT_INV_R.Data\(10) <= NOT \ConfigureCodec|R.Data\(10);
\ConfigureCodec|ALT_INV_R.Data\(2) <= NOT \ConfigureCodec|R.Data\(2);
\ConfigureCodec|ALT_INV_Mux9~0_combout\ <= NOT \ConfigureCodec|Mux9~0_combout\;
\ConfigureCodec|ALT_INV_R.Data\(4) <= NOT \ConfigureCodec|R.Data\(4);
\ConfigureCodec|ALT_INV_R.Data\(0) <= NOT \ConfigureCodec|R.Data\(0);
\ConfigureCodec|ALT_INV_R.Data\(12) <= NOT \ConfigureCodec|R.Data\(12);
\ConfigureCodec|ALT_INV_Selector6~0_combout\ <= NOT \ConfigureCodec|Selector6~0_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Data1~q\ <= NOT \ConfigureCodec|R.FrameState.Data1~q\;
\ConfigureCodec|ALT_INV_NextR~9_combout\ <= NOT \ConfigureCodec|NextR~9_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack1~0_combout\ <= NOT \ConfigureCodec|R.FrameState.Ack1~0_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\ <= NOT \ConfigureCodec|R.FrameState.RWBit~q\;
\ConfigureCodec|ALT_INV_Selector8~0_combout\ <= NOT \ConfigureCodec|Selector8~0_combout\;
\ConfigureCodec|ALT_INV_NextR~8_combout\ <= NOT \ConfigureCodec|NextR~8_combout\;
\ConfigureCodec|ALT_INV_R.BitCtr\(0) <= NOT \ConfigureCodec|R.BitCtr\(0);
\ConfigureCodec|ALT_INV_R.BitCtr\(1) <= NOT \ConfigureCodec|R.BitCtr\(1);
\ConfigureCodec|ALT_INV_R.BitCtr\(2) <= NOT \ConfigureCodec|R.BitCtr\(2);
\ConfigureCodec|ALT_INV_R.BitCtr\(3) <= NOT \ConfigureCodec|R.BitCtr\(3);
\ConfigureCodec|ALT_INV_R.FrameState.Data2~q\ <= NOT \ConfigureCodec|R.FrameState.Data2~q\;
\ConfigureCodec|ALT_INV_R.Sdin~q\ <= NOT \ConfigureCodec|R.Sdin~q\;
\ConfigureCodec|ALT_INV_Selector9~0_combout\ <= NOT \ConfigureCodec|Selector9~0_combout\;
\ConfigureCodec|ALT_INV_NextStateAndOutput:vSclkFalling~combout\ <= NOT \ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\ <= NOT \ConfigureCodec|R.FrameState.Ack2~q\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\ <= NOT \ConfigureCodec|R.FrameState.Ack1~q\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\ <= NOT \ConfigureCodec|R.FrameState.Ack3~q\;
\ConfigureCodec|ALT_INV_Selector0~0_combout\ <= NOT \ConfigureCodec|Selector0~0_combout\;
\ConfigureCodec|ALT_INV_R.Activity~3_combout\ <= NOT \ConfigureCodec|R.Activity~3_combout\;
\ConfigureCodec|ALT_INV_R.Activity~2_combout\ <= NOT \ConfigureCodec|R.Activity~2_combout\;
\ConfigureCodec|ALT_INV_R.AddrCtr[6]~0_combout\ <= NOT \ConfigureCodec|R.AddrCtr[6]~0_combout\;
\ConfigureCodec|ALT_INV_R.Activity~1_combout\ <= NOT \ConfigureCodec|R.Activity~1_combout\;
\GenStrobeI2C|ALT_INV_Equal0~0_combout\ <= NOT \GenStrobeI2C|Equal0~0_combout\;
\GenStrobeI2C|ALT_INV_ClkCounter\(0) <= NOT \GenStrobeI2C|ClkCounter\(0);
\GenStrobeI2C|ALT_INV_ClkCounter\(1) <= NOT \GenStrobeI2C|ClkCounter\(1);
\GenStrobeI2C|ALT_INV_ClkCounter\(2) <= NOT \GenStrobeI2C|ClkCounter\(2);
\GenStrobeI2C|ALT_INV_ClkCounter\(3) <= NOT \GenStrobeI2C|ClkCounter\(3);
\GenStrobeI2C|ALT_INV_ClkCounter\(4) <= NOT \GenStrobeI2C|ClkCounter\(4);
\GenStrobeI2C|ALT_INV_ClkCounter\(5) <= NOT \GenStrobeI2C|ClkCounter\(5);
\GenClks|ALT_INV_Equal0~0_combout\ <= NOT \GenClks|Equal0~0_combout\;
\GenClks|ALT_INV_BitCounter\(3) <= NOT \GenClks|BitCounter\(3);
\GenClks|ALT_INV_BitCounter\(4) <= NOT \GenClks|BitCounter\(4);
\GenClks|ALT_INV_BitCounter\(5) <= NOT \GenClks|BitCounter\(5);
\GenClks|ALT_INV_BitCounter\(6) <= NOT \GenClks|BitCounter\(6);
\GenClks|ALT_INV_BitCounter\(7) <= NOT \GenClks|BitCounter\(7);
\GenClks|ALT_INV_BitCounter\(0) <= NOT \GenClks|BitCounter\(0);
\GenClks|ALT_INV_BitCounter\(1) <= NOT \GenClks|BitCounter\(1);
\GenClks|ALT_INV_BitCounter\(2) <= NOT \GenClks|BitCounter\(2);
\GenClks|ALT_INV_ADClrc~0_combout\ <= NOT \GenClks|ADClrc~0_combout\;
\GenClks|ALT_INV_ClkCounter\(0) <= NOT \GenClks|ClkCounter\(0);
\ConfigureCodec|ALT_INV_R.Configured~0_combout\ <= NOT \ConfigureCodec|R.Configured~0_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Stop~q\ <= NOT \ConfigureCodec|R.FrameState.Stop~q\;
\ConfigureCodec|ALT_INV_R.Sclk~q\ <= NOT \ConfigureCodec|R.Sclk~q\;
\ConfigureCodec|ALT_INV_R.AckError~q\ <= NOT \ConfigureCodec|R.AckError~q\;
\ConfigureCodec|ALT_INV_Equal0~0_combout\ <= NOT \ConfigureCodec|Equal0~0_combout\;
\ConfigureCodec|ALT_INV_R.Activity~0_combout\ <= NOT \ConfigureCodec|R.Activity~0_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Idle~q\ <= NOT \ConfigureCodec|R.FrameState.Idle~q\;
\ConfigureCodec|ALT_INV_R.Activity~q\ <= NOT \ConfigureCodec|R.Activity~q\;
ALT_INV_WaitCtr(0) <= NOT WaitCtr(0);
ALT_INV_WaitCtr(1) <= NOT WaitCtr(1);
\GenStrobeI2C|ALT_INV_oStrobe~q\ <= NOT \GenStrobeI2C|oStrobe~q\;
\GenClks|ALT_INV_ADClrc~q\ <= NOT \GenClks|ADClrc~q\;
\GenClks|ALT_INV_BMclk~q\ <= NOT \GenClks|BMclk~q\;
\ConfigureCodec|ALT_INV_R.Configured~q\ <= NOT \ConfigureCodec|R.Configured~q\;
\ALT_INV_Start~q\ <= NOT \Start~q\;
\GenClks|ALT_INV_Add0~29_sumout\ <= NOT \GenClks|Add0~29_sumout\;
\GenClks|ALT_INV_Add0~25_sumout\ <= NOT \GenClks|Add0~25_sumout\;
\GenClks|ALT_INV_Add0~21_sumout\ <= NOT \GenClks|Add0~21_sumout\;
\GenClks|ALT_INV_Add0~17_sumout\ <= NOT \GenClks|Add0~17_sumout\;
\GenClks|ALT_INV_Add0~13_sumout\ <= NOT \GenClks|Add0~13_sumout\;
\GenClks|ALT_INV_Add0~5_sumout\ <= NOT \GenClks|Add0~5_sumout\;
\GenClks|ALT_INV_Add0~1_sumout\ <= NOT \GenClks|Add0~1_sumout\;
\ConfigureCodec|ALT_INV_Add0~25_sumout\ <= NOT \ConfigureCodec|Add0~25_sumout\;
\ConfigureCodec|ALT_INV_Add0~21_sumout\ <= NOT \ConfigureCodec|Add0~21_sumout\;
\ConfigureCodec|ALT_INV_Add0~17_sumout\ <= NOT \ConfigureCodec|Add0~17_sumout\;
\ConfigureCodec|ALT_INV_Add0~13_sumout\ <= NOT \ConfigureCodec|Add0~13_sumout\;
\ConfigureCodec|ALT_INV_Add0~9_sumout\ <= NOT \ConfigureCodec|Add0~9_sumout\;
\ConfigureCodec|ALT_INV_Add0~1_sumout\ <= NOT \ConfigureCodec|Add0~1_sumout\;
\ConfigureCodec|ALT_INV_R.AddrCtr\(2) <= NOT \ConfigureCodec|R.AddrCtr\(2);
\ConfigureCodec|ALT_INV_R.AddrCtr\(3) <= NOT \ConfigureCodec|R.AddrCtr\(3);
\ConfigureCodec|ALT_INV_R.AddrCtr\(4) <= NOT \ConfigureCodec|R.AddrCtr\(4);
\ConfigureCodec|ALT_INV_R.AddrCtr\(5) <= NOT \ConfigureCodec|R.AddrCtr\(5);
\ConfigureCodec|ALT_INV_R.AddrCtr\(6) <= NOT \ConfigureCodec|R.AddrCtr\(6);
\ConfigureCodec|ALT_INV_R.AddrCtr\(0) <= NOT \ConfigureCodec|R.AddrCtr\(0);
\ConfigureCodec|ALT_INV_R.AddrCtr\(1) <= NOT \ConfigureCodec|R.AddrCtr\(1);

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
	i => VCC,
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
	i => VCC,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => VCC,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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

-- Location: IOOBUF_X2_Y81_N76
\oMclk~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \GenClks|BMclk~DUPLICATE_q\,
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
	i => \GenClks|BMclk~DUPLICATE_q\,
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
	i => GND,
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
	i => VCC,
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
	nresync => \ALT_INV_inResetAsync~input_o\,
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

-- Location: FF_X23_Y51_N28
\GenStrobeI2C|ClkCounter[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \GenStrobeI2C|ClkCounter[0]~5_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\);

-- Location: LABCELL_X23_Y51_N54
\GenStrobeI2C|ClkCounter[0]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[0]~5_combout\ = ( !\GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\,
	combout => \GenStrobeI2C|ClkCounter[0]~5_combout\);

-- Location: FF_X23_Y51_N29
\GenStrobeI2C|ClkCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \GenStrobeI2C|ClkCounter[0]~5_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(0));

-- Location: FF_X23_Y51_N13
\GenStrobeI2C|ClkCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[2]~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(2));

-- Location: FF_X23_Y51_N11
\GenStrobeI2C|ClkCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[1]~4_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(1));

-- Location: LABCELL_X23_Y51_N9
\GenStrobeI2C|ClkCounter[1]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[1]~4_combout\ = ( \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ & ( !\GenStrobeI2C|ClkCounter\(1) ) ) # ( !\GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ & ( \GenStrobeI2C|ClkCounter\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(1),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\,
	combout => \GenStrobeI2C|ClkCounter[1]~4_combout\);

-- Location: FF_X23_Y51_N10
\GenStrobeI2C|ClkCounter[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[1]~4_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\);

-- Location: LABCELL_X23_Y51_N12
\GenStrobeI2C|ClkCounter[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[2]~3_combout\ = ( \GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\ & ( !\GenStrobeI2C|ClkCounter\(0) $ (!\GenStrobeI2C|ClkCounter\(2)) ) ) # ( !\GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\ & ( \GenStrobeI2C|ClkCounter\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenStrobeI2C|ALT_INV_ClkCounter\(0),
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter[1]~DUPLICATE_q\,
	combout => \GenStrobeI2C|ClkCounter[2]~3_combout\);

-- Location: FF_X23_Y51_N14
\GenStrobeI2C|ClkCounter[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[2]~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\);

-- Location: FF_X23_Y51_N23
\GenStrobeI2C|ClkCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[3]~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(3));

-- Location: LABCELL_X23_Y51_N21
\GenStrobeI2C|ClkCounter[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[3]~2_combout\ = ( \GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\ & ( !\GenStrobeI2C|ClkCounter\(3) $ (((!\GenStrobeI2C|ClkCounter\(0)) # (!\GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\))) ) ) # ( !\GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\ & ( 
-- \GenStrobeI2C|ClkCounter\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000101111110100000010111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_ClkCounter\(0),
	datac => \GenStrobeI2C|ALT_INV_ClkCounter[2]~DUPLICATE_q\,
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(3),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter[1]~DUPLICATE_q\,
	combout => \GenStrobeI2C|ClkCounter[3]~2_combout\);

-- Location: FF_X23_Y51_N22
\GenStrobeI2C|ClkCounter[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[3]~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\);

-- Location: LABCELL_X23_Y51_N18
\GenStrobeI2C|ClkCounter[4]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[4]~1_combout\ = ( \GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\ & ( !\GenStrobeI2C|ClkCounter\(4) $ (((!\GenStrobeI2C|ClkCounter\(0)) # ((!\GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\) # (!\GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\)))) ) ) # 
-- ( !\GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\ & ( \GenStrobeI2C|ClkCounter\(4) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000001111111100000000111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_ClkCounter\(0),
	datab => \GenStrobeI2C|ALT_INV_ClkCounter[2]~DUPLICATE_q\,
	datac => \GenStrobeI2C|ALT_INV_ClkCounter[1]~DUPLICATE_q\,
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(4),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter[3]~DUPLICATE_q\,
	combout => \GenStrobeI2C|ClkCounter[4]~1_combout\);

-- Location: FF_X23_Y51_N20
\GenStrobeI2C|ClkCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[4]~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(4));

-- Location: LABCELL_X23_Y51_N24
\GenStrobeI2C|ClkCounter[5]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[5]~0_combout\ = ( \GenStrobeI2C|ClkCounter\(5) & ( \GenStrobeI2C|ClkCounter\(2) & ( (!\GenStrobeI2C|ClkCounter\(4)) # ((!\GenStrobeI2C|ClkCounter\(1)) # ((!\GenStrobeI2C|ClkCounter\(3)) # 
-- (!\GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\))) ) ) ) # ( !\GenStrobeI2C|ClkCounter\(5) & ( \GenStrobeI2C|ClkCounter\(2) & ( (\GenStrobeI2C|ClkCounter\(4) & (\GenStrobeI2C|ClkCounter\(1) & (\GenStrobeI2C|ClkCounter\(3) & 
-- \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\))) ) ) ) # ( \GenStrobeI2C|ClkCounter\(5) & ( !\GenStrobeI2C|ClkCounter\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000011111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_ClkCounter\(4),
	datab => \GenStrobeI2C|ALT_INV_ClkCounter\(1),
	datac => \GenStrobeI2C|ALT_INV_ClkCounter\(3),
	datad => \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\,
	datae => \GenStrobeI2C|ALT_INV_ClkCounter\(5),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	combout => \GenStrobeI2C|ClkCounter[5]~0_combout\);

-- Location: FF_X23_Y51_N25
\GenStrobeI2C|ClkCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[5]~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(5));

-- Location: LABCELL_X23_Y51_N39
\GenStrobeI2C|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|Equal0~0_combout\ = ( \GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\ & ( \GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\ & ( (\GenStrobeI2C|ClkCounter\(0) & (\GenStrobeI2C|ClkCounter\(5) & (\GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\ & 
-- \GenStrobeI2C|ClkCounter\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_ClkCounter\(0),
	datab => \GenStrobeI2C|ALT_INV_ClkCounter\(5),
	datac => \GenStrobeI2C|ALT_INV_ClkCounter[2]~DUPLICATE_q\,
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(4),
	datae => \GenStrobeI2C|ALT_INV_ClkCounter[1]~DUPLICATE_q\,
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter[3]~DUPLICATE_q\,
	combout => \GenStrobeI2C|Equal0~0_combout\);

-- Location: FF_X21_Y51_N41
\GenStrobeI2C|oStrobe~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \GenStrobeI2C|Equal0~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|oStrobe~DUPLICATE_q\);

-- Location: FF_X22_Y51_N5
\ConfigureCodec|R.FrameState.Ack1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.FrameState.Ack1~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Ack1~q\);

-- Location: FF_X21_Y51_N35
\ConfigureCodec|R.Sclk~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Selector14~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Sclk~DUPLICATE_q\);

-- Location: FF_X21_Y51_N40
\GenStrobeI2C|oStrobe\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \GenStrobeI2C|Equal0~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|oStrobe~q\);

-- Location: FF_X22_Y52_N8
\ConfigureCodec|R.FrameState.Start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Selector1~1_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Start~q\);

-- Location: FF_X22_Y52_N52
\ConfigureCodec|R.Activity\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.Activity~3_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Activity~q\);

-- Location: FF_X23_Y52_N10
\ConfigureCodec|R.AddrCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.AddrCtr[0]_OTERM72\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(0));

-- Location: LABCELL_X23_Y52_N30
\ConfigureCodec|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~6\ = CARRY(( \ConfigureCodec|R.AddrCtr\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	cin => GND,
	cout => \ConfigureCodec|Add0~6\);

-- Location: LABCELL_X23_Y52_N33
\ConfigureCodec|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~1_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(1) ) + ( GND ) + ( \ConfigureCodec|Add0~6\ ))
-- \ConfigureCodec|Add0~2\ = CARRY(( \ConfigureCodec|R.AddrCtr\(1) ) + ( GND ) + ( \ConfigureCodec|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	cin => \ConfigureCodec|Add0~6\,
	sumout => \ConfigureCodec|Add0~1_sumout\,
	cout => \ConfigureCodec|Add0~2\);

-- Location: LABCELL_X23_Y52_N57
\ConfigureCodec|R.AddrCtr[1]_NEW74\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.AddrCtr[1]_OTERM75\ = ( \ConfigureCodec|R.AddrCtr[6]~0_combout\ & ( (\ConfigureCodec|R.Activity~q\ & \ConfigureCodec|Add0~1_sumout\) ) ) # ( !\ConfigureCodec|R.AddrCtr[6]~0_combout\ & ( \ConfigureCodec|R.AddrCtr\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datac => \ConfigureCodec|ALT_INV_Add0~1_sumout\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[6]~0_combout\,
	combout => \ConfigureCodec|R.AddrCtr[1]_OTERM75\);

-- Location: FF_X23_Y52_N59
\ConfigureCodec|R.AddrCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.AddrCtr[1]_OTERM75\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(1));

-- Location: LABCELL_X23_Y52_N36
\ConfigureCodec|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~25_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(2) ) + ( GND ) + ( \ConfigureCodec|Add0~2\ ))
-- \ConfigureCodec|Add0~26\ = CARRY(( \ConfigureCodec|R.AddrCtr\(2) ) + ( GND ) + ( \ConfigureCodec|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	cin => \ConfigureCodec|Add0~2\,
	sumout => \ConfigureCodec|Add0~25_sumout\,
	cout => \ConfigureCodec|Add0~26\);

-- Location: LABCELL_X23_Y52_N54
\ConfigureCodec|R.AddrCtr[2]_NEW59\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.AddrCtr[2]_OTERM60\ = ( \ConfigureCodec|R.AddrCtr[6]~0_combout\ & ( (\ConfigureCodec|R.Activity~q\ & \ConfigureCodec|Add0~25_sumout\) ) ) # ( !\ConfigureCodec|R.AddrCtr[6]~0_combout\ & ( \ConfigureCodec|R.AddrCtr\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datac => \ConfigureCodec|ALT_INV_Add0~25_sumout\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[6]~0_combout\,
	combout => \ConfigureCodec|R.AddrCtr[2]_OTERM60\);

-- Location: FF_X23_Y52_N56
\ConfigureCodec|R.AddrCtr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.AddrCtr[2]_OTERM60\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(2));

-- Location: LABCELL_X23_Y52_N39
\ConfigureCodec|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~21_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(3) ) + ( GND ) + ( \ConfigureCodec|Add0~26\ ))
-- \ConfigureCodec|Add0~22\ = CARRY(( \ConfigureCodec|R.AddrCtr\(3) ) + ( GND ) + ( \ConfigureCodec|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	cin => \ConfigureCodec|Add0~26\,
	sumout => \ConfigureCodec|Add0~21_sumout\,
	cout => \ConfigureCodec|Add0~22\);

-- Location: LABCELL_X23_Y52_N3
\ConfigureCodec|R.AddrCtr[3]_NEW62\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.AddrCtr[3]_OTERM63\ = ( \ConfigureCodec|R.AddrCtr[6]~0_combout\ & ( (\ConfigureCodec|R.Activity~q\ & \ConfigureCodec|Add0~21_sumout\) ) ) # ( !\ConfigureCodec|R.AddrCtr[6]~0_combout\ & ( \ConfigureCodec|R.AddrCtr\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datac => \ConfigureCodec|ALT_INV_Add0~21_sumout\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[6]~0_combout\,
	combout => \ConfigureCodec|R.AddrCtr[3]_OTERM63\);

-- Location: FF_X23_Y52_N5
\ConfigureCodec|R.AddrCtr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.AddrCtr[3]_OTERM63\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(3));

-- Location: LABCELL_X23_Y52_N42
\ConfigureCodec|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~17_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr[4]~DUPLICATE_q\ ) + ( GND ) + ( \ConfigureCodec|Add0~22\ ))
-- \ConfigureCodec|Add0~18\ = CARRY(( \ConfigureCodec|R.AddrCtr[4]~DUPLICATE_q\ ) + ( GND ) + ( \ConfigureCodec|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[4]~DUPLICATE_q\,
	cin => \ConfigureCodec|Add0~22\,
	sumout => \ConfigureCodec|Add0~17_sumout\,
	cout => \ConfigureCodec|Add0~18\);

-- Location: FF_X23_Y52_N19
\ConfigureCodec|R.AddrCtr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.AddrCtr[4]_OTERM66\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(4));

-- Location: LABCELL_X23_Y52_N18
\ConfigureCodec|R.AddrCtr[4]_NEW65\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.AddrCtr[4]_OTERM66\ = ( \ConfigureCodec|R.AddrCtr\(4) & ( \ConfigureCodec|R.AddrCtr[6]~0_combout\ & ( (\ConfigureCodec|R.Activity~q\ & \ConfigureCodec|Add0~17_sumout\) ) ) ) # ( !\ConfigureCodec|R.AddrCtr\(4) & ( 
-- \ConfigureCodec|R.AddrCtr[6]~0_combout\ & ( (\ConfigureCodec|R.Activity~q\ & \ConfigureCodec|Add0~17_sumout\) ) ) ) # ( \ConfigureCodec|R.AddrCtr\(4) & ( !\ConfigureCodec|R.AddrCtr[6]~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datad => \ConfigureCodec|ALT_INV_Add0~17_sumout\,
	datae => \ConfigureCodec|ALT_INV_R.AddrCtr\(4),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[6]~0_combout\,
	combout => \ConfigureCodec|R.AddrCtr[4]_OTERM66\);

-- Location: FF_X23_Y52_N20
\ConfigureCodec|R.AddrCtr[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.AddrCtr[4]_OTERM66\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr[4]~DUPLICATE_q\);

-- Location: LABCELL_X23_Y52_N45
\ConfigureCodec|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~13_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr[5]~DUPLICATE_q\ ) + ( GND ) + ( \ConfigureCodec|Add0~18\ ))
-- \ConfigureCodec|Add0~14\ = CARRY(( \ConfigureCodec|R.AddrCtr[5]~DUPLICATE_q\ ) + ( GND ) + ( \ConfigureCodec|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr[5]~DUPLICATE_q\,
	cin => \ConfigureCodec|Add0~18\,
	sumout => \ConfigureCodec|Add0~13_sumout\,
	cout => \ConfigureCodec|Add0~14\);

-- Location: FF_X23_Y52_N1
\ConfigureCodec|R.AddrCtr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.AddrCtr[5]_OTERM69\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(5));

-- Location: LABCELL_X23_Y52_N0
\ConfigureCodec|R.AddrCtr[5]_NEW68\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.AddrCtr[5]_OTERM69\ = ( \ConfigureCodec|R.AddrCtr[6]~0_combout\ & ( (\ConfigureCodec|Add0~13_sumout\ & \ConfigureCodec|R.Activity~q\) ) ) # ( !\ConfigureCodec|R.AddrCtr[6]~0_combout\ & ( \ConfigureCodec|R.AddrCtr\(5) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_Add0~13_sumout\,
	datac => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(5),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[6]~0_combout\,
	combout => \ConfigureCodec|R.AddrCtr[5]_OTERM69\);

-- Location: FF_X23_Y52_N2
\ConfigureCodec|R.AddrCtr[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.AddrCtr[5]_OTERM69\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr[5]~DUPLICATE_q\);

-- Location: LABCELL_X23_Y52_N48
\ConfigureCodec|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add0~9_sumout\ = SUM(( \ConfigureCodec|R.AddrCtr\(6) ) + ( GND ) + ( \ConfigureCodec|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(6),
	cin => \ConfigureCodec|Add0~14\,
	sumout => \ConfigureCodec|Add0~9_sumout\);

-- Location: LABCELL_X23_Y52_N15
\ConfigureCodec|R.AddrCtr[6]_NEW56\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.AddrCtr[6]_OTERM57\ = ( \ConfigureCodec|R.AddrCtr[6]~0_combout\ & ( (\ConfigureCodec|R.Activity~q\ & \ConfigureCodec|Add0~9_sumout\) ) ) # ( !\ConfigureCodec|R.AddrCtr[6]~0_combout\ & ( \ConfigureCodec|R.AddrCtr\(6) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datac => \ConfigureCodec|ALT_INV_Add0~9_sumout\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(6),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[6]~0_combout\,
	combout => \ConfigureCodec|R.AddrCtr[6]_OTERM57\);

-- Location: FF_X23_Y52_N17
\ConfigureCodec|R.AddrCtr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.AddrCtr[6]_OTERM57\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(6));

-- Location: LABCELL_X22_Y52_N30
\ConfigureCodec|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Equal0~0_combout\ = ( !\ConfigureCodec|R.AddrCtr[5]~DUPLICATE_q\ & ( !\ConfigureCodec|R.AddrCtr\(4) & ( (\ConfigureCodec|R.AddrCtr\(3) & (!\ConfigureCodec|R.AddrCtr\(6) & !\ConfigureCodec|R.AddrCtr\(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(6),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datae => \ConfigureCodec|ALT_INV_R.AddrCtr[5]~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(4),
	combout => \ConfigureCodec|Equal0~0_combout\);

-- Location: FF_X23_Y52_N58
\ConfigureCodec|R.AddrCtr[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.AddrCtr[1]_OTERM75\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\);

-- Location: FF_X21_Y51_N19
\ConfigureCodec|R.FrameState.Ack2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Selector6~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Ack2~q\);

-- Location: MLABCELL_X21_Y51_N0
\ConfigureCodec|NextStateAndOutput:vSclkFalling\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ = ( !\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	combout => \ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\);

-- Location: MLABCELL_X21_Y51_N6
\ConfigureCodec|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector5~0_combout\ = ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( (!\ConfigureCodec|R.AckError~q\ & (!\ConfigureCodec|R.Sclk~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Ack1~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000110000000000000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datac => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector5~0_combout\);

-- Location: FF_X22_Y51_N31
\ConfigureCodec|R.BitCtr[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector12~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\);

-- Location: LABCELL_X22_Y51_N33
\ConfigureCodec|Add1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add1~0_combout\ = ( \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ( !\ConfigureCodec|R.BitCtr\(2) ) ) # ( !\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ( !\ConfigureCodec|R.BitCtr\(2) $ (!\ConfigureCodec|R.BitCtr\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000011111111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	combout => \ConfigureCodec|Add1~0_combout\);

-- Location: FF_X21_Y51_N4
\ConfigureCodec|R.FrameState.Data1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector5~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Data1~q\);

-- Location: LABCELL_X22_Y51_N0
\ConfigureCodec|Selector11~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector11~1_combout\ = ( !\ConfigureCodec|Selector5~0_combout\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( (!\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ & (((!\ConfigureCodec|R.FrameState.Data1~q\) # (\ConfigureCodec|R.Sclk~q\)) # 
-- (\ConfigureCodec|Add1~0_combout\))) ) ) ) # ( !\ConfigureCodec|Selector5~0_combout\ & ( !\GenStrobeI2C|oStrobe~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011110000011100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Add1~0_combout\,
	datab => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datae => \ConfigureCodec|ALT_INV_Selector5~0_combout\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector11~1_combout\);

-- Location: LABCELL_X22_Y51_N27
\ConfigureCodec|Selector11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector11~0_combout\ = ( !\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ & ( \ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ & ( \ConfigureCodec|Selector13~1_OTERM9\ ) ) ) # ( !\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ & ( 
-- !\ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ & ( (\ConfigureCodec|Selector13~1_OTERM9\ & !\ConfigureCodec|R.FrameState.Data1~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000000000000000000001010101010101010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector13~1_OTERM9\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput:vSclkFalling~combout\,
	combout => \ConfigureCodec|Selector11~0_combout\);

-- Location: MLABCELL_X21_Y51_N24
\ConfigureCodec|Selector10~0_RTM013\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector10~0_RTM013_combout\ = ( \ConfigureCodec|Selector7~0_combout\ ) # ( !\ConfigureCodec|Selector7~0_combout\ & ( \ConfigureCodec|Selector2~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_Selector2~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_Selector7~0_combout\,
	combout => \ConfigureCodec|Selector10~0_RTM013_combout\);

-- Location: FF_X21_Y51_N25
\ConfigureCodec|Selector10~0_NEW_REG10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector10~0_RTM013_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|Selector10~0_OTERM11\);

-- Location: FF_X22_Y51_N8
\ConfigureCodec|R.BitCtr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector10~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(3));

-- Location: LABCELL_X22_Y51_N18
\ConfigureCodec|NextR~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextR~10_combout\ = ( \ConfigureCodec|R.BitCtr\(0) & ( \ConfigureCodec|R.BitCtr\(2) & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & !\ConfigureCodec|R.Sclk~q\) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(0) & ( \ConfigureCodec|R.BitCtr\(2) & ( 
-- (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & !\ConfigureCodec|R.Sclk~q\) ) ) ) # ( \ConfigureCodec|R.BitCtr\(0) & ( !\ConfigureCodec|R.BitCtr\(2) & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & !\ConfigureCodec|R.Sclk~q\) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(0) & ( 
-- !\ConfigureCodec|R.BitCtr\(2) & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & (!\ConfigureCodec|R.Sclk~q\ & ((\ConfigureCodec|R.BitCtr\(3)) # (\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000000000011110000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datac => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	combout => \ConfigureCodec|NextR~10_combout\);

-- Location: LABCELL_X22_Y51_N12
\ConfigureCodec|Selector11~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector11~2_combout\ = ( \ConfigureCodec|R.BitCtr\(2) & ( \ConfigureCodec|NextR~10_combout\ & ( (!\ConfigureCodec|Selector11~1_combout\) # ((!\ConfigureCodec|Selector11~0_combout\) # ((!\ConfigureCodec|Add1~0_combout\ & 
-- \ConfigureCodec|Selector10~0_OTERM11\))) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(2) & ( \ConfigureCodec|NextR~10_combout\ & ( (!\ConfigureCodec|Selector11~1_combout\) # ((!\ConfigureCodec|Add1~0_combout\ & \ConfigureCodec|Selector10~0_OTERM11\)) ) ) ) # ( 
-- \ConfigureCodec|R.BitCtr\(2) & ( !\ConfigureCodec|NextR~10_combout\ & ( (!\ConfigureCodec|Selector11~1_combout\) # ((!\ConfigureCodec|Selector11~0_combout\) # (\ConfigureCodec|Selector10~0_OTERM11\)) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(2) & ( 
-- !\ConfigureCodec|NextR~10_combout\ & ( !\ConfigureCodec|Selector11~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010111110101111111110101010111011101111101011111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector11~1_combout\,
	datab => \ConfigureCodec|ALT_INV_Add1~0_combout\,
	datac => \ConfigureCodec|ALT_INV_Selector11~0_combout\,
	datad => \ConfigureCodec|ALT_INV_Selector10~0_OTERM11\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_NextR~10_combout\,
	combout => \ConfigureCodec|Selector11~2_combout\);

-- Location: FF_X22_Y51_N14
\ConfigureCodec|R.BitCtr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector11~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(2));

-- Location: LABCELL_X22_Y51_N45
\ConfigureCodec|NextR~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextR~9_combout\ = ( !\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(2) & !\ConfigureCodec|R.BitCtr\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	combout => \ConfigureCodec|NextR~9_combout\);

-- Location: MLABCELL_X21_Y51_N3
\ConfigureCodec|Selector5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector5~1_combout\ = ( \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( ((\ConfigureCodec|R.FrameState.Data1~q\ & ((!\ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\) # (!\ConfigureCodec|NextR~9_combout\)))) # 
-- (\ConfigureCodec|Selector5~0_combout\) ) ) # ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (\ConfigureCodec|R.FrameState.Data1~q\) # (\ConfigureCodec|Selector5~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100110011111110110011001111111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextStateAndOutput:vSclkFalling~combout\,
	datab => \ConfigureCodec|ALT_INV_Selector5~0_combout\,
	datac => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector5~1_combout\);

-- Location: FF_X21_Y51_N5
\ConfigureCodec|R.FrameState.Data1~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector5~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\);

-- Location: MLABCELL_X21_Y51_N48
\ConfigureCodec|Selector13~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector13~2_combout\ = ( \ConfigureCodec|R.FrameState.Ack1~q\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( (!\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ((!\ConfigureCodec|R.AckError~q\) # ((\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & 
-- !\ConfigureCodec|R.BitCtr\(0))))) # (\ConfigureCodec|R.Sclk~DUPLICATE_q\ & (\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & ((\ConfigureCodec|R.BitCtr\(0))))) ) ) ) # ( !\ConfigureCodec|R.FrameState.Ack1~q\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( 
-- (\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & (!\ConfigureCodec|R.BitCtr\(0) $ (\ConfigureCodec|R.Sclk~DUPLICATE_q\))) ) ) ) # ( \ConfigureCodec|R.FrameState.Ack1~q\ & ( !\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( 
-- (\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & \ConfigureCodec|R.BitCtr\(0)) ) ) ) # ( !\ConfigureCodec|R.FrameState.Ack1~q\ & ( !\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( (\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & \ConfigureCodec|R.BitCtr\(0)) ) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010101010000000001011101110000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datad => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector13~2_combout\);

-- Location: LABCELL_X22_Y51_N57
\ConfigureCodec|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector1~0_combout\ = ( !\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector1~0_combout\);

-- Location: FF_X21_Y51_N26
\ConfigureCodec|Selector10~0_OTERM11DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector10~0_RTM013_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|Selector10~0_OTERM11DUPLICATE_q\);

-- Location: LABCELL_X22_Y51_N36
\ConfigureCodec|Selector13~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector13~3_combout\ = ( \ConfigureCodec|R.BitCtr\(0) & ( \ConfigureCodec|Selector10~0_OTERM11DUPLICATE_q\ & ( (!\ConfigureCodec|Selector13~1_OTERM9\) # (((!\ConfigureCodec|NextR~10_combout\) # (\ConfigureCodec|Selector1~0_combout\)) # 
-- (\ConfigureCodec|Selector13~2_combout\)) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(0) & ( \ConfigureCodec|Selector10~0_OTERM11DUPLICATE_q\ & ( (\ConfigureCodec|NextR~10_combout\) # (\ConfigureCodec|Selector13~2_combout\) ) ) ) # ( \ConfigureCodec|R.BitCtr\(0) 
-- & ( !\ConfigureCodec|Selector10~0_OTERM11DUPLICATE_q\ & ( (!\ConfigureCodec|Selector13~1_OTERM9\) # ((\ConfigureCodec|Selector1~0_combout\) # (\ConfigureCodec|Selector13~2_combout\)) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(0) & ( 
-- !\ConfigureCodec|Selector10~0_OTERM11DUPLICATE_q\ & ( \ConfigureCodec|Selector13~2_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011101110111111111100111111001111111111101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector13~1_OTERM9\,
	datab => \ConfigureCodec|ALT_INV_Selector13~2_combout\,
	datac => \ConfigureCodec|ALT_INV_NextR~10_combout\,
	datad => \ConfigureCodec|ALT_INV_Selector1~0_combout\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_Selector10~0_OTERM11DUPLICATE_q\,
	combout => \ConfigureCodec|Selector13~3_combout\);

-- Location: FF_X22_Y51_N38
\ConfigureCodec|R.BitCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector13~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(0));

-- Location: MLABCELL_X21_Y51_N36
\ConfigureCodec|Selector12~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector12~1_combout\ = ( \ConfigureCodec|Selector10~0_OTERM11DUPLICATE_q\ & ( \ConfigureCodec|NextR~10_combout\ & ( (!\GenStrobeI2C|oStrobe~DUPLICATE_q\ & (!\ConfigureCodec|R.BitCtr\(1) $ (((\ConfigureCodec|R.BitCtr\(0)))))) # 
-- (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ((!\ConfigureCodec|R.BitCtr\(1) $ (\ConfigureCodec|R.BitCtr\(0))) # (\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\))) ) ) ) # ( !\ConfigureCodec|Selector10~0_OTERM11DUPLICATE_q\ & ( \ConfigureCodec|NextR~10_combout\ 
-- & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\) ) ) ) # ( \ConfigureCodec|Selector10~0_OTERM11DUPLICATE_q\ & ( !\ConfigureCodec|NextR~10_combout\ & ( ((\GenStrobeI2C|oStrobe~DUPLICATE_q\ & 
-- \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\)) # (\ConfigureCodec|R.BitCtr\(1)) ) ) ) # ( !\ConfigureCodec|Selector10~0_OTERM11DUPLICATE_q\ & ( !\ConfigureCodec|NextR~10_combout\ & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & 
-- \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011010101110101011100000011000000111010101101010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datab => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datae => \ConfigureCodec|ALT_INV_Selector10~0_OTERM11DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_NextR~10_combout\,
	combout => \ConfigureCodec|Selector12~1_combout\);

-- Location: LABCELL_X22_Y51_N42
\ConfigureCodec|Selector12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector12~0_combout\ = ( \ConfigureCodec|R.AckError~q\ & ( (\ConfigureCodec|R.FrameState.Data1~q\ & (!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ $ (\ConfigureCodec|R.BitCtr\(0)))) ) ) # ( !\ConfigureCodec|R.AckError~q\ & ( 
-- ((\ConfigureCodec|R.FrameState.Data1~q\ & (!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ $ (\ConfigureCodec|R.BitCtr\(0))))) # (\ConfigureCodec|R.FrameState.Ack1~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000111111111001000011111111100100001001000010010000100100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	dataf => \ConfigureCodec|ALT_INV_R.AckError~q\,
	combout => \ConfigureCodec|Selector12~0_combout\);

-- Location: LABCELL_X22_Y51_N30
\ConfigureCodec|Selector12~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector12~2_combout\ = ( \ConfigureCodec|Selector12~0_combout\ & ( (((!\ConfigureCodec|Selector11~0_combout\ & \ConfigureCodec|R.BitCtr\(1))) # (\ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\)) # 
-- (\ConfigureCodec|Selector12~1_combout\) ) ) # ( !\ConfigureCodec|Selector12~0_combout\ & ( ((!\ConfigureCodec|Selector11~0_combout\ & \ConfigureCodec|R.BitCtr\(1))) # (\ConfigureCodec|Selector12~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111110101010101011111010101110111111101110111011111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector12~1_combout\,
	datab => \ConfigureCodec|ALT_INV_NextStateAndOutput:vSclkFalling~combout\,
	datac => \ConfigureCodec|ALT_INV_Selector11~0_combout\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_Selector12~0_combout\,
	combout => \ConfigureCodec|Selector12~2_combout\);

-- Location: FF_X22_Y51_N32
\ConfigureCodec|R.BitCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector12~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(1));

-- Location: MLABCELL_X21_Y51_N12
\ConfigureCodec|NextR~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextR~8_combout\ = ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( !\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(1) & (!\ConfigureCodec|R.BitCtr\(2) & (!\ConfigureCodec|R.BitCtr\(0) & 
-- \GenStrobeI2C|oStrobe~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datad => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	combout => \ConfigureCodec|NextR~8_combout\);

-- Location: MLABCELL_X21_Y51_N9
\ConfigureCodec|Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector7~0_combout\ = ( \ConfigureCodec|R.FrameState.Ack2~q\ & ( (!\ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ & (((!\ConfigureCodec|NextR~8_combout\ & \ConfigureCodec|R.FrameState.Data2~q\)))) # 
-- (\ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ & ((!\ConfigureCodec|R.AckError~q\) # ((!\ConfigureCodec|NextR~8_combout\ & \ConfigureCodec|R.FrameState.Data2~q\)))) ) ) # ( !\ConfigureCodec|R.FrameState.Ack2~q\ & ( 
-- (!\ConfigureCodec|NextR~8_combout\ & \ConfigureCodec|R.FrameState.Data2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000001000100111101000100010011110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextStateAndOutput:vSclkFalling~combout\,
	datab => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datac => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	combout => \ConfigureCodec|Selector7~0_combout\);

-- Location: FF_X21_Y51_N11
\ConfigureCodec|R.FrameState.Data2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector7~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Data2~q\);

-- Location: FF_X21_Y51_N17
\ConfigureCodec|R.FrameState.Ack3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Selector8~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Ack3~q\);

-- Location: MLABCELL_X21_Y51_N27
\ConfigureCodec|Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector8~0_combout\ = ( \ConfigureCodec|R.FrameState.Ack3~q\ & ( (!\ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\) # ((\ConfigureCodec|R.FrameState.Data2~q\ & \ConfigureCodec|NextR~8_combout\)) ) ) # ( 
-- !\ConfigureCodec|R.FrameState.Ack3~q\ & ( (\ConfigureCodec|R.FrameState.Data2~q\ & \ConfigureCodec|NextR~8_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010111111111000001011111111100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	datac => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	datad => \ConfigureCodec|ALT_INV_NextStateAndOutput:vSclkFalling~combout\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	combout => \ConfigureCodec|Selector8~0_combout\);

-- Location: MLABCELL_X21_Y51_N30
\ConfigureCodec|Selector13~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector13~1_combout\ = ( !\ConfigureCodec|Selector8~0_combout\ & ( \ConfigureCodec|Selector0~0_combout\ & ( (!\ConfigureCodec|Selector6~0_combout\ & (!\ConfigureCodec|Selector3~0_combout\ & (!\ConfigureCodec|Selector9~0_combout\ & 
-- !\ConfigureCodec|R.FrameState.Ack1~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector6~0_combout\,
	datab => \ConfigureCodec|ALT_INV_Selector3~0_combout\,
	datac => \ConfigureCodec|ALT_INV_Selector9~0_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~0_combout\,
	datae => \ConfigureCodec|ALT_INV_Selector8~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_Selector0~0_combout\,
	combout => \ConfigureCodec|Selector13~1_combout\);

-- Location: FF_X21_Y51_N31
\ConfigureCodec|Selector13~1_NEW_REG8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector13~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|Selector13~1_OTERM9\);

-- Location: LABCELL_X22_Y51_N48
\ConfigureCodec|Selector10~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector10~1_combout\ = ( !\ConfigureCodec|Selector5~0_combout\ & ( \ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ & ( (!\ConfigureCodec|R.FrameState.Data1~q\ & ((!\ConfigureCodec|R.BitCtr\(3)) # 
-- ((!\ConfigureCodec|Selector10~0_OTERM11DUPLICATE_q\) # (\ConfigureCodec|NextR~9_combout\)))) # (\ConfigureCodec|R.FrameState.Data1~q\ & (!\ConfigureCodec|R.BitCtr\(3) $ (((\ConfigureCodec|NextR~9_combout\))))) ) ) ) # ( 
-- !\ConfigureCodec|Selector5~0_combout\ & ( !\ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ & ( (!\ConfigureCodec|R.BitCtr\(3)) # (!\ConfigureCodec|Selector10~0_OTERM11DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110011111100000000000000000011101100101110110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datac => \ConfigureCodec|ALT_INV_Selector10~0_OTERM11DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	datae => \ConfigureCodec|ALT_INV_Selector5~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput:vSclkFalling~combout\,
	combout => \ConfigureCodec|Selector10~1_combout\);

-- Location: LABCELL_X22_Y51_N6
\ConfigureCodec|Selector10~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector10~2_combout\ = ( \ConfigureCodec|R.BitCtr\(3) & ( \ConfigureCodec|R.FrameState.Data1~q\ & ( (!\ConfigureCodec|Selector13~1_OTERM9\) # ((!\ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\) # 
-- ((!\ConfigureCodec|Selector10~1_combout\) # (\ConfigureCodec|Selector1~0_combout\))) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(3) & ( \ConfigureCodec|R.FrameState.Data1~q\ & ( !\ConfigureCodec|Selector10~1_combout\ ) ) ) # ( \ConfigureCodec|R.BitCtr\(3) & ( 
-- !\ConfigureCodec|R.FrameState.Data1~q\ & ( (!\ConfigureCodec|Selector13~1_OTERM9\) # ((!\ConfigureCodec|Selector10~1_combout\) # (\ConfigureCodec|Selector1~0_combout\)) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(3) & ( !\ConfigureCodec|R.FrameState.Data1~q\ & ( 
-- !\ConfigureCodec|Selector10~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111110101111111111110000111100001111111011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector13~1_OTERM9\,
	datab => \ConfigureCodec|ALT_INV_NextStateAndOutput:vSclkFalling~combout\,
	datac => \ConfigureCodec|ALT_INV_Selector10~1_combout\,
	datad => \ConfigureCodec|ALT_INV_Selector1~0_combout\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	combout => \ConfigureCodec|Selector10~2_combout\);

-- Location: FF_X22_Y51_N7
\ConfigureCodec|R.BitCtr[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector10~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\);

-- Location: MLABCELL_X21_Y51_N21
\ConfigureCodec|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector6~0_combout\ = ( \ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ & ( \ConfigureCodec|NextR~9_combout\ & ( (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\) ) ) ) # ( 
-- !\ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ & ( \ConfigureCodec|NextR~9_combout\ & ( \ConfigureCodec|R.FrameState.Ack2~q\ ) ) ) # ( !\ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ & ( !\ConfigureCodec|NextR~9_combout\ & ( 
-- \ConfigureCodec|R.FrameState.Ack2~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101000000000000000001010101010101010000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_NextStateAndOutput:vSclkFalling~combout\,
	dataf => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	combout => \ConfigureCodec|Selector6~0_combout\);

-- Location: MLABCELL_X21_Y51_N45
\ConfigureCodec|Selector13~0_RTM07\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector13~0_RTM07_combout\ = ( \ConfigureCodec|Selector8~0_combout\ ) # ( !\ConfigureCodec|Selector8~0_combout\ & ( (\ConfigureCodec|Selector6~0_combout\) # (\ConfigureCodec|R.FrameState.Ack1~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~0_combout\,
	datad => \ConfigureCodec|ALT_INV_Selector6~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_Selector8~0_combout\,
	combout => \ConfigureCodec|Selector13~0_RTM07_combout\);

-- Location: FF_X21_Y51_N46
\ConfigureCodec|Selector13~0_NEW_REG4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector13~0_RTM07_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|Selector13~0_OTERM5\);

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

-- Location: FF_X21_Y52_N14
\WaitCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \WaitCtr[0]~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => WaitCtr(0));

-- Location: LABCELL_X22_Y52_N24
\ConfigureCodec|R.Configured~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~0_combout\ = ( \GenStrobeI2C|oStrobe~q\ & ( (!\ConfigureCodec|R.AckError~q\ & (!\ConfigureCodec|R.Sclk~q\ & (\ConfigureCodec|R.Activity~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Stop~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000010000000000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datab => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datac => \ConfigureCodec|ALT_INV_R.Activity~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	combout => \ConfigureCodec|R.Configured~0_combout\);

-- Location: LABCELL_X22_Y52_N48
\ConfigureCodec|R.Configured~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~1_combout\ = ( \ConfigureCodec|R.Configured~q\ & ( \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( !\ConfigureCodec|R.Activity~0_combout\ ) ) ) # ( \ConfigureCodec|R.Configured~q\ & ( !\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & 
-- ( (!\ConfigureCodec|R.Activity~0_combout\) # ((\ConfigureCodec|R.Configured~0_combout\ & (\ConfigureCodec|Equal0~0_combout\ & \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\))) ) ) ) # ( !\ConfigureCodec|R.Configured~q\ & ( 
-- !\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( (\ConfigureCodec|R.Configured~0_combout\ & (\ConfigureCodec|Equal0~0_combout\ & \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001111111110000000100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Configured~0_combout\,
	datab => \ConfigureCodec|ALT_INV_Equal0~0_combout\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Activity~0_combout\,
	datae => \ConfigureCodec|ALT_INV_R.Configured~q\,
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	combout => \ConfigureCodec|R.Configured~1_combout\);

-- Location: FF_X22_Y52_N49
\ConfigureCodec|R.Configured\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Configured~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Configured~q\);

-- Location: MLABCELL_X21_Y52_N30
\WaitCtr[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WaitCtr[1]~0_combout\ = ( WaitCtr(1) & ( \ConfigureCodec|R.Configured~q\ ) ) # ( WaitCtr(1) & ( !\ConfigureCodec|R.Configured~q\ ) ) # ( !WaitCtr(1) & ( !\ConfigureCodec|R.Configured~q\ & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & WaitCtr(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datad => ALT_INV_WaitCtr(0),
	datae => ALT_INV_WaitCtr(1),
	dataf => \ConfigureCodec|ALT_INV_R.Configured~q\,
	combout => \WaitCtr[1]~0_combout\);

-- Location: FF_X21_Y52_N32
\WaitCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \WaitCtr[1]~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => WaitCtr(1));

-- Location: MLABCELL_X21_Y52_N12
\WaitCtr[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \WaitCtr[0]~1_combout\ = ( WaitCtr(0) & ( \ConfigureCodec|R.Configured~q\ ) ) # ( WaitCtr(0) & ( !\ConfigureCodec|R.Configured~q\ & ( (!\GenStrobeI2C|oStrobe~DUPLICATE_q\) # (WaitCtr(1)) ) ) ) # ( !WaitCtr(0) & ( !\ConfigureCodec|R.Configured~q\ & ( 
-- \GenStrobeI2C|oStrobe~DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111100001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datad => ALT_INV_WaitCtr(1),
	datae => ALT_INV_WaitCtr(0),
	dataf => \ConfigureCodec|ALT_INV_R.Configured~q\,
	combout => \WaitCtr[0]~1_combout\);

-- Location: FF_X21_Y52_N13
\WaitCtr[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \WaitCtr[0]~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \WaitCtr[0]~DUPLICATE_q\);

-- Location: MLABCELL_X21_Y52_N3
\Start~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Start~0_combout\ = ( \Start~q\ & ( !\ConfigureCodec|R.Configured~q\ & ( (!\GenStrobeI2C|oStrobe~DUPLICATE_q\) # ((\WaitCtr[0]~DUPLICATE_q\ & WaitCtr(1))) ) ) ) # ( !\Start~q\ & ( !\ConfigureCodec|R.Configured~q\ & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & 
-- (\WaitCtr[0]~DUPLICATE_q\ & WaitCtr(1))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001101010111010101100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datab => \ALT_INV_WaitCtr[0]~DUPLICATE_q\,
	datac => ALT_INV_WaitCtr(1),
	datae => \ALT_INV_Start~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Configured~q\,
	combout => \Start~0_combout\);

-- Location: FF_X21_Y52_N4
Start : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Start~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Start~q\);

-- Location: LABCELL_X22_Y52_N12
\ConfigureCodec|R.Activity~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Activity~0_combout\ = ( \Start~q\ & ( (\GenStrobeI2C|oStrobe~q\ & (!\ConfigureCodec|R.Activity~DUPLICATE_q\ & !\ConfigureCodec|R.FrameState.Idle~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010000000000000101000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datac => \ConfigureCodec|ALT_INV_R.Activity~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	dataf => \ALT_INV_Start~q\,
	combout => \ConfigureCodec|R.Activity~0_combout\);

-- Location: MLABCELL_X21_Y52_N54
\ConfigureCodec|Selector16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector16~0_combout\ = ( \ConfigureCodec|R.AckError~q\ & ( \ConfigureCodec|R.Activity~0_combout\ & ( (\ConfigureCodec|Selector13~0_OTERM5\ & (\ioI2cSdin~input_o\ & (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & \ConfigureCodec|R.Sclk~q\))) ) ) ) # 
-- ( !\ConfigureCodec|R.AckError~q\ & ( \ConfigureCodec|R.Activity~0_combout\ & ( (\ConfigureCodec|Selector13~0_OTERM5\ & (\ioI2cSdin~input_o\ & (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & \ConfigureCodec|R.Sclk~q\))) ) ) ) # ( \ConfigureCodec|R.AckError~q\ & ( 
-- !\ConfigureCodec|R.Activity~0_combout\ ) ) # ( !\ConfigureCodec|R.AckError~q\ & ( !\ConfigureCodec|R.Activity~0_combout\ & ( (\ConfigureCodec|Selector13~0_OTERM5\ & (\ioI2cSdin~input_o\ & (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & \ConfigureCodec|R.Sclk~q\))) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001111111111111111100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector13~0_OTERM5\,
	datab => \ALT_INV_ioI2cSdin~input_o\,
	datac => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datae => \ConfigureCodec|ALT_INV_R.AckError~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Activity~0_combout\,
	combout => \ConfigureCodec|Selector16~0_combout\);

-- Location: FF_X21_Y52_N56
\ConfigureCodec|R.AckError\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector16~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AckError~q\);

-- Location: LABCELL_X22_Y52_N45
\ConfigureCodec|R.Activity~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Activity~1_combout\ = ( \GenStrobeI2C|oStrobe~q\ & ( (\ConfigureCodec|R.FrameState.Stop~q\ & (\ConfigureCodec|R.Activity~q\ & !\ConfigureCodec|R.Sclk~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000101000000000000010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	datac => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datad => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	combout => \ConfigureCodec|R.Activity~1_combout\);

-- Location: LABCELL_X23_Y52_N27
\ConfigureCodec|R.AddrCtr[6]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.AddrCtr[6]~0_combout\ = ( \ConfigureCodec|R.Activity~0_combout\ & ( \ConfigureCodec|R.Activity~1_combout\ ) ) # ( !\ConfigureCodec|R.Activity~0_combout\ & ( \ConfigureCodec|R.Activity~1_combout\ & ( (!\ConfigureCodec|R.AckError~q\ & 
-- ((!\ConfigureCodec|Equal0~0_combout\) # ((!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\) # (\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\)))) ) ) ) # ( \ConfigureCodec|R.Activity~0_combout\ & ( !\ConfigureCodec|R.Activity~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111101111000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Equal0~0_combout\,
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datae => \ConfigureCodec|ALT_INV_R.Activity~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_R.Activity~1_combout\,
	combout => \ConfigureCodec|R.AddrCtr[6]~0_combout\);

-- Location: LABCELL_X23_Y52_N9
\ConfigureCodec|R.AddrCtr[0]_NEW71\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.AddrCtr[0]_OTERM72\ = ( \ConfigureCodec|R.AddrCtr[6]~0_combout\ & ( (\ConfigureCodec|R.Activity~q\ & !\ConfigureCodec|R.AddrCtr\(0)) ) ) # ( !\ConfigureCodec|R.AddrCtr[6]~0_combout\ & ( \ConfigureCodec|R.AddrCtr\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111101010101000000000101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[6]~0_combout\,
	combout => \ConfigureCodec|R.AddrCtr[0]_OTERM72\);

-- Location: FF_X23_Y52_N11
\ConfigureCodec|R.AddrCtr[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.AddrCtr[0]_OTERM72\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\);

-- Location: LABCELL_X22_Y52_N0
\ConfigureCodec|R.Activity~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Activity~2_combout\ = ( \ConfigureCodec|R.FrameState.Idle~q\ & ( \GenStrobeI2C|oStrobe~q\ & ( (\ConfigureCodec|R.Activity~DUPLICATE_q\ & (\ConfigureCodec|R.FrameState.Stop~q\ & !\ConfigureCodec|R.Sclk~q\)) ) ) ) # ( 
-- !\ConfigureCodec|R.FrameState.Idle~q\ & ( \GenStrobeI2C|oStrobe~q\ & ( (!\ConfigureCodec|R.Activity~DUPLICATE_q\ & (\Start~q\)) # (\ConfigureCodec|R.Activity~DUPLICATE_q\ & (((\ConfigureCodec|R.FrameState.Stop~q\ & !\ConfigureCodec|R.Sclk~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000100111001000100000010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Activity~DUPLICATE_q\,
	datab => \ALT_INV_Start~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	datad => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	combout => \ConfigureCodec|R.Activity~2_combout\);

-- Location: LABCELL_X22_Y52_N21
\ConfigureCodec|R.Activity~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Activity~3_combout\ = ( \ConfigureCodec|R.Activity~2_combout\ & ( \ConfigureCodec|Equal0~0_combout\ & ( (!\ConfigureCodec|R.Activity~q\) # ((!\ConfigureCodec|R.AckError~q\ & ((!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\) # 
-- (\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\)))) ) ) ) # ( !\ConfigureCodec|R.Activity~2_combout\ & ( \ConfigureCodec|Equal0~0_combout\ & ( \ConfigureCodec|R.Activity~q\ ) ) ) # ( \ConfigureCodec|R.Activity~2_combout\ & ( !\ConfigureCodec|Equal0~0_combout\ 
-- & ( (!\ConfigureCodec|R.Activity~q\) # (!\ConfigureCodec|R.AckError~q\) ) ) ) # ( !\ConfigureCodec|R.Activity~2_combout\ & ( !\ConfigureCodec|Equal0~0_combout\ & ( \ConfigureCodec|R.Activity~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011111111111100110000110011001100111110111111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datae => \ConfigureCodec|ALT_INV_R.Activity~2_combout\,
	dataf => \ConfigureCodec|ALT_INV_Equal0~0_combout\,
	combout => \ConfigureCodec|R.Activity~3_combout\);

-- Location: FF_X22_Y52_N53
\ConfigureCodec|R.Activity~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.Activity~3_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Activity~DUPLICATE_q\);

-- Location: LABCELL_X22_Y52_N15
\ConfigureCodec|Selector1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector1~1_combout\ = ( \ConfigureCodec|R.Activity~DUPLICATE_q\ & ( (!\GenStrobeI2C|oStrobe~q\ & (\ConfigureCodec|R.FrameState.Start~q\)) # (\GenStrobeI2C|oStrobe~q\ & ((!\ConfigureCodec|R.FrameState.Idle~q\))) ) ) # ( 
-- !\ConfigureCodec|R.Activity~DUPLICATE_q\ & ( (!\GenStrobeI2C|oStrobe~q\ & \ConfigureCodec|R.FrameState.Start~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101001011111000010100101111100001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Activity~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector1~1_combout\);

-- Location: FF_X22_Y52_N7
\ConfigureCodec|R.FrameState.Start~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Selector1~1_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\);

-- Location: MLABCELL_X21_Y51_N54
\ConfigureCodec|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector2~0_combout\ = ( \ConfigureCodec|NextR~8_combout\ & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\) ) ) # ( !\ConfigureCodec|NextR~8_combout\ & ( ((\GenStrobeI2C|oStrobe~DUPLICATE_q\ & 
-- \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\)) # (\ConfigureCodec|R.FrameState.Address~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011111000011110101111100000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	combout => \ConfigureCodec|Selector2~0_combout\);

-- Location: FF_X22_Y51_N25
\ConfigureCodec|R.FrameState.Address\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Selector2~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Address~q\);

-- Location: MLABCELL_X21_Y51_N42
\ConfigureCodec|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector3~0_combout\ = ( \ConfigureCodec|NextR~8_combout\ & ( ((\ConfigureCodec|R.FrameState.RWBit~q\ & !\ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\)) # (\ConfigureCodec|R.FrameState.Address~q\) ) ) # ( 
-- !\ConfigureCodec|NextR~8_combout\ & ( (\ConfigureCodec|R.FrameState.RWBit~q\ & !\ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100110000000001110111010101010111011101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\,
	datad => \ConfigureCodec|ALT_INV_NextStateAndOutput:vSclkFalling~combout\,
	dataf => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	combout => \ConfigureCodec|Selector3~0_combout\);

-- Location: FF_X21_Y51_N56
\ConfigureCodec|R.FrameState.RWBit\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Selector3~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.RWBit~q\);

-- Location: MLABCELL_X21_Y51_N57
\ConfigureCodec|R.FrameState.Ack1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.FrameState.Ack1~0_combout\ = (!\GenStrobeI2C|oStrobe~DUPLICATE_q\ & (\ConfigureCodec|R.FrameState.Ack1~q\)) # (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ((!\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ((\ConfigureCodec|R.FrameState.RWBit~q\))) # 
-- (\ConfigureCodec|R.Sclk~DUPLICATE_q\ & (\ConfigureCodec|R.FrameState.Ack1~q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001101110011001000110111001100100011011100110010001101110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	datac => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\,
	combout => \ConfigureCodec|R.FrameState.Ack1~0_combout\);

-- Location: FF_X22_Y51_N4
\ConfigureCodec|R.FrameState.Ack1~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.FrameState.Ack1~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Ack1~DUPLICATE_q\);

-- Location: FF_X21_Y51_N16
\ConfigureCodec|R.FrameState.Ack3~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Selector8~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Ack3~DUPLICATE_q\);

-- Location: LABCELL_X22_Y52_N9
\ConfigureCodec|Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector9~0_combout\ = ( \ConfigureCodec|R.AckError~q\ & ( \ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ & ( ((\ConfigureCodec|R.FrameState.Ack2~q\) # (\ConfigureCodec|R.FrameState.Ack3~DUPLICATE_q\)) # 
-- (\ConfigureCodec|R.FrameState.Ack1~DUPLICATE_q\) ) ) ) # ( !\ConfigureCodec|R.AckError~q\ & ( \ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ & ( \ConfigureCodec|R.FrameState.Ack3~DUPLICATE_q\ ) ) ) # ( \ConfigureCodec|R.AckError~q\ & ( 
-- !\ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ & ( \ConfigureCodec|R.FrameState.Stop~q\ ) ) ) # ( !\ConfigureCodec|R.AckError~q\ & ( !\ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ & ( \ConfigureCodec|R.FrameState.Stop~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100110011001100110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	datae => \ConfigureCodec|ALT_INV_R.AckError~q\,
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput:vSclkFalling~combout\,
	combout => \ConfigureCodec|Selector9~0_combout\);

-- Location: FF_X22_Y52_N26
\ConfigureCodec|R.FrameState.Stop\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Selector9~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Stop~q\);

-- Location: LABCELL_X22_Y52_N57
\ConfigureCodec|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector0~0_combout\ = ( \ConfigureCodec|R.Sclk~q\ & ( \GenStrobeI2C|oStrobe~q\ & ( (\ConfigureCodec|R.FrameState.Idle~q\) # (\ConfigureCodec|R.Activity~q\) ) ) ) # ( !\ConfigureCodec|R.Sclk~q\ & ( \GenStrobeI2C|oStrobe~q\ & ( 
-- (!\ConfigureCodec|R.FrameState.Stop~q\ & ((\ConfigureCodec|R.FrameState.Idle~q\) # (\ConfigureCodec|R.Activity~q\))) ) ) ) # ( \ConfigureCodec|R.Sclk~q\ & ( !\GenStrobeI2C|oStrobe~q\ & ( \ConfigureCodec|R.FrameState.Idle~q\ ) ) ) # ( 
-- !\ConfigureCodec|R.Sclk~q\ & ( !\GenStrobeI2C|oStrobe~q\ & ( \ConfigureCodec|R.FrameState.Idle~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001100110011000000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	datac => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datae => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	combout => \ConfigureCodec|Selector0~0_combout\);

-- Location: FF_X22_Y52_N56
\ConfigureCodec|R.FrameState.Idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Selector0~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Idle~q\);

-- Location: LABCELL_X22_Y52_N39
\ConfigureCodec|Selector14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector14~0_combout\ = ( \ConfigureCodec|R.Sclk~q\ & ( \GenStrobeI2C|oStrobe~q\ & ( !\ConfigureCodec|R.Activity~q\ ) ) ) # ( !\ConfigureCodec|R.Sclk~q\ & ( \GenStrobeI2C|oStrobe~q\ & ( (\ConfigureCodec|R.FrameState.Idle~q\ & 
-- (!\ConfigureCodec|R.FrameState.Stop~q\ & \ConfigureCodec|R.Activity~q\)) ) ) ) # ( \ConfigureCodec|R.Sclk~q\ & ( !\GenStrobeI2C|oStrobe~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000100000001001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	datac => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datae => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	combout => \ConfigureCodec|Selector14~0_combout\);

-- Location: FF_X21_Y51_N34
\ConfigureCodec|R.Sclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Selector14~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Sclk~q\);

-- Location: FF_X23_Y51_N59
\ConfigureCodec|R.Sdin~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector15~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Sdin~DUPLICATE_q\);

-- Location: LABCELL_X22_Y52_N42
\ConfigureCodec|Selector15~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~1_combout\ = ( !\ConfigureCodec|Selector1~1_combout\ & ( ((\GenStrobeI2C|Equal0~0_combout\ & \ConfigureCodec|R.Activity~3_combout\)) # (\ConfigureCodec|Selector0~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111111111000000111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_Equal0~0_combout\,
	datac => \ConfigureCodec|ALT_INV_R.Activity~3_combout\,
	datad => \ConfigureCodec|ALT_INV_Selector0~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_Selector1~1_combout\,
	combout => \ConfigureCodec|Selector15~1_combout\);

-- Location: FF_X22_Y52_N43
\ConfigureCodec|Selector15~1_NEW_REG0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector15~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|Selector15~1_OTERM1\);

-- Location: LABCELL_X22_Y51_N54
\ConfigureCodec|Selector15~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~2_combout\ = ( \ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ & ( (!\ConfigureCodec|R.FrameState.Stop~q\ & (!\ConfigureCodec|Selector13~0_OTERM5\ & ((\ConfigureCodec|Selector15~1_OTERM1\) # 
-- (\ConfigureCodec|R.Sdin~DUPLICATE_q\)))) ) ) # ( !\ConfigureCodec|NextStateAndOutput:vSclkFalling~combout\ & ( (!\ConfigureCodec|Selector13~0_OTERM5\ & ((\ConfigureCodec|Selector15~1_OTERM1\) # (\ConfigureCodec|R.Sdin~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000011110000001100001111000000100000101000000010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	datab => \ConfigureCodec|ALT_INV_R.Sdin~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_Selector13~0_OTERM5\,
	datad => \ConfigureCodec|ALT_INV_Selector15~1_OTERM1\,
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput:vSclkFalling~combout\,
	combout => \ConfigureCodec|Selector15~2_combout\);

-- Location: FF_X22_Y51_N13
\ConfigureCodec|R.BitCtr[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector11~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\);

-- Location: LABCELL_X23_Y51_N48
\ConfigureCodec|Selector15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~0_combout\ = ( \ConfigureCodec|R.FrameState.Address~q\ & ( (!\ConfigureCodec|R.BitCtr\(0) & (!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\)) # (\ConfigureCodec|R.BitCtr\(0) & 
-- ((!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011110000000011001111000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	combout => \ConfigureCodec|Selector15~0_combout\);

-- Location: FF_X23_Y52_N4
\ConfigureCodec|R.AddrCtr[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.AddrCtr[3]_OTERM63\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\);

-- Location: LABCELL_X22_Y52_N27
\ConfigureCodec|R.Data[15]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[15]~0_combout\ = ( \ConfigureCodec|Selector1~1_combout\ & ( (\GenStrobeI2C|Equal0~0_combout\ & \ConfigureCodec|R.Activity~3_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenStrobeI2C|ALT_INV_Equal0~0_combout\,
	datad => \ConfigureCodec|ALT_INV_R.Activity~3_combout\,
	dataf => \ConfigureCodec|ALT_INV_Selector1~1_combout\,
	combout => \ConfigureCodec|R.Data[15]~0_combout\);

-- Location: FF_X22_Y52_N28
\ConfigureCodec|R.Data[15]~0_NEW_REG2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[15]~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data[15]~0_OTERM3\);

-- Location: LABCELL_X23_Y51_N0
\ConfigureCodec|R.Data[5]_NEW24\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[5]_OTERM25\ = ( \ConfigureCodec|R.Data\(5) & ( \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.Data[15]~0_OTERM3\) # ((!\ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\ & ((!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\) # 
-- (!\ConfigureCodec|R.AddrCtr\(2))))) ) ) ) # ( !\ConfigureCodec|R.Data\(5) & ( \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\ & (\ConfigureCodec|R.Data[15]~0_OTERM3\ & ((!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\) 
-- # (!\ConfigureCodec|R.AddrCtr\(2))))) ) ) ) # ( \ConfigureCodec|R.Data\(5) & ( !\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.Data[15]~0_OTERM3\) # ((!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & 
-- (\ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\ & !\ConfigureCodec|R.AddrCtr\(2)))) ) ) ) # ( !\ConfigureCodec|R.Data\(5) & ( !\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & 
-- (\ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\ & (\ConfigureCodec|R.Data[15]~0_OTERM3\ & !\ConfigureCodec|R.AddrCtr\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000000111100101111000000001100000010001111110011111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr[3]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datae => \ConfigureCodec|ALT_INV_R.Data\(5),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	combout => \ConfigureCodec|R.Data[5]_OTERM25\);

-- Location: FF_X23_Y51_N2
\ConfigureCodec|R.Data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[5]_OTERM25\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(5));

-- Location: LABCELL_X23_Y51_N30
\ConfigureCodec|R.Data[1]_NEW28\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[1]_OTERM29\ = ( \ConfigureCodec|R.Data\(1) & ( \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.Data[15]~0_OTERM3\) # ((\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & (!\ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\ & 
-- \ConfigureCodec|R.AddrCtr\(2)))) ) ) ) # ( !\ConfigureCodec|R.Data\(1) & ( \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( (\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & (!\ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\ & (\ConfigureCodec|R.Data[15]~0_OTERM3\ & 
-- \ConfigureCodec|R.AddrCtr\(2)))) ) ) ) # ( \ConfigureCodec|R.Data\(1) & ( !\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.Data[15]~0_OTERM3\) # ((!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & (\ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\ & 
-- !\ConfigureCodec|R.AddrCtr\(2)))) ) ) ) # ( !\ConfigureCodec|R.Data\(1) & ( !\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & (\ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\ & (\ConfigureCodec|R.Data[15]~0_OTERM3\ & 
-- !\ConfigureCodec|R.AddrCtr\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000000111100101111000000000000000001001111000011110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr[3]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datae => \ConfigureCodec|ALT_INV_R.Data\(1),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	combout => \ConfigureCodec|R.Data[1]_OTERM29\);

-- Location: FF_X23_Y51_N32
\ConfigureCodec|R.Data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[1]_OTERM29\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(1));

-- Location: LABCELL_X23_Y51_N6
\ConfigureCodec|R.Data[9]_NEW26\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[9]_OTERM27\ = (!\ConfigureCodec|R.Data[15]~0_OTERM3\ & ((\ConfigureCodec|R.Data\(9)))) # (\ConfigureCodec|R.Data[15]~0_OTERM3\ & (\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111110101000001011111010100000101111101010000010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\,
	datad => \ConfigureCodec|ALT_INV_R.Data\(9),
	combout => \ConfigureCodec|R.Data[9]_OTERM27\);

-- Location: FF_X23_Y51_N8
\ConfigureCodec|R.Data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[9]_OTERM27\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(9));

-- Location: LABCELL_X23_Y51_N15
\ConfigureCodec|R.Data[13]_NEW22\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[13]_OTERM23\ = ( \ConfigureCodec|R.AddrCtr[4]~DUPLICATE_q\ & ( (\ConfigureCodec|R.Data\(13)) # (\ConfigureCodec|R.Data[15]~0_OTERM3\) ) ) # ( !\ConfigureCodec|R.AddrCtr[4]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.Data[15]~0_OTERM3\ & 
-- \ConfigureCodec|R.Data\(13)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101001010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\,
	datad => \ConfigureCodec|ALT_INV_R.Data\(13),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[4]~DUPLICATE_q\,
	combout => \ConfigureCodec|R.Data[13]_OTERM23\);

-- Location: FF_X23_Y51_N17
\ConfigureCodec|R.Data[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[13]_OTERM23\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(13));

-- Location: LABCELL_X23_Y51_N42
\ConfigureCodec|Mux9~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~2_combout\ = ( \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( \ConfigureCodec|R.Data\(13) & ( (\ConfigureCodec|R.Data\(9)) # (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\) ) ) ) # ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( 
-- \ConfigureCodec|R.Data\(13) & ( (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ((\ConfigureCodec|R.Data\(1)))) # (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (\ConfigureCodec|R.Data\(5))) ) ) ) # ( \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( 
-- !\ConfigureCodec|R.Data\(13) & ( (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & \ConfigureCodec|R.Data\(9)) ) ) ) # ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( !\ConfigureCodec|R.Data\(13) & ( (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & 
-- ((\ConfigureCodec|R.Data\(1)))) # (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (\ConfigureCodec|R.Data\(5))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011010100110101000000001111000000110101001101010000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data\(5),
	datab => \ConfigureCodec|ALT_INV_R.Data\(1),
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Data\(9),
	datae => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.Data\(13),
	combout => \ConfigureCodec|Mux9~2_combout\);

-- Location: LABCELL_X24_Y51_N18
\ConfigureCodec|R.Data[7]_NEW16\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[7]_OTERM17\ = ( \ConfigureCodec|R.Data\(7) & ( \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( !\ConfigureCodec|R.Data[15]~0_OTERM3\ ) ) ) # ( \ConfigureCodec|R.Data\(7) & ( !\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( 
-- (!\ConfigureCodec|R.Data[15]~0_OTERM3\) # ((!\ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\ & ((!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\) # (!\ConfigureCodec|R.AddrCtr\(2))))) ) ) ) # ( !\ConfigureCodec|R.Data\(7) & ( 
-- !\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\ & (\ConfigureCodec|R.Data[15]~0_OTERM3\ & ((!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\) # (!\ConfigureCodec|R.AddrCtr\(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001000111111001111100000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr[3]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datae => \ConfigureCodec|ALT_INV_R.Data\(7),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	combout => \ConfigureCodec|R.Data[7]_OTERM17\);

-- Location: FF_X24_Y51_N20
\ConfigureCodec|R.Data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[7]_OTERM17\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(7));

-- Location: LABCELL_X24_Y51_N12
\ConfigureCodec|R.Data[11]_NEW18\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[11]_OTERM19\ = ( \ConfigureCodec|R.AddrCtr\(2) & ( (\ConfigureCodec|R.Data\(11)) # (\ConfigureCodec|R.Data[15]~0_OTERM3\) ) ) # ( !\ConfigureCodec|R.AddrCtr\(2) & ( (!\ConfigureCodec|R.Data[15]~0_OTERM3\ & 
-- \ConfigureCodec|R.Data\(11)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\,
	datad => \ConfigureCodec|ALT_INV_R.Data\(11),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	combout => \ConfigureCodec|R.Data[11]_OTERM19\);

-- Location: FF_X24_Y51_N14
\ConfigureCodec|R.Data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[11]_OTERM19\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(11));

-- Location: LABCELL_X24_Y51_N15
\ConfigureCodec|R.Data[15]_NEW14\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[15]_OTERM15\ = ( \ConfigureCodec|R.AddrCtr\(6) & ( (\ConfigureCodec|R.Data\(15)) # (\ConfigureCodec|R.Data[15]~0_OTERM3\) ) ) # ( !\ConfigureCodec|R.AddrCtr\(6) & ( (!\ConfigureCodec|R.Data[15]~0_OTERM3\ & 
-- \ConfigureCodec|R.Data\(15)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\,
	datad => \ConfigureCodec|ALT_INV_R.Data\(15),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(6),
	combout => \ConfigureCodec|R.Data[15]_OTERM15\);

-- Location: FF_X24_Y51_N17
\ConfigureCodec|R.Data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[15]_OTERM15\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(15));

-- Location: LABCELL_X24_Y51_N3
\ConfigureCodec|R.Data[3]_NEW20\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[3]_OTERM21\ = ( \ConfigureCodec|R.AddrCtr\(2) & ( (!\ConfigureCodec|R.Data[15]~0_OTERM3\ & \ConfigureCodec|R.Data\(3)) ) ) # ( !\ConfigureCodec|R.AddrCtr\(2) & ( (!\ConfigureCodec|R.Data[15]~0_OTERM3\ & 
-- ((\ConfigureCodec|R.Data\(3)))) # (\ConfigureCodec|R.Data[15]~0_OTERM3\ & (\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111001111000000111100111100000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Data\(3),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	combout => \ConfigureCodec|R.Data[3]_OTERM21\);

-- Location: FF_X24_Y51_N5
\ConfigureCodec|R.Data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[3]_OTERM21\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(3));

-- Location: LABCELL_X24_Y51_N39
\ConfigureCodec|Mux9~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~3_combout\ = ( \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( \ConfigureCodec|R.Data\(15) ) ) ) # ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( 
-- \ConfigureCodec|R.Data\(7) ) ) ) # ( \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( !\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( \ConfigureCodec|R.Data\(11) ) ) ) # ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( !\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & 
-- ( \ConfigureCodec|R.Data\(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111001100110011001101010101010101010000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data\(7),
	datab => \ConfigureCodec|ALT_INV_R.Data\(11),
	datac => \ConfigureCodec|ALT_INV_R.Data\(15),
	datad => \ConfigureCodec|ALT_INV_R.Data\(3),
	datae => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux9~3_combout\);

-- Location: LABCELL_X24_Y51_N48
\ConfigureCodec|R.Data[0]_NEW40\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[0]_OTERM41\ = ( \ConfigureCodec|R.Data\(0) & ( \ConfigureCodec|R.Data[15]~0_OTERM3\ & ( (!\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ $ (((!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\) # (!\ConfigureCodec|R.AddrCtr\(2))))) # 
-- (\ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\) ) ) ) # ( !\ConfigureCodec|R.Data\(0) & ( \ConfigureCodec|R.Data[15]~0_OTERM3\ & ( (!\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ $ (((!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\) # 
-- (!\ConfigureCodec|R.AddrCtr\(2))))) # (\ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\) ) ) ) # ( \ConfigureCodec|R.Data\(0) & ( !\ConfigureCodec|R.Data[15]~0_OTERM3\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111101110111011111010111011101111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[3]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datae => \ConfigureCodec|ALT_INV_R.Data\(0),
	dataf => \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\,
	combout => \ConfigureCodec|R.Data[0]_OTERM41\);

-- Location: FF_X24_Y51_N50
\ConfigureCodec|R.Data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[0]_OTERM41\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(0));

-- Location: LABCELL_X24_Y51_N54
\ConfigureCodec|R.Data[4]_NEW38\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[4]_OTERM39\ = ( \ConfigureCodec|R.AddrCtr\(2) & ( (!\ConfigureCodec|R.Data[15]~0_OTERM3\ & (((\ConfigureCodec|R.Data\(4))))) # (\ConfigureCodec|R.Data[15]~0_OTERM3\ & (!\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & 
-- (!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\))) ) ) # ( !\ConfigureCodec|R.AddrCtr\(2) & ( (!\ConfigureCodec|R.Data[15]~0_OTERM3\ & ((\ConfigureCodec|R.Data\(4)))) # (\ConfigureCodec|R.Data[15]~0_OTERM3\ & (\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000110111011000100011011101101000000111010100100000011101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\,
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Data\(4),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	combout => \ConfigureCodec|R.Data[4]_OTERM39\);

-- Location: FF_X24_Y51_N56
\ConfigureCodec|R.Data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[4]_OTERM39\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(4));

-- Location: LABCELL_X23_Y51_N51
\ConfigureCodec|R.Data[12]_NEW42\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[12]_OTERM43\ = (!\ConfigureCodec|R.Data[15]~0_OTERM3\ & ((\ConfigureCodec|R.Data\(12)))) # (\ConfigureCodec|R.Data[15]~0_OTERM3\ & (\ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110101111000001011010111100000101101011110000010110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[3]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Data\(12),
	combout => \ConfigureCodec|R.Data[12]_OTERM43\);

-- Location: FF_X23_Y51_N52
\ConfigureCodec|R.Data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[12]_OTERM43\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(12));

-- Location: LABCELL_X24_Y51_N27
\ConfigureCodec|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~0_combout\ = ( \ConfigureCodec|R.Data\(4) & ( \ConfigureCodec|R.Data\(12) & ( ((\ConfigureCodec|R.Data\(0) & !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\)) # (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\) ) ) ) # ( 
-- !\ConfigureCodec|R.Data\(4) & ( \ConfigureCodec|R.Data\(12) & ( (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (\ConfigureCodec|R.Data\(0) & !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\)) # (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & 
-- ((\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\))) ) ) ) # ( \ConfigureCodec|R.Data\(4) & ( !\ConfigureCodec|R.Data\(12) & ( (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ((\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\) # (\ConfigureCodec|R.Data\(0)))) ) ) ) # ( 
-- !\ConfigureCodec|R.Data\(4) & ( !\ConfigureCodec|R.Data\(12) & ( (\ConfigureCodec|R.Data\(0) & (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000000000010111110000000001010000000011110101111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data\(0),
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.Data\(4),
	dataf => \ConfigureCodec|ALT_INV_R.Data\(12),
	combout => \ConfigureCodec|Mux9~0_combout\);

-- Location: LABCELL_X24_Y51_N57
\ConfigureCodec|R.Data[10]_NEW34\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[10]_OTERM35\ = (!\ConfigureCodec|R.Data[15]~0_OTERM3\ & ((\ConfigureCodec|R.Data\(10)))) # (\ConfigureCodec|R.Data[15]~0_OTERM3\ & (\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000110111011000100011011101100010001101110110001000110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\,
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Data\(10),
	combout => \ConfigureCodec|R.Data[10]_OTERM35\);

-- Location: FF_X24_Y51_N59
\ConfigureCodec|R.Data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[10]_OTERM35\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(10));

-- Location: LABCELL_X24_Y51_N0
\ConfigureCodec|R.Data[14]_NEW30\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[14]_OTERM31\ = (!\ConfigureCodec|R.Data[15]~0_OTERM3\ & ((\ConfigureCodec|R.Data\(14)))) # (\ConfigureCodec|R.Data[15]~0_OTERM3\ & (\ConfigureCodec|R.AddrCtr\(5)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111001111000000111100111100000011110011110000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(5),
	datad => \ConfigureCodec|ALT_INV_R.Data\(14),
	combout => \ConfigureCodec|R.Data[14]_OTERM31\);

-- Location: FF_X24_Y51_N2
\ConfigureCodec|R.Data[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[14]_OTERM31\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(14));

-- Location: LABCELL_X24_Y51_N6
\ConfigureCodec|R.Data[2]_NEW36\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[2]_OTERM37\ = ( \ConfigureCodec|R.AddrCtr\(2) & ( (!\ConfigureCodec|R.Data[15]~0_OTERM3\ & (((\ConfigureCodec|R.Data\(2))))) # (\ConfigureCodec|R.Data[15]~0_OTERM3\ & (!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & 
-- (!\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\))) ) ) # ( !\ConfigureCodec|R.AddrCtr\(2) & ( (!\ConfigureCodec|R.Data[15]~0_OTERM3\ & \ConfigureCodec|R.Data\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001000111110000000100011111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\,
	datad => \ConfigureCodec|ALT_INV_R.Data\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	combout => \ConfigureCodec|R.Data[2]_OTERM37\);

-- Location: FF_X24_Y51_N8
\ConfigureCodec|R.Data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[2]_OTERM37\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(2));

-- Location: LABCELL_X24_Y51_N9
\ConfigureCodec|R.Data[6]_NEW32\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[6]_OTERM33\ = ( \ConfigureCodec|R.AddrCtr\(2) & ( (!\ConfigureCodec|R.Data[15]~0_OTERM3\ & ((\ConfigureCodec|R.Data\(6)))) # (\ConfigureCodec|R.Data[15]~0_OTERM3\ & (!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\)) ) ) # ( 
-- !\ConfigureCodec|R.AddrCtr\(2) & ( (!\ConfigureCodec|R.Data[15]~0_OTERM3\ & ((\ConfigureCodec|R.Data\(6)))) # (\ConfigureCodec|R.Data[15]~0_OTERM3\ & (\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111110011000000111111001100001010111110100000101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.Data[15]~0_OTERM3\,
	datad => \ConfigureCodec|ALT_INV_R.Data\(6),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	combout => \ConfigureCodec|R.Data[6]_OTERM33\);

-- Location: FF_X24_Y51_N10
\ConfigureCodec|R.Data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Data[6]_OTERM33\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(6));

-- Location: LABCELL_X24_Y51_N42
\ConfigureCodec|Mux9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~1_combout\ = ( \ConfigureCodec|R.Data\(6) & ( \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\) # (\ConfigureCodec|R.Data\(14)) ) ) ) # ( !\ConfigureCodec|R.Data\(6) & ( 
-- \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & \ConfigureCodec|R.Data\(14)) ) ) ) # ( \ConfigureCodec|R.Data\(6) & ( !\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & 
-- ((\ConfigureCodec|R.Data\(2)))) # (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & (\ConfigureCodec|R.Data\(10))) ) ) ) # ( !\ConfigureCodec|R.Data\(6) & ( !\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & 
-- ((\ConfigureCodec|R.Data\(2)))) # (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & (\ConfigureCodec|R.Data\(10))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000110111011000100011011101100000101000001011010111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.Data\(10),
	datac => \ConfigureCodec|ALT_INV_R.Data\(14),
	datad => \ConfigureCodec|ALT_INV_R.Data\(2),
	datae => \ConfigureCodec|ALT_INV_R.Data\(6),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux9~1_combout\);

-- Location: LABCELL_X24_Y51_N30
\ConfigureCodec|Mux9~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~4_combout\ = ( \ConfigureCodec|Mux9~0_combout\ & ( \ConfigureCodec|Mux9~1_combout\ & ( (!\ConfigureCodec|R.BitCtr\(0)) # ((!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & (\ConfigureCodec|Mux9~2_combout\)) # 
-- (\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ((\ConfigureCodec|Mux9~3_combout\)))) ) ) ) # ( !\ConfigureCodec|Mux9~0_combout\ & ( \ConfigureCodec|Mux9~1_combout\ & ( (!\ConfigureCodec|R.BitCtr\(0) & (((\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\)))) # 
-- (\ConfigureCodec|R.BitCtr\(0) & ((!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & (\ConfigureCodec|Mux9~2_combout\)) # (\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ((\ConfigureCodec|Mux9~3_combout\))))) ) ) ) # ( \ConfigureCodec|Mux9~0_combout\ & ( 
-- !\ConfigureCodec|Mux9~1_combout\ & ( (!\ConfigureCodec|R.BitCtr\(0) & (((!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\)))) # (\ConfigureCodec|R.BitCtr\(0) & ((!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & (\ConfigureCodec|Mux9~2_combout\)) # 
-- (\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ((\ConfigureCodec|Mux9~3_combout\))))) ) ) ) # ( !\ConfigureCodec|Mux9~0_combout\ & ( !\ConfigureCodec|Mux9~1_combout\ & ( (\ConfigureCodec|R.BitCtr\(0) & ((!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & 
-- (\ConfigureCodec|Mux9~2_combout\)) # (\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ((\ConfigureCodec|Mux9~3_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010101101100001011010100011010000111111011101010111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datab => \ConfigureCodec|ALT_INV_Mux9~2_combout\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_Mux9~3_combout\,
	datae => \ConfigureCodec|ALT_INV_Mux9~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_Mux9~1_combout\,
	combout => \ConfigureCodec|Mux9~4_combout\);

-- Location: LABCELL_X23_Y51_N57
\ConfigureCodec|Selector15~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~3_combout\ = ( \ConfigureCodec|Mux9~4_combout\ & ( (\ConfigureCodec|Selector15~2_combout\ & (!\ConfigureCodec|R.FrameState.Data2~q\ & (!\ConfigureCodec|Selector15~0_combout\ & !\ConfigureCodec|R.FrameState.Data1~q\))) ) ) # ( 
-- !\ConfigureCodec|Mux9~4_combout\ & ( (\ConfigureCodec|Selector15~2_combout\ & !\ConfigureCodec|Selector15~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000001000000000000000100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector15~2_combout\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	datac => \ConfigureCodec|ALT_INV_Selector15~0_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	dataf => \ConfigureCodec|ALT_INV_Mux9~4_combout\,
	combout => \ConfigureCodec|Selector15~3_combout\);

-- Location: FF_X23_Y51_N58
\ConfigureCodec|R.Sdin\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector15~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Sdin~q\);

-- Location: FF_X24_Y52_N59
\GenClks|BMclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|BMclk~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|BMclk~q\);

-- Location: LABCELL_X23_Y52_N12
\GenClks|ClkCounter[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|ClkCounter[0]~0_combout\ = !\GenClks|ClkCounter\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \GenClks|ALT_INV_ClkCounter\(0),
	combout => \GenClks|ClkCounter[0]~0_combout\);

-- Location: FF_X23_Y52_N14
\GenClks|ClkCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|ClkCounter[0]~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|ClkCounter\(0));

-- Location: LABCELL_X24_Y52_N57
\GenClks|BMclk~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|BMclk~0_combout\ = ( \GenClks|ClkCounter\(0) & ( !\GenClks|BMclk~q\ ) ) # ( !\GenClks|ClkCounter\(0) & ( \GenClks|BMclk~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \GenClks|ALT_INV_BMclk~q\,
	dataf => \GenClks|ALT_INV_ClkCounter\(0),
	combout => \GenClks|BMclk~0_combout\);

-- Location: FF_X24_Y52_N58
\GenClks|BMclk~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|BMclk~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|BMclk~DUPLICATE_q\);

-- Location: LABCELL_X24_Y52_N15
\GenClks|ADClrc~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|ADClrc~0_combout\ = ( \GenClks|ClkCounter\(0) & ( \GenClks|BMclk~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \GenClks|ALT_INV_BMclk~q\,
	dataf => \GenClks|ALT_INV_ClkCounter\(0),
	combout => \GenClks|ADClrc~0_combout\);

-- Location: LABCELL_X23_Y52_N6
\GenClks|BitCounter[0]_NEW50\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|BitCounter[0]_OTERM51\ = !\GenClks|ADClrc~0_combout\ $ (!\GenClks|BitCounter\(0))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000011111111000000001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenClks|ALT_INV_ADClrc~0_combout\,
	datad => \GenClks|ALT_INV_BitCounter\(0),
	combout => \GenClks|BitCounter[0]_OTERM51\);

-- Location: FF_X23_Y52_N8
\GenClks|BitCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|BitCounter[0]_OTERM51\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|BitCounter\(0));

-- Location: FF_X24_Y52_N1
\GenClks|BitCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|BitCounter[1]_OTERM53\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|BitCounter\(1));

-- Location: FF_X23_Y52_N7
\GenClks|BitCounter[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|BitCounter[0]_OTERM51\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|BitCounter[0]~DUPLICATE_q\);

-- Location: LABCELL_X24_Y52_N30
\GenClks|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add0~10\ = CARRY(( \GenClks|BitCounter[0]~DUPLICATE_q\ ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \GenClks|ALT_INV_BitCounter[0]~DUPLICATE_q\,
	cin => GND,
	cout => \GenClks|Add0~10\);

-- Location: LABCELL_X24_Y52_N33
\GenClks|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add0~5_sumout\ = SUM(( \GenClks|BitCounter[1]~DUPLICATE_q\ ) + ( GND ) + ( \GenClks|Add0~10\ ))
-- \GenClks|Add0~6\ = CARRY(( \GenClks|BitCounter[1]~DUPLICATE_q\ ) + ( GND ) + ( \GenClks|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \GenClks|ALT_INV_BitCounter[1]~DUPLICATE_q\,
	cin => \GenClks|Add0~10\,
	sumout => \GenClks|Add0~5_sumout\,
	cout => \GenClks|Add0~6\);

-- Location: LABCELL_X24_Y52_N0
\GenClks|BitCounter[1]_NEW52\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|BitCounter[1]_OTERM53\ = ( \GenClks|Add0~5_sumout\ & ( (\GenClks|BitCounter\(1)) # (\GenClks|ADClrc~0_combout\) ) ) # ( !\GenClks|Add0~5_sumout\ & ( (!\GenClks|ADClrc~0_combout\ & \GenClks|BitCounter\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenClks|ALT_INV_ADClrc~0_combout\,
	datad => \GenClks|ALT_INV_BitCounter\(1),
	dataf => \GenClks|ALT_INV_Add0~5_sumout\,
	combout => \GenClks|BitCounter[1]_OTERM53\);

-- Location: FF_X24_Y52_N2
\GenClks|BitCounter[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|BitCounter[1]_OTERM53\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|BitCounter[1]~DUPLICATE_q\);

-- Location: LABCELL_X24_Y52_N36
\GenClks|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add0~1_sumout\ = SUM(( \GenClks|BitCounter[2]~DUPLICATE_q\ ) + ( GND ) + ( \GenClks|Add0~6\ ))
-- \GenClks|Add0~2\ = CARRY(( \GenClks|BitCounter[2]~DUPLICATE_q\ ) + ( GND ) + ( \GenClks|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenClks|ALT_INV_BitCounter[2]~DUPLICATE_q\,
	cin => \GenClks|Add0~6\,
	sumout => \GenClks|Add0~1_sumout\,
	cout => \GenClks|Add0~2\);

-- Location: FF_X24_Y52_N25
\GenClks|BitCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|BitCounter[2]_OTERM55\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|BitCounter\(2));

-- Location: LABCELL_X24_Y52_N24
\GenClks|BitCounter[2]_NEW54\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|BitCounter[2]_OTERM55\ = (!\GenClks|ADClrc~0_combout\ & ((\GenClks|BitCounter\(2)))) # (\GenClks|ADClrc~0_combout\ & (\GenClks|Add0~1_sumout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111001111000000111100111100000011110011110000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenClks|ALT_INV_ADClrc~0_combout\,
	datac => \GenClks|ALT_INV_Add0~1_sumout\,
	datad => \GenClks|ALT_INV_BitCounter\(2),
	combout => \GenClks|BitCounter[2]_OTERM55\);

-- Location: FF_X24_Y52_N26
\GenClks|BitCounter[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|BitCounter[2]_OTERM55\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|BitCounter[2]~DUPLICATE_q\);

-- Location: LABCELL_X24_Y52_N39
\GenClks|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add0~29_sumout\ = SUM(( \GenClks|BitCounter\(3) ) + ( GND ) + ( \GenClks|Add0~2\ ))
-- \GenClks|Add0~30\ = CARRY(( \GenClks|BitCounter\(3) ) + ( GND ) + ( \GenClks|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \GenClks|ALT_INV_BitCounter\(3),
	cin => \GenClks|Add0~2\,
	sumout => \GenClks|Add0~29_sumout\,
	cout => \GenClks|Add0~30\);

-- Location: LABCELL_X24_Y52_N21
\GenClks|BitCounter~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|BitCounter~1_combout\ = ( \GenClks|BitCounter\(2) & ( (\GenClks|Add0~29_sumout\ & ((!\GenClks|Equal0~0_combout\) # ((!\GenClks|BitCounter\(0)) # (!\GenClks|BitCounter\(1))))) ) ) # ( !\GenClks|BitCounter\(2) & ( \GenClks|Add0~29_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011100000111100001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenClks|ALT_INV_Equal0~0_combout\,
	datab => \GenClks|ALT_INV_BitCounter\(0),
	datac => \GenClks|ALT_INV_Add0~29_sumout\,
	datad => \GenClks|ALT_INV_BitCounter\(1),
	dataf => \GenClks|ALT_INV_BitCounter\(2),
	combout => \GenClks|BitCounter~1_combout\);

-- Location: FF_X24_Y52_N23
\GenClks|BitCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|BitCounter~1_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \GenClks|ADClrc~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|BitCounter\(3));

-- Location: LABCELL_X24_Y52_N42
\GenClks|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add0~25_sumout\ = SUM(( \GenClks|BitCounter\(4) ) + ( GND ) + ( \GenClks|Add0~30\ ))
-- \GenClks|Add0~26\ = CARRY(( \GenClks|BitCounter\(4) ) + ( GND ) + ( \GenClks|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \GenClks|ALT_INV_BitCounter\(4),
	cin => \GenClks|Add0~30\,
	sumout => \GenClks|Add0~25_sumout\,
	cout => \GenClks|Add0~26\);

-- Location: LABCELL_X24_Y52_N27
\GenClks|BitCounter[4]_NEW44\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|BitCounter[4]_OTERM45\ = ( \GenClks|Add0~25_sumout\ & ( (\GenClks|BitCounter\(4)) # (\GenClks|ADClrc~0_combout\) ) ) # ( !\GenClks|Add0~25_sumout\ & ( (!\GenClks|ADClrc~0_combout\ & \GenClks|BitCounter\(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenClks|ALT_INV_ADClrc~0_combout\,
	datad => \GenClks|ALT_INV_BitCounter\(4),
	dataf => \GenClks|ALT_INV_Add0~25_sumout\,
	combout => \GenClks|BitCounter[4]_OTERM45\);

-- Location: FF_X24_Y52_N29
\GenClks|BitCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|BitCounter[4]_OTERM45\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|BitCounter\(4));

-- Location: FF_X24_Y52_N19
\GenClks|BitCounter[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|BitCounter~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \GenClks|ADClrc~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|BitCounter[7]~DUPLICATE_q\);

-- Location: LABCELL_X24_Y52_N45
\GenClks|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add0~21_sumout\ = SUM(( \GenClks|BitCounter\(5) ) + ( GND ) + ( \GenClks|Add0~26\ ))
-- \GenClks|Add0~22\ = CARRY(( \GenClks|BitCounter\(5) ) + ( GND ) + ( \GenClks|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenClks|ALT_INV_BitCounter\(5),
	cin => \GenClks|Add0~26\,
	sumout => \GenClks|Add0~21_sumout\,
	cout => \GenClks|Add0~22\);

-- Location: LABCELL_X24_Y52_N12
\GenClks|BitCounter[5]_NEW46\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|BitCounter[5]_OTERM47\ = ( \GenClks|Add0~21_sumout\ & ( (\GenClks|BitCounter\(5)) # (\GenClks|ADClrc~0_combout\) ) ) # ( !\GenClks|Add0~21_sumout\ & ( (!\GenClks|ADClrc~0_combout\ & \GenClks|BitCounter\(5)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenClks|ALT_INV_ADClrc~0_combout\,
	datad => \GenClks|ALT_INV_BitCounter\(5),
	dataf => \GenClks|ALT_INV_Add0~21_sumout\,
	combout => \GenClks|BitCounter[5]_OTERM47\);

-- Location: FF_X24_Y52_N14
\GenClks|BitCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|BitCounter[5]_OTERM47\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|BitCounter\(5));

-- Location: LABCELL_X24_Y52_N48
\GenClks|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add0~17_sumout\ = SUM(( \GenClks|BitCounter\(6) ) + ( GND ) + ( \GenClks|Add0~22\ ))
-- \GenClks|Add0~18\ = CARRY(( \GenClks|BitCounter\(6) ) + ( GND ) + ( \GenClks|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenClks|ALT_INV_BitCounter\(6),
	cin => \GenClks|Add0~22\,
	sumout => \GenClks|Add0~17_sumout\,
	cout => \GenClks|Add0~18\);

-- Location: LABCELL_X24_Y52_N3
\GenClks|BitCounter[6]_NEW48\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|BitCounter[6]_OTERM49\ = ( \GenClks|Add0~17_sumout\ & ( (\GenClks|BitCounter\(6)) # (\GenClks|ADClrc~0_combout\) ) ) # ( !\GenClks|Add0~17_sumout\ & ( (!\GenClks|ADClrc~0_combout\ & \GenClks|BitCounter\(6)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenClks|ALT_INV_ADClrc~0_combout\,
	datad => \GenClks|ALT_INV_BitCounter\(6),
	dataf => \GenClks|ALT_INV_Add0~17_sumout\,
	combout => \GenClks|BitCounter[6]_OTERM49\);

-- Location: FF_X24_Y52_N5
\GenClks|BitCounter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|BitCounter[6]_OTERM49\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|BitCounter\(6));

-- Location: LABCELL_X24_Y52_N51
\GenClks|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Add0~13_sumout\ = SUM(( \GenClks|BitCounter[7]~DUPLICATE_q\ ) + ( GND ) + ( \GenClks|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenClks|ALT_INV_BitCounter[7]~DUPLICATE_q\,
	cin => \GenClks|Add0~18\,
	sumout => \GenClks|Add0~13_sumout\);

-- Location: LABCELL_X24_Y52_N18
\GenClks|BitCounter~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|BitCounter~0_combout\ = ( \GenClks|Add0~13_sumout\ & ( (!\GenClks|Equal0~0_combout\) # ((!\GenClks|BitCounter\(0)) # ((!\GenClks|BitCounter[2]~DUPLICATE_q\) # (!\GenClks|BitCounter\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111101111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenClks|ALT_INV_Equal0~0_combout\,
	datab => \GenClks|ALT_INV_BitCounter\(0),
	datac => \GenClks|ALT_INV_BitCounter[2]~DUPLICATE_q\,
	datad => \GenClks|ALT_INV_BitCounter\(1),
	dataf => \GenClks|ALT_INV_Add0~13_sumout\,
	combout => \GenClks|BitCounter~0_combout\);

-- Location: FF_X24_Y52_N20
\GenClks|BitCounter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|BitCounter~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \GenClks|ADClrc~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|BitCounter\(7));

-- Location: LABCELL_X24_Y52_N54
\GenClks|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|Equal0~0_combout\ = ( !\GenClks|BitCounter\(5) & ( (!\GenClks|BitCounter\(4) & (!\GenClks|BitCounter\(3) & (\GenClks|BitCounter\(7) & !\GenClks|BitCounter\(6)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000010000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenClks|ALT_INV_BitCounter\(4),
	datab => \GenClks|ALT_INV_BitCounter\(3),
	datac => \GenClks|ALT_INV_BitCounter\(7),
	datad => \GenClks|ALT_INV_BitCounter\(6),
	dataf => \GenClks|ALT_INV_BitCounter\(5),
	combout => \GenClks|Equal0~0_combout\);

-- Location: LABCELL_X24_Y52_N6
\GenClks|ADClrc~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenClks|ADClrc~1_combout\ = ( \GenClks|ADClrc~q\ & ( \GenClks|BitCounter\(1) & ( (!\GenClks|Equal0~0_combout\) # ((!\GenClks|BitCounter\(0)) # ((!\GenClks|BitCounter[2]~DUPLICATE_q\) # (!\GenClks|ADClrc~0_combout\))) ) ) ) # ( !\GenClks|ADClrc~q\ & ( 
-- \GenClks|BitCounter\(1) & ( (\GenClks|Equal0~0_combout\ & (\GenClks|BitCounter\(0) & (\GenClks|BitCounter[2]~DUPLICATE_q\ & \GenClks|ADClrc~0_combout\))) ) ) ) # ( \GenClks|ADClrc~q\ & ( !\GenClks|BitCounter\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000011111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenClks|ALT_INV_Equal0~0_combout\,
	datab => \GenClks|ALT_INV_BitCounter\(0),
	datac => \GenClks|ALT_INV_BitCounter[2]~DUPLICATE_q\,
	datad => \GenClks|ALT_INV_ADClrc~0_combout\,
	datae => \GenClks|ALT_INV_ADClrc~q\,
	dataf => \GenClks|ALT_INV_BitCounter\(1),
	combout => \GenClks|ADClrc~1_combout\);

-- Location: FF_X24_Y52_N7
\GenClks|ADClrc\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL_50MHz_48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenClks|ADClrc~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenClks|ADClrc~q\);

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

-- Location: LABCELL_X45_Y6_N3
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


