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

-- DATE "11/01/2021 00:32:59"

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

ENTITY 	TbdI2sParI2s IS
    PORT (
	iClk : IN std_logic;
	inResetAsync : IN std_logic;
	oI2cSclk : OUT std_logic;
	ioI2cSdin : INOUT std_logic;
	oMclk : OUT std_logic;
	oBclk : OUT std_logic;
	iADCdat : IN std_logic;
	oADClrc : OUT std_logic;
	oDACdat : OUT std_logic;
	oDAClrc : OUT std_logic;
	oLed : OUT IEEE.STD_LOGIC_1164.std_ulogic_vector(9 DOWNTO 0)
	);
END TbdI2sParI2s;

-- Design Ports Information
-- oI2cSclk	=>  Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oMclk	=>  Location: PIN_G7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oBclk	=>  Location: PIN_H7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oADClrc	=>  Location: PIN_K8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oDACdat	=>  Location: PIN_J7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- oDAClrc	=>  Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
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
-- ioI2cSdin	=>  Location: PIN_K12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- inResetAsync	=>  Location: PIN_AA14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iClk	=>  Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iADCdat	=>  Location: PIN_K7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF TbdI2sParI2s IS
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
SIGNAL ww_oI2cSclk : std_logic;
SIGNAL ww_oMclk : std_logic;
SIGNAL ww_oBclk : std_logic;
SIGNAL ww_iADCdat : std_logic;
SIGNAL ww_oADClrc : std_logic;
SIGNAL ww_oDACdat : std_logic;
SIGNAL ww_oDAClrc : std_logic;
SIGNAL ww_oLed : std_logic_vector(9 DOWNTO 0);
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \iClk~input_o\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\ : std_logic;
SIGNAL \inResetAsync~input_o\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ : std_logic;
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\ : std_logic;
SIGNAL \ioI2cSdin~input_o\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[0]~5_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[1]~4_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[2]~3_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[3]~2_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[4]~1_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[5]~0_combout\ : std_logic;
SIGNAL \GenStrobeI2C|Equal0~0_combout\ : std_logic;
SIGNAL \GenStrobeI2C|oStrobe~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Add0~1_sumout\ : std_logic;
SIGNAL \ConfigureCodec|R.Sclk~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|oStrobe~q\ : std_logic;
SIGNAL \ConfigureCodec|NextStateAndOutput~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Start~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector1~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data2~q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Address~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector11~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.RWBit~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector3~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.RWBit~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector13~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector11~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector5~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Add1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector10~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector10~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector11~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector11~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|NextR~9_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector2~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector10~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector13~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|NextR~10_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector13~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector12~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector12~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|NextR~8_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector5~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data1~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector6~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack2~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector7~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector8~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack3~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector9~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Stop~q\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~22\ : std_logic;
SIGNAL \ConfigureCodec|Add0~17_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~18\ : std_logic;
SIGNAL \ConfigureCodec|Add0~13_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~14\ : std_logic;
SIGNAL \ConfigureCodec|Add0~9_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~10\ : std_logic;
SIGNAL \ConfigureCodec|Add0~5_sumout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[6]~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[6]~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[6]~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Activity~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Activity~q\ : std_logic;
SIGNAL \ConfigureCodec|Add0~2\ : std_logic;
SIGNAL \ConfigureCodec|Add0~25_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~26\ : std_logic;
SIGNAL \ConfigureCodec|Add0~21_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Equal0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~q\ : std_logic;
SIGNAL \WaitCtr[1]~0_combout\ : std_logic;
SIGNAL \WaitCtr[0]~1_combout\ : std_logic;
SIGNAL \WaitCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \Start~0_combout\ : std_logic;
SIGNAL \Start~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector16~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector16~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AckError~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector4~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack1~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector0~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector0~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Idle~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Idle~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector14~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Sclk~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Sdin~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector0~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~5_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux6~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[15]~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Mux4~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux2~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux5~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux7~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[5]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Mux3~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~6_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Sdin~DUPLICATE_q\ : std_logic;
SIGNAL \TheClkMaster|MclkCounter[0]~0_combout\ : std_logic;
SIGNAL \TheClkMaster|Mclk~0_combout\ : std_logic;
SIGNAL \TheClkMaster|Mclk~q\ : std_logic;
SIGNAL \TheClkMaster|Add1~9_sumout\ : std_logic;
SIGNAL \TheClkMaster|Add1~10\ : std_logic;
SIGNAL \TheClkMaster|Add1~5_sumout\ : std_logic;
SIGNAL \TheClkMaster|Add1~6\ : std_logic;
SIGNAL \TheClkMaster|Add1~1_sumout\ : std_logic;
SIGNAL \TheClkMaster|Add1~2\ : std_logic;
SIGNAL \TheClkMaster|Add1~29_sumout\ : std_logic;
SIGNAL \TheClkMaster|ADCCounter~1_combout\ : std_logic;
SIGNAL \TheClkMaster|Add1~30\ : std_logic;
SIGNAL \TheClkMaster|Add1~25_sumout\ : std_logic;
SIGNAL \TheClkMaster|Add1~26\ : std_logic;
SIGNAL \TheClkMaster|Add1~21_sumout\ : std_logic;
SIGNAL \TheClkMaster|Add1~22\ : std_logic;
SIGNAL \TheClkMaster|Add1~17_sumout\ : std_logic;
SIGNAL \TheClkMaster|ADCCounter[6]~feeder_combout\ : std_logic;
SIGNAL \TheClkMaster|Add1~18\ : std_logic;
SIGNAL \TheClkMaster|Add1~13_sumout\ : std_logic;
SIGNAL \TheClkMaster|ADCCounter~0_combout\ : std_logic;
SIGNAL \TheClkMaster|Equal0~0_combout\ : std_logic;
SIGNAL \TheClkMaster|ADClrc~0_combout\ : std_logic;
SIGNAL \TheClkMaster|ADClrc~q\ : std_logic;
SIGNAL \TheI2SToPar|BclkDlyd~q\ : std_logic;
SIGNAL \TheI2SToPar|BclkRiseEdge~combout\ : std_logic;
SIGNAL \TheI2SToPar|LrcDlyd~q\ : std_logic;
SIGNAL \TheI2SToPar|State~q\ : std_logic;
SIGNAL \TheI2SToPar|NextAudioBitCtr[0]~4_combout\ : std_logic;
SIGNAL \TheI2SToPar|AudioBitCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \TheI2SToPar|NextAudioBitCtr[1]~3_combout\ : std_logic;
SIGNAL \TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \TheI2SToPar|NextAudioBitCtr[2]~2_combout\ : std_logic;
SIGNAL \TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ : std_logic;
SIGNAL \TheI2SToPar|Equal0~0_combout\ : std_logic;
SIGNAL \TheI2SToPar|NextAudioBitCtr[3]~0_combout\ : std_logic;
SIGNAL \TheI2SToPar|NextAudioBitCtr[4]~1_combout\ : std_logic;
SIGNAL \TheI2SToPar|Equal0~1_combout\ : std_logic;
SIGNAL \TheI2SToPar|State~0_combout\ : std_logic;
SIGNAL \TheI2SToPar|State~DUPLICATE_q\ : std_logic;
SIGNAL \TheI2SToPar|NextValL~0_combout\ : std_logic;
SIGNAL \TheI2SToPar|ValL~q\ : std_logic;
SIGNAL \TheParToI2S|Selector0~0_combout\ : std_logic;
SIGNAL \TheParToI2S|State.WaitingValL~q\ : std_logic;
SIGNAL \TheParToI2S|BclkDlyd~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2S|Selector1~0_combout\ : std_logic;
SIGNAL \TheParToI2S|State.SyncingToBclk~q\ : std_logic;
SIGNAL \TheParToI2S|NextBclkCtr~0_combout\ : std_logic;
SIGNAL \TheParToI2S|State.SyncingToBclk~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2S|BclkDlyd~q\ : std_logic;
SIGNAL \TheParToI2S|State.FirstBitEmptyL~0_combout\ : std_logic;
SIGNAL \TheParToI2S|State.FirstBitEmptyL~q\ : std_logic;
SIGNAL \TheParToI2S|Selector3~0_combout\ : std_logic;
SIGNAL \TheParToI2S|State.SendingL~q\ : std_logic;
SIGNAL \TheParToI2S|Selector6~0_combout\ : std_logic;
SIGNAL \TheParToI2S|State.SendingL~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2S|Selector4~0_combout\ : std_logic;
SIGNAL \TheParToI2S|State.FirstBitEmptyR~q\ : std_logic;
SIGNAL \TheParToI2S|Selector7~0_combout\ : std_logic;
SIGNAL \TheParToI2S|Selector8~0_combout\ : std_logic;
SIGNAL \TheParToI2S|Selector8~1_combout\ : std_logic;
SIGNAL \TheParToI2S|Add0~0_combout\ : std_logic;
SIGNAL \TheParToI2S|Selector7~1_combout\ : std_logic;
SIGNAL \TheParToI2S|Selector6~1_combout\ : std_logic;
SIGNAL \TheParToI2S|Selector6~2_combout\ : std_logic;
SIGNAL \TheParToI2S|Selector6~3_combout\ : std_logic;
SIGNAL \TheParToI2S|NextBclkCtr~1_combout\ : std_logic;
SIGNAL \TheParToI2S|Selector9~0_combout\ : std_logic;
SIGNAL \TheParToI2S|Selector9~1_combout\ : std_logic;
SIGNAL \TheParToI2S|BclkCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2S|NextState~6_combout\ : std_logic;
SIGNAL \TheParToI2S|Selector5~0_combout\ : std_logic;
SIGNAL \TheParToI2S|State.SendingR~q\ : std_logic;
SIGNAL \iADCdat~input_o\ : std_logic;
SIGNAL \TheI2SToPar|Decoder0~4_combout\ : std_logic;
SIGNAL \TheI2SToPar|D[3]~10_combout\ : std_logic;
SIGNAL \TheI2SToPar|NextValR~0_combout\ : std_logic;
SIGNAL \TheI2SToPar|ValR~q\ : std_logic;
SIGNAL \TheI2SToPar|D[1]~8_combout\ : std_logic;
SIGNAL \TheI2SToPar|AudioBitCtr[3]~DUPLICATE_q\ : std_logic;
SIGNAL \TheI2SToPar|Decoder0~1_combout\ : std_logic;
SIGNAL \TheI2SToPar|D[11]~11_combout\ : std_logic;
SIGNAL \TheI2SToPar|D[9]~9_combout\ : std_logic;
SIGNAL \TheParToI2S|Mux1~2_combout\ : std_logic;
SIGNAL \TheI2SToPar|Decoder0~3_combout\ : std_logic;
SIGNAL \TheI2SToPar|D[7]~14_combout\ : std_logic;
SIGNAL \TheI2SToPar|Decoder0~2_combout\ : std_logic;
SIGNAL \TheI2SToPar|D[13]~13_combout\ : std_logic;
SIGNAL \TheI2SToPar|D[15]~15_combout\ : std_logic;
SIGNAL \TheI2SToPar|D[5]~12_combout\ : std_logic;
SIGNAL \TheParToI2S|LastValidDR[5]~feeder_combout\ : std_logic;
SIGNAL \TheParToI2S|Mux1~3_combout\ : std_logic;
SIGNAL \TheI2SToPar|Decoder0~0_combout\ : std_logic;
SIGNAL \TheI2SToPar|D[2]~2_combout\ : std_logic;
SIGNAL \TheI2SToPar|D[0]~0_combout\ : std_logic;
SIGNAL \TheI2SToPar|D[10]~3_combout\ : std_logic;
SIGNAL \TheI2SToPar|Equal0~2_combout\ : std_logic;
SIGNAL \TheI2SToPar|D[8]~1_combout\ : std_logic;
SIGNAL \TheParToI2S|Mux1~0_combout\ : std_logic;
SIGNAL \TheI2SToPar|D[4]~4_combout\ : std_logic;
SIGNAL \TheI2SToPar|D[6]~6_combout\ : std_logic;
SIGNAL \TheI2SToPar|D[14]~7_combout\ : std_logic;
SIGNAL \TheI2SToPar|D[12]~5_combout\ : std_logic;
SIGNAL \TheParToI2S|Mux1~1_combout\ : std_logic;
SIGNAL \TheParToI2S|Mux1~4_combout\ : std_logic;
SIGNAL \TheParToI2S|Mux0~3_combout\ : std_logic;
SIGNAL \TheParToI2S|Mux0~0_combout\ : std_logic;
SIGNAL \TheParToI2S|Mux0~1_combout\ : std_logic;
SIGNAL \TheParToI2S|Mux0~2_combout\ : std_logic;
SIGNAL \TheParToI2S|Mux0~4_combout\ : std_logic;
SIGNAL \TheParToI2S|Selector10~0_combout\ : std_logic;
SIGNAL \TheParToI2S|oLrc~0_combout\ : std_logic;
SIGNAL WaitCtr : std_logic_vector(1 DOWNTO 0);
SIGNAL \ConfigureCodec|R.AddrCtr\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \TheI2SToPar|D\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \TheParToI2S|LastValidDR\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \TheParToI2S|BclkCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TheClkMaster|MclkCounter\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \TheI2SToPar|AudioBitCtr\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \TheParToI2S|LastValidDL\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \TheClkMaster|ADCCounter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \GenStrobeI2C|ClkCounter\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \ConfigureCodec|R.BitCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ConfigureCodec|R.Data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|fboutclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|locked_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_Selector13~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector12~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextR~10_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector11~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector11~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector11~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector10~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector10~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector5~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Add1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector13~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector1~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Address~q\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_LrcDlyd~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Sdin~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextR~9_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextR~8_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector0~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \TheI2SToPar|ALT_INV_Decoder0~4_combout\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_Decoder0~3_combout\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_Decoder0~2_combout\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_Decoder0~1_combout\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_BclkRiseEdge~combout\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_AudioBitCtr\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \TheI2SToPar|ALT_INV_Decoder0~0_combout\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_State~q\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_BclkDlyd~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Start~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Activity~q\ : std_logic;
SIGNAL ALT_INV_WaitCtr : std_logic_vector(1 DOWNTO 0);
SIGNAL \GenStrobeI2C|ALT_INV_oStrobe~q\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_ValL~q\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_Selector9~0_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_Selector7~0_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_D\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \TheParToI2S|ALT_INV_Selector8~0_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_NextBclkCtr~1_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_Selector6~2_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_Selector6~1_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_Selector6~0_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_NextBclkCtr~0_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_State.SyncingToBclk~q\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_State.WaitingValL~q\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_State.FirstBitEmptyR~q\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_NextState~6_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_BclkDlyd~q\ : std_logic;
SIGNAL \TheClkMaster|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \TheClkMaster|ALT_INV_ADCCounter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \TheClkMaster|ALT_INV_MclkCounter\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_R.Sclk~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AckError~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~q\ : std_logic;
SIGNAL \ALT_INV_Start~q\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_oLrc~0_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_State.FirstBitEmptyL~q\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_Mux0~4_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_Mux0~3_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_LastValidDL\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \TheParToI2S|ALT_INV_Mux0~2_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_Mux0~1_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_State.SendingL~q\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_Mux1~4_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_BclkCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TheParToI2S|ALT_INV_Mux1~3_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_LastValidDR\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \TheParToI2S|ALT_INV_Mux1~2_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_Mux1~1_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_State.SendingR~q\ : std_logic;
SIGNAL \TheClkMaster|ALT_INV_ADClrc~q\ : std_logic;
SIGNAL \TheClkMaster|ALT_INV_Mclk~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector0~3_combout\ : std_logic;
SIGNAL \TheClkMaster|ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \TheClkMaster|ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \TheClkMaster|ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Address~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Sdin~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data2~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.RWBit~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter[3]~DUPLICATE_q\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_AudioBitCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_AudioBitCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_AudioBitCtr[2]~DUPLICATE_q\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_State~DUPLICATE_q\ : std_logic;
SIGNAL \TheI2SToPar|ALT_INV_AudioBitCtr[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_WaitCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_State.SyncingToBclk~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_BclkDlyd~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_State.SendingL~DUPLICATE_q\ : std_logic;
SIGNAL \TheParToI2S|ALT_INV_BclkCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_iADCdat~input_o\ : std_logic;
SIGNAL \ALT_INV_inResetAsync~input_o\ : std_logic;
SIGNAL \ALT_INV_ioI2cSdin~input_o\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector0~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector16~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[6]~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[6]~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~5_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~1_combout\ : std_logic;

BEGIN

ww_iClk <= iClk;
ww_inResetAsync <= inResetAsync;
oI2cSclk <= ww_oI2cSclk;
oMclk <= ww_oMclk;
oBclk <= ww_oBclk;
ww_iADCdat <= iADCdat;
oADClrc <= ww_oADClrc;
oDACdat <= ww_oDACdat;
oDAClrc <= ww_oDAClrc;
oLed <= IEEE.STD_LOGIC_1164.TO_STDULOGICVECTOR(ww_oLed);
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(0);
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(1);
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(2);
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(3);
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(4);
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(5);
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(6);
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(7);

\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(0);
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(1);
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(2);
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(3);
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(4);
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(5);
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(6);
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(7);

\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ <= (gnd & gnd & gnd & \iClk~input_o\);

\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ <= (\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ & 
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ & \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ & 
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ & \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ & 
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ & \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ & 
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\);

\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ <= \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\(6);

\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ <= (
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ & \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\
& \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ & 
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ & \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\
& \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ & 
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ & \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\
);
\ConfigureCodec|ALT_INV_Mux9~0_combout\ <= NOT \ConfigureCodec|Mux9~0_combout\;
\ConfigureCodec|ALT_INV_R.Data\(2) <= NOT \ConfigureCodec|R.Data\(2);
\ConfigureCodec|ALT_INV_R.Data\(0) <= NOT \ConfigureCodec|R.Data\(0);
\ConfigureCodec|ALT_INV_R.Data\(10) <= NOT \ConfigureCodec|R.Data\(10);
\ConfigureCodec|ALT_INV_Selector13~1_combout\ <= NOT \ConfigureCodec|Selector13~1_combout\;
\ConfigureCodec|ALT_INV_Selector12~0_combout\ <= NOT \ConfigureCodec|Selector12~0_combout\;
\ConfigureCodec|ALT_INV_NextR~10_combout\ <= NOT \ConfigureCodec|NextR~10_combout\;
\ConfigureCodec|ALT_INV_Selector11~2_combout\ <= NOT \ConfigureCodec|Selector11~2_combout\;
\ConfigureCodec|ALT_INV_Selector15~0_combout\ <= NOT \ConfigureCodec|Selector15~0_combout\;
\ConfigureCodec|ALT_INV_Selector11~1_combout\ <= NOT \ConfigureCodec|Selector11~1_combout\;
\ConfigureCodec|ALT_INV_Selector11~0_combout\ <= NOT \ConfigureCodec|Selector11~0_combout\;
\ConfigureCodec|ALT_INV_Selector10~1_combout\ <= NOT \ConfigureCodec|Selector10~1_combout\;
\ConfigureCodec|ALT_INV_Selector10~0_combout\ <= NOT \ConfigureCodec|Selector10~0_combout\;
\ConfigureCodec|ALT_INV_Selector5~0_combout\ <= NOT \ConfigureCodec|Selector5~0_combout\;
\ConfigureCodec|ALT_INV_Add1~0_combout\ <= NOT \ConfigureCodec|Add1~0_combout\;
\ConfigureCodec|ALT_INV_Selector13~0_combout\ <= NOT \ConfigureCodec|Selector13~0_combout\;
\ConfigureCodec|ALT_INV_Selector1~1_combout\ <= NOT \ConfigureCodec|Selector1~1_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Address~q\ <= NOT \ConfigureCodec|R.FrameState.Address~q\;
\TheI2SToPar|ALT_INV_LrcDlyd~q\ <= NOT \TheI2SToPar|LrcDlyd~q\;
\ConfigureCodec|ALT_INV_R.Sdin~q\ <= NOT \ConfigureCodec|R.Sdin~q\;
\ConfigureCodec|ALT_INV_NextR~9_combout\ <= NOT \ConfigureCodec|NextR~9_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Data2~q\ <= NOT \ConfigureCodec|R.FrameState.Data2~q\;
\ConfigureCodec|ALT_INV_R.FrameState.Data1~q\ <= NOT \ConfigureCodec|R.FrameState.Data1~q\;
\ConfigureCodec|ALT_INV_NextR~8_combout\ <= NOT \ConfigureCodec|NextR~8_combout\;
\ConfigureCodec|ALT_INV_R.BitCtr\(0) <= NOT \ConfigureCodec|R.BitCtr\(0);
\ConfigureCodec|ALT_INV_R.BitCtr\(1) <= NOT \ConfigureCodec|R.BitCtr\(1);
\ConfigureCodec|ALT_INV_R.BitCtr\(2) <= NOT \ConfigureCodec|R.BitCtr\(2);
\ConfigureCodec|ALT_INV_R.BitCtr\(3) <= NOT \ConfigureCodec|R.BitCtr\(3);
\ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\ <= NOT \ConfigureCodec|R.FrameState.RWBit~q\;
\ConfigureCodec|ALT_INV_Selector0~1_combout\ <= NOT \ConfigureCodec|Selector0~1_combout\;
\ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\ <= NOT \ConfigureCodec|NextStateAndOutput~2_combout\;
\GenStrobeI2C|ALT_INV_ClkCounter\(0) <= NOT \GenStrobeI2C|ClkCounter\(0);
\GenStrobeI2C|ALT_INV_ClkCounter\(1) <= NOT \GenStrobeI2C|ClkCounter\(1);
\GenStrobeI2C|ALT_INV_ClkCounter\(2) <= NOT \GenStrobeI2C|ClkCounter\(2);
\GenStrobeI2C|ALT_INV_ClkCounter\(3) <= NOT \GenStrobeI2C|ClkCounter\(3);
\GenStrobeI2C|ALT_INV_ClkCounter\(4) <= NOT \GenStrobeI2C|ClkCounter\(4);
\GenStrobeI2C|ALT_INV_ClkCounter\(5) <= NOT \GenStrobeI2C|ClkCounter\(5);
\TheI2SToPar|ALT_INV_Decoder0~4_combout\ <= NOT \TheI2SToPar|Decoder0~4_combout\;
\TheI2SToPar|ALT_INV_Decoder0~3_combout\ <= NOT \TheI2SToPar|Decoder0~3_combout\;
\TheI2SToPar|ALT_INV_Decoder0~2_combout\ <= NOT \TheI2SToPar|Decoder0~2_combout\;
\TheI2SToPar|ALT_INV_Decoder0~1_combout\ <= NOT \TheI2SToPar|Decoder0~1_combout\;
\TheI2SToPar|ALT_INV_Equal0~2_combout\ <= NOT \TheI2SToPar|Equal0~2_combout\;
\TheI2SToPar|ALT_INV_Equal0~1_combout\ <= NOT \TheI2SToPar|Equal0~1_combout\;
\TheI2SToPar|ALT_INV_BclkRiseEdge~combout\ <= NOT \TheI2SToPar|BclkRiseEdge~combout\;
\TheI2SToPar|ALT_INV_Equal0~0_combout\ <= NOT \TheI2SToPar|Equal0~0_combout\;
\TheI2SToPar|ALT_INV_AudioBitCtr\(0) <= NOT \TheI2SToPar|AudioBitCtr\(0);
\TheI2SToPar|ALT_INV_AudioBitCtr\(1) <= NOT \TheI2SToPar|AudioBitCtr\(1);
\TheI2SToPar|ALT_INV_AudioBitCtr\(2) <= NOT \TheI2SToPar|AudioBitCtr\(2);
\TheI2SToPar|ALT_INV_Decoder0~0_combout\ <= NOT \TheI2SToPar|Decoder0~0_combout\;
\TheI2SToPar|ALT_INV_State~q\ <= NOT \TheI2SToPar|State~q\;
\TheI2SToPar|ALT_INV_BclkDlyd~q\ <= NOT \TheI2SToPar|BclkDlyd~q\;
\TheI2SToPar|ALT_INV_AudioBitCtr\(4) <= NOT \TheI2SToPar|AudioBitCtr\(4);
\TheI2SToPar|ALT_INV_AudioBitCtr\(3) <= NOT \TheI2SToPar|AudioBitCtr\(3);
\ConfigureCodec|ALT_INV_Selector0~0_combout\ <= NOT \ConfigureCodec|Selector0~0_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\ <= NOT \ConfigureCodec|R.FrameState.Ack3~q\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\ <= NOT \ConfigureCodec|R.FrameState.Ack2~q\;
\ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\ <= NOT \ConfigureCodec|R.FrameState.Ack1~q\;
\ConfigureCodec|ALT_INV_R.FrameState.Start~q\ <= NOT \ConfigureCodec|R.FrameState.Start~q\;
\ConfigureCodec|ALT_INV_R.Configured~1_combout\ <= NOT \ConfigureCodec|R.Configured~1_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Stop~q\ <= NOT \ConfigureCodec|R.FrameState.Stop~q\;
\ConfigureCodec|ALT_INV_Equal0~0_combout\ <= NOT \ConfigureCodec|Equal0~0_combout\;
\ConfigureCodec|ALT_INV_R.Configured~0_combout\ <= NOT \ConfigureCodec|R.Configured~0_combout\;
\ConfigureCodec|ALT_INV_R.FrameState.Idle~q\ <= NOT \ConfigureCodec|R.FrameState.Idle~q\;
\ConfigureCodec|ALT_INV_R.Activity~q\ <= NOT \ConfigureCodec|R.Activity~q\;
ALT_INV_WaitCtr(0) <= NOT WaitCtr(0);
ALT_INV_WaitCtr(1) <= NOT WaitCtr(1);
\GenStrobeI2C|ALT_INV_oStrobe~q\ <= NOT \GenStrobeI2C|oStrobe~q\;
\TheI2SToPar|ALT_INV_ValL~q\ <= NOT \TheI2SToPar|ValL~q\;
\TheParToI2S|ALT_INV_Selector9~0_combout\ <= NOT \TheParToI2S|Selector9~0_combout\;
\TheParToI2S|ALT_INV_Selector7~0_combout\ <= NOT \TheParToI2S|Selector7~0_combout\;
\TheParToI2S|ALT_INV_Add0~0_combout\ <= NOT \TheParToI2S|Add0~0_combout\;
\TheI2SToPar|ALT_INV_D\(15) <= NOT \TheI2SToPar|D\(15);
\TheI2SToPar|ALT_INV_D\(7) <= NOT \TheI2SToPar|D\(7);
\TheI2SToPar|ALT_INV_D\(13) <= NOT \TheI2SToPar|D\(13);
\TheI2SToPar|ALT_INV_D\(5) <= NOT \TheI2SToPar|D\(5);
\TheI2SToPar|ALT_INV_D\(11) <= NOT \TheI2SToPar|D\(11);
\TheI2SToPar|ALT_INV_D\(3) <= NOT \TheI2SToPar|D\(3);
\TheI2SToPar|ALT_INV_D\(9) <= NOT \TheI2SToPar|D\(9);
\TheI2SToPar|ALT_INV_D\(1) <= NOT \TheI2SToPar|D\(1);
\TheI2SToPar|ALT_INV_D\(14) <= NOT \TheI2SToPar|D\(14);
\TheI2SToPar|ALT_INV_D\(6) <= NOT \TheI2SToPar|D\(6);
\TheI2SToPar|ALT_INV_D\(12) <= NOT \TheI2SToPar|D\(12);
\TheI2SToPar|ALT_INV_D\(4) <= NOT \TheI2SToPar|D\(4);
\TheParToI2S|ALT_INV_Selector8~0_combout\ <= NOT \TheParToI2S|Selector8~0_combout\;
\TheParToI2S|ALT_INV_NextBclkCtr~1_combout\ <= NOT \TheParToI2S|NextBclkCtr~1_combout\;
\TheParToI2S|ALT_INV_Selector6~2_combout\ <= NOT \TheParToI2S|Selector6~2_combout\;
\TheParToI2S|ALT_INV_Selector6~1_combout\ <= NOT \TheParToI2S|Selector6~1_combout\;
\TheParToI2S|ALT_INV_Selector6~0_combout\ <= NOT \TheParToI2S|Selector6~0_combout\;
\TheParToI2S|ALT_INV_NextBclkCtr~0_combout\ <= NOT \TheParToI2S|NextBclkCtr~0_combout\;
\TheParToI2S|ALT_INV_State.SyncingToBclk~q\ <= NOT \TheParToI2S|State.SyncingToBclk~q\;
\TheParToI2S|ALT_INV_State.WaitingValL~q\ <= NOT \TheParToI2S|State.WaitingValL~q\;
\TheI2SToPar|ALT_INV_D\(10) <= NOT \TheI2SToPar|D\(10);
\TheI2SToPar|ALT_INV_D\(2) <= NOT \TheI2SToPar|D\(2);
\TheI2SToPar|ALT_INV_D\(8) <= NOT \TheI2SToPar|D\(8);
\TheI2SToPar|ALT_INV_D\(0) <= NOT \TheI2SToPar|D\(0);
\TheParToI2S|ALT_INV_State.FirstBitEmptyR~q\ <= NOT \TheParToI2S|State.FirstBitEmptyR~q\;
\TheParToI2S|ALT_INV_NextState~6_combout\ <= NOT \TheParToI2S|NextState~6_combout\;
\TheParToI2S|ALT_INV_BclkDlyd~q\ <= NOT \TheParToI2S|BclkDlyd~q\;
\TheClkMaster|ALT_INV_Equal0~0_combout\ <= NOT \TheClkMaster|Equal0~0_combout\;
\TheClkMaster|ALT_INV_ADCCounter\(3) <= NOT \TheClkMaster|ADCCounter\(3);
\TheClkMaster|ALT_INV_ADCCounter\(4) <= NOT \TheClkMaster|ADCCounter\(4);
\TheClkMaster|ALT_INV_ADCCounter\(5) <= NOT \TheClkMaster|ADCCounter\(5);
\TheClkMaster|ALT_INV_ADCCounter\(6) <= NOT \TheClkMaster|ADCCounter\(6);
\TheClkMaster|ALT_INV_ADCCounter\(7) <= NOT \TheClkMaster|ADCCounter\(7);
\TheClkMaster|ALT_INV_ADCCounter\(0) <= NOT \TheClkMaster|ADCCounter\(0);
\TheClkMaster|ALT_INV_ADCCounter\(1) <= NOT \TheClkMaster|ADCCounter\(1);
\TheClkMaster|ALT_INV_ADCCounter\(2) <= NOT \TheClkMaster|ADCCounter\(2);
\TheClkMaster|ALT_INV_MclkCounter\(0) <= NOT \TheClkMaster|MclkCounter\(0);
\ConfigureCodec|ALT_INV_R.Sclk~q\ <= NOT \ConfigureCodec|R.Sclk~q\;
\ConfigureCodec|ALT_INV_R.AckError~q\ <= NOT \ConfigureCodec|R.AckError~q\;
\ConfigureCodec|ALT_INV_R.Configured~q\ <= NOT \ConfigureCodec|R.Configured~q\;
\ALT_INV_Start~q\ <= NOT \Start~q\;
\TheParToI2S|ALT_INV_oLrc~0_combout\ <= NOT \TheParToI2S|oLrc~0_combout\;
\TheParToI2S|ALT_INV_State.FirstBitEmptyL~q\ <= NOT \TheParToI2S|State.FirstBitEmptyL~q\;
\TheParToI2S|ALT_INV_Mux0~4_combout\ <= NOT \TheParToI2S|Mux0~4_combout\;
\TheParToI2S|ALT_INV_Mux0~3_combout\ <= NOT \TheParToI2S|Mux0~3_combout\;
\TheParToI2S|ALT_INV_LastValidDL\(15) <= NOT \TheParToI2S|LastValidDL\(15);
\TheParToI2S|ALT_INV_LastValidDL\(14) <= NOT \TheParToI2S|LastValidDL\(14);
\TheParToI2S|ALT_INV_LastValidDL\(11) <= NOT \TheParToI2S|LastValidDL\(11);
\TheParToI2S|ALT_INV_LastValidDL\(10) <= NOT \TheParToI2S|LastValidDL\(10);
\TheParToI2S|ALT_INV_Mux0~2_combout\ <= NOT \TheParToI2S|Mux0~2_combout\;
\TheParToI2S|ALT_INV_LastValidDL\(7) <= NOT \TheParToI2S|LastValidDL\(7);
\TheParToI2S|ALT_INV_LastValidDL\(6) <= NOT \TheParToI2S|LastValidDL\(6);
\TheParToI2S|ALT_INV_LastValidDL\(3) <= NOT \TheParToI2S|LastValidDL\(3);
\TheParToI2S|ALT_INV_LastValidDL\(2) <= NOT \TheParToI2S|LastValidDL\(2);
\TheParToI2S|ALT_INV_Mux0~1_combout\ <= NOT \TheParToI2S|Mux0~1_combout\;
\TheParToI2S|ALT_INV_LastValidDL\(13) <= NOT \TheParToI2S|LastValidDL\(13);
\TheParToI2S|ALT_INV_LastValidDL\(12) <= NOT \TheParToI2S|LastValidDL\(12);
\TheParToI2S|ALT_INV_LastValidDL\(9) <= NOT \TheParToI2S|LastValidDL\(9);
\TheParToI2S|ALT_INV_LastValidDL\(8) <= NOT \TheParToI2S|LastValidDL\(8);
\TheParToI2S|ALT_INV_Mux0~0_combout\ <= NOT \TheParToI2S|Mux0~0_combout\;
\TheParToI2S|ALT_INV_LastValidDL\(5) <= NOT \TheParToI2S|LastValidDL\(5);
\TheParToI2S|ALT_INV_LastValidDL\(4) <= NOT \TheParToI2S|LastValidDL\(4);
\TheParToI2S|ALT_INV_LastValidDL\(1) <= NOT \TheParToI2S|LastValidDL\(1);
\TheParToI2S|ALT_INV_LastValidDL\(0) <= NOT \TheParToI2S|LastValidDL\(0);
\TheParToI2S|ALT_INV_State.SendingL~q\ <= NOT \TheParToI2S|State.SendingL~q\;
\TheParToI2S|ALT_INV_Mux1~4_combout\ <= NOT \TheParToI2S|Mux1~4_combout\;
\TheParToI2S|ALT_INV_BclkCtr\(0) <= NOT \TheParToI2S|BclkCtr\(0);
\TheParToI2S|ALT_INV_BclkCtr\(2) <= NOT \TheParToI2S|BclkCtr\(2);
\TheParToI2S|ALT_INV_Mux1~3_combout\ <= NOT \TheParToI2S|Mux1~3_combout\;
\TheParToI2S|ALT_INV_LastValidDR\(15) <= NOT \TheParToI2S|LastValidDR\(15);
\TheParToI2S|ALT_INV_LastValidDR\(7) <= NOT \TheParToI2S|LastValidDR\(7);
\TheParToI2S|ALT_INV_LastValidDR\(13) <= NOT \TheParToI2S|LastValidDR\(13);
\TheParToI2S|ALT_INV_LastValidDR\(5) <= NOT \TheParToI2S|LastValidDR\(5);
\TheParToI2S|ALT_INV_Mux1~2_combout\ <= NOT \TheParToI2S|Mux1~2_combout\;
\TheParToI2S|ALT_INV_LastValidDR\(11) <= NOT \TheParToI2S|LastValidDR\(11);
\TheParToI2S|ALT_INV_LastValidDR\(3) <= NOT \TheParToI2S|LastValidDR\(3);
\TheParToI2S|ALT_INV_LastValidDR\(9) <= NOT \TheParToI2S|LastValidDR\(9);
\TheParToI2S|ALT_INV_LastValidDR\(1) <= NOT \TheParToI2S|LastValidDR\(1);
\TheParToI2S|ALT_INV_Mux1~1_combout\ <= NOT \TheParToI2S|Mux1~1_combout\;
\TheParToI2S|ALT_INV_LastValidDR\(14) <= NOT \TheParToI2S|LastValidDR\(14);
\TheParToI2S|ALT_INV_LastValidDR\(6) <= NOT \TheParToI2S|LastValidDR\(6);
\TheParToI2S|ALT_INV_LastValidDR\(12) <= NOT \TheParToI2S|LastValidDR\(12);
\TheParToI2S|ALT_INV_LastValidDR\(4) <= NOT \TheParToI2S|LastValidDR\(4);
\TheParToI2S|ALT_INV_Mux1~0_combout\ <= NOT \TheParToI2S|Mux1~0_combout\;
\TheParToI2S|ALT_INV_BclkCtr\(1) <= NOT \TheParToI2S|BclkCtr\(1);
\TheParToI2S|ALT_INV_BclkCtr\(3) <= NOT \TheParToI2S|BclkCtr\(3);
\TheParToI2S|ALT_INV_LastValidDR\(10) <= NOT \TheParToI2S|LastValidDR\(10);
\TheParToI2S|ALT_INV_LastValidDR\(2) <= NOT \TheParToI2S|LastValidDR\(2);
\TheParToI2S|ALT_INV_LastValidDR\(8) <= NOT \TheParToI2S|LastValidDR\(8);
\TheParToI2S|ALT_INV_LastValidDR\(0) <= NOT \TheParToI2S|LastValidDR\(0);
\TheParToI2S|ALT_INV_State.SendingR~q\ <= NOT \TheParToI2S|State.SendingR~q\;
\TheClkMaster|ALT_INV_ADClrc~q\ <= NOT \TheClkMaster|ADClrc~q\;
\TheClkMaster|ALT_INV_Mclk~q\ <= NOT \TheClkMaster|Mclk~q\;
\ConfigureCodec|ALT_INV_Selector0~3_combout\ <= NOT \ConfigureCodec|Selector0~3_combout\;
\TheClkMaster|ALT_INV_Add1~29_sumout\ <= NOT \TheClkMaster|Add1~29_sumout\;
\TheClkMaster|ALT_INV_Add1~17_sumout\ <= NOT \TheClkMaster|Add1~17_sumout\;
\TheClkMaster|ALT_INV_Add1~13_sumout\ <= NOT \TheClkMaster|Add1~13_sumout\;
\ConfigureCodec|ALT_INV_R.AddrCtr\(1) <= NOT \ConfigureCodec|R.AddrCtr\(1);
\ConfigureCodec|ALT_INV_R.AddrCtr\(2) <= NOT \ConfigureCodec|R.AddrCtr\(2);
\ConfigureCodec|ALT_INV_R.AddrCtr\(3) <= NOT \ConfigureCodec|R.AddrCtr\(3);
\ConfigureCodec|ALT_INV_R.AddrCtr\(4) <= NOT \ConfigureCodec|R.AddrCtr\(4);
\ConfigureCodec|ALT_INV_R.AddrCtr\(5) <= NOT \ConfigureCodec|R.AddrCtr\(5);
\ConfigureCodec|ALT_INV_R.AddrCtr\(6) <= NOT \ConfigureCodec|R.AddrCtr\(6);
\ConfigureCodec|ALT_INV_R.AddrCtr\(0) <= NOT \ConfigureCodec|R.AddrCtr\(0);
\ConfigureCodec|ALT_INV_R.FrameState.Address~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Address~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.Sdin~DUPLICATE_q\ <= NOT \ConfigureCodec|R.Sdin~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.FrameState.Data2~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.FrameState.RWBit~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.RWBit~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\ <= NOT \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_ClkCounter[2]~DUPLICATE_q\ <= NOT \GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_ClkCounter[3]~DUPLICATE_q\ <= NOT \GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\;
\TheI2SToPar|ALT_INV_AudioBitCtr[0]~DUPLICATE_q\ <= NOT \TheI2SToPar|AudioBitCtr[0]~DUPLICATE_q\;
\TheI2SToPar|ALT_INV_AudioBitCtr[1]~DUPLICATE_q\ <= NOT \TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\;
\TheI2SToPar|ALT_INV_AudioBitCtr[2]~DUPLICATE_q\ <= NOT \TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\;
\TheI2SToPar|ALT_INV_State~DUPLICATE_q\ <= NOT \TheI2SToPar|State~DUPLICATE_q\;
\TheI2SToPar|ALT_INV_AudioBitCtr[3]~DUPLICATE_q\ <= NOT \TheI2SToPar|AudioBitCtr[3]~DUPLICATE_q\;
\ALT_INV_WaitCtr[0]~DUPLICATE_q\ <= NOT \WaitCtr[0]~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\ <= NOT \GenStrobeI2C|oStrobe~DUPLICATE_q\;
\TheParToI2S|ALT_INV_State.SyncingToBclk~DUPLICATE_q\ <= NOT \TheParToI2S|State.SyncingToBclk~DUPLICATE_q\;
\TheParToI2S|ALT_INV_BclkDlyd~DUPLICATE_q\ <= NOT \TheParToI2S|BclkDlyd~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\ <= NOT \ConfigureCodec|R.Sclk~DUPLICATE_q\;
\TheParToI2S|ALT_INV_State.SendingL~DUPLICATE_q\ <= NOT \TheParToI2S|State.SendingL~DUPLICATE_q\;
\TheParToI2S|ALT_INV_BclkCtr[0]~DUPLICATE_q\ <= NOT \TheParToI2S|BclkCtr[0]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\;
\ALT_INV_iADCdat~input_o\ <= NOT \iADCdat~input_o\;
\ALT_INV_inResetAsync~input_o\ <= NOT \inResetAsync~input_o\;
\ALT_INV_ioI2cSdin~input_o\ <= NOT \ioI2cSdin~input_o\;
\ConfigureCodec|ALT_INV_Selector0~2_combout\ <= NOT \ConfigureCodec|Selector0~2_combout\;
\ConfigureCodec|ALT_INV_Selector16~1_combout\ <= NOT \ConfigureCodec|Selector16~1_combout\;
\ConfigureCodec|ALT_INV_R.AddrCtr[6]~2_combout\ <= NOT \ConfigureCodec|R.AddrCtr[6]~2_combout\;
\ConfigureCodec|ALT_INV_R.AddrCtr[6]~1_combout\ <= NOT \ConfigureCodec|R.AddrCtr[6]~1_combout\;
\ConfigureCodec|ALT_INV_Selector15~5_combout\ <= NOT \ConfigureCodec|Selector15~5_combout\;
\ConfigureCodec|ALT_INV_Selector15~4_combout\ <= NOT \ConfigureCodec|Selector15~4_combout\;
\ConfigureCodec|ALT_INV_Selector15~3_combout\ <= NOT \ConfigureCodec|Selector15~3_combout\;
\ConfigureCodec|ALT_INV_Selector15~2_combout\ <= NOT \ConfigureCodec|Selector15~2_combout\;
\ConfigureCodec|ALT_INV_Selector15~1_combout\ <= NOT \ConfigureCodec|Selector15~1_combout\;
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

-- Location: IOOBUF_X2_Y81_N76
\oMclk~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TheClkMaster|Mclk~q\,
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
	i => \TheClkMaster|Mclk~q\,
	devoe => ww_devoe,
	o => ww_oBclk);

-- Location: IOOBUF_X8_Y81_N19
\oADClrc~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TheClkMaster|ADClrc~q\,
	devoe => ww_devoe,
	o => ww_oADClrc);

-- Location: IOOBUF_X16_Y81_N2
\oDACdat~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TheParToI2S|Selector10~0_combout\,
	devoe => ww_devoe,
	o => ww_oDACdat);

-- Location: IOOBUF_X24_Y81_N2
\oDAClrc~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \TheParToI2S|ALT_INV_oLrc~0_combout\,
	devoe => ww_devoe,
	o => ww_oDAClrc);

-- Location: IOOBUF_X52_Y0_N2
\oLed[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Start~q\,
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
	i => \ConfigureCodec|R.Configured~q\,
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
	i => \ConfigureCodec|R.AckError~q\,
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
	i => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|locked_wire\(0),
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

-- Location: IOOBUF_X12_Y81_N2
\ioI2cSdin~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ConfigureCodec|ALT_INV_R.Sdin~DUPLICATE_q\,
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
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT\ : cyclonev_pll_refclk_select
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
	clkin => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\,
	clkout => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	extswitchbuf => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\);

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
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL\ : cyclonev_fractional_pll
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
	coreclkfb => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|fboutclk_wire\(0),
	ecnc1test => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\,
	nresync => \ALT_INV_inResetAsync~input_o\,
	refclkin => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	shift => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftdonein => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	cntnen => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	fbclk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|fboutclk_wire\(0),
	lock => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|locked_wire\(0),
	tclk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	vcoph => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\,
	mhi => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\);

-- Location: PLLRECONFIG_X0_Y19_N0
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG\ : cyclonev_pll_reconfig
-- pragma translate_off
GENERIC MAP (
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	cntnen => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	mhi => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\,
	shift => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftenm => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	shiften => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\);

-- Location: PLLOUTPUTCOUNTER_X0_Y20_N1
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER\ : cyclonev_pll_output_counter
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
	nen0 => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	shift0 => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\,
	tclk0 => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	up0 => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	vco0ph => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\,
	divclk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire\(0));

-- Location: CLKCTRL_G0
\PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire\(0),
	outclk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\);

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

-- Location: FF_X29_Y7_N23
\GenStrobeI2C|ClkCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[0]~5_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(0));

-- Location: LABCELL_X29_Y7_N21
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

-- Location: FF_X29_Y7_N22
\GenStrobeI2C|ClkCounter[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[0]~5_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\);

-- Location: LABCELL_X29_Y7_N12
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

-- Location: FF_X29_Y7_N14
\GenStrobeI2C|ClkCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[1]~4_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(1));

-- Location: LABCELL_X29_Y7_N6
\GenStrobeI2C|ClkCounter[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[2]~3_combout\ = ( \GenStrobeI2C|ClkCounter\(2) & ( (!\GenStrobeI2C|ClkCounter\(0)) # (!\GenStrobeI2C|ClkCounter\(1)) ) ) # ( !\GenStrobeI2C|ClkCounter\(2) & ( (\GenStrobeI2C|ClkCounter\(0) & \GenStrobeI2C|ClkCounter\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111111111111000000000000000011111111111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenStrobeI2C|ALT_INV_ClkCounter\(0),
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(1),
	datae => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	combout => \GenStrobeI2C|ClkCounter[2]~3_combout\);

-- Location: FF_X29_Y7_N8
\GenStrobeI2C|ClkCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[2]~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(2));

-- Location: FF_X29_Y7_N29
\GenStrobeI2C|ClkCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[3]~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(3));

-- Location: FF_X29_Y7_N7
\GenStrobeI2C|ClkCounter[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[2]~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\);

-- Location: LABCELL_X29_Y7_N27
\GenStrobeI2C|ClkCounter[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[3]~2_combout\ = ( \GenStrobeI2C|ClkCounter\(3) & ( \GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\ & ( (!\GenStrobeI2C|ClkCounter\(1)) # (!\GenStrobeI2C|ClkCounter\(0)) ) ) ) # ( !\GenStrobeI2C|ClkCounter\(3) & ( 
-- \GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\ & ( (\GenStrobeI2C|ClkCounter\(1) & \GenStrobeI2C|ClkCounter\(0)) ) ) ) # ( \GenStrobeI2C|ClkCounter\(3) & ( !\GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000001100111111111111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_ClkCounter\(1),
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(0),
	datae => \GenStrobeI2C|ALT_INV_ClkCounter\(3),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter[2]~DUPLICATE_q\,
	combout => \GenStrobeI2C|ClkCounter[3]~2_combout\);

-- Location: FF_X29_Y7_N28
\GenStrobeI2C|ClkCounter[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[3]~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\);

-- Location: LABCELL_X29_Y7_N42
\GenStrobeI2C|ClkCounter[4]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[4]~1_combout\ = ( \GenStrobeI2C|ClkCounter\(4) & ( \GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\ & ( (!\GenStrobeI2C|ClkCounter\(1)) # ((!\GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\) # (!\GenStrobeI2C|ClkCounter\(2))) ) ) ) # ( 
-- !\GenStrobeI2C|ClkCounter\(4) & ( \GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\ & ( (\GenStrobeI2C|ClkCounter\(1) & (\GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ & \GenStrobeI2C|ClkCounter\(2))) ) ) ) # ( \GenStrobeI2C|ClkCounter\(4) & ( 
-- !\GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000111111111111111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_ClkCounter\(1),
	datac => \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\,
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	datae => \GenStrobeI2C|ALT_INV_ClkCounter\(4),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter[3]~DUPLICATE_q\,
	combout => \GenStrobeI2C|ClkCounter[4]~1_combout\);

-- Location: FF_X29_Y7_N43
\GenStrobeI2C|ClkCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[4]~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(4));

-- Location: LABCELL_X29_Y7_N36
\GenStrobeI2C|ClkCounter[5]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[5]~0_combout\ = ( \GenStrobeI2C|ClkCounter\(5) & ( \GenStrobeI2C|ClkCounter\(4) & ( (!\GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\) # ((!\GenStrobeI2C|ClkCounter\(1)) # ((!\GenStrobeI2C|ClkCounter\(3)) # 
-- (!\GenStrobeI2C|ClkCounter\(2)))) ) ) ) # ( !\GenStrobeI2C|ClkCounter\(5) & ( \GenStrobeI2C|ClkCounter\(4) & ( (\GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ & (\GenStrobeI2C|ClkCounter\(1) & (\GenStrobeI2C|ClkCounter\(3) & \GenStrobeI2C|ClkCounter\(2)))) ) ) 
-- ) # ( \GenStrobeI2C|ClkCounter\(5) & ( !\GenStrobeI2C|ClkCounter\(4) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000011111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\,
	datab => \GenStrobeI2C|ALT_INV_ClkCounter\(1),
	datac => \GenStrobeI2C|ALT_INV_ClkCounter\(3),
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	datae => \GenStrobeI2C|ALT_INV_ClkCounter\(5),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter\(4),
	combout => \GenStrobeI2C|ClkCounter[5]~0_combout\);

-- Location: FF_X29_Y7_N38
\GenStrobeI2C|ClkCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenStrobeI2C|ClkCounter[5]~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|ClkCounter\(5));

-- Location: LABCELL_X29_Y7_N51
\GenStrobeI2C|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|Equal0~0_combout\ = ( \GenStrobeI2C|ClkCounter\(5) & ( \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ & ( (\GenStrobeI2C|ClkCounter\(4) & (\GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\ & (\GenStrobeI2C|ClkCounter\(1) & 
-- \GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_ClkCounter\(4),
	datab => \GenStrobeI2C|ALT_INV_ClkCounter[3]~DUPLICATE_q\,
	datac => \GenStrobeI2C|ALT_INV_ClkCounter\(1),
	datad => \GenStrobeI2C|ALT_INV_ClkCounter[2]~DUPLICATE_q\,
	datae => \GenStrobeI2C|ALT_INV_ClkCounter\(5),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\,
	combout => \GenStrobeI2C|Equal0~0_combout\);

-- Location: FF_X30_Y8_N41
\GenStrobeI2C|oStrobe~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \GenStrobeI2C|Equal0~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|oStrobe~DUPLICATE_q\);

-- Location: FF_X34_Y8_N44
\WaitCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \WaitCtr[0]~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => WaitCtr(0));

-- Location: LABCELL_X33_Y8_N30
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

-- Location: FF_X30_Y8_N25
\ConfigureCodec|R.Sclk~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Selector14~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Sclk~DUPLICATE_q\);

-- Location: FF_X30_Y8_N40
\GenStrobeI2C|oStrobe\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \GenStrobeI2C|Equal0~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenStrobeI2C|oStrobe~q\);

-- Location: LABCELL_X30_Y8_N3
\ConfigureCodec|NextStateAndOutput~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextStateAndOutput~2_combout\ = (!\ConfigureCodec|R.Sclk~DUPLICATE_q\ & \GenStrobeI2C|oStrobe~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	datac => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	combout => \ConfigureCodec|NextStateAndOutput~2_combout\);

-- Location: LABCELL_X31_Y8_N0
\ConfigureCodec|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector1~0_combout\ = ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( (\ConfigureCodec|R.Activity~q\ & !\ConfigureCodec|R.FrameState.Idle~q\) ) ) # ( !\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( \ConfigureCodec|R.FrameState.Start~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111101010000010100000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector1~0_combout\);

-- Location: FF_X31_Y8_N2
\ConfigureCodec|R.FrameState.Start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector1~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Start~q\);

-- Location: MLABCELL_X28_Y8_N39
\ConfigureCodec|Selector1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector1~1_combout\ = ( !\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( \ConfigureCodec|R.FrameState.Start~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector1~1_combout\);

-- Location: FF_X29_Y8_N8
\ConfigureCodec|R.FrameState.Data2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector7~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Data2~q\);

-- Location: FF_X30_Y8_N14
\ConfigureCodec|R.FrameState.Address\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector2~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Address~q\);

-- Location: LABCELL_X30_Y8_N0
\ConfigureCodec|Selector11~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector11~1_combout\ = ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( ((!\ConfigureCodec|R.AckError~q\ & (!\ConfigureCodec|R.Sclk~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Ack1~q\))) # (\ConfigureCodec|R.FrameState.Start~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111100011110000111110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datab => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector11~1_combout\);

-- Location: FF_X30_Y8_N56
\ConfigureCodec|R.FrameState.RWBit\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector3~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.RWBit~q\);

-- Location: LABCELL_X30_Y8_N54
\ConfigureCodec|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector3~0_combout\ = ( \ConfigureCodec|NextR~9_combout\ & ( ((!\ConfigureCodec|NextStateAndOutput~2_combout\ & \ConfigureCodec|R.FrameState.RWBit~q\)) # (\ConfigureCodec|R.FrameState.Address~q\) ) ) # ( !\ConfigureCodec|NextR~9_combout\ 
-- & ( (!\ConfigureCodec|NextStateAndOutput~2_combout\ & \ConfigureCodec|R.FrameState.RWBit~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000110011101110110011001110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\,
	dataf => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	combout => \ConfigureCodec|Selector3~0_combout\);

-- Location: FF_X30_Y8_N55
\ConfigureCodec|R.FrameState.RWBit~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector3~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.RWBit~DUPLICATE_q\);

-- Location: LABCELL_X31_Y8_N30
\ConfigureCodec|Selector13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector13~0_combout\ = ( \ConfigureCodec|R.FrameState.Idle~q\ & ( !\ConfigureCodec|R.FrameState.Ack1~q\ & ( (!\ConfigureCodec|R.FrameState.Ack2~q\ & (!\ConfigureCodec|R.FrameState.Stop~q\ & 
-- (!\ConfigureCodec|R.FrameState.RWBit~DUPLICATE_q\ & !\ConfigureCodec|R.FrameState.Ack3~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.RWBit~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	combout => \ConfigureCodec|Selector13~0_combout\);

-- Location: LABCELL_X30_Y8_N57
\ConfigureCodec|Selector11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector11~0_combout\ = ( \ConfigureCodec|Selector13~0_combout\ & ( (!\ConfigureCodec|R.FrameState.Start~q\ & ((!\ConfigureCodec|R.FrameState.Data1~q\) # (\ConfigureCodec|NextStateAndOutput~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000010100001111000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	dataf => \ConfigureCodec|ALT_INV_Selector13~0_combout\,
	combout => \ConfigureCodec|Selector11~0_combout\);

-- Location: FF_X29_Y8_N32
\ConfigureCodec|R.BitCtr[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector12~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\);

-- Location: LABCELL_X29_Y8_N21
\ConfigureCodec|Selector15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~0_combout\ = ( !\ConfigureCodec|R.BitCtr\(0) & ( !\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	combout => \ConfigureCodec|Selector15~0_combout\);

-- Location: FF_X30_Y8_N50
\ConfigureCodec|R.FrameState.Data1~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector5~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\);

-- Location: FF_X28_Y8_N44
\ConfigureCodec|R.BitCtr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector10~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(3));

-- Location: LABCELL_X30_Y8_N15
\ConfigureCodec|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector5~0_combout\ = ( !\ConfigureCodec|R.Sclk~q\ & ( (!\ConfigureCodec|R.AckError~q\ & (\ConfigureCodec|R.FrameState.Ack1~q\ & \GenStrobeI2C|oStrobe~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001010000000000000101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	combout => \ConfigureCodec|Selector5~0_combout\);

-- Location: FF_X29_Y8_N25
\ConfigureCodec|R.BitCtr[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector13~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\);

-- Location: FF_X29_Y8_N4
\ConfigureCodec|R.BitCtr[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector11~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y8_N30
\ConfigureCodec|Add1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add1~0_combout\ = ( !\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	combout => \ConfigureCodec|Add1~0_combout\);

-- Location: LABCELL_X29_Y8_N12
\ConfigureCodec|Selector10~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector10~1_combout\ = ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( \ConfigureCodec|Selector10~0_combout\ & ( (!\ConfigureCodec|Selector5~0_combout\ & ((!\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\) # 
-- (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ $ (\ConfigureCodec|Add1~0_combout\)))) ) ) ) # ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( \ConfigureCodec|Selector10~0_combout\ & ( !\ConfigureCodec|Selector5~0_combout\ ) ) ) # ( 
-- \ConfigureCodec|NextStateAndOutput~2_combout\ & ( !\ConfigureCodec|Selector10~0_combout\ & ( (!\ConfigureCodec|Selector5~0_combout\ & ((!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ((!\ConfigureCodec|Add1~0_combout\) # 
-- (!\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\))) # (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & (\ConfigureCodec|Add1~0_combout\)))) ) ) ) # ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( !\ConfigureCodec|Selector10~0_combout\ & ( 
-- (!\ConfigureCodec|Selector5~0_combout\ & !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000100010101000001010101010101010101010101010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector5~0_combout\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_Add1~0_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	dataf => \ConfigureCodec|ALT_INV_Selector10~0_combout\,
	combout => \ConfigureCodec|Selector10~1_combout\);

-- Location: MLABCELL_X28_Y8_N42
\ConfigureCodec|Selector10~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector10~2_combout\ = ( \ConfigureCodec|R.BitCtr\(3) & ( \ConfigureCodec|Selector10~1_combout\ & ( ((!\ConfigureCodec|Selector13~0_combout\) # ((!\ConfigureCodec|NextStateAndOutput~2_combout\ & 
-- \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\))) # (\ConfigureCodec|Selector1~1_combout\) ) ) ) # ( \ConfigureCodec|R.BitCtr\(3) & ( !\ConfigureCodec|Selector10~1_combout\ ) ) # ( !\ConfigureCodec|R.BitCtr\(3) & ( !\ConfigureCodec|Selector10~1_combout\ 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000001111010111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector1~1_combout\,
	datab => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datac => \ConfigureCodec|ALT_INV_Selector13~0_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_Selector10~1_combout\,
	combout => \ConfigureCodec|Selector10~2_combout\);

-- Location: FF_X28_Y8_N43
\ConfigureCodec|R.BitCtr[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector10~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\);

-- Location: LABCELL_X29_Y8_N48
\ConfigureCodec|Selector11~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector11~2_combout\ = ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( \ConfigureCodec|Selector10~0_combout\ & ( (\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & (!\ConfigureCodec|Selector15~0_combout\ $ 
-- (!\ConfigureCodec|R.BitCtr\(2)))) ) ) ) # ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( !\ConfigureCodec|Selector10~0_combout\ & ( (!\ConfigureCodec|Selector15~0_combout\ & (((\ConfigureCodec|R.BitCtr\(2))))) # (\ConfigureCodec|Selector15~0_combout\ 
-- & (!\ConfigureCodec|R.BitCtr\(2) & ((\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\) # (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\)))) ) ) ) # ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( !\ConfigureCodec|Selector10~0_combout\ & ( 
-- \ConfigureCodec|R.BitCtr\(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000110100101101000000000000000000000000001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector15~0_combout\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	dataf => \ConfigureCodec|ALT_INV_Selector10~0_combout\,
	combout => \ConfigureCodec|Selector11~2_combout\);

-- Location: LABCELL_X29_Y8_N3
\ConfigureCodec|Selector11~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector11~3_combout\ = ( \ConfigureCodec|Selector11~2_combout\ ) # ( !\ConfigureCodec|Selector11~2_combout\ & ( ((!\ConfigureCodec|Selector11~0_combout\ & \ConfigureCodec|R.BitCtr\(2))) # (\ConfigureCodec|Selector11~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111110101010101011111010111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector11~1_combout\,
	datac => \ConfigureCodec|ALT_INV_Selector11~0_combout\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_Selector11~2_combout\,
	combout => \ConfigureCodec|Selector11~3_combout\);

-- Location: FF_X29_Y8_N5
\ConfigureCodec|R.BitCtr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector11~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(2));

-- Location: LABCELL_X29_Y8_N36
\ConfigureCodec|NextR~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextR~9_combout\ = ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(2) & (!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & (!\ConfigureCodec|R.BitCtr\(0) & 
-- !\ConfigureCodec|R.Sclk~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datad => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|NextR~9_combout\);

-- Location: LABCELL_X30_Y8_N12
\ConfigureCodec|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector2~0_combout\ = ( \ConfigureCodec|NextR~9_combout\ & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Start~q\) ) ) # ( !\ConfigureCodec|NextR~9_combout\ & ( ((\GenStrobeI2C|oStrobe~DUPLICATE_q\ & 
-- \ConfigureCodec|R.FrameState.Start~q\)) # (\ConfigureCodec|R.FrameState.Address~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111111111000000111111111100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	dataf => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	combout => \ConfigureCodec|Selector2~0_combout\);

-- Location: FF_X30_Y8_N13
\ConfigureCodec|R.FrameState.Address~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector2~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Address~DUPLICATE_q\);

-- Location: LABCELL_X29_Y8_N9
\ConfigureCodec|Selector10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector10~0_combout\ = ( !\ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ & ( !\ConfigureCodec|R.FrameState.Data2~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Address~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector10~0_combout\);

-- Location: LABCELL_X30_Y8_N27
\ConfigureCodec|Selector13~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector13~1_combout\ = ( \ConfigureCodec|R.FrameState.Ack1~q\ & ( \ConfigureCodec|R.Sclk~q\ & ( (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\) ) ) ) # ( !\ConfigureCodec|R.FrameState.Ack1~q\ & 
-- ( \ConfigureCodec|R.Sclk~q\ & ( (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\) ) ) ) # ( \ConfigureCodec|R.FrameState.Ack1~q\ & ( !\ConfigureCodec|R.Sclk~q\ & ( (!\GenStrobeI2C|oStrobe~DUPLICATE_q\ & 
-- (((\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\)))) # (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ((!\ConfigureCodec|R.AckError~q\) # ((!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & 
-- \ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\)))) ) ) ) # ( !\ConfigureCodec|R.FrameState.Ack1~q\ & ( !\ConfigureCodec|R.Sclk~q\ & ( (\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & (!\GenStrobeI2C|oStrobe~DUPLICATE_q\ $ 
-- (!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000111100001000100011111000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datab => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	combout => \ConfigureCodec|Selector13~1_combout\);

-- Location: LABCELL_X30_Y8_N33
\ConfigureCodec|NextR~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextR~10_combout\ = ( \ConfigureCodec|R.BitCtr\(3) & ( !\ConfigureCodec|R.Sclk~q\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ ) ) ) # ( !\ConfigureCodec|R.BitCtr\(3) & ( !\ConfigureCodec|R.Sclk~q\ & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & 
-- (((\ConfigureCodec|R.BitCtr\(1)) # (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\)) # (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010101010101010101010101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	combout => \ConfigureCodec|NextR~10_combout\);

-- Location: LABCELL_X29_Y8_N24
\ConfigureCodec|Selector13~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector13~2_combout\ = ( \ConfigureCodec|R.BitCtr\(0) & ( \ConfigureCodec|NextR~10_combout\ & ( ((!\ConfigureCodec|Selector13~0_combout\) # (\ConfigureCodec|Selector13~1_combout\)) # (\ConfigureCodec|Selector1~1_combout\) ) ) ) # ( 
-- !\ConfigureCodec|R.BitCtr\(0) & ( \ConfigureCodec|NextR~10_combout\ & ( (!\ConfigureCodec|Selector10~0_combout\) # (\ConfigureCodec|Selector13~1_combout\) ) ) ) # ( \ConfigureCodec|R.BitCtr\(0) & ( !\ConfigureCodec|NextR~10_combout\ & ( 
-- ((!\ConfigureCodec|Selector10~0_combout\) # ((!\ConfigureCodec|Selector13~0_combout\) # (\ConfigureCodec|Selector13~1_combout\))) # (\ConfigureCodec|Selector1~1_combout\) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(0) & ( !\ConfigureCodec|NextR~10_combout\ & ( 
-- \ConfigureCodec|Selector13~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111111111101111111001111110011111111111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector1~1_combout\,
	datab => \ConfigureCodec|ALT_INV_Selector10~0_combout\,
	datac => \ConfigureCodec|ALT_INV_Selector13~1_combout\,
	datad => \ConfigureCodec|ALT_INV_Selector13~0_combout\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_NextR~10_combout\,
	combout => \ConfigureCodec|Selector13~2_combout\);

-- Location: FF_X29_Y8_N26
\ConfigureCodec|R.BitCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector13~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(0));

-- Location: LABCELL_X29_Y8_N0
\ConfigureCodec|Selector12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector12~0_combout\ = ( \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|Selector11~1_combout\ & ((!\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\) # ((!\ConfigureCodec|R.BitCtr\(0)) # 
-- (!\ConfigureCodec|NextStateAndOutput~2_combout\)))) ) ) # ( !\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|Selector11~1_combout\ & ((!\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\) # ((!\ConfigureCodec|NextStateAndOutput~2_combout\) # 
-- (\ConfigureCodec|R.BitCtr\(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010001010101010101000101010101010101010001010101010101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector11~1_combout\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datad => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector12~0_combout\);

-- Location: LABCELL_X29_Y8_N30
\ConfigureCodec|Selector12~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector12~1_combout\ = ( \ConfigureCodec|R.BitCtr\(1) & ( \ConfigureCodec|NextR~10_combout\ & ( (!\ConfigureCodec|Selector12~0_combout\) # ((!\ConfigureCodec|Selector11~0_combout\) # ((\ConfigureCodec|R.BitCtr\(0) & 
-- !\ConfigureCodec|Selector10~0_combout\))) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(1) & ( \ConfigureCodec|NextR~10_combout\ & ( (!\ConfigureCodec|Selector12~0_combout\) # ((!\ConfigureCodec|R.BitCtr\(0) & !\ConfigureCodec|Selector10~0_combout\)) ) ) ) # ( 
-- \ConfigureCodec|R.BitCtr\(1) & ( !\ConfigureCodec|NextR~10_combout\ & ( (!\ConfigureCodec|Selector10~0_combout\) # ((!\ConfigureCodec|Selector12~0_combout\) # (!\ConfigureCodec|Selector11~0_combout\)) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(1) & ( 
-- !\ConfigureCodec|NextR~10_combout\ & ( !\ConfigureCodec|Selector12~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111111111111110011111000111110001111111111110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datab => \ConfigureCodec|ALT_INV_Selector10~0_combout\,
	datac => \ConfigureCodec|ALT_INV_Selector12~0_combout\,
	datad => \ConfigureCodec|ALT_INV_Selector11~0_combout\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_NextR~10_combout\,
	combout => \ConfigureCodec|Selector12~1_combout\);

-- Location: FF_X29_Y8_N31
\ConfigureCodec|R.BitCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector12~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.BitCtr\(1));

-- Location: LABCELL_X30_Y8_N36
\ConfigureCodec|NextR~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextR~8_combout\ = ( \ConfigureCodec|R.BitCtr\(3) & ( !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(1) & (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (!\ConfigureCodec|R.Sclk~q\ & 
-- \GenStrobeI2C|oStrobe~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|NextR~8_combout\);

-- Location: LABCELL_X30_Y8_N48
\ConfigureCodec|Selector5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector5~1_combout\ = ( \ConfigureCodec|Selector5~0_combout\ ) # ( !\ConfigureCodec|Selector5~0_combout\ & ( (!\ConfigureCodec|NextR~8_combout\ & \ConfigureCodec|R.FrameState.Data1~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	dataf => \ConfigureCodec|ALT_INV_Selector5~0_combout\,
	combout => \ConfigureCodec|Selector5~1_combout\);

-- Location: FF_X30_Y8_N49
\ConfigureCodec|R.FrameState.Data1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector5~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Data1~q\);

-- Location: LABCELL_X31_Y8_N24
\ConfigureCodec|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector6~0_combout\ = ( !\ConfigureCodec|R.Sclk~q\ & ( (!\ConfigureCodec|R.FrameState.Ack2~q\ & ((((\ConfigureCodec|R.FrameState.Data1~q\ & \ConfigureCodec|NextR~8_combout\))))) # (\ConfigureCodec|R.FrameState.Ack2~q\ & 
-- ((!\GenStrobeI2C|oStrobe~q\) # (((\ConfigureCodec|R.FrameState.Data1~q\ & \ConfigureCodec|NextR~8_combout\)) # (\ConfigureCodec|R.AckError~q\)))) ) ) # ( \ConfigureCodec|R.Sclk~q\ & ( (!\ConfigureCodec|R.FrameState.Ack2~q\ & 
-- ((((\ConfigureCodec|R.FrameState.Data1~q\ & \ConfigureCodec|NextR~8_combout\))))) # (\ConfigureCodec|R.FrameState.Ack2~q\ & ((!\GenStrobeI2C|oStrobe~q\) # ((!\ioI2cSdin~input_o\) # ((\ConfigureCodec|R.FrameState.Data1~q\ & 
-- \ConfigureCodec|NextR~8_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0100010101000101010101000101010001000101111111110101010011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	datab => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datac => \ALT_INV_ioI2cSdin~input_o\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datae => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	dataf => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	datag => \ConfigureCodec|ALT_INV_R.AckError~q\,
	combout => \ConfigureCodec|Selector6~0_combout\);

-- Location: FF_X31_Y8_N26
\ConfigureCodec|R.FrameState.Ack2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector6~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Ack2~q\);

-- Location: LABCELL_X29_Y8_N6
\ConfigureCodec|Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector7~0_combout\ = ( \ConfigureCodec|R.AckError~q\ & ( (!\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Data2~q\) ) ) # ( !\ConfigureCodec|R.AckError~q\ & ( (!\ConfigureCodec|NextStateAndOutput~2_combout\ & 
-- (((!\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Data2~q\)))) # (\ConfigureCodec|NextStateAndOutput~2_combout\ & (((!\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Data2~q\)) # (\ConfigureCodec|R.FrameState.Ack2~q\))) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111110001000100011111000100000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	datac => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	dataf => \ConfigureCodec|ALT_INV_R.AckError~q\,
	combout => \ConfigureCodec|Selector7~0_combout\);

-- Location: FF_X29_Y8_N7
\ConfigureCodec|R.FrameState.Data2~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector7~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\);

-- Location: LABCELL_X31_Y8_N6
\ConfigureCodec|Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector8~0_combout\ = ( !\ConfigureCodec|R.Sclk~q\ & ( (!\ConfigureCodec|R.FrameState.Ack3~q\ & (\ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\ & (((\ConfigureCodec|NextR~9_combout\))))) # (\ConfigureCodec|R.FrameState.Ack3~q\ & 
-- (((!\GenStrobeI2C|oStrobe~DUPLICATE_q\) # ((\ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\ & \ConfigureCodec|NextR~9_combout\))) # (\ConfigureCodec|R.AckError~q\))) ) ) # ( \ConfigureCodec|R.Sclk~q\ & ( (!\ConfigureCodec|R.FrameState.Ack3~q\ & 
-- (\ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\ & (((\ConfigureCodec|NextR~9_combout\))))) # (\ConfigureCodec|R.FrameState.Ack3~q\ & ((!\ioI2cSdin~input_o\) # ((!\GenStrobeI2C|oStrobe~DUPLICATE_q\) # ((\ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\ & 
-- \ConfigureCodec|NextR~9_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0011001101110111001100110111011100000011010101110011000001110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Data2~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	datac => \ALT_INV_ioI2cSdin~input_o\,
	datad => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	datae => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datag => \ConfigureCodec|ALT_INV_R.AckError~q\,
	combout => \ConfigureCodec|Selector8~0_combout\);

-- Location: FF_X31_Y8_N8
\ConfigureCodec|R.FrameState.Ack3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector8~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Ack3~q\);

-- Location: MLABCELL_X28_Y8_N0
\ConfigureCodec|Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector9~0_combout\ = ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( (!\ConfigureCodec|R.Sclk~q\ & (((!\ConfigureCodec|R.AckError~q\ & \ConfigureCodec|R.FrameState.Ack3~q\)))) # (\ConfigureCodec|R.Sclk~q\ & 
-- (\ConfigureCodec|R.FrameState.Stop~q\)) ) ) # ( !\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( \ConfigureCodec|R.FrameState.Stop~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100001100010101010000110001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	datab => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	datad => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector9~0_combout\);

-- Location: FF_X30_Y8_N43
\ConfigureCodec|R.FrameState.Stop\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Selector9~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Stop~q\);

-- Location: LABCELL_X33_Y8_N24
\ConfigureCodec|R.Configured~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~1_combout\ = ( \ConfigureCodec|R.FrameState.Stop~q\ & ( (\ConfigureCodec|R.Activity~q\ & (!\ConfigureCodec|R.Sclk~DUPLICATE_q\ & \GenStrobeI2C|oStrobe~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010100000000000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datac => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	combout => \ConfigureCodec|R.Configured~1_combout\);

-- Location: LABCELL_X33_Y8_N36
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

-- Location: LABCELL_X33_Y8_N39
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

-- Location: FF_X33_Y8_N41
\ConfigureCodec|R.AddrCtr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~17_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(3));

-- Location: LABCELL_X33_Y8_N42
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

-- Location: FF_X33_Y8_N44
\ConfigureCodec|R.AddrCtr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~13_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(4));

-- Location: LABCELL_X33_Y8_N45
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

-- Location: FF_X33_Y8_N47
\ConfigureCodec|R.AddrCtr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~9_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(5));

-- Location: LABCELL_X33_Y8_N48
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

-- Location: FF_X33_Y8_N50
\ConfigureCodec|R.AddrCtr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~5_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(6));

-- Location: LABCELL_X33_Y8_N18
\ConfigureCodec|R.AddrCtr[6]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.AddrCtr[6]~1_combout\ = ( !\ConfigureCodec|R.AddrCtr\(5) & ( \ConfigureCodec|R.AddrCtr\(3) & ( (!\ConfigureCodec|R.AddrCtr\(1) & (\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & (!\ConfigureCodec|R.AddrCtr\(2) & 
-- !\ConfigureCodec|R.AddrCtr\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000100000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(4),
	datae => \ConfigureCodec|ALT_INV_R.AddrCtr\(5),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	combout => \ConfigureCodec|R.AddrCtr[6]~1_combout\);

-- Location: LABCELL_X33_Y8_N6
\ConfigureCodec|R.AddrCtr[6]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.AddrCtr[6]~2_combout\ = ( \ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( \ConfigureCodec|R.FrameState.Stop~q\ & ( (!\ConfigureCodec|R.Activity~q\ & !\ConfigureCodec|R.FrameState.Idle~q\) ) ) ) # ( !\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( 
-- \ConfigureCodec|R.FrameState.Stop~q\ & ( (!\ConfigureCodec|R.FrameState.Idle~q\) # (\ConfigureCodec|R.Activity~q\) ) ) ) # ( \ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( !\ConfigureCodec|R.FrameState.Stop~q\ & ( (!\ConfigureCodec|R.Activity~q\ & 
-- !\ConfigureCodec|R.FrameState.Idle~q\) ) ) ) # ( !\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( !\ConfigureCodec|R.FrameState.Stop~q\ & ( (!\ConfigureCodec|R.Activity~q\ & !\ConfigureCodec|R.FrameState.Idle~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000101000001010000011110101111101011010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datae => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	combout => \ConfigureCodec|R.AddrCtr[6]~2_combout\);

-- Location: LABCELL_X33_Y8_N54
\ConfigureCodec|R.AddrCtr[6]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.AddrCtr[6]~0_combout\ = ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( \ConfigureCodec|R.AddrCtr[6]~2_combout\ & ( (!\ConfigureCodec|R.Activity~q\ & (((\Start~q\)))) # (\ConfigureCodec|R.Activity~q\ & 
-- (((!\ConfigureCodec|R.AddrCtr[6]~1_combout\)) # (\ConfigureCodec|R.AddrCtr\(6)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(6),
	datab => \ALT_INV_Start~q\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[6]~1_combout\,
	datad => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datae => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[6]~2_combout\,
	combout => \ConfigureCodec|R.AddrCtr[6]~0_combout\);

-- Location: FF_X33_Y8_N32
\ConfigureCodec|R.AddrCtr[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~1_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\);

-- Location: MLABCELL_X34_Y8_N27
\ConfigureCodec|R.Configured~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~0_combout\ = ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( \Start~q\ & ( (!\ConfigureCodec|R.Activity~q\ & !\ConfigureCodec|R.FrameState.Idle~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datae => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	dataf => \ALT_INV_Start~q\,
	combout => \ConfigureCodec|R.Configured~0_combout\);

-- Location: LABCELL_X33_Y8_N27
\ConfigureCodec|R.Activity~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Activity~0_combout\ = ( \ConfigureCodec|Equal0~0_combout\ & ( !\ConfigureCodec|R.Activity~q\ $ (((!\ConfigureCodec|R.Configured~0_combout\ & ((!\ConfigureCodec|R.Configured~1_combout\) # (!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\))))) ) 
-- ) # ( !\ConfigureCodec|Equal0~0_combout\ & ( !\ConfigureCodec|R.Activity~q\ $ (!\ConfigureCodec|R.Configured~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010110101010010101011010101001010110101010100101011010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datab => \ConfigureCodec|ALT_INV_R.Configured~1_combout\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Configured~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_Equal0~0_combout\,
	combout => \ConfigureCodec|R.Activity~0_combout\);

-- Location: FF_X33_Y8_N29
\ConfigureCodec|R.Activity\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Activity~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Activity~q\);

-- Location: FF_X33_Y8_N31
\ConfigureCodec|R.AddrCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~1_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(0));

-- Location: LABCELL_X33_Y8_N33
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

-- Location: FF_X33_Y8_N35
\ConfigureCodec|R.AddrCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~25_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(1));

-- Location: FF_X33_Y8_N38
\ConfigureCodec|R.AddrCtr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~21_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr\(2));

-- Location: LABCELL_X33_Y8_N12
\ConfigureCodec|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Equal0~0_combout\ = ( !\ConfigureCodec|R.AddrCtr\(5) & ( !\ConfigureCodec|R.AddrCtr\(6) & ( (!\ConfigureCodec|R.AddrCtr\(2) & (!\ConfigureCodec|R.AddrCtr\(4) & (!\ConfigureCodec|R.AddrCtr\(1) & \ConfigureCodec|R.AddrCtr\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(4),
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datae => \ConfigureCodec|ALT_INV_R.AddrCtr\(5),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(6),
	combout => \ConfigureCodec|Equal0~0_combout\);

-- Location: MLABCELL_X34_Y8_N33
\ConfigureCodec|R.Configured~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~2_combout\ = ( \ConfigureCodec|R.Configured~q\ & ( \ConfigureCodec|R.Configured~0_combout\ & ( \ConfigureCodec|R.Activity~q\ ) ) ) # ( !\ConfigureCodec|R.Configured~q\ & ( \ConfigureCodec|R.Configured~0_combout\ & ( 
-- \ConfigureCodec|R.Activity~q\ ) ) ) # ( \ConfigureCodec|R.Configured~q\ & ( !\ConfigureCodec|R.Configured~0_combout\ & ( (!\ConfigureCodec|Equal0~0_combout\) # ((!\ConfigureCodec|R.Configured~1_combout\) # ((!\ConfigureCodec|R.AddrCtr\(0)) # 
-- (\ConfigureCodec|R.Activity~q\))) ) ) ) # ( !\ConfigureCodec|R.Configured~q\ & ( !\ConfigureCodec|R.Configured~0_combout\ & ( (\ConfigureCodec|Equal0~0_combout\ & (\ConfigureCodec|R.Configured~1_combout\ & (\ConfigureCodec|R.Activity~q\ & 
-- \ConfigureCodec|R.AddrCtr\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001111111111110111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Equal0~0_combout\,
	datab => \ConfigureCodec|ALT_INV_R.Configured~1_combout\,
	datac => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	datae => \ConfigureCodec|ALT_INV_R.Configured~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Configured~0_combout\,
	combout => \ConfigureCodec|R.Configured~2_combout\);

-- Location: FF_X34_Y8_N34
\ConfigureCodec|R.Configured\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.Configured~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Configured~q\);

-- Location: MLABCELL_X34_Y8_N15
\WaitCtr[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WaitCtr[1]~0_combout\ = ( WaitCtr(1) & ( \ConfigureCodec|R.Configured~q\ ) ) # ( WaitCtr(1) & ( !\ConfigureCodec|R.Configured~q\ ) ) # ( !WaitCtr(1) & ( !\ConfigureCodec|R.Configured~q\ & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & WaitCtr(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datac => ALT_INV_WaitCtr(0),
	datae => ALT_INV_WaitCtr(1),
	dataf => \ConfigureCodec|ALT_INV_R.Configured~q\,
	combout => \WaitCtr[1]~0_combout\);

-- Location: FF_X34_Y8_N17
\WaitCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \WaitCtr[1]~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => WaitCtr(1));

-- Location: MLABCELL_X34_Y8_N42
\WaitCtr[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \WaitCtr[0]~1_combout\ = ( WaitCtr(0) & ( \ConfigureCodec|R.Configured~q\ ) ) # ( WaitCtr(0) & ( !\ConfigureCodec|R.Configured~q\ & ( (!\GenStrobeI2C|oStrobe~DUPLICATE_q\) # (WaitCtr(1)) ) ) ) # ( !WaitCtr(0) & ( !\ConfigureCodec|R.Configured~q\ & ( 
-- \GenStrobeI2C|oStrobe~DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011110011001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datad => ALT_INV_WaitCtr(1),
	datae => ALT_INV_WaitCtr(0),
	dataf => \ConfigureCodec|ALT_INV_R.Configured~q\,
	combout => \WaitCtr[0]~1_combout\);

-- Location: FF_X34_Y8_N43
\WaitCtr[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \WaitCtr[0]~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \WaitCtr[0]~DUPLICATE_q\);

-- Location: MLABCELL_X34_Y8_N48
\Start~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Start~0_combout\ = ( \Start~q\ & ( !\ConfigureCodec|R.Configured~q\ & ( (!\GenStrobeI2C|oStrobe~DUPLICATE_q\) # ((\WaitCtr[0]~DUPLICATE_q\ & WaitCtr(1))) ) ) ) # ( !\Start~q\ & ( !\ConfigureCodec|R.Configured~q\ & ( (\WaitCtr[0]~DUPLICATE_q\ & 
-- (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & WaitCtr(1))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010001110011001101110100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_WaitCtr[0]~DUPLICATE_q\,
	datab => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datad => ALT_INV_WaitCtr(1),
	datae => \ALT_INV_Start~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Configured~q\,
	combout => \Start~0_combout\);

-- Location: FF_X34_Y8_N50
Start : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \Start~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Start~q\);

-- Location: LABCELL_X31_Y8_N54
\ConfigureCodec|Selector16~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector16~1_combout\ = ( \ConfigureCodec|R.FrameState.Start~q\ & ( \ConfigureCodec|Selector0~0_combout\ ) ) # ( !\ConfigureCodec|R.FrameState.Start~q\ & ( \ConfigureCodec|Selector0~0_combout\ & ( (\Start~q\ & 
-- (!\ConfigureCodec|R.Activity~q\ & (!\ConfigureCodec|R.FrameState.Idle~q\ & \GenStrobeI2C|oStrobe~q\))) ) ) ) # ( \ConfigureCodec|R.FrameState.Start~q\ & ( !\ConfigureCodec|Selector0~0_combout\ & ( (\Start~q\ & (!\ConfigureCodec|R.Activity~q\ & 
-- (!\ConfigureCodec|R.FrameState.Idle~q\ & \GenStrobeI2C|oStrobe~q\))) ) ) ) # ( !\ConfigureCodec|R.FrameState.Start~q\ & ( !\ConfigureCodec|Selector0~0_combout\ & ( (\Start~q\ & (!\ConfigureCodec|R.Activity~q\ & (!\ConfigureCodec|R.FrameState.Idle~q\ & 
-- \GenStrobeI2C|oStrobe~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000000000000000100000000000000010000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Start~q\,
	datab => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	dataf => \ConfigureCodec|ALT_INV_Selector0~0_combout\,
	combout => \ConfigureCodec|Selector16~1_combout\);

-- Location: LABCELL_X30_Y8_N18
\ConfigureCodec|Selector16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector16~0_combout\ = ( \ConfigureCodec|R.AckError~q\ & ( \ConfigureCodec|Selector16~1_combout\ & ( (!\ConfigureCodec|Selector0~0_combout\ & (\ConfigureCodec|R.Sclk~q\ & ((!\GenStrobeI2C|oStrobe~DUPLICATE_q\) # (\ioI2cSdin~input_o\)))) ) 
-- ) ) # ( !\ConfigureCodec|R.AckError~q\ & ( \ConfigureCodec|Selector16~1_combout\ & ( (\ioI2cSdin~input_o\ & (!\ConfigureCodec|Selector0~0_combout\ & (\ConfigureCodec|R.Sclk~q\ & \GenStrobeI2C|oStrobe~DUPLICATE_q\))) ) ) ) # ( \ConfigureCodec|R.AckError~q\ 
-- & ( !\ConfigureCodec|Selector16~1_combout\ & ( (((!\ConfigureCodec|R.Sclk~q\) # (!\GenStrobeI2C|oStrobe~DUPLICATE_q\)) # (\ConfigureCodec|Selector0~0_combout\)) # (\ioI2cSdin~input_o\) ) ) ) # ( !\ConfigureCodec|R.AckError~q\ & ( 
-- !\ConfigureCodec|Selector16~1_combout\ & ( (\ioI2cSdin~input_o\ & (!\ConfigureCodec|Selector0~0_combout\ & (\ConfigureCodec|R.Sclk~q\ & \GenStrobeI2C|oStrobe~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100111111111111011100000000000001000000110000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ioI2cSdin~input_o\,
	datab => \ConfigureCodec|ALT_INV_Selector0~0_combout\,
	datac => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.AckError~q\,
	dataf => \ConfigureCodec|ALT_INV_Selector16~1_combout\,
	combout => \ConfigureCodec|Selector16~0_combout\);

-- Location: FF_X30_Y8_N20
\ConfigureCodec|R.AckError\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector16~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AckError~q\);

-- Location: LABCELL_X31_Y8_N48
\ConfigureCodec|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector4~0_combout\ = ( \ConfigureCodec|R.FrameState.Ack1~q\ & ( \ConfigureCodec|R.FrameState.RWBit~DUPLICATE_q\ & ( (!\ConfigureCodec|R.Sclk~q\) # ((!\ioI2cSdin~input_o\) # (!\GenStrobeI2C|oStrobe~q\)) ) ) ) # ( 
-- !\ConfigureCodec|R.FrameState.Ack1~q\ & ( \ConfigureCodec|R.FrameState.RWBit~DUPLICATE_q\ & ( (!\ConfigureCodec|R.Sclk~q\ & \GenStrobeI2C|oStrobe~q\) ) ) ) # ( \ConfigureCodec|R.FrameState.Ack1~q\ & ( !\ConfigureCodec|R.FrameState.RWBit~DUPLICATE_q\ & ( 
-- (!\GenStrobeI2C|oStrobe~q\) # ((!\ConfigureCodec|R.Sclk~q\ & ((\ConfigureCodec|R.AckError~q\))) # (\ConfigureCodec|R.Sclk~q\ & (!\ioI2cSdin~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110100111000000000101010101111111111101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datab => \ALT_INV_ioI2cSdin~input_o\,
	datac => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.RWBit~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector4~0_combout\);

-- Location: FF_X31_Y8_N50
\ConfigureCodec|R.FrameState.Ack1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector4~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Ack1~q\);

-- Location: LABCELL_X31_Y8_N12
\ConfigureCodec|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector0~0_combout\ = ( !\ConfigureCodec|R.FrameState.Ack3~q\ & ( (!\ConfigureCodec|R.FrameState.Ack1~q\ & !\ConfigureCodec|R.FrameState.Ack2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000101000001010000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	combout => \ConfigureCodec|Selector0~0_combout\);

-- Location: LABCELL_X31_Y8_N42
\ConfigureCodec|Selector0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector0~2_combout\ = ( \ConfigureCodec|R.AckError~q\ & ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( ((!\ConfigureCodec|R.FrameState.Idle~q\ & !\ConfigureCodec|Selector0~0_combout\)) # (\ConfigureCodec|R.FrameState.Stop~q\) ) ) ) # 
-- ( !\ConfigureCodec|R.AckError~q\ & ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( ((!\ConfigureCodec|R.FrameState.Idle~q\ & (!\GenStrobeI2C|oStrobe~DUPLICATE_q\ & !\ConfigureCodec|Selector0~0_combout\))) # (\ConfigureCodec|R.FrameState.Stop~q\) ) ) ) 
-- # ( \ConfigureCodec|R.AckError~q\ & ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( (!\ConfigureCodec|R.FrameState.Idle~q\ & !\ConfigureCodec|Selector0~0_combout\) ) ) ) # ( !\ConfigureCodec|R.AckError~q\ & ( 
-- !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( (!\ConfigureCodec|R.FrameState.Idle~q\ & (!\GenStrobeI2C|oStrobe~DUPLICATE_q\ & !\ConfigureCodec|Selector0~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101010100000000010110011001100111011101100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	datac => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_Selector0~0_combout\,
	datae => \ConfigureCodec|ALT_INV_R.AckError~q\,
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	combout => \ConfigureCodec|Selector0~2_combout\);

-- Location: LABCELL_X31_Y8_N36
\ConfigureCodec|Selector0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector0~3_combout\ = ( !\ConfigureCodec|R.FrameState.Idle~q\ & ( (!\ConfigureCodec|R.Activity~q\) # ((!\GenStrobeI2C|oStrobe~q\) # (((\ConfigureCodec|R.Sclk~q\ & !\ConfigureCodec|Selector0~0_combout\)) # 
-- (\ConfigureCodec|Selector0~2_combout\))) ) ) # ( \ConfigureCodec|R.FrameState.Idle~q\ & ( ((\ConfigureCodec|R.Sclk~q\ & (!\ConfigureCodec|Selector0~0_combout\ & (\ioI2cSdin~input_o\ & \GenStrobeI2C|oStrobe~q\)))) # (\ConfigureCodec|Selector0~2_combout\) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "1111111111110100000000000000010011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datab => \ConfigureCodec|ALT_INV_Selector0~0_combout\,
	datac => \ALT_INV_ioI2cSdin~input_o\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	dataf => \ConfigureCodec|ALT_INV_Selector0~2_combout\,
	datag => \ConfigureCodec|ALT_INV_R.Activity~q\,
	combout => \ConfigureCodec|Selector0~3_combout\);

-- Location: LABCELL_X31_Y8_N3
\ConfigureCodec|R.FrameState.Idle~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.FrameState.Idle~0_combout\ = ( !\ConfigureCodec|Selector0~3_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ConfigureCodec|ALT_INV_Selector0~3_combout\,
	combout => \ConfigureCodec|R.FrameState.Idle~0_combout\);

-- Location: FF_X31_Y8_N5
\ConfigureCodec|R.FrameState.Idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|R.FrameState.Idle~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Idle~q\);

-- Location: LABCELL_X31_Y8_N18
\ConfigureCodec|Selector14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector14~0_combout\ = ( \ConfigureCodec|R.Sclk~q\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( ((!\ConfigureCodec|R.Activity~q\ & ((\ConfigureCodec|R.FrameState.Stop~q\) # (\ConfigureCodec|R.FrameState.Idle~q\)))) # 
-- (\ConfigureCodec|R.FrameState.Start~q\) ) ) ) # ( !\ConfigureCodec|R.Sclk~q\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( ((\ConfigureCodec|R.FrameState.Idle~q\ & (\ConfigureCodec|R.Activity~q\ & !\ConfigureCodec|R.FrameState.Stop~q\))) # 
-- (\ConfigureCodec|R.FrameState.Start~q\) ) ) ) # ( \ConfigureCodec|R.Sclk~q\ & ( !\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( ((\ConfigureCodec|R.FrameState.Idle~q\ & !\ConfigureCodec|R.FrameState.Start~q\)) # (\ConfigureCodec|R.FrameState.Stop~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100001111111100011111000011110100111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datab => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	datae => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector14~0_combout\);

-- Location: FF_X30_Y8_N26
\ConfigureCodec|R.Sclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Selector14~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Sclk~q\);

-- Location: LABCELL_X29_Y8_N54
\ConfigureCodec|Selector15~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~1_combout\ = ( !\ConfigureCodec|R.FrameState.RWBit~q\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( ((!\ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ & (!\ConfigureCodec|R.FrameState.Data1~q\ & 
-- !\ConfigureCodec|R.FrameState.Data2~q\))) # (\ConfigureCodec|R.Sdin~DUPLICATE_q\) ) ) ) # ( \ConfigureCodec|R.FrameState.RWBit~q\ & ( !\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( \ConfigureCodec|R.Sdin~DUPLICATE_q\ ) ) ) # ( 
-- !\ConfigureCodec|R.FrameState.RWBit~q\ & ( !\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( ((!\ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ & (!\ConfigureCodec|R.FrameState.Data1~q\ & !\ConfigureCodec|R.FrameState.Data2~q\))) # 
-- (\ConfigureCodec|R.Sdin~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101010101010101010101010101010111010101010101010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Sdin~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Address~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector15~1_combout\);

-- Location: LABCELL_X29_Y8_N18
\ConfigureCodec|Selector15~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~2_combout\ = ( \ConfigureCodec|NextR~8_combout\ & ( (!\ConfigureCodec|R.FrameState.Data1~q\ & (\ConfigureCodec|Selector15~1_combout\ & ((!\ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\) # (!\ConfigureCodec|NextR~9_combout\)))) 
-- ) ) # ( !\ConfigureCodec|NextR~8_combout\ & ( (\ConfigureCodec|Selector15~1_combout\ & ((!\ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\) # (!\ConfigureCodec|NextR~9_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111100000000001111110000000000101010000000000010101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Data2~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	datad => \ConfigureCodec|ALT_INV_Selector15~1_combout\,
	dataf => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	combout => \ConfigureCodec|Selector15~2_combout\);

-- Location: LABCELL_X30_Y8_N51
\ConfigureCodec|Selector15~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~3_combout\ = ( \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( (\ConfigureCodec|R.FrameState.Address~q\ & (((\ConfigureCodec|R.BitCtr\(1) & \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\)) # (\ConfigureCodec|R.BitCtr\(3)))) ) ) # ( 
-- !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( (\ConfigureCodec|R.FrameState.Address~q\ & \ConfigureCodec|R.BitCtr\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000001000011110000000100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector15~3_combout\);

-- Location: LABCELL_X30_Y8_N45
\ConfigureCodec|Selector15~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~4_combout\ = ( !\ConfigureCodec|R.BitCtr\(3) & ( \ConfigureCodec|R.Sclk~q\ & ( (\ConfigureCodec|R.FrameState.Address~q\ & ((!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & 
-- !\ConfigureCodec|R.BitCtr\(1))) # (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000010010000100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	combout => \ConfigureCodec|Selector15~4_combout\);

-- Location: FF_X29_Y8_N44
\ConfigureCodec|R.Sdin\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector15~6_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Sdin~q\);

-- Location: LABCELL_X31_Y8_N15
\ConfigureCodec|Selector0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector0~1_combout\ = ( \ConfigureCodec|R.Activity~q\ & ( (!\GenStrobeI2C|oStrobe~q\ & !\ConfigureCodec|R.FrameState.Idle~q\) ) ) # ( !\ConfigureCodec|R.Activity~q\ & ( !\ConfigureCodec|R.FrameState.Idle~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Activity~q\,
	combout => \ConfigureCodec|Selector0~1_combout\);

-- Location: LABCELL_X30_Y8_N6
\ConfigureCodec|Selector15~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~5_combout\ = ( \ConfigureCodec|R.Sdin~q\ & ( !\ConfigureCodec|Selector0~1_combout\ & ( !\ConfigureCodec|Selector15~4_combout\ ) ) ) # ( !\ConfigureCodec|R.Sdin~q\ & ( !\ConfigureCodec|Selector0~1_combout\ & ( 
-- (!\ConfigureCodec|Selector15~3_combout\ & (!\ConfigureCodec|Selector15~4_combout\ & (!\ConfigureCodec|R.FrameState.Start~q\ & \ConfigureCodec|Selector0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000110011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector15~3_combout\,
	datab => \ConfigureCodec|ALT_INV_Selector15~4_combout\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datad => \ConfigureCodec|ALT_INV_Selector0~0_combout\,
	datae => \ConfigureCodec|ALT_INV_R.Sdin~q\,
	dataf => \ConfigureCodec|ALT_INV_Selector0~1_combout\,
	combout => \ConfigureCodec|Selector15~5_combout\);

-- Location: LABCELL_X33_Y8_N0
\ConfigureCodec|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux6~0_combout\ = ( \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (\ConfigureCodec|R.AddrCtr\(1) & (!\ConfigureCodec|R.AddrCtr\(3) & \ConfigureCodec|R.AddrCtr\(2))) ) ) # ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( 
-- (!\ConfigureCodec|R.AddrCtr\(1) & (\ConfigureCodec|R.AddrCtr\(3) & !\ConfigureCodec|R.AddrCtr\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000000000001000100000000000000000010001000000000001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux6~0_combout\);

-- Location: MLABCELL_X28_Y8_N36
\ConfigureCodec|R.Data[15]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[15]~0_combout\ = ( \ConfigureCodec|R.Activity~q\ & ( (\ConfigureCodec|R.FrameState.Start~q\ & \GenStrobeI2C|oStrobe~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	datab => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.Activity~q\,
	combout => \ConfigureCodec|R.Data[15]~0_combout\);

-- Location: FF_X28_Y8_N37
\ConfigureCodec|R.Data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Mux6~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(1));

-- Location: FF_X28_Y8_N58
\ConfigureCodec|R.Data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(9));

-- Location: FF_X33_Y8_N34
\ConfigureCodec|R.AddrCtr[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~25_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y8_N3
\ConfigureCodec|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux4~0_combout\ = ( \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( !\ConfigureCodec|R.AddrCtr\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux4~0_combout\);

-- Location: FF_X28_Y8_N5
\ConfigureCodec|R.Data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux4~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(3));

-- Location: FF_X28_Y8_N8
\ConfigureCodec|R.Data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(2),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(11));

-- Location: MLABCELL_X28_Y8_N9
\ConfigureCodec|Mux9~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~2_combout\ = ( \ConfigureCodec|R.Data\(3) & ( \ConfigureCodec|R.Data\(11) & ( ((!\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(1))) # (\ConfigureCodec|R.BitCtr\(3) & ((\ConfigureCodec|R.Data\(9))))) # 
-- (\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\) ) ) ) # ( !\ConfigureCodec|R.Data\(3) & ( \ConfigureCodec|R.Data\(11) & ( (!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ((!\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(1))) # 
-- (\ConfigureCodec|R.BitCtr\(3) & ((\ConfigureCodec|R.Data\(9)))))) # (\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & (\ConfigureCodec|R.BitCtr\(3))) ) ) ) # ( \ConfigureCodec|R.Data\(3) & ( !\ConfigureCodec|R.Data\(11) & ( 
-- (!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ((!\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(1))) # (\ConfigureCodec|R.BitCtr\(3) & ((\ConfigureCodec|R.Data\(9)))))) # (\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & (!\ConfigureCodec|R.BitCtr\(3))) 
-- ) ) ) # ( !\ConfigureCodec|R.Data\(3) & ( !\ConfigureCodec|R.Data\(11) & ( (!\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ((!\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(1))) # (\ConfigureCodec|R.BitCtr\(3) & ((\ConfigureCodec|R.Data\(9)))))) ) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000101010010011000110111000011001001110110101110101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datac => \ConfigureCodec|ALT_INV_R.Data\(1),
	datad => \ConfigureCodec|ALT_INV_R.Data\(9),
	datae => \ConfigureCodec|ALT_INV_R.Data\(3),
	dataf => \ConfigureCodec|ALT_INV_R.Data\(11),
	combout => \ConfigureCodec|Mux9~2_combout\);

-- Location: MLABCELL_X28_Y8_N51
\ConfigureCodec|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux0~0_combout\ = ( !\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.AddrCtr\(3) & ((!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\) # (!\ConfigureCodec|R.AddrCtr\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110000011100000111000001110000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux0~0_combout\);

-- Location: FF_X28_Y8_N53
\ConfigureCodec|R.Data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux0~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(7));

-- Location: MLABCELL_X28_Y8_N33
\ConfigureCodec|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux2~0_combout\ = ( \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.AddrCtr\(3) & ((!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\) # (!\ConfigureCodec|R.AddrCtr\(2)))) ) ) # ( !\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( 
-- (!\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & (\ConfigureCodec|R.AddrCtr\(3) & !\ConfigureCodec|R.AddrCtr\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000011110000101000001111000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux2~0_combout\);

-- Location: FF_X28_Y8_N35
\ConfigureCodec|R.Data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux2~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(5));

-- Location: FF_X28_Y8_N17
\ConfigureCodec|R.Data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(6),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(15));

-- Location: FF_X28_Y8_N23
\ConfigureCodec|R.Data[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(4),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(13));

-- Location: MLABCELL_X28_Y8_N12
\ConfigureCodec|Mux9~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~3_combout\ = ( \ConfigureCodec|R.Data\(13) & ( \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(7))) # (\ConfigureCodec|R.BitCtr\(3) & ((\ConfigureCodec|R.Data\(15)))) ) ) ) # ( 
-- !\ConfigureCodec|R.Data\(13) & ( \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(7))) # (\ConfigureCodec|R.BitCtr\(3) & ((\ConfigureCodec|R.Data\(15)))) ) ) ) # ( \ConfigureCodec|R.Data\(13) & ( 
-- !\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ( (\ConfigureCodec|R.Data\(5)) # (\ConfigureCodec|R.BitCtr\(3)) ) ) ) # ( !\ConfigureCodec|R.Data\(13) & ( !\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(3) & 
-- \ConfigureCodec|R.Data\(5)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100001111110011111101000100011101110100010001110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data\(7),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datac => \ConfigureCodec|ALT_INV_R.Data\(5),
	datad => \ConfigureCodec|ALT_INV_R.Data\(15),
	datae => \ConfigureCodec|ALT_INV_R.Data\(13),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux9~3_combout\);

-- Location: LABCELL_X27_Y8_N36
\ConfigureCodec|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux5~0_combout\ = ( \ConfigureCodec|R.AddrCtr\(2) & ( !\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux5~0_combout\);

-- Location: FF_X28_Y8_N26
\ConfigureCodec|R.Data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Mux5~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(2));

-- Location: FF_X28_Y8_N13
\ConfigureCodec|R.Data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(10));

-- Location: LABCELL_X33_Y8_N3
\ConfigureCodec|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux7~0_combout\ = ( \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.AddrCtr\(1) $ (!\ConfigureCodec|R.AddrCtr\(2))) # (\ConfigureCodec|R.AddrCtr\(3)) ) ) # ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( 
-- (\ConfigureCodec|R.AddrCtr\(3)) # (\ConfigureCodec|R.AddrCtr\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111011101110111011101110111101110110111011110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux7~0_combout\);

-- Location: FF_X28_Y8_N19
\ConfigureCodec|R.Data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|Mux7~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(0));

-- Location: MLABCELL_X28_Y8_N57
\ConfigureCodec|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~0_combout\ = ( \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(2))) # (\ConfigureCodec|R.BitCtr\(3) & ((\ConfigureCodec|R.Data\(10)))) ) ) # ( 
-- !\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(3) & \ConfigureCodec|R.Data\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110001000111010001110100011101000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data\(2),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datac => \ConfigureCodec|ALT_INV_R.Data\(10),
	datad => \ConfigureCodec|ALT_INV_R.Data\(0),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux9~0_combout\);

-- Location: MLABCELL_X28_Y8_N48
\ConfigureCodec|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux1~0_combout\ = ( \ConfigureCodec|R.AddrCtr\(2) & ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ ) ) # ( !\ConfigureCodec|R.AddrCtr\(2) & ( \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	combout => \ConfigureCodec|Mux1~0_combout\);

-- Location: FF_X28_Y8_N50
\ConfigureCodec|R.Data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux1~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(6));

-- Location: FF_X33_Y8_N46
\ConfigureCodec|R.AddrCtr[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Add0~9_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ConfigureCodec|ALT_INV_R.Activity~q\,
	ena => \ConfigureCodec|R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.AddrCtr[5]~DUPLICATE_q\);

-- Location: FF_X28_Y8_N29
\ConfigureCodec|R.Data[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr[5]~DUPLICATE_q\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(14));

-- Location: FF_X28_Y8_N41
\ConfigureCodec|R.Data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(3),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(12));

-- Location: MLABCELL_X28_Y8_N54
\ConfigureCodec|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux3~0_combout\ = ( \ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( (\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & !\ConfigureCodec|R.AddrCtr\(2)) ) ) # ( !\ConfigureCodec|R.AddrCtr[0]~DUPLICATE_q\ & ( 
-- !\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ $ (!\ConfigureCodec|R.AddrCtr\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000011111111000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[0]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux3~0_combout\);

-- Location: FF_X28_Y8_N56
\ConfigureCodec|R.Data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux3~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(4));

-- Location: MLABCELL_X28_Y8_N18
\ConfigureCodec|Mux9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~1_combout\ = ( \ConfigureCodec|R.Data\(4) & ( \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(6))) # (\ConfigureCodec|R.BitCtr\(3) & ((\ConfigureCodec|R.Data\(14)))) ) ) ) # ( 
-- !\ConfigureCodec|R.Data\(4) & ( \ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(3) & (\ConfigureCodec|R.Data\(6))) # (\ConfigureCodec|R.BitCtr\(3) & ((\ConfigureCodec|R.Data\(14)))) ) ) ) # ( \ConfigureCodec|R.Data\(4) & ( 
-- !\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(3)) # (\ConfigureCodec|R.Data\(12)) ) ) ) # ( !\ConfigureCodec|R.Data\(4) & ( !\ConfigureCodec|R.BitCtr[1]~DUPLICATE_q\ & ( (\ConfigureCodec|R.BitCtr\(3) & 
-- \ConfigureCodec|R.Data\(12)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011110011001111111101000111010001110100011101000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data\(6),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datac => \ConfigureCodec|ALT_INV_R.Data\(14),
	datad => \ConfigureCodec|ALT_INV_R.Data\(12),
	datae => \ConfigureCodec|ALT_INV_R.Data\(4),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[1]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux9~1_combout\);

-- Location: MLABCELL_X28_Y8_N24
\ConfigureCodec|Mux9~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~4_combout\ = ( \ConfigureCodec|Mux9~0_combout\ & ( \ConfigureCodec|Mux9~1_combout\ & ( (!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\) # ((!\ConfigureCodec|R.BitCtr\(2) & (\ConfigureCodec|Mux9~2_combout\)) # (\ConfigureCodec|R.BitCtr\(2) 
-- & ((\ConfigureCodec|Mux9~3_combout\)))) ) ) ) # ( !\ConfigureCodec|Mux9~0_combout\ & ( \ConfigureCodec|Mux9~1_combout\ & ( (!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & (((\ConfigureCodec|R.BitCtr\(2))))) # (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & 
-- ((!\ConfigureCodec|R.BitCtr\(2) & (\ConfigureCodec|Mux9~2_combout\)) # (\ConfigureCodec|R.BitCtr\(2) & ((\ConfigureCodec|Mux9~3_combout\))))) ) ) ) # ( \ConfigureCodec|Mux9~0_combout\ & ( !\ConfigureCodec|Mux9~1_combout\ & ( 
-- (!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & (((!\ConfigureCodec|R.BitCtr\(2))))) # (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ((!\ConfigureCodec|R.BitCtr\(2) & (\ConfigureCodec|Mux9~2_combout\)) # (\ConfigureCodec|R.BitCtr\(2) & 
-- ((\ConfigureCodec|Mux9~3_combout\))))) ) ) ) # ( !\ConfigureCodec|Mux9~0_combout\ & ( !\ConfigureCodec|Mux9~1_combout\ & ( (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ((!\ConfigureCodec|R.BitCtr\(2) & (\ConfigureCodec|Mux9~2_combout\)) # 
-- (\ConfigureCodec|R.BitCtr\(2) & ((\ConfigureCodec|Mux9~3_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010101101100001011010100011010000111111011101010111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_Mux9~2_combout\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	datad => \ConfigureCodec|ALT_INV_Mux9~3_combout\,
	datae => \ConfigureCodec|ALT_INV_Mux9~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_Mux9~1_combout\,
	combout => \ConfigureCodec|Mux9~4_combout\);

-- Location: LABCELL_X29_Y8_N42
\ConfigureCodec|Selector15~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~6_combout\ = ( \ConfigureCodec|Selector15~5_combout\ & ( \ConfigureCodec|Mux9~4_combout\ & ( (!\ConfigureCodec|R.Sclk~q\ & (((\ConfigureCodec|Selector15~2_combout\)))) # (\ConfigureCodec|R.Sclk~q\ & 
-- (!\ConfigureCodec|R.FrameState.Data1~DUPLICATE_q\ & ((!\ConfigureCodec|R.FrameState.Data2~q\)))) ) ) ) # ( \ConfigureCodec|Selector15~5_combout\ & ( !\ConfigureCodec|Mux9~4_combout\ & ( (\ConfigureCodec|Selector15~2_combout\) # (\ConfigureCodec|R.Sclk~q\) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010111110101111100000000000000000100111000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Data1~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_Selector15~2_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	datae => \ConfigureCodec|ALT_INV_Selector15~5_combout\,
	dataf => \ConfigureCodec|ALT_INV_Mux9~4_combout\,
	combout => \ConfigureCodec|Selector15~6_combout\);

-- Location: FF_X29_Y8_N43
\ConfigureCodec|R.Sdin~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector15~6_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Sdin~DUPLICATE_q\);

-- Location: MLABCELL_X34_Y57_N24
\TheClkMaster|MclkCounter[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheClkMaster|MclkCounter[0]~0_combout\ = ( !\TheClkMaster|MclkCounter\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \TheClkMaster|ALT_INV_MclkCounter\(0),
	combout => \TheClkMaster|MclkCounter[0]~0_combout\);

-- Location: FF_X34_Y57_N26
\TheClkMaster|MclkCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheClkMaster|MclkCounter[0]~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheClkMaster|MclkCounter\(0));

-- Location: LABCELL_X33_Y57_N3
\TheClkMaster|Mclk~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheClkMaster|Mclk~0_combout\ = ( \TheClkMaster|MclkCounter\(0) & ( !\TheClkMaster|Mclk~q\ ) ) # ( !\TheClkMaster|MclkCounter\(0) & ( \TheClkMaster|Mclk~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheClkMaster|ALT_INV_Mclk~q\,
	dataf => \TheClkMaster|ALT_INV_MclkCounter\(0),
	combout => \TheClkMaster|Mclk~0_combout\);

-- Location: FF_X33_Y57_N20
\TheClkMaster|Mclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheClkMaster|Mclk~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheClkMaster|Mclk~q\);

-- Location: LABCELL_X33_Y57_N30
\TheClkMaster|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheClkMaster|Add1~9_sumout\ = SUM(( \TheClkMaster|ADCCounter\(0) ) + ( VCC ) + ( !VCC ))
-- \TheClkMaster|Add1~10\ = CARRY(( \TheClkMaster|ADCCounter\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheClkMaster|ALT_INV_ADCCounter\(0),
	cin => GND,
	sumout => \TheClkMaster|Add1~9_sumout\,
	cout => \TheClkMaster|Add1~10\);

-- Location: FF_X33_Y57_N14
\TheClkMaster|ADCCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TheClkMaster|ALT_INV_Mclk~q\,
	asdata => \TheClkMaster|Add1~9_sumout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheClkMaster|ADCCounter\(0));

-- Location: LABCELL_X33_Y57_N33
\TheClkMaster|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheClkMaster|Add1~5_sumout\ = SUM(( \TheClkMaster|ADCCounter\(1) ) + ( GND ) + ( \TheClkMaster|Add1~10\ ))
-- \TheClkMaster|Add1~6\ = CARRY(( \TheClkMaster|ADCCounter\(1) ) + ( GND ) + ( \TheClkMaster|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheClkMaster|ALT_INV_ADCCounter\(1),
	cin => \TheClkMaster|Add1~10\,
	sumout => \TheClkMaster|Add1~5_sumout\,
	cout => \TheClkMaster|Add1~6\);

-- Location: FF_X33_Y57_N28
\TheClkMaster|ADCCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TheClkMaster|ALT_INV_Mclk~q\,
	asdata => \TheClkMaster|Add1~5_sumout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheClkMaster|ADCCounter\(1));

-- Location: LABCELL_X33_Y57_N36
\TheClkMaster|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheClkMaster|Add1~1_sumout\ = SUM(( \TheClkMaster|ADCCounter\(2) ) + ( GND ) + ( \TheClkMaster|Add1~6\ ))
-- \TheClkMaster|Add1~2\ = CARRY(( \TheClkMaster|ADCCounter\(2) ) + ( GND ) + ( \TheClkMaster|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheClkMaster|ALT_INV_ADCCounter\(2),
	cin => \TheClkMaster|Add1~6\,
	sumout => \TheClkMaster|Add1~1_sumout\,
	cout => \TheClkMaster|Add1~2\);

-- Location: FF_X33_Y57_N17
\TheClkMaster|ADCCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TheClkMaster|ALT_INV_Mclk~q\,
	asdata => \TheClkMaster|Add1~1_sumout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheClkMaster|ADCCounter\(2));

-- Location: LABCELL_X33_Y57_N39
\TheClkMaster|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheClkMaster|Add1~29_sumout\ = SUM(( \TheClkMaster|ADCCounter\(3) ) + ( GND ) + ( \TheClkMaster|Add1~2\ ))
-- \TheClkMaster|Add1~30\ = CARRY(( \TheClkMaster|ADCCounter\(3) ) + ( GND ) + ( \TheClkMaster|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheClkMaster|ALT_INV_ADCCounter\(3),
	cin => \TheClkMaster|Add1~2\,
	sumout => \TheClkMaster|Add1~29_sumout\,
	cout => \TheClkMaster|Add1~30\);

-- Location: LABCELL_X33_Y57_N6
\TheClkMaster|ADCCounter~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheClkMaster|ADCCounter~1_combout\ = ( \TheClkMaster|ADCCounter\(0) & ( (\TheClkMaster|Add1~29_sumout\ & ((!\TheClkMaster|Equal0~0_combout\) # ((!\TheClkMaster|ADCCounter\(2)) # (!\TheClkMaster|ADCCounter\(1))))) ) ) # ( !\TheClkMaster|ADCCounter\(0) & ( 
-- \TheClkMaster|Add1~29_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000111111100000000011111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheClkMaster|ALT_INV_Equal0~0_combout\,
	datab => \TheClkMaster|ALT_INV_ADCCounter\(2),
	datac => \TheClkMaster|ALT_INV_ADCCounter\(1),
	datad => \TheClkMaster|ALT_INV_Add1~29_sumout\,
	dataf => \TheClkMaster|ALT_INV_ADCCounter\(0),
	combout => \TheClkMaster|ADCCounter~1_combout\);

-- Location: FF_X33_Y57_N7
\TheClkMaster|ADCCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TheClkMaster|ALT_INV_Mclk~q\,
	d => \TheClkMaster|ADCCounter~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheClkMaster|ADCCounter\(3));

-- Location: LABCELL_X33_Y57_N42
\TheClkMaster|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheClkMaster|Add1~25_sumout\ = SUM(( \TheClkMaster|ADCCounter\(4) ) + ( GND ) + ( \TheClkMaster|Add1~30\ ))
-- \TheClkMaster|Add1~26\ = CARRY(( \TheClkMaster|ADCCounter\(4) ) + ( GND ) + ( \TheClkMaster|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheClkMaster|ALT_INV_ADCCounter\(4),
	cin => \TheClkMaster|Add1~30\,
	sumout => \TheClkMaster|Add1~25_sumout\,
	cout => \TheClkMaster|Add1~26\);

-- Location: FF_X33_Y57_N25
\TheClkMaster|ADCCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TheClkMaster|ALT_INV_Mclk~q\,
	asdata => \TheClkMaster|Add1~25_sumout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheClkMaster|ADCCounter\(4));

-- Location: LABCELL_X33_Y57_N45
\TheClkMaster|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheClkMaster|Add1~21_sumout\ = SUM(( \TheClkMaster|ADCCounter\(5) ) + ( GND ) + ( \TheClkMaster|Add1~26\ ))
-- \TheClkMaster|Add1~22\ = CARRY(( \TheClkMaster|ADCCounter\(5) ) + ( GND ) + ( \TheClkMaster|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheClkMaster|ALT_INV_ADCCounter\(5),
	cin => \TheClkMaster|Add1~26\,
	sumout => \TheClkMaster|Add1~21_sumout\,
	cout => \TheClkMaster|Add1~22\);

-- Location: FF_X33_Y57_N55
\TheClkMaster|ADCCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TheClkMaster|ALT_INV_Mclk~q\,
	asdata => \TheClkMaster|Add1~21_sumout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheClkMaster|ADCCounter\(5));

-- Location: LABCELL_X33_Y57_N48
\TheClkMaster|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheClkMaster|Add1~17_sumout\ = SUM(( \TheClkMaster|ADCCounter\(6) ) + ( GND ) + ( \TheClkMaster|Add1~22\ ))
-- \TheClkMaster|Add1~18\ = CARRY(( \TheClkMaster|ADCCounter\(6) ) + ( GND ) + ( \TheClkMaster|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheClkMaster|ALT_INV_ADCCounter\(6),
	cin => \TheClkMaster|Add1~22\,
	sumout => \TheClkMaster|Add1~17_sumout\,
	cout => \TheClkMaster|Add1~18\);

-- Location: LABCELL_X33_Y57_N57
\TheClkMaster|ADCCounter[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheClkMaster|ADCCounter[6]~feeder_combout\ = ( \TheClkMaster|Add1~17_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \TheClkMaster|ALT_INV_Add1~17_sumout\,
	combout => \TheClkMaster|ADCCounter[6]~feeder_combout\);

-- Location: FF_X33_Y57_N59
\TheClkMaster|ADCCounter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TheClkMaster|ALT_INV_Mclk~q\,
	d => \TheClkMaster|ADCCounter[6]~feeder_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheClkMaster|ADCCounter\(6));

-- Location: LABCELL_X33_Y57_N51
\TheClkMaster|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheClkMaster|Add1~13_sumout\ = SUM(( \TheClkMaster|ADCCounter\(7) ) + ( GND ) + ( \TheClkMaster|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheClkMaster|ALT_INV_ADCCounter\(7),
	cin => \TheClkMaster|Add1~18\,
	sumout => \TheClkMaster|Add1~13_sumout\);

-- Location: LABCELL_X33_Y57_N9
\TheClkMaster|ADCCounter~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheClkMaster|ADCCounter~0_combout\ = ( \TheClkMaster|Add1~13_sumout\ & ( (!\TheClkMaster|Equal0~0_combout\) # ((!\TheClkMaster|ADCCounter\(2)) # ((!\TheClkMaster|ADCCounter\(0)) # (!\TheClkMaster|ADCCounter\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111101111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheClkMaster|ALT_INV_Equal0~0_combout\,
	datab => \TheClkMaster|ALT_INV_ADCCounter\(2),
	datac => \TheClkMaster|ALT_INV_ADCCounter\(0),
	datad => \TheClkMaster|ALT_INV_ADCCounter\(1),
	dataf => \TheClkMaster|ALT_INV_Add1~13_sumout\,
	combout => \TheClkMaster|ADCCounter~0_combout\);

-- Location: FF_X33_Y57_N11
\TheClkMaster|ADCCounter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TheClkMaster|ALT_INV_Mclk~q\,
	d => \TheClkMaster|ADCCounter~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheClkMaster|ADCCounter\(7));

-- Location: LABCELL_X33_Y57_N24
\TheClkMaster|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheClkMaster|Equal0~0_combout\ = ( !\TheClkMaster|ADCCounter\(4) & ( (!\TheClkMaster|ADCCounter\(5) & (!\TheClkMaster|ADCCounter\(6) & (!\TheClkMaster|ADCCounter\(3) & \TheClkMaster|ADCCounter\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000000000000000000000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheClkMaster|ALT_INV_ADCCounter\(5),
	datab => \TheClkMaster|ALT_INV_ADCCounter\(6),
	datac => \TheClkMaster|ALT_INV_ADCCounter\(3),
	datad => \TheClkMaster|ALT_INV_ADCCounter\(7),
	datae => \TheClkMaster|ALT_INV_ADCCounter\(4),
	combout => \TheClkMaster|Equal0~0_combout\);

-- Location: LABCELL_X33_Y57_N21
\TheClkMaster|ADClrc~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheClkMaster|ADClrc~0_combout\ = ( \TheClkMaster|ADCCounter\(0) & ( !\TheClkMaster|ADClrc~q\ $ (((!\TheClkMaster|Equal0~0_combout\) # ((!\TheClkMaster|ADCCounter\(1)) # (!\TheClkMaster|ADCCounter\(2))))) ) ) # ( !\TheClkMaster|ADCCounter\(0) & ( 
-- \TheClkMaster|ADClrc~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000001111111100000000111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheClkMaster|ALT_INV_Equal0~0_combout\,
	datab => \TheClkMaster|ALT_INV_ADCCounter\(1),
	datac => \TheClkMaster|ALT_INV_ADCCounter\(2),
	datad => \TheClkMaster|ALT_INV_ADClrc~q\,
	dataf => \TheClkMaster|ALT_INV_ADCCounter\(0),
	combout => \TheClkMaster|ADClrc~0_combout\);

-- Location: FF_X33_Y57_N47
\TheClkMaster|ADClrc\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \TheClkMaster|ALT_INV_Mclk~q\,
	asdata => \TheClkMaster|ADClrc~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheClkMaster|ADClrc~q\);

-- Location: FF_X33_Y57_N5
\TheI2SToPar|BclkDlyd\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheClkMaster|Mclk~q\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|BclkDlyd~q\);

-- Location: LABCELL_X33_Y57_N12
\TheI2SToPar|BclkRiseEdge\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|BclkRiseEdge~combout\ = ( !\TheI2SToPar|BclkDlyd~q\ & ( \TheClkMaster|Mclk~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheClkMaster|ALT_INV_Mclk~q\,
	dataf => \TheI2SToPar|ALT_INV_BclkDlyd~q\,
	combout => \TheI2SToPar|BclkRiseEdge~combout\);

-- Location: FF_X30_Y57_N31
\TheI2SToPar|LrcDlyd\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheClkMaster|ADClrc~q\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|LrcDlyd~q\);

-- Location: FF_X30_Y57_N55
\TheI2SToPar|State\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|State~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|State~q\);

-- Location: FF_X30_Y57_N11
\TheI2SToPar|AudioBitCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|NextAudioBitCtr[0]~4_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|AudioBitCtr\(0));

-- Location: LABCELL_X30_Y57_N9
\TheI2SToPar|NextAudioBitCtr[0]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|NextAudioBitCtr[0]~4_combout\ = ( \TheI2SToPar|State~q\ & ( !\TheI2SToPar|AudioBitCtr\(0) $ (((!\TheClkMaster|Mclk~q\) # (\TheI2SToPar|BclkDlyd~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110000110011110011000011001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheClkMaster|ALT_INV_Mclk~q\,
	datac => \TheI2SToPar|ALT_INV_BclkDlyd~q\,
	datad => \TheI2SToPar|ALT_INV_AudioBitCtr\(0),
	dataf => \TheI2SToPar|ALT_INV_State~q\,
	combout => \TheI2SToPar|NextAudioBitCtr[0]~4_combout\);

-- Location: FF_X30_Y57_N10
\TheI2SToPar|AudioBitCtr[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|NextAudioBitCtr[0]~4_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|AudioBitCtr[0]~DUPLICATE_q\);

-- Location: LABCELL_X31_Y57_N21
\TheI2SToPar|NextAudioBitCtr[1]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|NextAudioBitCtr[1]~3_combout\ = ( \TheClkMaster|Mclk~q\ & ( \TheI2SToPar|BclkDlyd~q\ & ( (\TheI2SToPar|State~q\ & \TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\) ) ) ) # ( !\TheClkMaster|Mclk~q\ & ( \TheI2SToPar|BclkDlyd~q\ & ( 
-- (\TheI2SToPar|State~q\ & \TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\) ) ) ) # ( \TheClkMaster|Mclk~q\ & ( !\TheI2SToPar|BclkDlyd~q\ & ( (\TheI2SToPar|State~q\ & (!\TheI2SToPar|AudioBitCtr[0]~DUPLICATE_q\ $ (\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\))) ) ) ) # 
-- ( !\TheClkMaster|Mclk~q\ & ( !\TheI2SToPar|BclkDlyd~q\ & ( (\TheI2SToPar|State~q\ & \TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101010000010100000100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheI2SToPar|ALT_INV_State~q\,
	datab => \TheI2SToPar|ALT_INV_AudioBitCtr[0]~DUPLICATE_q\,
	datac => \TheI2SToPar|ALT_INV_AudioBitCtr[1]~DUPLICATE_q\,
	datae => \TheClkMaster|ALT_INV_Mclk~q\,
	dataf => \TheI2SToPar|ALT_INV_BclkDlyd~q\,
	combout => \TheI2SToPar|NextAudioBitCtr[1]~3_combout\);

-- Location: FF_X30_Y57_N4
\TheI2SToPar|AudioBitCtr[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|NextAudioBitCtr[1]~3_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\);

-- Location: FF_X30_Y57_N46
\TheI2SToPar|AudioBitCtr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|NextAudioBitCtr[2]~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|AudioBitCtr\(2));

-- Location: LABCELL_X30_Y57_N45
\TheI2SToPar|NextAudioBitCtr[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|NextAudioBitCtr[2]~2_combout\ = ( \TheI2SToPar|AudioBitCtr\(2) & ( \TheI2SToPar|State~q\ & ( (((!\TheClkMaster|Mclk~q\) # (\TheI2SToPar|BclkDlyd~q\)) # (\TheI2SToPar|AudioBitCtr\(0))) # (\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\) ) ) ) # ( 
-- !\TheI2SToPar|AudioBitCtr\(2) & ( \TheI2SToPar|State~q\ & ( (!\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\ & (!\TheI2SToPar|AudioBitCtr\(0) & (!\TheI2SToPar|BclkDlyd~q\ & \TheClkMaster|Mclk~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000100000001111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheI2SToPar|ALT_INV_AudioBitCtr[1]~DUPLICATE_q\,
	datab => \TheI2SToPar|ALT_INV_AudioBitCtr\(0),
	datac => \TheI2SToPar|ALT_INV_BclkDlyd~q\,
	datad => \TheClkMaster|ALT_INV_Mclk~q\,
	datae => \TheI2SToPar|ALT_INV_AudioBitCtr\(2),
	dataf => \TheI2SToPar|ALT_INV_State~q\,
	combout => \TheI2SToPar|NextAudioBitCtr[2]~2_combout\);

-- Location: FF_X30_Y57_N47
\TheI2SToPar|AudioBitCtr[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|NextAudioBitCtr[2]~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\);

-- Location: FF_X30_Y57_N5
\TheI2SToPar|AudioBitCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|NextAudioBitCtr[1]~3_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|AudioBitCtr\(1));

-- Location: LABCELL_X30_Y57_N57
\TheI2SToPar|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|Equal0~0_combout\ = ( !\TheI2SToPar|AudioBitCtr\(0) & ( (!\TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ & !\TheI2SToPar|AudioBitCtr\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheI2SToPar|ALT_INV_AudioBitCtr[2]~DUPLICATE_q\,
	datad => \TheI2SToPar|ALT_INV_AudioBitCtr\(1),
	dataf => \TheI2SToPar|ALT_INV_AudioBitCtr\(0),
	combout => \TheI2SToPar|Equal0~0_combout\);

-- Location: LABCELL_X30_Y57_N21
\TheI2SToPar|NextAudioBitCtr[3]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|NextAudioBitCtr[3]~0_combout\ = ( \TheI2SToPar|State~q\ & ( !\TheI2SToPar|AudioBitCtr\(3) $ (((!\TheI2SToPar|BclkRiseEdge~combout\) # (!\TheI2SToPar|Equal0~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000011111111000000001111111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheI2SToPar|ALT_INV_BclkRiseEdge~combout\,
	datac => \TheI2SToPar|ALT_INV_Equal0~0_combout\,
	datad => \TheI2SToPar|ALT_INV_AudioBitCtr\(3),
	dataf => \TheI2SToPar|ALT_INV_State~q\,
	combout => \TheI2SToPar|NextAudioBitCtr[3]~0_combout\);

-- Location: FF_X30_Y57_N23
\TheI2SToPar|AudioBitCtr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|NextAudioBitCtr[3]~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|AudioBitCtr\(3));

-- Location: LABCELL_X30_Y57_N12
\TheI2SToPar|NextAudioBitCtr[4]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|NextAudioBitCtr[4]~1_combout\ = ( \TheI2SToPar|BclkRiseEdge~combout\ & ( (!\TheI2SToPar|State~DUPLICATE_q\) # (!\TheI2SToPar|AudioBitCtr\(4) $ (((!\TheI2SToPar|Equal0~0_combout\) # (\TheI2SToPar|AudioBitCtr\(3))))) ) ) # ( 
-- !\TheI2SToPar|BclkRiseEdge~combout\ & ( (!\TheI2SToPar|State~DUPLICATE_q\) # (\TheI2SToPar|AudioBitCtr\(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111001111110011111100111111001111110011111110011111001111111001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheI2SToPar|ALT_INV_AudioBitCtr\(3),
	datab => \TheI2SToPar|ALT_INV_AudioBitCtr\(4),
	datac => \TheI2SToPar|ALT_INV_State~DUPLICATE_q\,
	datad => \TheI2SToPar|ALT_INV_Equal0~0_combout\,
	dataf => \TheI2SToPar|ALT_INV_BclkRiseEdge~combout\,
	combout => \TheI2SToPar|NextAudioBitCtr[4]~1_combout\);

-- Location: FF_X30_Y57_N13
\TheI2SToPar|AudioBitCtr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|NextAudioBitCtr[4]~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|AudioBitCtr\(4));

-- Location: LABCELL_X30_Y57_N15
\TheI2SToPar|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|Equal0~1_combout\ = ( !\TheI2SToPar|AudioBitCtr\(0) & ( (!\TheI2SToPar|AudioBitCtr\(3) & (!\TheI2SToPar|AudioBitCtr\(4) & (!\TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ & !\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheI2SToPar|ALT_INV_AudioBitCtr\(3),
	datab => \TheI2SToPar|ALT_INV_AudioBitCtr\(4),
	datac => \TheI2SToPar|ALT_INV_AudioBitCtr[2]~DUPLICATE_q\,
	datad => \TheI2SToPar|ALT_INV_AudioBitCtr[1]~DUPLICATE_q\,
	dataf => \TheI2SToPar|ALT_INV_AudioBitCtr\(0),
	combout => \TheI2SToPar|Equal0~1_combout\);

-- Location: LABCELL_X30_Y57_N54
\TheI2SToPar|State~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|State~0_combout\ = ( \TheI2SToPar|Equal0~1_combout\ & ( (!\TheI2SToPar|State~q\ & (!\TheClkMaster|ADClrc~q\ $ (((!\TheI2SToPar|LrcDlyd~q\))))) # (\TheI2SToPar|State~q\ & (((!\TheI2SToPar|BclkRiseEdge~combout\)))) ) ) # ( 
-- !\TheI2SToPar|Equal0~1_combout\ & ( (!\TheClkMaster|ADClrc~q\ $ (!\TheI2SToPar|LrcDlyd~q\)) # (\TheI2SToPar|State~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101011111111010110101111111101011010110011000101101011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheClkMaster|ALT_INV_ADClrc~q\,
	datab => \TheI2SToPar|ALT_INV_BclkRiseEdge~combout\,
	datac => \TheI2SToPar|ALT_INV_LrcDlyd~q\,
	datad => \TheI2SToPar|ALT_INV_State~q\,
	dataf => \TheI2SToPar|ALT_INV_Equal0~1_combout\,
	combout => \TheI2SToPar|State~0_combout\);

-- Location: FF_X30_Y57_N56
\TheI2SToPar|State~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|State~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|State~DUPLICATE_q\);

-- Location: LABCELL_X30_Y57_N18
\TheI2SToPar|NextValL~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|NextValL~0_combout\ = ( \TheI2SToPar|Equal0~1_combout\ & ( (\TheI2SToPar|BclkRiseEdge~combout\ & (!\TheClkMaster|ADClrc~q\ & \TheI2SToPar|State~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001100000000000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheI2SToPar|ALT_INV_BclkRiseEdge~combout\,
	datac => \TheClkMaster|ALT_INV_ADClrc~q\,
	datad => \TheI2SToPar|ALT_INV_State~DUPLICATE_q\,
	dataf => \TheI2SToPar|ALT_INV_Equal0~1_combout\,
	combout => \TheI2SToPar|NextValL~0_combout\);

-- Location: FF_X30_Y57_N20
\TheI2SToPar|ValL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|NextValL~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|ValL~q\);

-- Location: LABCELL_X29_Y57_N15
\TheParToI2S|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector0~0_combout\ = ( \TheParToI2S|State.SendingR~q\ & ( (!\TheParToI2S|NextState~6_combout\ & ((\TheParToI2S|State.WaitingValL~q\) # (\TheI2SToPar|ValL~q\))) ) ) # ( !\TheParToI2S|State.SendingR~q\ & ( (\TheParToI2S|State.WaitingValL~q\) 
-- # (\TheI2SToPar|ValL~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100110000111100000011000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheI2SToPar|ALT_INV_ValL~q\,
	datac => \TheParToI2S|ALT_INV_NextState~6_combout\,
	datad => \TheParToI2S|ALT_INV_State.WaitingValL~q\,
	dataf => \TheParToI2S|ALT_INV_State.SendingR~q\,
	combout => \TheParToI2S|Selector0~0_combout\);

-- Location: FF_X29_Y57_N17
\TheParToI2S|State.WaitingValL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2S|Selector0~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|State.WaitingValL~q\);

-- Location: FF_X29_Y57_N56
\TheParToI2S|BclkDlyd~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheClkMaster|Mclk~q\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|BclkDlyd~DUPLICATE_q\);

-- Location: LABCELL_X29_Y57_N30
\TheParToI2S|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector1~0_combout\ = ( \TheParToI2S|State.WaitingValL~q\ & ( (\TheParToI2S|State.SyncingToBclk~q\ & ((!\TheParToI2S|BclkDlyd~DUPLICATE_q\) # (\TheClkMaster|Mclk~q\))) ) ) # ( !\TheParToI2S|State.WaitingValL~q\ & ( 
-- ((\TheParToI2S|State.SyncingToBclk~q\ & ((!\TheParToI2S|BclkDlyd~DUPLICATE_q\) # (\TheClkMaster|Mclk~q\)))) # (\TheI2SToPar|ValL~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111011111000011111101111100000000110111010000000011011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheClkMaster|ALT_INV_Mclk~q\,
	datab => \TheParToI2S|ALT_INV_BclkDlyd~DUPLICATE_q\,
	datac => \TheI2SToPar|ALT_INV_ValL~q\,
	datad => \TheParToI2S|ALT_INV_State.SyncingToBclk~q\,
	dataf => \TheParToI2S|ALT_INV_State.WaitingValL~q\,
	combout => \TheParToI2S|Selector1~0_combout\);

-- Location: FF_X29_Y57_N32
\TheParToI2S|State.SyncingToBclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2S|Selector1~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|State.SyncingToBclk~q\);

-- Location: LABCELL_X29_Y57_N51
\TheParToI2S|NextBclkCtr~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|NextBclkCtr~0_combout\ = (\TheParToI2S|State.WaitingValL~q\ & !\TheParToI2S|State.SyncingToBclk~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheParToI2S|ALT_INV_State.WaitingValL~q\,
	datad => \TheParToI2S|ALT_INV_State.SyncingToBclk~q\,
	combout => \TheParToI2S|NextBclkCtr~0_combout\);

-- Location: FF_X29_Y57_N31
\TheParToI2S|State.SyncingToBclk~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2S|Selector1~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|State.SyncingToBclk~DUPLICATE_q\);

-- Location: FF_X29_Y57_N55
\TheParToI2S|BclkDlyd\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheClkMaster|Mclk~q\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|BclkDlyd~q\);

-- Location: LABCELL_X30_Y57_N6
\TheParToI2S|State.FirstBitEmptyL~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|State.FirstBitEmptyL~0_combout\ = ( \TheParToI2S|BclkDlyd~q\ & ( (!\TheClkMaster|Mclk~q\ & (\TheParToI2S|State.SyncingToBclk~DUPLICATE_q\)) # (\TheClkMaster|Mclk~q\ & ((\TheParToI2S|State.FirstBitEmptyL~q\))) ) ) # ( !\TheParToI2S|BclkDlyd~q\ 
-- & ( \TheParToI2S|State.FirstBitEmptyL~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001100001111110000110000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheClkMaster|ALT_INV_Mclk~q\,
	datac => \TheParToI2S|ALT_INV_State.SyncingToBclk~DUPLICATE_q\,
	datad => \TheParToI2S|ALT_INV_State.FirstBitEmptyL~q\,
	dataf => \TheParToI2S|ALT_INV_BclkDlyd~q\,
	combout => \TheParToI2S|State.FirstBitEmptyL~0_combout\);

-- Location: FF_X30_Y57_N8
\TheParToI2S|State.FirstBitEmptyL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2S|State.FirstBitEmptyL~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|State.FirstBitEmptyL~q\);

-- Location: LABCELL_X29_Y57_N57
\TheParToI2S|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector3~0_combout\ = ( \TheParToI2S|State.SendingL~q\ & ( \TheParToI2S|BclkDlyd~DUPLICATE_q\ & ( (!\TheParToI2S|NextState~6_combout\) # ((!\TheClkMaster|Mclk~q\ & \TheParToI2S|State.FirstBitEmptyL~q\)) ) ) ) # ( 
-- !\TheParToI2S|State.SendingL~q\ & ( \TheParToI2S|BclkDlyd~DUPLICATE_q\ & ( (!\TheClkMaster|Mclk~q\ & \TheParToI2S|State.FirstBitEmptyL~q\) ) ) ) # ( \TheParToI2S|State.SendingL~q\ & ( !\TheParToI2S|BclkDlyd~DUPLICATE_q\ & ( 
-- !\TheParToI2S|NextState~6_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000101010101111000011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheClkMaster|ALT_INV_Mclk~q\,
	datac => \TheParToI2S|ALT_INV_NextState~6_combout\,
	datad => \TheParToI2S|ALT_INV_State.FirstBitEmptyL~q\,
	datae => \TheParToI2S|ALT_INV_State.SendingL~q\,
	dataf => \TheParToI2S|ALT_INV_BclkDlyd~DUPLICATE_q\,
	combout => \TheParToI2S|Selector3~0_combout\);

-- Location: FF_X29_Y57_N58
\TheParToI2S|State.SendingL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2S|Selector3~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|State.SendingL~q\);

-- Location: LABCELL_X29_Y57_N12
\TheParToI2S|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector6~0_combout\ = ( !\TheParToI2S|State.SendingL~q\ & ( !\TheParToI2S|State.SendingR~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheParToI2S|ALT_INV_State.SendingR~q\,
	dataf => \TheParToI2S|ALT_INV_State.SendingL~q\,
	combout => \TheParToI2S|Selector6~0_combout\);

-- Location: FF_X29_Y57_N59
\TheParToI2S|State.SendingL~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2S|Selector3~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|State.SendingL~DUPLICATE_q\);

-- Location: LABCELL_X29_Y57_N21
\TheParToI2S|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector4~0_combout\ = ( \TheParToI2S|BclkDlyd~DUPLICATE_q\ & ( (!\TheClkMaster|Mclk~q\ & (\TheParToI2S|State.SendingL~DUPLICATE_q\ & (\TheParToI2S|NextState~6_combout\))) # (\TheClkMaster|Mclk~q\ & (((\TheParToI2S|State.SendingL~DUPLICATE_q\ 
-- & \TheParToI2S|NextState~6_combout\)) # (\TheParToI2S|State.FirstBitEmptyR~q\))) ) ) # ( !\TheParToI2S|BclkDlyd~DUPLICATE_q\ & ( ((\TheParToI2S|State.SendingL~DUPLICATE_q\ & \TheParToI2S|NextState~6_combout\)) # (\TheParToI2S|State.FirstBitEmptyR~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111111111000000111111111100000011010101110000001101010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheClkMaster|ALT_INV_Mclk~q\,
	datab => \TheParToI2S|ALT_INV_State.SendingL~DUPLICATE_q\,
	datac => \TheParToI2S|ALT_INV_NextState~6_combout\,
	datad => \TheParToI2S|ALT_INV_State.FirstBitEmptyR~q\,
	dataf => \TheParToI2S|ALT_INV_BclkDlyd~DUPLICATE_q\,
	combout => \TheParToI2S|Selector4~0_combout\);

-- Location: FF_X29_Y57_N23
\TheParToI2S|State.FirstBitEmptyR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2S|Selector4~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|State.FirstBitEmptyR~q\);

-- Location: LABCELL_X29_Y57_N48
\TheParToI2S|Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector7~0_combout\ = ( \TheParToI2S|BclkDlyd~DUPLICATE_q\ & ( (!\TheParToI2S|State.FirstBitEmptyR~q\ & (\TheParToI2S|State.FirstBitEmptyL~q\ & ((!\TheClkMaster|Mclk~q\) # (\TheParToI2S|BclkCtr\(2))))) # (\TheParToI2S|State.FirstBitEmptyR~q\ 
-- & (((!\TheClkMaster|Mclk~q\) # (\TheParToI2S|BclkCtr\(2))))) ) ) # ( !\TheParToI2S|BclkDlyd~DUPLICATE_q\ & ( (\TheParToI2S|BclkCtr\(2) & ((\TheParToI2S|State.FirstBitEmptyL~q\) # (\TheParToI2S|State.FirstBitEmptyR~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001110111000000000111011101110000011101110111000001110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_State.FirstBitEmptyR~q\,
	datab => \TheParToI2S|ALT_INV_State.FirstBitEmptyL~q\,
	datac => \TheClkMaster|ALT_INV_Mclk~q\,
	datad => \TheParToI2S|ALT_INV_BclkCtr\(2),
	dataf => \TheParToI2S|ALT_INV_BclkDlyd~DUPLICATE_q\,
	combout => \TheParToI2S|Selector7~0_combout\);

-- Location: LABCELL_X29_Y57_N42
\TheParToI2S|Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector8~0_combout\ = ( \TheParToI2S|BclkCtr\(1) & ( \TheClkMaster|Mclk~q\ & ( (\TheParToI2S|State.FirstBitEmptyR~q\) # (\TheParToI2S|State.FirstBitEmptyL~q\) ) ) ) # ( \TheParToI2S|BclkCtr\(1) & ( !\TheClkMaster|Mclk~q\ & ( 
-- (\TheParToI2S|State.FirstBitEmptyR~q\) # (\TheParToI2S|State.FirstBitEmptyL~q\) ) ) ) # ( !\TheParToI2S|BclkCtr\(1) & ( !\TheClkMaster|Mclk~q\ & ( (\TheParToI2S|BclkDlyd~DUPLICATE_q\ & ((\TheParToI2S|State.FirstBitEmptyR~q\) # 
-- (\TheParToI2S|State.FirstBitEmptyL~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001100010011010111110101111100000000000000000101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_State.FirstBitEmptyL~q\,
	datab => \TheParToI2S|ALT_INV_BclkDlyd~DUPLICATE_q\,
	datac => \TheParToI2S|ALT_INV_State.FirstBitEmptyR~q\,
	datae => \TheParToI2S|ALT_INV_BclkCtr\(1),
	dataf => \TheClkMaster|ALT_INV_Mclk~q\,
	combout => \TheParToI2S|Selector8~0_combout\);

-- Location: FF_X29_Y57_N7
\TheParToI2S|BclkCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2S|Selector9~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|BclkCtr\(0));

-- Location: LABCELL_X30_Y57_N24
\TheParToI2S|Selector8~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector8~1_combout\ = ( \TheParToI2S|BclkCtr\(1) & ( \TheParToI2S|NextBclkCtr~1_combout\ & ( ((!\TheParToI2S|NextBclkCtr~0_combout\) # ((!\TheParToI2S|Selector6~0_combout\ & \TheParToI2S|BclkCtr\(0)))) # (\TheParToI2S|Selector8~0_combout\) ) 
-- ) ) # ( !\TheParToI2S|BclkCtr\(1) & ( \TheParToI2S|NextBclkCtr~1_combout\ & ( ((!\TheParToI2S|Selector6~0_combout\ & !\TheParToI2S|BclkCtr\(0))) # (\TheParToI2S|Selector8~0_combout\) ) ) ) # ( \TheParToI2S|BclkCtr\(1) & ( 
-- !\TheParToI2S|NextBclkCtr~1_combout\ & ( (!\TheParToI2S|Selector6~0_combout\) # ((!\TheParToI2S|NextBclkCtr~0_combout\) # (\TheParToI2S|Selector8~0_combout\)) ) ) ) # ( !\TheParToI2S|BclkCtr\(1) & ( !\TheParToI2S|NextBclkCtr~1_combout\ & ( 
-- \TheParToI2S|Selector8~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011111111111011101110110011101100111111111100111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_Selector6~0_combout\,
	datab => \TheParToI2S|ALT_INV_Selector8~0_combout\,
	datac => \TheParToI2S|ALT_INV_BclkCtr\(0),
	datad => \TheParToI2S|ALT_INV_NextBclkCtr~0_combout\,
	datae => \TheParToI2S|ALT_INV_BclkCtr\(1),
	dataf => \TheParToI2S|ALT_INV_NextBclkCtr~1_combout\,
	combout => \TheParToI2S|Selector8~1_combout\);

-- Location: FF_X30_Y57_N25
\TheParToI2S|BclkCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2S|Selector8~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|BclkCtr\(1));

-- Location: LABCELL_X29_Y57_N27
\TheParToI2S|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Add0~0_combout\ = ( !\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & ( !\TheParToI2S|BclkCtr\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \TheParToI2S|ALT_INV_BclkCtr\(1),
	dataf => \TheParToI2S|ALT_INV_BclkCtr[0]~DUPLICATE_q\,
	combout => \TheParToI2S|Add0~0_combout\);

-- Location: LABCELL_X29_Y57_N0
\TheParToI2S|Selector7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector7~1_combout\ = ( \TheParToI2S|BclkCtr\(2) & ( \TheParToI2S|Add0~0_combout\ & ( ((!\TheParToI2S|NextBclkCtr~0_combout\) # ((!\TheParToI2S|Selector6~0_combout\ & !\TheParToI2S|NextBclkCtr~1_combout\))) # 
-- (\TheParToI2S|Selector7~0_combout\) ) ) ) # ( !\TheParToI2S|BclkCtr\(2) & ( \TheParToI2S|Add0~0_combout\ & ( ((!\TheParToI2S|Selector6~0_combout\ & \TheParToI2S|NextBclkCtr~1_combout\)) # (\TheParToI2S|Selector7~0_combout\) ) ) ) # ( 
-- \TheParToI2S|BclkCtr\(2) & ( !\TheParToI2S|Add0~0_combout\ & ( ((!\TheParToI2S|Selector6~0_combout\) # (!\TheParToI2S|NextBclkCtr~0_combout\)) # (\TheParToI2S|Selector7~0_combout\) ) ) ) # ( !\TheParToI2S|BclkCtr\(2) & ( !\TheParToI2S|Add0~0_combout\ & ( 
-- \TheParToI2S|Selector7~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101111111111101110101011101010111011111111111010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_Selector7~0_combout\,
	datab => \TheParToI2S|ALT_INV_Selector6~0_combout\,
	datac => \TheParToI2S|ALT_INV_NextBclkCtr~1_combout\,
	datad => \TheParToI2S|ALT_INV_NextBclkCtr~0_combout\,
	datae => \TheParToI2S|ALT_INV_BclkCtr\(2),
	dataf => \TheParToI2S|ALT_INV_Add0~0_combout\,
	combout => \TheParToI2S|Selector7~1_combout\);

-- Location: FF_X29_Y57_N2
\TheParToI2S|BclkCtr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2S|Selector7~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|BclkCtr\(2));

-- Location: MLABCELL_X28_Y57_N0
\TheParToI2S|Selector6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector6~1_combout\ = ( !\TheParToI2S|BclkCtr\(2) & ( !\TheParToI2S|BclkCtr\(1) & ( (!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (\TheParToI2S|BclkDlyd~q\ & !\TheClkMaster|Mclk~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000100000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_BclkCtr[0]~DUPLICATE_q\,
	datab => \TheParToI2S|ALT_INV_BclkDlyd~q\,
	datac => \TheClkMaster|ALT_INV_Mclk~q\,
	datae => \TheParToI2S|ALT_INV_BclkCtr\(2),
	dataf => \TheParToI2S|ALT_INV_BclkCtr\(1),
	combout => \TheParToI2S|Selector6~1_combout\);

-- Location: LABCELL_X29_Y57_N39
\TheParToI2S|Selector6~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector6~2_combout\ = ( \TheParToI2S|State.FirstBitEmptyR~q\ & ( \TheClkMaster|Mclk~q\ & ( \TheParToI2S|BclkCtr\(3) ) ) ) # ( !\TheParToI2S|State.FirstBitEmptyR~q\ & ( \TheClkMaster|Mclk~q\ & ( (\TheParToI2S|State.FirstBitEmptyL~q\ & 
-- \TheParToI2S|BclkCtr\(3)) ) ) ) # ( \TheParToI2S|State.FirstBitEmptyR~q\ & ( !\TheClkMaster|Mclk~q\ & ( (\TheParToI2S|BclkCtr\(3)) # (\TheParToI2S|BclkDlyd~DUPLICATE_q\) ) ) ) # ( !\TheParToI2S|State.FirstBitEmptyR~q\ & ( !\TheClkMaster|Mclk~q\ & ( 
-- (\TheParToI2S|State.FirstBitEmptyL~q\ & ((\TheParToI2S|BclkCtr\(3)) # (\TheParToI2S|BclkDlyd~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010100010101001111110011111100000101000001010000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_State.FirstBitEmptyL~q\,
	datab => \TheParToI2S|ALT_INV_BclkDlyd~DUPLICATE_q\,
	datac => \TheParToI2S|ALT_INV_BclkCtr\(3),
	datae => \TheParToI2S|ALT_INV_State.FirstBitEmptyR~q\,
	dataf => \TheClkMaster|ALT_INV_Mclk~q\,
	combout => \TheParToI2S|Selector6~2_combout\);

-- Location: LABCELL_X29_Y57_N9
\TheParToI2S|Selector6~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector6~3_combout\ = ( \TheParToI2S|Selector6~2_combout\ ) # ( !\TheParToI2S|Selector6~2_combout\ & ( (\TheParToI2S|BclkCtr\(3) & ((!\TheParToI2S|NextBclkCtr~0_combout\) # ((!\TheParToI2S|Selector6~0_combout\ & 
-- !\TheParToI2S|Selector6~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011101010000000001110101011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_NextBclkCtr~0_combout\,
	datab => \TheParToI2S|ALT_INV_Selector6~0_combout\,
	datac => \TheParToI2S|ALT_INV_Selector6~1_combout\,
	datad => \TheParToI2S|ALT_INV_BclkCtr\(3),
	dataf => \TheParToI2S|ALT_INV_Selector6~2_combout\,
	combout => \TheParToI2S|Selector6~3_combout\);

-- Location: FF_X29_Y57_N11
\TheParToI2S|BclkCtr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2S|Selector6~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|BclkCtr\(3));

-- Location: MLABCELL_X28_Y57_N45
\TheParToI2S|NextBclkCtr~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|NextBclkCtr~1_combout\ = ( \TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & ( !\TheClkMaster|Mclk~q\ & ( \TheParToI2S|BclkDlyd~q\ ) ) ) # ( !\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & ( !\TheClkMaster|Mclk~q\ & ( (\TheParToI2S|BclkDlyd~q\ & 
-- (((\TheParToI2S|BclkCtr\(3)) # (\TheParToI2S|BclkCtr\(1))) # (\TheParToI2S|BclkCtr\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_BclkCtr\(2),
	datab => \TheParToI2S|ALT_INV_BclkCtr\(1),
	datac => \TheParToI2S|ALT_INV_BclkDlyd~q\,
	datad => \TheParToI2S|ALT_INV_BclkCtr\(3),
	datae => \TheParToI2S|ALT_INV_BclkCtr[0]~DUPLICATE_q\,
	dataf => \TheClkMaster|ALT_INV_Mclk~q\,
	combout => \TheParToI2S|NextBclkCtr~1_combout\);

-- Location: LABCELL_X29_Y57_N33
\TheParToI2S|Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector9~0_combout\ = ( \TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & ( (\TheParToI2S|State.FirstBitEmptyR~q\) # (\TheParToI2S|State.FirstBitEmptyL~q\) ) ) # ( !\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & ( (!\TheClkMaster|Mclk~q\ & 
-- (\TheParToI2S|BclkDlyd~DUPLICATE_q\ & ((\TheParToI2S|State.FirstBitEmptyR~q\) # (\TheParToI2S|State.FirstBitEmptyL~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000100010000000100010001000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheClkMaster|ALT_INV_Mclk~q\,
	datab => \TheParToI2S|ALT_INV_BclkDlyd~DUPLICATE_q\,
	datac => \TheParToI2S|ALT_INV_State.FirstBitEmptyL~q\,
	datad => \TheParToI2S|ALT_INV_State.FirstBitEmptyR~q\,
	dataf => \TheParToI2S|ALT_INV_BclkCtr[0]~DUPLICATE_q\,
	combout => \TheParToI2S|Selector9~0_combout\);

-- Location: LABCELL_X29_Y57_N6
\TheParToI2S|Selector9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector9~1_combout\ = ( \TheParToI2S|Selector9~0_combout\ ) # ( !\TheParToI2S|Selector9~0_combout\ & ( (!\TheParToI2S|BclkCtr\(0) & (((!\TheParToI2S|Selector6~0_combout\ & \TheParToI2S|NextBclkCtr~1_combout\)))) # (\TheParToI2S|BclkCtr\(0) & 
-- ((!\TheParToI2S|NextBclkCtr~0_combout\) # ((!\TheParToI2S|Selector6~0_combout\ & !\TheParToI2S|NextBclkCtr~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110011101010000011001110101011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_NextBclkCtr~0_combout\,
	datab => \TheParToI2S|ALT_INV_Selector6~0_combout\,
	datac => \TheParToI2S|ALT_INV_NextBclkCtr~1_combout\,
	datad => \TheParToI2S|ALT_INV_BclkCtr\(0),
	dataf => \TheParToI2S|ALT_INV_Selector9~0_combout\,
	combout => \TheParToI2S|Selector9~1_combout\);

-- Location: FF_X29_Y57_N8
\TheParToI2S|BclkCtr[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2S|Selector9~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|BclkCtr[0]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y57_N18
\TheParToI2S|NextState~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|NextState~6_combout\ = ( !\TheParToI2S|BclkCtr\(3) & ( !\TheClkMaster|Mclk~q\ & ( (!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (\TheParToI2S|BclkDlyd~q\ & (!\TheParToI2S|BclkCtr\(2) & !\TheParToI2S|BclkCtr\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_BclkCtr[0]~DUPLICATE_q\,
	datab => \TheParToI2S|ALT_INV_BclkDlyd~q\,
	datac => \TheParToI2S|ALT_INV_BclkCtr\(2),
	datad => \TheParToI2S|ALT_INV_BclkCtr\(1),
	datae => \TheParToI2S|ALT_INV_BclkCtr\(3),
	dataf => \TheClkMaster|ALT_INV_Mclk~q\,
	combout => \TheParToI2S|NextState~6_combout\);

-- Location: LABCELL_X29_Y57_N24
\TheParToI2S|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector5~0_combout\ = ( \TheParToI2S|BclkDlyd~DUPLICATE_q\ & ( (!\TheClkMaster|Mclk~q\ & (((!\TheParToI2S|NextState~6_combout\ & \TheParToI2S|State.SendingR~q\)) # (\TheParToI2S|State.FirstBitEmptyR~q\))) # (\TheClkMaster|Mclk~q\ & 
-- (!\TheParToI2S|NextState~6_combout\ & ((\TheParToI2S|State.SendingR~q\)))) ) ) # ( !\TheParToI2S|BclkDlyd~DUPLICATE_q\ & ( (!\TheParToI2S|NextState~6_combout\ & \TheParToI2S|State.SendingR~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000001010110011100000101011001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheClkMaster|ALT_INV_Mclk~q\,
	datab => \TheParToI2S|ALT_INV_NextState~6_combout\,
	datac => \TheParToI2S|ALT_INV_State.FirstBitEmptyR~q\,
	datad => \TheParToI2S|ALT_INV_State.SendingR~q\,
	dataf => \TheParToI2S|ALT_INV_BclkDlyd~DUPLICATE_q\,
	combout => \TheParToI2S|Selector5~0_combout\);

-- Location: FF_X29_Y57_N26
\TheParToI2S|State.SendingR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2S|Selector5~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|State.SendingR~q\);

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

-- Location: LABCELL_X30_Y57_N0
\TheI2SToPar|Decoder0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|Decoder0~4_combout\ = ( \TheClkMaster|Mclk~q\ & ( !\TheI2SToPar|BclkDlyd~q\ & ( (!\TheI2SToPar|AudioBitCtr\(3) & (\TheI2SToPar|AudioBitCtr\(0) & (\TheI2SToPar|State~DUPLICATE_q\ & !\TheI2SToPar|AudioBitCtr\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheI2SToPar|ALT_INV_AudioBitCtr\(3),
	datab => \TheI2SToPar|ALT_INV_AudioBitCtr\(0),
	datac => \TheI2SToPar|ALT_INV_State~DUPLICATE_q\,
	datad => \TheI2SToPar|ALT_INV_AudioBitCtr\(4),
	datae => \TheClkMaster|ALT_INV_Mclk~q\,
	dataf => \TheI2SToPar|ALT_INV_BclkDlyd~q\,
	combout => \TheI2SToPar|Decoder0~4_combout\);

-- Location: MLABCELL_X28_Y57_N48
\TheI2SToPar|D[3]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[3]~10_combout\ = ( \TheI2SToPar|Decoder0~4_combout\ & ( (!\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\ & (((\TheI2SToPar|D\(3))))) # (\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\ & ((!\TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ & (\iADCdat~input_o\)) 
-- # (\TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ & ((\TheI2SToPar|D\(3)))))) ) ) # ( !\TheI2SToPar|Decoder0~4_combout\ & ( \TheI2SToPar|D\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100010000110111110001000011011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iADCdat~input_o\,
	datab => \TheI2SToPar|ALT_INV_AudioBitCtr[1]~DUPLICATE_q\,
	datac => \TheI2SToPar|ALT_INV_AudioBitCtr[2]~DUPLICATE_q\,
	datad => \TheI2SToPar|ALT_INV_D\(3),
	dataf => \TheI2SToPar|ALT_INV_Decoder0~4_combout\,
	combout => \TheI2SToPar|D[3]~10_combout\);

-- Location: FF_X28_Y57_N50
\TheI2SToPar|D[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[3]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(3));

-- Location: LABCELL_X30_Y57_N51
\TheI2SToPar|NextValR~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|NextValR~0_combout\ = ( \TheI2SToPar|Equal0~1_combout\ & ( (\TheI2SToPar|State~DUPLICATE_q\ & (\TheI2SToPar|BclkRiseEdge~combout\ & \TheClkMaster|ADClrc~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001010000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheI2SToPar|ALT_INV_State~DUPLICATE_q\,
	datac => \TheI2SToPar|ALT_INV_BclkRiseEdge~combout\,
	datad => \TheClkMaster|ALT_INV_ADClrc~q\,
	dataf => \TheI2SToPar|ALT_INV_Equal0~1_combout\,
	combout => \TheI2SToPar|NextValR~0_combout\);

-- Location: FF_X30_Y57_N53
\TheI2SToPar|ValR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|NextValR~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|ValR~q\);

-- Location: FF_X28_Y57_N29
\TheParToI2S|LastValidDR[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(3),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(3));

-- Location: LABCELL_X31_Y57_N6
\TheI2SToPar|D[1]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[1]~8_combout\ = ( \TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ & ( \TheI2SToPar|D\(1) ) ) # ( !\TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ & ( (!\TheI2SToPar|Decoder0~4_combout\ & (((\TheI2SToPar|D\(1))))) # (\TheI2SToPar|Decoder0~4_combout\ & 
-- ((!\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\ & (\iADCdat~input_o\)) # (\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\ & ((\TheI2SToPar|D\(1)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000011011111000100001101111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iADCdat~input_o\,
	datab => \TheI2SToPar|ALT_INV_Decoder0~4_combout\,
	datac => \TheI2SToPar|ALT_INV_AudioBitCtr[1]~DUPLICATE_q\,
	datad => \TheI2SToPar|ALT_INV_D\(1),
	dataf => \TheI2SToPar|ALT_INV_AudioBitCtr[2]~DUPLICATE_q\,
	combout => \TheI2SToPar|D[1]~8_combout\);

-- Location: FF_X31_Y57_N8
\TheI2SToPar|D[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[1]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(1));

-- Location: FF_X27_Y57_N52
\TheParToI2S|LastValidDR[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(1),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(1));

-- Location: FF_X30_Y57_N22
\TheI2SToPar|AudioBitCtr[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|NextAudioBitCtr[3]~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|AudioBitCtr[3]~DUPLICATE_q\);

-- Location: LABCELL_X30_Y57_N33
\TheI2SToPar|Decoder0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|Decoder0~1_combout\ = ( !\TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ & ( \TheClkMaster|Mclk~q\ & ( (!\TheI2SToPar|BclkDlyd~q\ & (\TheI2SToPar|AudioBitCtr[3]~DUPLICATE_q\ & (!\TheI2SToPar|AudioBitCtr\(4) & \TheI2SToPar|State~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheI2SToPar|ALT_INV_BclkDlyd~q\,
	datab => \TheI2SToPar|ALT_INV_AudioBitCtr[3]~DUPLICATE_q\,
	datac => \TheI2SToPar|ALT_INV_AudioBitCtr\(4),
	datad => \TheI2SToPar|ALT_INV_State~DUPLICATE_q\,
	datae => \TheI2SToPar|ALT_INV_AudioBitCtr[2]~DUPLICATE_q\,
	dataf => \TheClkMaster|ALT_INV_Mclk~q\,
	combout => \TheI2SToPar|Decoder0~1_combout\);

-- Location: MLABCELL_X28_Y57_N54
\TheI2SToPar|D[11]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[11]~11_combout\ = ( \TheI2SToPar|Decoder0~1_combout\ & ( (!\TheI2SToPar|AudioBitCtr\(0) & (((\TheI2SToPar|D\(11))))) # (\TheI2SToPar|AudioBitCtr\(0) & ((!\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\ & ((\TheI2SToPar|D\(11)))) # 
-- (\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\ & (\iADCdat~input_o\)))) ) ) # ( !\TheI2SToPar|Decoder0~1_combout\ & ( \TheI2SToPar|D\(11) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000001111111010000000111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iADCdat~input_o\,
	datab => \TheI2SToPar|ALT_INV_AudioBitCtr\(0),
	datac => \TheI2SToPar|ALT_INV_AudioBitCtr[1]~DUPLICATE_q\,
	datad => \TheI2SToPar|ALT_INV_D\(11),
	dataf => \TheI2SToPar|ALT_INV_Decoder0~1_combout\,
	combout => \TheI2SToPar|D[11]~11_combout\);

-- Location: FF_X28_Y57_N56
\TheI2SToPar|D[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[11]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(11));

-- Location: FF_X28_Y57_N26
\TheParToI2S|LastValidDR[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(11),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(11));

-- Location: MLABCELL_X28_Y57_N57
\TheI2SToPar|D[9]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[9]~9_combout\ = ( \TheI2SToPar|Decoder0~1_combout\ & ( (!\TheI2SToPar|AudioBitCtr\(0) & (((\TheI2SToPar|D\(9))))) # (\TheI2SToPar|AudioBitCtr\(0) & ((!\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\ & (\iADCdat~input_o\)) # 
-- (\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\ & ((\TheI2SToPar|D\(9)))))) ) ) # ( !\TheI2SToPar|Decoder0~1_combout\ & ( \TheI2SToPar|D\(9) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100010000110111110001000011011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iADCdat~input_o\,
	datab => \TheI2SToPar|ALT_INV_AudioBitCtr\(0),
	datac => \TheI2SToPar|ALT_INV_AudioBitCtr[1]~DUPLICATE_q\,
	datad => \TheI2SToPar|ALT_INV_D\(9),
	dataf => \TheI2SToPar|ALT_INV_Decoder0~1_combout\,
	combout => \TheI2SToPar|D[9]~9_combout\);

-- Location: FF_X28_Y57_N59
\TheI2SToPar|D[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[9]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(9));

-- Location: FF_X28_Y57_N11
\TheParToI2S|LastValidDR[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(9),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(9));

-- Location: MLABCELL_X28_Y57_N24
\TheParToI2S|Mux1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Mux1~2_combout\ = ( \TheParToI2S|LastValidDR\(11) & ( \TheParToI2S|LastValidDR\(9) & ( ((!\TheParToI2S|BclkCtr\(1) & ((\TheParToI2S|LastValidDR\(1)))) # (\TheParToI2S|BclkCtr\(1) & (\TheParToI2S|LastValidDR\(3)))) # (\TheParToI2S|BclkCtr\(3)) 
-- ) ) ) # ( !\TheParToI2S|LastValidDR\(11) & ( \TheParToI2S|LastValidDR\(9) & ( (!\TheParToI2S|BclkCtr\(1) & (((\TheParToI2S|LastValidDR\(1)) # (\TheParToI2S|BclkCtr\(3))))) # (\TheParToI2S|BclkCtr\(1) & (\TheParToI2S|LastValidDR\(3) & 
-- (!\TheParToI2S|BclkCtr\(3)))) ) ) ) # ( \TheParToI2S|LastValidDR\(11) & ( !\TheParToI2S|LastValidDR\(9) & ( (!\TheParToI2S|BclkCtr\(1) & (((!\TheParToI2S|BclkCtr\(3) & \TheParToI2S|LastValidDR\(1))))) # (\TheParToI2S|BclkCtr\(1) & 
-- (((\TheParToI2S|BclkCtr\(3))) # (\TheParToI2S|LastValidDR\(3)))) ) ) ) # ( !\TheParToI2S|LastValidDR\(11) & ( !\TheParToI2S|LastValidDR\(9) & ( (!\TheParToI2S|BclkCtr\(3) & ((!\TheParToI2S|BclkCtr\(1) & ((\TheParToI2S|LastValidDR\(1)))) # 
-- (\TheParToI2S|BclkCtr\(1) & (\TheParToI2S|LastValidDR\(3))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000011010000000100111101001100011100110111000001111111011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_LastValidDR\(3),
	datab => \TheParToI2S|ALT_INV_BclkCtr\(1),
	datac => \TheParToI2S|ALT_INV_BclkCtr\(3),
	datad => \TheParToI2S|ALT_INV_LastValidDR\(1),
	datae => \TheParToI2S|ALT_INV_LastValidDR\(11),
	dataf => \TheParToI2S|ALT_INV_LastValidDR\(9),
	combout => \TheParToI2S|Mux1~2_combout\);

-- Location: LABCELL_X31_Y57_N15
\TheI2SToPar|Decoder0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|Decoder0~3_combout\ = ( \TheI2SToPar|AudioBitCtr\(2) & ( \TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheI2SToPar|ALT_INV_AudioBitCtr[1]~DUPLICATE_q\,
	dataf => \TheI2SToPar|ALT_INV_AudioBitCtr\(2),
	combout => \TheI2SToPar|Decoder0~3_combout\);

-- Location: LABCELL_X31_Y57_N57
\TheI2SToPar|D[7]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[7]~14_combout\ = ( \TheI2SToPar|Decoder0~4_combout\ & ( (!\TheI2SToPar|Decoder0~3_combout\ & ((\TheI2SToPar|D\(7)))) # (\TheI2SToPar|Decoder0~3_combout\ & (\iADCdat~input_o\)) ) ) # ( !\TheI2SToPar|Decoder0~4_combout\ & ( \TheI2SToPar|D\(7) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000011111100110000001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_iADCdat~input_o\,
	datac => \TheI2SToPar|ALT_INV_Decoder0~3_combout\,
	datad => \TheI2SToPar|ALT_INV_D\(7),
	dataf => \TheI2SToPar|ALT_INV_Decoder0~4_combout\,
	combout => \TheI2SToPar|D[7]~14_combout\);

-- Location: FF_X31_Y57_N59
\TheI2SToPar|D[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[7]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(7));

-- Location: FF_X27_Y57_N19
\TheParToI2S|LastValidDR[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(7),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(7));

-- Location: LABCELL_X30_Y57_N48
\TheI2SToPar|Decoder0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|Decoder0~2_combout\ = ( !\TheI2SToPar|AudioBitCtr\(4) & ( (\TheI2SToPar|State~DUPLICATE_q\ & (!\TheI2SToPar|BclkDlyd~q\ & (\TheClkMaster|Mclk~q\ & \TheI2SToPar|AudioBitCtr\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000010000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheI2SToPar|ALT_INV_State~DUPLICATE_q\,
	datab => \TheI2SToPar|ALT_INV_BclkDlyd~q\,
	datac => \TheClkMaster|ALT_INV_Mclk~q\,
	datad => \TheI2SToPar|ALT_INV_AudioBitCtr\(3),
	dataf => \TheI2SToPar|ALT_INV_AudioBitCtr\(4),
	combout => \TheI2SToPar|Decoder0~2_combout\);

-- Location: LABCELL_X31_Y57_N36
\TheI2SToPar|D[13]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[13]~13_combout\ = ( \TheI2SToPar|D\(13) & ( \TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ & ( (!\TheI2SToPar|AudioBitCtr\(0)) # (((!\TheI2SToPar|Decoder0~2_combout\) # (\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\)) # (\iADCdat~input_o\)) ) ) ) # ( 
-- !\TheI2SToPar|D\(13) & ( \TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ & ( (\TheI2SToPar|AudioBitCtr\(0) & (\iADCdat~input_o\ & (!\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\ & \TheI2SToPar|Decoder0~2_combout\))) ) ) ) # ( \TheI2SToPar|D\(13) & ( 
-- !\TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000100001111111110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheI2SToPar|ALT_INV_AudioBitCtr\(0),
	datab => \ALT_INV_iADCdat~input_o\,
	datac => \TheI2SToPar|ALT_INV_AudioBitCtr[1]~DUPLICATE_q\,
	datad => \TheI2SToPar|ALT_INV_Decoder0~2_combout\,
	datae => \TheI2SToPar|ALT_INV_D\(13),
	dataf => \TheI2SToPar|ALT_INV_AudioBitCtr[2]~DUPLICATE_q\,
	combout => \TheI2SToPar|D[13]~13_combout\);

-- Location: FF_X31_Y57_N38
\TheI2SToPar|D[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[13]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(13));

-- Location: FF_X27_Y57_N23
\TheParToI2S|LastValidDR[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(13),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(13));

-- Location: LABCELL_X31_Y57_N27
\TheI2SToPar|D[15]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[15]~15_combout\ = ( \TheI2SToPar|AudioBitCtr\(0) & ( (!\TheI2SToPar|Decoder0~2_combout\ & (((\TheI2SToPar|D\(15))))) # (\TheI2SToPar|Decoder0~2_combout\ & ((!\TheI2SToPar|Decoder0~3_combout\ & ((\TheI2SToPar|D\(15)))) # 
-- (\TheI2SToPar|Decoder0~3_combout\ & (\iADCdat~input_o\)))) ) ) # ( !\TheI2SToPar|AudioBitCtr\(0) & ( \TheI2SToPar|D\(15) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000001111111010000000111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iADCdat~input_o\,
	datab => \TheI2SToPar|ALT_INV_Decoder0~2_combout\,
	datac => \TheI2SToPar|ALT_INV_Decoder0~3_combout\,
	datad => \TheI2SToPar|ALT_INV_D\(15),
	dataf => \TheI2SToPar|ALT_INV_AudioBitCtr\(0),
	combout => \TheI2SToPar|D[15]~15_combout\);

-- Location: FF_X31_Y57_N29
\TheI2SToPar|D[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[15]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(15));

-- Location: FF_X27_Y57_N26
\TheParToI2S|LastValidDR[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(15),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(15));

-- Location: LABCELL_X31_Y57_N33
\TheI2SToPar|D[5]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[5]~12_combout\ = ( \TheI2SToPar|D\(5) & ( \TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ & ( (!\TheI2SToPar|Decoder0~4_combout\) # ((\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\) # (\iADCdat~input_o\)) ) ) ) # ( !\TheI2SToPar|D\(5) & ( 
-- \TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ & ( (\TheI2SToPar|Decoder0~4_combout\ & (\iADCdat~input_o\ & !\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\)) ) ) ) # ( \TheI2SToPar|D\(5) & ( !\TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000011000000001100111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheI2SToPar|ALT_INV_Decoder0~4_combout\,
	datac => \ALT_INV_iADCdat~input_o\,
	datad => \TheI2SToPar|ALT_INV_AudioBitCtr[1]~DUPLICATE_q\,
	datae => \TheI2SToPar|ALT_INV_D\(5),
	dataf => \TheI2SToPar|ALT_INV_AudioBitCtr[2]~DUPLICATE_q\,
	combout => \TheI2SToPar|D[5]~12_combout\);

-- Location: FF_X31_Y57_N35
\TheI2SToPar|D[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[5]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(5));

-- Location: LABCELL_X27_Y57_N18
\TheParToI2S|LastValidDR[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|LastValidDR[5]~feeder_combout\ = ( \TheI2SToPar|D\(5) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \TheI2SToPar|ALT_INV_D\(5),
	combout => \TheParToI2S|LastValidDR[5]~feeder_combout\);

-- Location: FF_X27_Y57_N20
\TheParToI2S|LastValidDR[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheParToI2S|LastValidDR[5]~feeder_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(5));

-- Location: LABCELL_X27_Y57_N24
\TheParToI2S|Mux1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Mux1~3_combout\ = ( \TheParToI2S|LastValidDR\(15) & ( \TheParToI2S|LastValidDR\(5) & ( (!\TheParToI2S|BclkCtr\(1) & (((!\TheParToI2S|BclkCtr\(3)) # (\TheParToI2S|LastValidDR\(13))))) # (\TheParToI2S|BclkCtr\(1) & (((\TheParToI2S|BclkCtr\(3))) 
-- # (\TheParToI2S|LastValidDR\(7)))) ) ) ) # ( !\TheParToI2S|LastValidDR\(15) & ( \TheParToI2S|LastValidDR\(5) & ( (!\TheParToI2S|BclkCtr\(1) & (((!\TheParToI2S|BclkCtr\(3)) # (\TheParToI2S|LastValidDR\(13))))) # (\TheParToI2S|BclkCtr\(1) & 
-- (\TheParToI2S|LastValidDR\(7) & ((!\TheParToI2S|BclkCtr\(3))))) ) ) ) # ( \TheParToI2S|LastValidDR\(15) & ( !\TheParToI2S|LastValidDR\(5) & ( (!\TheParToI2S|BclkCtr\(1) & (((\TheParToI2S|LastValidDR\(13) & \TheParToI2S|BclkCtr\(3))))) # 
-- (\TheParToI2S|BclkCtr\(1) & (((\TheParToI2S|BclkCtr\(3))) # (\TheParToI2S|LastValidDR\(7)))) ) ) ) # ( !\TheParToI2S|LastValidDR\(15) & ( !\TheParToI2S|LastValidDR\(5) & ( (!\TheParToI2S|BclkCtr\(1) & (((\TheParToI2S|LastValidDR\(13) & 
-- \TheParToI2S|BclkCtr\(3))))) # (\TheParToI2S|BclkCtr\(1) & (\TheParToI2S|LastValidDR\(7) & ((!\TheParToI2S|BclkCtr\(3))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100001100000100010011111111011101000011001101110100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_LastValidDR\(7),
	datab => \TheParToI2S|ALT_INV_BclkCtr\(1),
	datac => \TheParToI2S|ALT_INV_LastValidDR\(13),
	datad => \TheParToI2S|ALT_INV_BclkCtr\(3),
	datae => \TheParToI2S|ALT_INV_LastValidDR\(15),
	dataf => \TheParToI2S|ALT_INV_LastValidDR\(5),
	combout => \TheParToI2S|Mux1~3_combout\);

-- Location: LABCELL_X30_Y57_N36
\TheI2SToPar|Decoder0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|Decoder0~0_combout\ = ( \TheClkMaster|Mclk~q\ & ( !\TheI2SToPar|AudioBitCtr[3]~DUPLICATE_q\ & ( (!\TheI2SToPar|AudioBitCtr\(4) & (\TheI2SToPar|State~DUPLICATE_q\ & !\TheI2SToPar|BclkDlyd~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheI2SToPar|ALT_INV_AudioBitCtr\(4),
	datac => \TheI2SToPar|ALT_INV_State~DUPLICATE_q\,
	datad => \TheI2SToPar|ALT_INV_BclkDlyd~q\,
	datae => \TheClkMaster|ALT_INV_Mclk~q\,
	dataf => \TheI2SToPar|ALT_INV_AudioBitCtr[3]~DUPLICATE_q\,
	combout => \TheI2SToPar|Decoder0~0_combout\);

-- Location: LABCELL_X31_Y57_N48
\TheI2SToPar|D[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[2]~2_combout\ = ( \TheI2SToPar|D\(2) & ( \TheI2SToPar|Decoder0~0_combout\ & ( (((!\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\) # (\TheI2SToPar|AudioBitCtr\(2))) # (\iADCdat~input_o\)) # (\TheI2SToPar|AudioBitCtr\(0)) ) ) ) # ( 
-- !\TheI2SToPar|D\(2) & ( \TheI2SToPar|Decoder0~0_combout\ & ( (!\TheI2SToPar|AudioBitCtr\(0) & (\iADCdat~input_o\ & (!\TheI2SToPar|AudioBitCtr\(2) & \TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\))) ) ) ) # ( \TheI2SToPar|D\(2) & ( 
-- !\TheI2SToPar|Decoder0~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000001000001111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheI2SToPar|ALT_INV_AudioBitCtr\(0),
	datab => \ALT_INV_iADCdat~input_o\,
	datac => \TheI2SToPar|ALT_INV_AudioBitCtr\(2),
	datad => \TheI2SToPar|ALT_INV_AudioBitCtr[1]~DUPLICATE_q\,
	datae => \TheI2SToPar|ALT_INV_D\(2),
	dataf => \TheI2SToPar|ALT_INV_Decoder0~0_combout\,
	combout => \TheI2SToPar|D[2]~2_combout\);

-- Location: FF_X31_Y57_N50
\TheI2SToPar|D[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(2));

-- Location: FF_X28_Y57_N34
\TheParToI2S|LastValidDR[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(2),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(2));

-- Location: LABCELL_X31_Y57_N24
\TheI2SToPar|D[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[0]~0_combout\ = ( \TheI2SToPar|Decoder0~0_combout\ & ( (!\TheI2SToPar|Equal0~0_combout\ & ((\TheI2SToPar|D\(0)))) # (\TheI2SToPar|Equal0~0_combout\ & (\iADCdat~input_o\)) ) ) # ( !\TheI2SToPar|Decoder0~0_combout\ & ( \TheI2SToPar|D\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000101111101010000010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iADCdat~input_o\,
	datac => \TheI2SToPar|ALT_INV_Equal0~0_combout\,
	datad => \TheI2SToPar|ALT_INV_D\(0),
	dataf => \TheI2SToPar|ALT_INV_Decoder0~0_combout\,
	combout => \TheI2SToPar|D[0]~0_combout\);

-- Location: FF_X31_Y57_N26
\TheI2SToPar|D[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(0));

-- Location: FF_X28_Y57_N14
\TheParToI2S|LastValidDR[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(0),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(0));

-- Location: MLABCELL_X28_Y57_N51
\TheI2SToPar|D[10]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[10]~3_combout\ = ( \TheI2SToPar|Decoder0~1_combout\ & ( (!\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\ & (((\TheI2SToPar|D\(10))))) # (\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\ & ((!\TheI2SToPar|AudioBitCtr\(0) & (\iADCdat~input_o\)) # 
-- (\TheI2SToPar|AudioBitCtr\(0) & ((\TheI2SToPar|D\(10)))))) ) ) # ( !\TheI2SToPar|Decoder0~1_combout\ & ( \TheI2SToPar|D\(10) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100010000110111110001000011011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iADCdat~input_o\,
	datab => \TheI2SToPar|ALT_INV_AudioBitCtr[1]~DUPLICATE_q\,
	datac => \TheI2SToPar|ALT_INV_AudioBitCtr\(0),
	datad => \TheI2SToPar|ALT_INV_D\(10),
	dataf => \TheI2SToPar|ALT_INV_Decoder0~1_combout\,
	combout => \TheI2SToPar|D[10]~3_combout\);

-- Location: FF_X28_Y57_N53
\TheI2SToPar|D[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[10]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(10));

-- Location: FF_X28_Y57_N32
\TheParToI2S|LastValidDR[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(10),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(10));

-- Location: LABCELL_X31_Y57_N3
\TheI2SToPar|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|Equal0~2_combout\ = ( !\TheI2SToPar|AudioBitCtr[1]~DUPLICATE_q\ & ( !\TheI2SToPar|AudioBitCtr[0]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \TheI2SToPar|ALT_INV_AudioBitCtr[0]~DUPLICATE_q\,
	dataf => \TheI2SToPar|ALT_INV_AudioBitCtr[1]~DUPLICATE_q\,
	combout => \TheI2SToPar|Equal0~2_combout\);

-- Location: LABCELL_X31_Y57_N9
\TheI2SToPar|D[8]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[8]~1_combout\ = ( \TheI2SToPar|Decoder0~1_combout\ & ( (!\TheI2SToPar|Equal0~2_combout\ & ((\TheI2SToPar|D\(8)))) # (\TheI2SToPar|Equal0~2_combout\ & (\iADCdat~input_o\)) ) ) # ( !\TheI2SToPar|Decoder0~1_combout\ & ( \TheI2SToPar|D\(8) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000101111101010000010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iADCdat~input_o\,
	datac => \TheI2SToPar|ALT_INV_Equal0~2_combout\,
	datad => \TheI2SToPar|ALT_INV_D\(8),
	dataf => \TheI2SToPar|ALT_INV_Decoder0~1_combout\,
	combout => \TheI2SToPar|D[8]~1_combout\);

-- Location: FF_X31_Y57_N11
\TheI2SToPar|D[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[8]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(8));

-- Location: FF_X28_Y57_N17
\TheParToI2S|LastValidDR[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(8),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(8));

-- Location: MLABCELL_X28_Y57_N30
\TheParToI2S|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Mux1~0_combout\ = ( \TheParToI2S|LastValidDR\(10) & ( \TheParToI2S|LastValidDR\(8) & ( ((!\TheParToI2S|BclkCtr\(1) & ((\TheParToI2S|LastValidDR\(0)))) # (\TheParToI2S|BclkCtr\(1) & (\TheParToI2S|LastValidDR\(2)))) # (\TheParToI2S|BclkCtr\(3)) 
-- ) ) ) # ( !\TheParToI2S|LastValidDR\(10) & ( \TheParToI2S|LastValidDR\(8) & ( (!\TheParToI2S|BclkCtr\(1) & (((\TheParToI2S|LastValidDR\(0)) # (\TheParToI2S|BclkCtr\(3))))) # (\TheParToI2S|BclkCtr\(1) & (\TheParToI2S|LastValidDR\(2) & 
-- (!\TheParToI2S|BclkCtr\(3)))) ) ) ) # ( \TheParToI2S|LastValidDR\(10) & ( !\TheParToI2S|LastValidDR\(8) & ( (!\TheParToI2S|BclkCtr\(1) & (((!\TheParToI2S|BclkCtr\(3) & \TheParToI2S|LastValidDR\(0))))) # (\TheParToI2S|BclkCtr\(1) & 
-- (((\TheParToI2S|BclkCtr\(3))) # (\TheParToI2S|LastValidDR\(2)))) ) ) ) # ( !\TheParToI2S|LastValidDR\(10) & ( !\TheParToI2S|LastValidDR\(8) & ( (!\TheParToI2S|BclkCtr\(3) & ((!\TheParToI2S|BclkCtr\(1) & ((\TheParToI2S|LastValidDR\(0)))) # 
-- (\TheParToI2S|BclkCtr\(1) & (\TheParToI2S|LastValidDR\(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000011010000000100111101001100011100110111000001111111011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_LastValidDR\(2),
	datab => \TheParToI2S|ALT_INV_BclkCtr\(1),
	datac => \TheParToI2S|ALT_INV_BclkCtr\(3),
	datad => \TheParToI2S|ALT_INV_LastValidDR\(0),
	datae => \TheParToI2S|ALT_INV_LastValidDR\(10),
	dataf => \TheParToI2S|ALT_INV_LastValidDR\(8),
	combout => \TheParToI2S|Mux1~0_combout\);

-- Location: LABCELL_X31_Y57_N54
\TheI2SToPar|D[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[4]~4_combout\ = ( \TheI2SToPar|Decoder0~0_combout\ & ( (!\TheI2SToPar|Equal0~2_combout\ & (((\TheI2SToPar|D\(4))))) # (\TheI2SToPar|Equal0~2_combout\ & ((!\TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ & ((\TheI2SToPar|D\(4)))) # 
-- (\TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ & (\iADCdat~input_o\)))) ) ) # ( !\TheI2SToPar|Decoder0~0_combout\ & ( \TheI2SToPar|D\(4) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000001111110110000000111111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheI2SToPar|ALT_INV_Equal0~2_combout\,
	datab => \ALT_INV_iADCdat~input_o\,
	datac => \TheI2SToPar|ALT_INV_AudioBitCtr[2]~DUPLICATE_q\,
	datad => \TheI2SToPar|ALT_INV_D\(4),
	dataf => \TheI2SToPar|ALT_INV_Decoder0~0_combout\,
	combout => \TheI2SToPar|D[4]~4_combout\);

-- Location: FF_X31_Y57_N56
\TheI2SToPar|D[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(4));

-- Location: FF_X27_Y57_N38
\TheParToI2S|LastValidDR[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(4),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(4));

-- Location: LABCELL_X31_Y57_N45
\TheI2SToPar|D[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[6]~6_combout\ = ( \TheI2SToPar|D\(6) & ( \TheI2SToPar|Decoder0~0_combout\ & ( (!\TheI2SToPar|Decoder0~3_combout\) # ((\TheI2SToPar|AudioBitCtr\(0)) # (\iADCdat~input_o\)) ) ) ) # ( !\TheI2SToPar|D\(6) & ( \TheI2SToPar|Decoder0~0_combout\ & 
-- ( (\TheI2SToPar|Decoder0~3_combout\ & (\iADCdat~input_o\ & !\TheI2SToPar|AudioBitCtr\(0))) ) ) ) # ( \TheI2SToPar|D\(6) & ( !\TheI2SToPar|Decoder0~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000011000000001100111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheI2SToPar|ALT_INV_Decoder0~3_combout\,
	datac => \ALT_INV_iADCdat~input_o\,
	datad => \TheI2SToPar|ALT_INV_AudioBitCtr\(0),
	datae => \TheI2SToPar|ALT_INV_D\(6),
	dataf => \TheI2SToPar|ALT_INV_Decoder0~0_combout\,
	combout => \TheI2SToPar|D[6]~6_combout\);

-- Location: FF_X31_Y57_N47
\TheI2SToPar|D[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(6));

-- Location: FF_X28_Y57_N4
\TheParToI2S|LastValidDR[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(6),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(6));

-- Location: LABCELL_X31_Y57_N12
\TheI2SToPar|D[14]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[14]~7_combout\ = ( \TheI2SToPar|AudioBitCtr\(0) & ( \TheI2SToPar|D\(14) ) ) # ( !\TheI2SToPar|AudioBitCtr\(0) & ( (!\TheI2SToPar|Decoder0~3_combout\ & (((\TheI2SToPar|D\(14))))) # (\TheI2SToPar|Decoder0~3_combout\ & 
-- ((!\TheI2SToPar|Decoder0~2_combout\ & ((\TheI2SToPar|D\(14)))) # (\TheI2SToPar|Decoder0~2_combout\ & (\iADCdat~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111101000000011111110100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iADCdat~input_o\,
	datab => \TheI2SToPar|ALT_INV_Decoder0~3_combout\,
	datac => \TheI2SToPar|ALT_INV_Decoder0~2_combout\,
	datad => \TheI2SToPar|ALT_INV_D\(14),
	dataf => \TheI2SToPar|ALT_INV_AudioBitCtr\(0),
	combout => \TheI2SToPar|D[14]~7_combout\);

-- Location: FF_X31_Y57_N14
\TheI2SToPar|D[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[14]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(14));

-- Location: FF_X27_Y57_N41
\TheParToI2S|LastValidDR[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(14),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(14));

-- Location: LABCELL_X31_Y57_N0
\TheI2SToPar|D[12]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheI2SToPar|D[12]~5_combout\ = ( \TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ & ( (!\TheI2SToPar|Decoder0~2_combout\ & (((\TheI2SToPar|D\(12))))) # (\TheI2SToPar|Decoder0~2_combout\ & ((!\TheI2SToPar|Equal0~2_combout\ & ((\TheI2SToPar|D\(12)))) # 
-- (\TheI2SToPar|Equal0~2_combout\ & (\iADCdat~input_o\)))) ) ) # ( !\TheI2SToPar|AudioBitCtr[2]~DUPLICATE_q\ & ( \TheI2SToPar|D\(12) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000001111111010000000111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iADCdat~input_o\,
	datab => \TheI2SToPar|ALT_INV_Decoder0~2_combout\,
	datac => \TheI2SToPar|ALT_INV_Equal0~2_combout\,
	datad => \TheI2SToPar|ALT_INV_D\(12),
	dataf => \TheI2SToPar|ALT_INV_AudioBitCtr[2]~DUPLICATE_q\,
	combout => \TheI2SToPar|D[12]~5_combout\);

-- Location: FF_X31_Y57_N2
\TheI2SToPar|D[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \TheI2SToPar|D[12]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheI2SToPar|D\(12));

-- Location: FF_X27_Y57_N44
\TheParToI2S|LastValidDR[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(12),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValR~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDR\(12));

-- Location: LABCELL_X27_Y57_N39
\TheParToI2S|Mux1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Mux1~1_combout\ = ( \TheParToI2S|LastValidDR\(14) & ( \TheParToI2S|LastValidDR\(12) & ( ((!\TheParToI2S|BclkCtr\(1) & (\TheParToI2S|LastValidDR\(4))) # (\TheParToI2S|BclkCtr\(1) & ((\TheParToI2S|LastValidDR\(6))))) # 
-- (\TheParToI2S|BclkCtr\(3)) ) ) ) # ( !\TheParToI2S|LastValidDR\(14) & ( \TheParToI2S|LastValidDR\(12) & ( (!\TheParToI2S|BclkCtr\(1) & (((\TheParToI2S|BclkCtr\(3))) # (\TheParToI2S|LastValidDR\(4)))) # (\TheParToI2S|BclkCtr\(1) & 
-- (((!\TheParToI2S|BclkCtr\(3) & \TheParToI2S|LastValidDR\(6))))) ) ) ) # ( \TheParToI2S|LastValidDR\(14) & ( !\TheParToI2S|LastValidDR\(12) & ( (!\TheParToI2S|BclkCtr\(1) & (\TheParToI2S|LastValidDR\(4) & (!\TheParToI2S|BclkCtr\(3)))) # 
-- (\TheParToI2S|BclkCtr\(1) & (((\TheParToI2S|LastValidDR\(6)) # (\TheParToI2S|BclkCtr\(3))))) ) ) ) # ( !\TheParToI2S|LastValidDR\(14) & ( !\TheParToI2S|LastValidDR\(12) & ( (!\TheParToI2S|BclkCtr\(3) & ((!\TheParToI2S|BclkCtr\(1) & 
-- (\TheParToI2S|LastValidDR\(4))) # (\TheParToI2S|BclkCtr\(1) & ((\TheParToI2S|LastValidDR\(6)))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001110000010000110111001101001100011111000100111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_LastValidDR\(4),
	datab => \TheParToI2S|ALT_INV_BclkCtr\(1),
	datac => \TheParToI2S|ALT_INV_BclkCtr\(3),
	datad => \TheParToI2S|ALT_INV_LastValidDR\(6),
	datae => \TheParToI2S|ALT_INV_LastValidDR\(14),
	dataf => \TheParToI2S|ALT_INV_LastValidDR\(12),
	combout => \TheParToI2S|Mux1~1_combout\);

-- Location: MLABCELL_X28_Y57_N12
\TheParToI2S|Mux1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Mux1~4_combout\ = ( \TheParToI2S|BclkCtr\(2) & ( \TheParToI2S|Mux1~1_combout\ & ( (!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\) # (\TheParToI2S|Mux1~3_combout\) ) ) ) # ( !\TheParToI2S|BclkCtr\(2) & ( \TheParToI2S|Mux1~1_combout\ & ( 
-- (!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & ((\TheParToI2S|Mux1~0_combout\))) # (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (\TheParToI2S|Mux1~2_combout\)) ) ) ) # ( \TheParToI2S|BclkCtr\(2) & ( !\TheParToI2S|Mux1~1_combout\ & ( (\TheParToI2S|Mux1~3_combout\ & 
-- \TheParToI2S|BclkCtr[0]~DUPLICATE_q\) ) ) ) # ( !\TheParToI2S|BclkCtr\(2) & ( !\TheParToI2S|Mux1~1_combout\ & ( (!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & ((\TheParToI2S|Mux1~0_combout\))) # (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & 
-- (\TheParToI2S|Mux1~2_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111110101000000110000001100000101111101011111001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_Mux1~2_combout\,
	datab => \TheParToI2S|ALT_INV_Mux1~3_combout\,
	datac => \TheParToI2S|ALT_INV_BclkCtr[0]~DUPLICATE_q\,
	datad => \TheParToI2S|ALT_INV_Mux1~0_combout\,
	datae => \TheParToI2S|ALT_INV_BclkCtr\(2),
	dataf => \TheParToI2S|ALT_INV_Mux1~1_combout\,
	combout => \TheParToI2S|Mux1~4_combout\);

-- Location: FF_X28_Y57_N20
\TheParToI2S|LastValidDL[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(10),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(10));

-- Location: FF_X28_Y57_N43
\TheParToI2S|LastValidDL[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(11),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(11));

-- Location: FF_X27_Y57_N56
\TheParToI2S|LastValidDL[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(15),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(15));

-- Location: FF_X27_Y57_N11
\TheParToI2S|LastValidDL[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(14),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(14));

-- Location: LABCELL_X27_Y57_N54
\TheParToI2S|Mux0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Mux0~3_combout\ = ( \TheParToI2S|LastValidDL\(15) & ( \TheParToI2S|LastValidDL\(14) & ( ((!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (\TheParToI2S|LastValidDL\(10))) # (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & ((\TheParToI2S|LastValidDL\(11))))) # 
-- (\TheParToI2S|BclkCtr\(2)) ) ) ) # ( !\TheParToI2S|LastValidDL\(15) & ( \TheParToI2S|LastValidDL\(14) & ( (!\TheParToI2S|BclkCtr\(2) & ((!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (\TheParToI2S|LastValidDL\(10))) # (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & 
-- ((\TheParToI2S|LastValidDL\(11)))))) # (\TheParToI2S|BclkCtr\(2) & (((!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\)))) ) ) ) # ( \TheParToI2S|LastValidDL\(15) & ( !\TheParToI2S|LastValidDL\(14) & ( (!\TheParToI2S|BclkCtr\(2) & 
-- ((!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (\TheParToI2S|LastValidDL\(10))) # (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & ((\TheParToI2S|LastValidDL\(11)))))) # (\TheParToI2S|BclkCtr\(2) & (((\TheParToI2S|BclkCtr[0]~DUPLICATE_q\)))) ) ) ) # ( 
-- !\TheParToI2S|LastValidDL\(15) & ( !\TheParToI2S|LastValidDL\(14) & ( (!\TheParToI2S|BclkCtr\(2) & ((!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (\TheParToI2S|LastValidDL\(10))) # (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & ((\TheParToI2S|LastValidDL\(11)))))) ) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001001100010000110100111101110000011111000111001101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_LastValidDL\(10),
	datab => \TheParToI2S|ALT_INV_BclkCtr\(2),
	datac => \TheParToI2S|ALT_INV_BclkCtr[0]~DUPLICATE_q\,
	datad => \TheParToI2S|ALT_INV_LastValidDL\(11),
	datae => \TheParToI2S|ALT_INV_LastValidDL\(15),
	dataf => \TheParToI2S|ALT_INV_LastValidDL\(14),
	combout => \TheParToI2S|Mux0~3_combout\);

-- Location: FF_X27_Y57_N5
\TheParToI2S|LastValidDL[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(1),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(1));

-- Location: FF_X27_Y57_N59
\TheParToI2S|LastValidDL[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(0),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(0));

-- Location: FF_X27_Y57_N32
\TheParToI2S|LastValidDL[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(5),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(5));

-- Location: FF_X27_Y57_N35
\TheParToI2S|LastValidDL[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(4),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(4));

-- Location: LABCELL_X27_Y57_N30
\TheParToI2S|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Mux0~0_combout\ = ( \TheParToI2S|LastValidDL\(5) & ( \TheParToI2S|LastValidDL\(4) & ( ((!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & ((\TheParToI2S|LastValidDL\(0)))) # (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (\TheParToI2S|LastValidDL\(1)))) # 
-- (\TheParToI2S|BclkCtr\(2)) ) ) ) # ( !\TheParToI2S|LastValidDL\(5) & ( \TheParToI2S|LastValidDL\(4) & ( (!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (((\TheParToI2S|LastValidDL\(0))) # (\TheParToI2S|BclkCtr\(2)))) # (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & 
-- (!\TheParToI2S|BclkCtr\(2) & (\TheParToI2S|LastValidDL\(1)))) ) ) ) # ( \TheParToI2S|LastValidDL\(5) & ( !\TheParToI2S|LastValidDL\(4) & ( (!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (!\TheParToI2S|BclkCtr\(2) & ((\TheParToI2S|LastValidDL\(0))))) # 
-- (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (((\TheParToI2S|LastValidDL\(1))) # (\TheParToI2S|BclkCtr\(2)))) ) ) ) # ( !\TheParToI2S|LastValidDL\(5) & ( !\TheParToI2S|LastValidDL\(4) & ( (!\TheParToI2S|BclkCtr\(2) & ((!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & 
-- ((\TheParToI2S|LastValidDL\(0)))) # (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (\TheParToI2S|LastValidDL\(1))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010010001100000101011001110100100110101011100011011110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_BclkCtr[0]~DUPLICATE_q\,
	datab => \TheParToI2S|ALT_INV_BclkCtr\(2),
	datac => \TheParToI2S|ALT_INV_LastValidDL\(1),
	datad => \TheParToI2S|ALT_INV_LastValidDL\(0),
	datae => \TheParToI2S|ALT_INV_LastValidDL\(5),
	dataf => \TheParToI2S|ALT_INV_LastValidDL\(4),
	combout => \TheParToI2S|Mux0~0_combout\);

-- Location: FF_X28_Y57_N23
\TheParToI2S|LastValidDL[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(8),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(8));

-- Location: FF_X27_Y57_N17
\TheParToI2S|LastValidDL[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(9),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(9));

-- Location: FF_X27_Y57_N8
\TheParToI2S|LastValidDL[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(13),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(13));

-- Location: FF_X27_Y57_N14
\TheParToI2S|LastValidDL[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(12),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(12));

-- Location: LABCELL_X27_Y57_N6
\TheParToI2S|Mux0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Mux0~1_combout\ = ( \TheParToI2S|LastValidDL\(13) & ( \TheParToI2S|LastValidDL\(12) & ( ((!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (\TheParToI2S|LastValidDL\(8))) # (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & ((\TheParToI2S|LastValidDL\(9))))) # 
-- (\TheParToI2S|BclkCtr\(2)) ) ) ) # ( !\TheParToI2S|LastValidDL\(13) & ( \TheParToI2S|LastValidDL\(12) & ( (!\TheParToI2S|BclkCtr\(2) & ((!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (\TheParToI2S|LastValidDL\(8))) # (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & 
-- ((\TheParToI2S|LastValidDL\(9)))))) # (\TheParToI2S|BclkCtr\(2) & (((!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\)))) ) ) ) # ( \TheParToI2S|LastValidDL\(13) & ( !\TheParToI2S|LastValidDL\(12) & ( (!\TheParToI2S|BclkCtr\(2) & 
-- ((!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (\TheParToI2S|LastValidDL\(8))) # (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & ((\TheParToI2S|LastValidDL\(9)))))) # (\TheParToI2S|BclkCtr\(2) & (((\TheParToI2S|BclkCtr[0]~DUPLICATE_q\)))) ) ) ) # ( 
-- !\TheParToI2S|LastValidDL\(13) & ( !\TheParToI2S|LastValidDL\(12) & ( (!\TheParToI2S|BclkCtr\(2) & ((!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (\TheParToI2S|LastValidDL\(8))) # (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & ((\TheParToI2S|LastValidDL\(9)))))) ) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001001100010000110100111101110000011111000111001101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_LastValidDL\(8),
	datab => \TheParToI2S|ALT_INV_BclkCtr\(2),
	datac => \TheParToI2S|ALT_INV_BclkCtr[0]~DUPLICATE_q\,
	datad => \TheParToI2S|ALT_INV_LastValidDL\(9),
	datae => \TheParToI2S|ALT_INV_LastValidDL\(13),
	dataf => \TheParToI2S|ALT_INV_LastValidDL\(12),
	combout => \TheParToI2S|Mux0~1_combout\);

-- Location: FF_X29_Y57_N49
\TheParToI2S|LastValidDL[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(7),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(7));

-- Location: FF_X28_Y57_N38
\TheParToI2S|LastValidDL[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(2),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(2));

-- Location: FF_X28_Y57_N41
\TheParToI2S|LastValidDL[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(3),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(3));

-- Location: FF_X33_Y57_N31
\TheParToI2S|LastValidDL[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \TheI2SToPar|D\(6),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \TheI2SToPar|ValL~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TheParToI2S|LastValidDL\(6));

-- Location: MLABCELL_X28_Y57_N39
\TheParToI2S|Mux0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Mux0~2_combout\ = ( \TheParToI2S|LastValidDL\(3) & ( \TheParToI2S|LastValidDL\(6) & ( (!\TheParToI2S|BclkCtr\(2) & (((\TheParToI2S|LastValidDL\(2))) # (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\))) # (\TheParToI2S|BclkCtr\(2) & 
-- ((!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\) # ((\TheParToI2S|LastValidDL\(7))))) ) ) ) # ( !\TheParToI2S|LastValidDL\(3) & ( \TheParToI2S|LastValidDL\(6) & ( (!\TheParToI2S|BclkCtr\(2) & (!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & 
-- ((\TheParToI2S|LastValidDL\(2))))) # (\TheParToI2S|BclkCtr\(2) & ((!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\) # ((\TheParToI2S|LastValidDL\(7))))) ) ) ) # ( \TheParToI2S|LastValidDL\(3) & ( !\TheParToI2S|LastValidDL\(6) & ( (!\TheParToI2S|BclkCtr\(2) & 
-- (((\TheParToI2S|LastValidDL\(2))) # (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\))) # (\TheParToI2S|BclkCtr\(2) & (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (\TheParToI2S|LastValidDL\(7)))) ) ) ) # ( !\TheParToI2S|LastValidDL\(3) & ( !\TheParToI2S|LastValidDL\(6) & 
-- ( (!\TheParToI2S|BclkCtr\(2) & (!\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & ((\TheParToI2S|LastValidDL\(2))))) # (\TheParToI2S|BclkCtr\(2) & (\TheParToI2S|BclkCtr[0]~DUPLICATE_q\ & (\TheParToI2S|LastValidDL\(7)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000110001001001000111010101101000101110011010110011111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_BclkCtr\(2),
	datab => \TheParToI2S|ALT_INV_BclkCtr[0]~DUPLICATE_q\,
	datac => \TheParToI2S|ALT_INV_LastValidDL\(7),
	datad => \TheParToI2S|ALT_INV_LastValidDL\(2),
	datae => \TheParToI2S|ALT_INV_LastValidDL\(3),
	dataf => \TheParToI2S|ALT_INV_LastValidDL\(6),
	combout => \TheParToI2S|Mux0~2_combout\);

-- Location: LABCELL_X27_Y57_N0
\TheParToI2S|Mux0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Mux0~4_combout\ = ( \TheParToI2S|Mux0~2_combout\ & ( \TheParToI2S|BclkCtr\(1) & ( (!\TheParToI2S|BclkCtr\(3)) # (\TheParToI2S|Mux0~3_combout\) ) ) ) # ( !\TheParToI2S|Mux0~2_combout\ & ( \TheParToI2S|BclkCtr\(1) & ( 
-- (\TheParToI2S|Mux0~3_combout\ & \TheParToI2S|BclkCtr\(3)) ) ) ) # ( \TheParToI2S|Mux0~2_combout\ & ( !\TheParToI2S|BclkCtr\(1) & ( (!\TheParToI2S|BclkCtr\(3) & (\TheParToI2S|Mux0~0_combout\)) # (\TheParToI2S|BclkCtr\(3) & ((\TheParToI2S|Mux0~1_combout\))) 
-- ) ) ) # ( !\TheParToI2S|Mux0~2_combout\ & ( !\TheParToI2S|BclkCtr\(1) & ( (!\TheParToI2S|BclkCtr\(3) & (\TheParToI2S|Mux0~0_combout\)) # (\TheParToI2S|BclkCtr\(3) & ((\TheParToI2S|Mux0~1_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000111111000011000011111100010001000100011101110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_Mux0~3_combout\,
	datab => \TheParToI2S|ALT_INV_BclkCtr\(3),
	datac => \TheParToI2S|ALT_INV_Mux0~0_combout\,
	datad => \TheParToI2S|ALT_INV_Mux0~1_combout\,
	datae => \TheParToI2S|ALT_INV_Mux0~2_combout\,
	dataf => \TheParToI2S|ALT_INV_BclkCtr\(1),
	combout => \TheParToI2S|Mux0~4_combout\);

-- Location: MLABCELL_X28_Y57_N9
\TheParToI2S|Selector10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|Selector10~0_combout\ = ( \TheParToI2S|Mux0~4_combout\ & ( ((\TheParToI2S|State.SendingR~q\ & \TheParToI2S|Mux1~4_combout\)) # (\TheParToI2S|State.SendingL~DUPLICATE_q\) ) ) # ( !\TheParToI2S|Mux0~4_combout\ & ( 
-- (\TheParToI2S|State.SendingR~q\ & \TheParToI2S|Mux1~4_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100011111000111110001111100011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \TheParToI2S|ALT_INV_State.SendingR~q\,
	datab => \TheParToI2S|ALT_INV_Mux1~4_combout\,
	datac => \TheParToI2S|ALT_INV_State.SendingL~DUPLICATE_q\,
	dataf => \TheParToI2S|ALT_INV_Mux0~4_combout\,
	combout => \TheParToI2S|Selector10~0_combout\);

-- Location: LABCELL_X29_Y57_N18
\TheParToI2S|oLrc~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \TheParToI2S|oLrc~0_combout\ = (\TheParToI2S|State.FirstBitEmptyL~q\) # (\TheParToI2S|State.SendingL~DUPLICATE_q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111001111110011111100111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \TheParToI2S|ALT_INV_State.SendingL~DUPLICATE_q\,
	datac => \TheParToI2S|ALT_INV_State.FirstBitEmptyL~q\,
	combout => \TheParToI2S|oLrc~0_combout\);

-- Location: MLABCELL_X21_Y22_N3
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


