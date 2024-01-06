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

-- DATE "10/30/2021 16:52:49"

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

ENTITY 	I2sAdcIdentI2sDacSlaveMode IS
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
END I2sAdcIdentI2sDacSlaveMode;

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
-- iADCdat	=>  Location: PIN_K7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inResetAsync	=>  Location: PIN_AA14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- iClk	=>  Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF I2sAdcIdentI2sDacSlaveMode IS
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
SIGNAL \GenStrobeI2C|ClkCounter[0]~5_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ : std_logic;
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
SIGNAL \ioI2cSdin~input_o\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data2~q\ : std_logic;
SIGNAL \ConfigureCodec|NextStateAndOutput~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector7~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Start~q\ : std_logic;
SIGNAL \ConfigureCodec|Add0~1_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~2\ : std_logic;
SIGNAL \ConfigureCodec|Add0~25_sumout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Add0~26\ : std_logic;
SIGNAL \ConfigureCodec|Add0~21_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~22\ : std_logic;
SIGNAL \ConfigureCodec|Add0~17_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~18\ : std_logic;
SIGNAL \ConfigureCodec|Add0~13_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~14\ : std_logic;
SIGNAL \ConfigureCodec|Add0~9_sumout\ : std_logic;
SIGNAL \ConfigureCodec|Add0~10\ : std_logic;
SIGNAL \ConfigureCodec|Add0~5_sumout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[6]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Equal0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Sclk~q\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Stop~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~q\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~DUPLICATE_q\ : std_logic;
SIGNAL \WaitCtr[0]~1_combout\ : std_logic;
SIGNAL \WaitCtr[1]~0_combout\ : std_logic;
SIGNAL \Start~0_combout\ : std_logic;
SIGNAL \Start~q\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Configured~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[6]~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Activity~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Activity~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector2~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Address~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector10~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector3~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.RWBit~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector13~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector11~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector11~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector12~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector12~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Add1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector10~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector1~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector10~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|oStrobe~q\ : std_logic;
SIGNAL \ConfigureCodec|NextR~10_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector13~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector13~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|NextR~8_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector6~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack2~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector0~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector0~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Idle~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Idle~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector16~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector16~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AckError~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector4~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack1~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector5~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector5~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Data1~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector11~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector11~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|NextR~9_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector8~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Ack3~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector9~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.FrameState.Stop~q\ : std_logic;
SIGNAL \ConfigureCodec|Selector14~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Sclk~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|R.Sdin~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector0~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~5_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux4~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Data[15]~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux6~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux2~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux0~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux7~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux5~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.AddrCtr[5]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|Mux3~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux1~0_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|Mux9~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|Selector15~6_combout\ : std_logic;
SIGNAL \ConfigureCodec|R.Sdin~q\ : std_logic;
SIGNAL \GenCodecClk|MclkCounter[0]~0_combout\ : std_logic;
SIGNAL \GenCodecClk|Mclk~0_combout\ : std_logic;
SIGNAL \GenCodecClk|Mclk~q\ : std_logic;
SIGNAL \GenCodecClk|Add1~9_sumout\ : std_logic;
SIGNAL \GenCodecClk|ADCCounter[0]~feeder_combout\ : std_logic;
SIGNAL \GenCodecClk|Add1~10\ : std_logic;
SIGNAL \GenCodecClk|Add1~5_sumout\ : std_logic;
SIGNAL \GenCodecClk|ADCCounter[1]~feeder_combout\ : std_logic;
SIGNAL \GenCodecClk|ADCCounter[1]~DUPLICATE_q\ : std_logic;
SIGNAL \GenCodecClk|Add1~6\ : std_logic;
SIGNAL \GenCodecClk|Add1~1_sumout\ : std_logic;
SIGNAL \GenCodecClk|Add1~2\ : std_logic;
SIGNAL \GenCodecClk|Add1~29_sumout\ : std_logic;
SIGNAL \GenCodecClk|ADCCounter~1_combout\ : std_logic;
SIGNAL \GenCodecClk|Add1~30\ : std_logic;
SIGNAL \GenCodecClk|Add1~25_sumout\ : std_logic;
SIGNAL \GenCodecClk|Add1~26\ : std_logic;
SIGNAL \GenCodecClk|Add1~21_sumout\ : std_logic;
SIGNAL \GenCodecClk|Add1~22\ : std_logic;
SIGNAL \GenCodecClk|Add1~17_sumout\ : std_logic;
SIGNAL \GenCodecClk|ADCCounter[6]~feeder_combout\ : std_logic;
SIGNAL \GenCodecClk|Add1~18\ : std_logic;
SIGNAL \GenCodecClk|Add1~13_sumout\ : std_logic;
SIGNAL \GenCodecClk|ADCCounter~0_combout\ : std_logic;
SIGNAL \GenCodecClk|Equal0~0_combout\ : std_logic;
SIGNAL \GenCodecClk|ADClrc~0_combout\ : std_logic;
SIGNAL \GenCodecClk|ADClrc~q\ : std_logic;
SIGNAL \iADCdat~input_o\ : std_logic;
SIGNAL \GenCodecClk|ADCCounter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ConfigureCodec|R.AddrCtr\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|fboutclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ConfigureCodec|R.BitCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \GenCodecClk|MclkCounter\ : std_logic_vector(0 DOWNTO 0);
SIGNAL WaitCtr : std_logic_vector(1 DOWNTO 0);
SIGNAL \GenStrobeI2C|ClkCounter\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|locked_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ConfigureCodec|R.Data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Address~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Sdin~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data2~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter[1]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Stop~DUPLICATE_q\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\ : std_logic;
SIGNAL \GenCodecClk|ALT_INV_ADCCounter[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr[6]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_inResetAsync~input_o\ : std_logic;
SIGNAL \ALT_INV_ioI2cSdin~input_o\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector0~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector16~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~5_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector15~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~3_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_Mux9~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Mux9~0_combout\ : std_logic;
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
SIGNAL \ConfigureCodec|ALT_INV_R.Sdin~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextR~9_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextR~8_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.BitCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector0~1_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~4_combout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~3_combout\ : std_logic;
SIGNAL \GenStrobeI2C|ALT_INV_ClkCounter\ : std_logic_vector(5 DOWNTO 0);
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
SIGNAL \GenCodecClk|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \GenCodecClk|ALT_INV_ADCCounter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \GenCodecClk|ALT_INV_MclkCounter\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ConfigureCodec|ALT_INV_R.Sclk~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AckError~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.Configured~q\ : std_logic;
SIGNAL \ALT_INV_Start~q\ : std_logic;
SIGNAL \GenCodecClk|ALT_INV_ADClrc~q\ : std_logic;
SIGNAL \GenCodecClk|ALT_INV_Mclk~q\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_Selector0~3_combout\ : std_logic;
SIGNAL \GenCodecClk|ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \GenCodecClk|ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \GenCodecClk|ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \GenCodecClk|ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \GenCodecClk|ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \ConfigureCodec|ALT_INV_R.AddrCtr\ : std_logic_vector(6 DOWNTO 0);

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
\ConfigureCodec|ALT_INV_R.FrameState.Address~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Address~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.Sdin~DUPLICATE_q\ <= NOT \ConfigureCodec|R.Sdin~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.FrameState.Data2~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\ <= NOT \GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_ClkCounter[1]~DUPLICATE_q\ <= NOT \GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_ClkCounter[2]~DUPLICATE_q\ <= NOT \GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_ClkCounter[3]~DUPLICATE_q\ <= NOT \GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.FrameState.Stop~DUPLICATE_q\ <= NOT \ConfigureCodec|R.FrameState.Stop~DUPLICATE_q\;
\GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\ <= NOT \GenStrobeI2C|oStrobe~DUPLICATE_q\;
\GenCodecClk|ALT_INV_ADCCounter[1]~DUPLICATE_q\ <= NOT \GenCodecClk|ADCCounter[1]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\ <= NOT \ConfigureCodec|R.Sclk~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.Configured~DUPLICATE_q\ <= NOT \ConfigureCodec|R.Configured~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.AddrCtr[3]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\;
\ConfigureCodec|ALT_INV_R.AddrCtr[6]~DUPLICATE_q\ <= NOT \ConfigureCodec|R.AddrCtr[6]~DUPLICATE_q\;
\ALT_INV_inResetAsync~input_o\ <= NOT \inResetAsync~input_o\;
\ALT_INV_ioI2cSdin~input_o\ <= NOT \ioI2cSdin~input_o\;
\ConfigureCodec|ALT_INV_Selector0~2_combout\ <= NOT \ConfigureCodec|Selector0~2_combout\;
\ConfigureCodec|ALT_INV_Selector16~1_combout\ <= NOT \ConfigureCodec|Selector16~1_combout\;
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
\ConfigureCodec|ALT_INV_R.Configured~4_combout\ <= NOT \ConfigureCodec|R.Configured~4_combout\;
\ConfigureCodec|ALT_INV_R.Configured~3_combout\ <= NOT \ConfigureCodec|R.Configured~3_combout\;
\GenStrobeI2C|ALT_INV_ClkCounter\(0) <= NOT \GenStrobeI2C|ClkCounter\(0);
\GenStrobeI2C|ALT_INV_ClkCounter\(1) <= NOT \GenStrobeI2C|ClkCounter\(1);
\GenStrobeI2C|ALT_INV_ClkCounter\(2) <= NOT \GenStrobeI2C|ClkCounter\(2);
\GenStrobeI2C|ALT_INV_ClkCounter\(3) <= NOT \GenStrobeI2C|ClkCounter\(3);
\GenStrobeI2C|ALT_INV_ClkCounter\(4) <= NOT \GenStrobeI2C|ClkCounter\(4);
\GenStrobeI2C|ALT_INV_ClkCounter\(5) <= NOT \GenStrobeI2C|ClkCounter\(5);
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
\GenCodecClk|ALT_INV_Equal0~0_combout\ <= NOT \GenCodecClk|Equal0~0_combout\;
\GenCodecClk|ALT_INV_ADCCounter\(3) <= NOT \GenCodecClk|ADCCounter\(3);
\GenCodecClk|ALT_INV_ADCCounter\(4) <= NOT \GenCodecClk|ADCCounter\(4);
\GenCodecClk|ALT_INV_ADCCounter\(5) <= NOT \GenCodecClk|ADCCounter\(5);
\GenCodecClk|ALT_INV_ADCCounter\(6) <= NOT \GenCodecClk|ADCCounter\(6);
\GenCodecClk|ALT_INV_ADCCounter\(7) <= NOT \GenCodecClk|ADCCounter\(7);
\GenCodecClk|ALT_INV_ADCCounter\(0) <= NOT \GenCodecClk|ADCCounter\(0);
\GenCodecClk|ALT_INV_ADCCounter\(1) <= NOT \GenCodecClk|ADCCounter\(1);
\GenCodecClk|ALT_INV_ADCCounter\(2) <= NOT \GenCodecClk|ADCCounter\(2);
\GenCodecClk|ALT_INV_MclkCounter\(0) <= NOT \GenCodecClk|MclkCounter\(0);
\ConfigureCodec|ALT_INV_R.Sclk~q\ <= NOT \ConfigureCodec|R.Sclk~q\;
\ConfigureCodec|ALT_INV_R.AckError~q\ <= NOT \ConfigureCodec|R.AckError~q\;
\ConfigureCodec|ALT_INV_R.Configured~q\ <= NOT \ConfigureCodec|R.Configured~q\;
\ALT_INV_Start~q\ <= NOT \Start~q\;
\GenCodecClk|ALT_INV_ADClrc~q\ <= NOT \GenCodecClk|ADClrc~q\;
\GenCodecClk|ALT_INV_Mclk~q\ <= NOT \GenCodecClk|Mclk~q\;
\ConfigureCodec|ALT_INV_Selector0~3_combout\ <= NOT \ConfigureCodec|Selector0~3_combout\;
\GenCodecClk|ALT_INV_Add1~29_sumout\ <= NOT \GenCodecClk|Add1~29_sumout\;
\GenCodecClk|ALT_INV_Add1~17_sumout\ <= NOT \GenCodecClk|Add1~17_sumout\;
\GenCodecClk|ALT_INV_Add1~13_sumout\ <= NOT \GenCodecClk|Add1~13_sumout\;
\GenCodecClk|ALT_INV_Add1~9_sumout\ <= NOT \GenCodecClk|Add1~9_sumout\;
\GenCodecClk|ALT_INV_Add1~5_sumout\ <= NOT \GenCodecClk|Add1~5_sumout\;
\ConfigureCodec|ALT_INV_R.AddrCtr\(1) <= NOT \ConfigureCodec|R.AddrCtr\(1);
\ConfigureCodec|ALT_INV_R.AddrCtr\(2) <= NOT \ConfigureCodec|R.AddrCtr\(2);
\ConfigureCodec|ALT_INV_R.AddrCtr\(3) <= NOT \ConfigureCodec|R.AddrCtr\(3);
\ConfigureCodec|ALT_INV_R.AddrCtr\(4) <= NOT \ConfigureCodec|R.AddrCtr\(4);
\ConfigureCodec|ALT_INV_R.AddrCtr\(5) <= NOT \ConfigureCodec|R.AddrCtr\(5);
\ConfigureCodec|ALT_INV_R.AddrCtr\(6) <= NOT \ConfigureCodec|R.AddrCtr\(6);
\ConfigureCodec|ALT_INV_R.AddrCtr\(0) <= NOT \ConfigureCodec|R.AddrCtr\(0);

-- Location: IOOBUF_X12_Y81_N19
\oI2cSclk~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
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
	i => \GenCodecClk|Mclk~q\,
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
	i => \GenCodecClk|Mclk~q\,
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
	i => \GenCodecClk|ADClrc~q\,
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
	i => \iADCdat~input_o\,
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
	i => \GenCodecClk|ALT_INV_ADClrc~q\,
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

-- Location: FF_X31_Y3_N22
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

-- Location: FF_X31_Y3_N26
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

-- Location: LABCELL_X31_Y3_N24
\GenStrobeI2C|ClkCounter[0]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[0]~5_combout\ = !\GenStrobeI2C|ClkCounter\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(0),
	combout => \GenStrobeI2C|ClkCounter[0]~5_combout\);

-- Location: FF_X31_Y3_N25
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

-- Location: LABCELL_X31_Y3_N21
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

-- Location: FF_X31_Y3_N23
\GenStrobeI2C|ClkCounter[1]~DUPLICATE\ : dffeas
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
	q => \GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\);

-- Location: FF_X31_Y3_N19
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

-- Location: LABCELL_X31_Y3_N18
\GenStrobeI2C|ClkCounter[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[2]~3_combout\ = ( \GenStrobeI2C|ClkCounter\(1) & ( !\GenStrobeI2C|ClkCounter\(0) $ (!\GenStrobeI2C|ClkCounter\(2)) ) ) # ( !\GenStrobeI2C|ClkCounter\(1) & ( \GenStrobeI2C|ClkCounter\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenStrobeI2C|ALT_INV_ClkCounter\(0),
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter\(1),
	combout => \GenStrobeI2C|ClkCounter[2]~3_combout\);

-- Location: FF_X31_Y3_N20
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

-- Location: FF_X31_Y3_N59
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

-- Location: LABCELL_X31_Y3_N57
\GenStrobeI2C|ClkCounter[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[3]~2_combout\ = ( \GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\ & ( !\GenStrobeI2C|ClkCounter\(3) $ (((!\GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\) # (!\GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\))) ) ) # ( 
-- !\GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\ & ( \GenStrobeI2C|ClkCounter\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100010001111011100001000111101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_ClkCounter[1]~DUPLICATE_q\,
	datab => \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\,
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(3),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter[2]~DUPLICATE_q\,
	combout => \GenStrobeI2C|ClkCounter[3]~2_combout\);

-- Location: FF_X31_Y3_N58
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

-- Location: LABCELL_X31_Y3_N54
\GenStrobeI2C|ClkCounter[4]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[4]~1_combout\ = ( \GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\ & ( !\GenStrobeI2C|ClkCounter\(4) $ (((!\GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\) # ((!\GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\) # 
-- (!\GenStrobeI2C|ClkCounter[2]~DUPLICATE_q\)))) ) ) # ( !\GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\ & ( \GenStrobeI2C|ClkCounter\(4) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000001111111100000000111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_ClkCounter[1]~DUPLICATE_q\,
	datab => \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\,
	datac => \GenStrobeI2C|ALT_INV_ClkCounter[2]~DUPLICATE_q\,
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(4),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter[3]~DUPLICATE_q\,
	combout => \GenStrobeI2C|ClkCounter[4]~1_combout\);

-- Location: FF_X31_Y3_N56
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

-- Location: LABCELL_X31_Y3_N0
\GenStrobeI2C|ClkCounter[5]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|ClkCounter[5]~0_combout\ = ( \GenStrobeI2C|ClkCounter\(5) & ( \GenStrobeI2C|ClkCounter\(2) & ( (!\GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\) # ((!\GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\) # ((!\GenStrobeI2C|ClkCounter\(4)) # 
-- (!\GenStrobeI2C|ClkCounter\(3)))) ) ) ) # ( !\GenStrobeI2C|ClkCounter\(5) & ( \GenStrobeI2C|ClkCounter\(2) & ( (\GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\ & (\GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ & (\GenStrobeI2C|ClkCounter\(4) & 
-- \GenStrobeI2C|ClkCounter\(3)))) ) ) ) # ( \GenStrobeI2C|ClkCounter\(5) & ( !\GenStrobeI2C|ClkCounter\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000011111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_ClkCounter[1]~DUPLICATE_q\,
	datab => \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\,
	datac => \GenStrobeI2C|ALT_INV_ClkCounter\(4),
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(3),
	datae => \GenStrobeI2C|ALT_INV_ClkCounter\(5),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	combout => \GenStrobeI2C|ClkCounter[5]~0_combout\);

-- Location: FF_X31_Y3_N2
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

-- Location: LABCELL_X31_Y3_N12
\GenStrobeI2C|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenStrobeI2C|Equal0~0_combout\ = ( \GenStrobeI2C|ClkCounter\(5) & ( \GenStrobeI2C|ClkCounter[3]~DUPLICATE_q\ & ( (\GenStrobeI2C|ClkCounter[1]~DUPLICATE_q\ & (\GenStrobeI2C|ClkCounter[0]~DUPLICATE_q\ & (\GenStrobeI2C|ClkCounter\(4) & 
-- \GenStrobeI2C|ClkCounter\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_ClkCounter[1]~DUPLICATE_q\,
	datab => \GenStrobeI2C|ALT_INV_ClkCounter[0]~DUPLICATE_q\,
	datac => \GenStrobeI2C|ALT_INV_ClkCounter\(4),
	datad => \GenStrobeI2C|ALT_INV_ClkCounter\(2),
	datae => \GenStrobeI2C|ALT_INV_ClkCounter\(5),
	dataf => \GenStrobeI2C|ALT_INV_ClkCounter[3]~DUPLICATE_q\,
	combout => \GenStrobeI2C|Equal0~0_combout\);

-- Location: FF_X35_Y3_N26
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

-- Location: FF_X35_Y3_N56
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

-- Location: FF_X35_Y3_N20
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

-- Location: MLABCELL_X34_Y3_N27
\ConfigureCodec|NextStateAndOutput~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextStateAndOutput~2_combout\ = ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( !\ConfigureCodec|R.Sclk~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|NextStateAndOutput~2_combout\);

-- Location: LABCELL_X35_Y3_N18
\ConfigureCodec|Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector7~0_combout\ = ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( (!\ConfigureCodec|R.AckError~q\ & (((!\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Data2~q\)) # (\ConfigureCodec|R.FrameState.Ack2~q\))) # 
-- (\ConfigureCodec|R.AckError~q\ & (!\ConfigureCodec|NextR~9_combout\ & ((\ConfigureCodec|R.FrameState.Data2~q\)))) ) ) # ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( (!\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Data2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000001010110011100000101011001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datab => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	combout => \ConfigureCodec|Selector7~0_combout\);

-- Location: FF_X35_Y3_N19
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

-- Location: FF_X34_Y3_N11
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

-- Location: LABCELL_X31_Y3_N30
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

-- Location: FF_X31_Y3_N34
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

-- Location: LABCELL_X31_Y3_N33
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

-- Location: FF_X31_Y3_N35
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

-- Location: LABCELL_X31_Y3_N36
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

-- Location: FF_X31_Y3_N38
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

-- Location: LABCELL_X31_Y3_N39
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

-- Location: FF_X31_Y3_N40
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

-- Location: LABCELL_X31_Y3_N42
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

-- Location: FF_X31_Y3_N44
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

-- Location: FF_X31_Y3_N49
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

-- Location: LABCELL_X31_Y3_N45
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

-- Location: FF_X31_Y3_N47
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

-- Location: LABCELL_X31_Y3_N48
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

-- Location: FF_X31_Y3_N50
\ConfigureCodec|R.AddrCtr[6]~DUPLICATE\ : dffeas
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
	q => \ConfigureCodec|R.AddrCtr[6]~DUPLICATE_q\);

-- Location: FF_X31_Y3_N41
\ConfigureCodec|R.AddrCtr[3]~DUPLICATE\ : dffeas
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
	q => \ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\);

-- Location: LABCELL_X31_Y3_N6
\ConfigureCodec|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Equal0~0_combout\ = ( !\ConfigureCodec|R.AddrCtr\(2) & ( \ConfigureCodec|R.AddrCtr[3]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.AddrCtr[1]~DUPLICATE_q\ & (!\ConfigureCodec|R.AddrCtr\(4) & (!\ConfigureCodec|R.AddrCtr[6]~DUPLICATE_q\ & 
-- !\ConfigureCodec|R.AddrCtr\(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr[1]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(4),
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr[6]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(5),
	datae => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr[3]~DUPLICATE_q\,
	combout => \ConfigureCodec|Equal0~0_combout\);

-- Location: FF_X34_Y3_N55
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

-- Location: FF_X33_Y3_N35
\ConfigureCodec|R.FrameState.Stop~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector9~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Stop~DUPLICATE_q\);

-- Location: LABCELL_X33_Y3_N36
\ConfigureCodec|R.Configured~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~1_combout\ = ( \ConfigureCodec|R.FrameState.Stop~DUPLICATE_q\ & ( (\ConfigureCodec|R.Activity~q\ & (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & !\ConfigureCodec|R.Sclk~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000011000000000000001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datac => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Stop~DUPLICATE_q\,
	combout => \ConfigureCodec|R.Configured~1_combout\);

-- Location: FF_X33_Y3_N19
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

-- Location: LABCELL_X33_Y3_N57
\ConfigureCodec|R.Configured~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~0_combout\ = ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( (!\ConfigureCodec|R.Activity~q\ & (\Start~q\ & !\ConfigureCodec|R.FrameState.Idle~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001100000000000000110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datac => \ALT_INV_Start~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|R.Configured~0_combout\);

-- Location: LABCELL_X33_Y3_N18
\ConfigureCodec|R.Configured~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~2_combout\ = ( \ConfigureCodec|R.Configured~q\ & ( \ConfigureCodec|R.Configured~0_combout\ & ( \ConfigureCodec|R.Activity~q\ ) ) ) # ( !\ConfigureCodec|R.Configured~q\ & ( \ConfigureCodec|R.Configured~0_combout\ & ( 
-- \ConfigureCodec|R.Activity~q\ ) ) ) # ( \ConfigureCodec|R.Configured~q\ & ( !\ConfigureCodec|R.Configured~0_combout\ & ( (!\ConfigureCodec|R.AddrCtr\(0)) # ((!\ConfigureCodec|Equal0~0_combout\) # ((!\ConfigureCodec|R.Configured~1_combout\) # 
-- (\ConfigureCodec|R.Activity~q\))) ) ) ) # ( !\ConfigureCodec|R.Configured~q\ & ( !\ConfigureCodec|R.Configured~0_combout\ & ( (\ConfigureCodec|R.AddrCtr\(0) & (\ConfigureCodec|Equal0~0_combout\ & (\ConfigureCodec|R.Configured~1_combout\ & 
-- \ConfigureCodec|R.Activity~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001111111101111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	datab => \ConfigureCodec|ALT_INV_Equal0~0_combout\,
	datac => \ConfigureCodec|ALT_INV_R.Configured~1_combout\,
	datad => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datae => \ConfigureCodec|ALT_INV_R.Configured~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Configured~0_combout\,
	combout => \ConfigureCodec|R.Configured~2_combout\);

-- Location: FF_X33_Y3_N20
\ConfigureCodec|R.Configured~DUPLICATE\ : dffeas
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
	q => \ConfigureCodec|R.Configured~DUPLICATE_q\);

-- Location: LABCELL_X33_Y3_N6
\WaitCtr[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \WaitCtr[0]~1_combout\ = ( WaitCtr(1) & ( ((\GenStrobeI2C|oStrobe~DUPLICATE_q\ & !\ConfigureCodec|R.Configured~DUPLICATE_q\)) # (WaitCtr(0)) ) ) # ( !WaitCtr(1) & ( !WaitCtr(0) $ (((!\GenStrobeI2C|oStrobe~DUPLICATE_q\) # 
-- (\ConfigureCodec|R.Configured~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000010101111010100001010111101010000111111110101000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.Configured~DUPLICATE_q\,
	datad => ALT_INV_WaitCtr(0),
	dataf => ALT_INV_WaitCtr(1),
	combout => \WaitCtr[0]~1_combout\);

-- Location: FF_X33_Y3_N8
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

-- Location: LABCELL_X33_Y3_N15
\WaitCtr[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WaitCtr[1]~0_combout\ = ( \ConfigureCodec|R.Configured~q\ & ( WaitCtr(1) ) ) # ( !\ConfigureCodec|R.Configured~q\ & ( ((\GenStrobeI2C|oStrobe~DUPLICATE_q\ & WaitCtr(0))) # (WaitCtr(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111111111000001011111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datac => ALT_INV_WaitCtr(0),
	datad => ALT_INV_WaitCtr(1),
	dataf => \ConfigureCodec|ALT_INV_R.Configured~q\,
	combout => \WaitCtr[1]~0_combout\);

-- Location: FF_X33_Y3_N16
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

-- Location: LABCELL_X33_Y3_N9
\Start~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Start~0_combout\ = ( !\ConfigureCodec|R.Configured~q\ & ( (!\GenStrobeI2C|oStrobe~DUPLICATE_q\ & (((\Start~q\)))) # (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & (WaitCtr(1) & (WaitCtr(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000110101011000000011010101100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datab => ALT_INV_WaitCtr(1),
	datac => ALT_INV_WaitCtr(0),
	datad => \ALT_INV_Start~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Configured~q\,
	combout => \Start~0_combout\);

-- Location: FF_X33_Y3_N11
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

-- Location: LABCELL_X33_Y3_N12
\ConfigureCodec|R.Configured~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~3_combout\ = ( !\ConfigureCodec|R.Activity~q\ & ( (\Start~q\ & !\ConfigureCodec|R.FrameState.Idle~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Start~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Activity~q\,
	combout => \ConfigureCodec|R.Configured~3_combout\);

-- Location: LABCELL_X33_Y3_N54
\ConfigureCodec|R.Configured~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Configured~4_combout\ = ( !\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( (\ConfigureCodec|R.Activity~q\ & \ConfigureCodec|R.FrameState.Stop~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Stop~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	combout => \ConfigureCodec|R.Configured~4_combout\);

-- Location: LABCELL_X31_Y3_N27
\ConfigureCodec|R.AddrCtr[6]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.AddrCtr[6]~0_combout\ = ( \ConfigureCodec|R.Configured~4_combout\ & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ((!\ConfigureCodec|R.AddrCtr\(0)) # ((!\ConfigureCodec|Equal0~0_combout\) # (\ConfigureCodec|R.Configured~3_combout\)))) ) ) # ( 
-- !\ConfigureCodec|R.Configured~4_combout\ & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & \ConfigureCodec|R.Configured~3_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100001110000011110000111000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	datab => \ConfigureCodec|ALT_INV_Equal0~0_combout\,
	datac => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Configured~3_combout\,
	dataf => \ConfigureCodec|ALT_INV_R.Configured~4_combout\,
	combout => \ConfigureCodec|R.AddrCtr[6]~0_combout\);

-- Location: FF_X31_Y3_N31
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

-- Location: LABCELL_X33_Y3_N39
\ConfigureCodec|R.Activity~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Activity~0_combout\ = ( \ConfigureCodec|R.Configured~0_combout\ & ( !\ConfigureCodec|R.Activity~q\ ) ) # ( !\ConfigureCodec|R.Configured~0_combout\ & ( !\ConfigureCodec|R.Activity~q\ $ (((!\ConfigureCodec|R.AddrCtr\(0)) # 
-- ((!\ConfigureCodec|Equal0~0_combout\) # (!\ConfigureCodec|R.Configured~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110110001100110011011011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	datab => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datac => \ConfigureCodec|ALT_INV_Equal0~0_combout\,
	datad => \ConfigureCodec|ALT_INV_R.Configured~1_combout\,
	dataf => \ConfigureCodec|ALT_INV_R.Configured~0_combout\,
	combout => \ConfigureCodec|R.Activity~0_combout\);

-- Location: FF_X33_Y3_N41
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

-- Location: MLABCELL_X34_Y3_N9
\ConfigureCodec|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector1~0_combout\ = ( \ConfigureCodec|R.Activity~q\ & ( (!\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ((\ConfigureCodec|R.FrameState.Start~q\))) # (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & (!\ConfigureCodec|R.FrameState.Idle~q\)) ) ) # ( 
-- !\ConfigureCodec|R.Activity~q\ & ( (!\GenStrobeI2C|oStrobe~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Start~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001010111110100000101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datac => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Activity~q\,
	combout => \ConfigureCodec|Selector1~0_combout\);

-- Location: FF_X34_Y3_N10
\ConfigureCodec|R.FrameState.Start~DUPLICATE\ : dffeas
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
	q => \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\);

-- Location: LABCELL_X35_Y3_N51
\ConfigureCodec|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector2~0_combout\ = ( \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ & ( ((!\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Address~q\)) # (\GenStrobeI2C|oStrobe~DUPLICATE_q\) ) ) # ( 
-- !\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ & ( (!\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Address~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110001010101110111010101010111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector2~0_combout\);

-- Location: FF_X35_Y3_N53
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

-- Location: LABCELL_X35_Y3_N21
\ConfigureCodec|Selector10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector10~0_combout\ = ( !\ConfigureCodec|R.FrameState.Address~q\ & ( !\ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Data2~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	combout => \ConfigureCodec|Selector10~0_combout\);

-- Location: FF_X35_Y3_N52
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

-- Location: LABCELL_X35_Y3_N57
\ConfigureCodec|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector3~0_combout\ = ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( (\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Address~DUPLICATE_q\) ) ) # ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( 
-- ((\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Address~DUPLICATE_q\)) # (\ConfigureCodec|R.FrameState.RWBit~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111111111000000111111111100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Address~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\,
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	combout => \ConfigureCodec|Selector3~0_combout\);

-- Location: FF_X35_Y3_N58
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

-- Location: MLABCELL_X34_Y3_N18
\ConfigureCodec|Selector13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector13~0_combout\ = ( !\ConfigureCodec|R.FrameState.Stop~q\ & ( \ConfigureCodec|R.FrameState.Idle~q\ & ( (!\ConfigureCodec|R.FrameState.Ack3~q\ & (!\ConfigureCodec|R.FrameState.RWBit~q\ & (!\ConfigureCodec|R.FrameState.Ack1~q\ & 
-- !\ConfigureCodec|R.FrameState.Ack2~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	combout => \ConfigureCodec|Selector13~0_combout\);

-- Location: MLABCELL_X34_Y3_N6
\ConfigureCodec|Selector11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector11~0_combout\ = ( \ConfigureCodec|Selector13~0_combout\ & ( (!\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ & ((!\ConfigureCodec|R.FrameState.Data1~q\) # (\ConfigureCodec|NextStateAndOutput~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011000000111100001100000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	dataf => \ConfigureCodec|ALT_INV_Selector13~0_combout\,
	combout => \ConfigureCodec|Selector11~0_combout\);

-- Location: FF_X35_Y3_N14
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

-- Location: MLABCELL_X34_Y3_N24
\ConfigureCodec|Selector11~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector11~1_combout\ = ( \ConfigureCodec|R.FrameState.Start~q\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ ) ) # ( !\ConfigureCodec|R.FrameState.Start~q\ & ( (!\ConfigureCodec|R.Sclk~DUPLICATE_q\ & (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & 
-- (\ConfigureCodec|R.FrameState.Ack1~q\ & !\ConfigureCodec|R.AckError~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000000000000100000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	datab => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	datad => \ConfigureCodec|ALT_INV_R.AckError~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	combout => \ConfigureCodec|Selector11~1_combout\);

-- Location: LABCELL_X35_Y3_N33
\ConfigureCodec|Selector12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector12~0_combout\ = ( !\ConfigureCodec|Selector11~1_combout\ & ( (!\ConfigureCodec|NextStateAndOutput~2_combout\) # ((!\ConfigureCodec|R.FrameState.Data1~q\) # (!\ConfigureCodec|R.BitCtr\(0) $ (!\ConfigureCodec|R.BitCtr\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101111111110111110111111111000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_Selector11~1_combout\,
	combout => \ConfigureCodec|Selector12~0_combout\);

-- Location: LABCELL_X35_Y3_N42
\ConfigureCodec|Selector12~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector12~1_combout\ = ( \ConfigureCodec|R.BitCtr\(1) & ( \ConfigureCodec|Selector12~0_combout\ & ( (!\ConfigureCodec|Selector11~0_combout\) # ((!\ConfigureCodec|Selector10~0_combout\ & ((!\ConfigureCodec|NextR~10_combout\) # 
-- (\ConfigureCodec|R.BitCtr\(0))))) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(1) & ( \ConfigureCodec|Selector12~0_combout\ & ( (\ConfigureCodec|NextR~10_combout\ & (!\ConfigureCodec|Selector10~0_combout\ & !\ConfigureCodec|R.BitCtr\(0))) ) ) ) # ( 
-- \ConfigureCodec|R.BitCtr\(1) & ( !\ConfigureCodec|Selector12~0_combout\ ) ) # ( !\ConfigureCodec|R.BitCtr\(1) & ( !\ConfigureCodec|Selector12~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111101000100000000001111100011111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextR~10_combout\,
	datab => \ConfigureCodec|ALT_INV_Selector10~0_combout\,
	datac => \ConfigureCodec|ALT_INV_Selector11~0_combout\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_Selector12~0_combout\,
	combout => \ConfigureCodec|Selector12~1_combout\);

-- Location: FF_X35_Y3_N43
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

-- Location: LABCELL_X35_Y3_N48
\ConfigureCodec|Add1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Add1~0_combout\ = ( !\ConfigureCodec|R.BitCtr\(0) & ( (!\ConfigureCodec|R.BitCtr\(2) & !\ConfigureCodec|R.BitCtr\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	combout => \ConfigureCodec|Add1~0_combout\);

-- Location: FF_X35_Y3_N2
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

-- Location: LABCELL_X35_Y3_N27
\ConfigureCodec|Selector10~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector10~1_combout\ = ( \ConfigureCodec|R.BitCtr\(3) & ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( (!\ConfigureCodec|Selector5~0_combout\ & (((\ConfigureCodec|Selector10~0_combout\ & !\ConfigureCodec|R.FrameState.Data1~q\)) # 
-- (\ConfigureCodec|Add1~0_combout\))) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(3) & ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( (!\ConfigureCodec|Selector5~0_combout\ & ((!\ConfigureCodec|R.FrameState.Data1~q\) # (!\ConfigureCodec|Add1~0_combout\))) ) ) 
-- ) # ( \ConfigureCodec|R.BitCtr\(3) & ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( (\ConfigureCodec|Selector10~0_combout\ & !\ConfigureCodec|Selector5~0_combout\) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(3) & ( 
-- !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( !\ConfigureCodec|Selector5~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000010100000101000011110000110000000100000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector10~0_combout\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datac => \ConfigureCodec|ALT_INV_Selector5~0_combout\,
	datad => \ConfigureCodec|ALT_INV_Add1~0_combout\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	combout => \ConfigureCodec|Selector10~1_combout\);

-- Location: LABCELL_X35_Y3_N30
\ConfigureCodec|Selector1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector1~1_combout\ = ( \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ & ( !\GenStrobeI2C|oStrobe~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector1~1_combout\);

-- Location: LABCELL_X35_Y3_N0
\ConfigureCodec|Selector10~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector10~2_combout\ = ( \ConfigureCodec|R.BitCtr\(3) & ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( (!\ConfigureCodec|Selector10~1_combout\) # ((!\ConfigureCodec|Selector13~0_combout\) # (\ConfigureCodec|Selector1~1_combout\)) ) ) 
-- ) # ( !\ConfigureCodec|R.BitCtr\(3) & ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( !\ConfigureCodec|Selector10~1_combout\ ) ) ) # ( \ConfigureCodec|R.BitCtr\(3) & ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( 
-- (!\ConfigureCodec|Selector10~1_combout\) # ((!\ConfigureCodec|Selector13~0_combout\) # ((\ConfigureCodec|Selector1~1_combout\) # (\ConfigureCodec|R.FrameState.Data1~q\))) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(3) & ( 
-- !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( !\ConfigureCodec|Selector10~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010111011111111111110101010101010101110111011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector10~1_combout\,
	datab => \ConfigureCodec|ALT_INV_Selector13~0_combout\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datad => \ConfigureCodec|ALT_INV_Selector1~1_combout\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	combout => \ConfigureCodec|Selector10~2_combout\);

-- Location: FF_X35_Y3_N1
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

-- Location: FF_X35_Y3_N25
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

-- Location: LABCELL_X36_Y3_N18
\ConfigureCodec|NextR~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextR~10_combout\ = ( \ConfigureCodec|R.BitCtr\(1) & ( \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( (\GenStrobeI2C|oStrobe~q\ & !\ConfigureCodec|R.Sclk~q\) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(1) & ( 
-- \ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( (\GenStrobeI2C|oStrobe~q\ & !\ConfigureCodec|R.Sclk~q\) ) ) ) # ( \ConfigureCodec|R.BitCtr\(1) & ( !\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( (\GenStrobeI2C|oStrobe~q\ & !\ConfigureCodec|R.Sclk~q\) ) ) ) # ( 
-- !\ConfigureCodec|R.BitCtr\(1) & ( !\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( (\GenStrobeI2C|oStrobe~q\ & (!\ConfigureCodec|R.Sclk~q\ & ((\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\) # (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000000000011110000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datac => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datad => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	combout => \ConfigureCodec|NextR~10_combout\);

-- Location: MLABCELL_X34_Y3_N39
\ConfigureCodec|Selector13~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector13~1_combout\ = ( \ConfigureCodec|R.FrameState.Data1~q\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( (!\ConfigureCodec|R.Sclk~q\ & ((!\ConfigureCodec|R.BitCtr\(0)) # ((\ConfigureCodec|R.FrameState.Ack1~q\ & 
-- !\ConfigureCodec|R.AckError~q\)))) # (\ConfigureCodec|R.Sclk~q\ & (((\ConfigureCodec|R.BitCtr\(0))))) ) ) ) # ( !\ConfigureCodec|R.FrameState.Data1~q\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( (\ConfigureCodec|R.FrameState.Ack1~q\ & 
-- (!\ConfigureCodec|R.Sclk~q\ & !\ConfigureCodec|R.AckError~q\)) ) ) ) # ( \ConfigureCodec|R.FrameState.Data1~q\ & ( !\GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( \ConfigureCodec|R.BitCtr\(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111101000100000000001100011111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	datab => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datad => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector13~1_combout\);

-- Location: LABCELL_X35_Y3_N12
\ConfigureCodec|Selector13~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector13~2_combout\ = ( \ConfigureCodec|R.BitCtr\(0) & ( \ConfigureCodec|Selector1~1_combout\ ) ) # ( !\ConfigureCodec|R.BitCtr\(0) & ( \ConfigureCodec|Selector1~1_combout\ & ( ((\ConfigureCodec|NextR~10_combout\ & 
-- !\ConfigureCodec|Selector10~0_combout\)) # (\ConfigureCodec|Selector13~1_combout\) ) ) ) # ( \ConfigureCodec|R.BitCtr\(0) & ( !\ConfigureCodec|Selector1~1_combout\ & ( ((!\ConfigureCodec|Selector13~0_combout\) # ((!\ConfigureCodec|NextR~10_combout\ & 
-- !\ConfigureCodec|Selector10~0_combout\))) # (\ConfigureCodec|Selector13~1_combout\) ) ) ) # ( !\ConfigureCodec|R.BitCtr\(0) & ( !\ConfigureCodec|Selector1~1_combout\ & ( ((\ConfigureCodec|NextR~10_combout\ & !\ConfigureCodec|Selector10~0_combout\)) # 
-- (\ConfigureCodec|Selector13~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100111101001111111111111000111101001111010011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_NextR~10_combout\,
	datab => \ConfigureCodec|ALT_INV_Selector10~0_combout\,
	datac => \ConfigureCodec|ALT_INV_Selector13~1_combout\,
	datad => \ConfigureCodec|ALT_INV_Selector13~0_combout\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_Selector1~1_combout\,
	combout => \ConfigureCodec|Selector13~2_combout\);

-- Location: FF_X35_Y3_N13
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

-- Location: LABCELL_X36_Y3_N12
\ConfigureCodec|NextR~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextR~8_combout\ = ( \GenStrobeI2C|oStrobe~q\ & ( !\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & (!\ConfigureCodec|R.BitCtr\(1) & (\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & 
-- !\ConfigureCodec|R.Sclk~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datae => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	combout => \ConfigureCodec|NextR~8_combout\);

-- Location: MLABCELL_X34_Y3_N12
\ConfigureCodec|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector6~0_combout\ = ( !\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( (!\ConfigureCodec|R.FrameState.Ack2~q\ & (\ConfigureCodec|R.FrameState.Data1~q\ & (((\ConfigureCodec|NextR~8_combout\))))) # (\ConfigureCodec|R.FrameState.Ack2~q\ & 
-- (((!\GenStrobeI2C|oStrobe~DUPLICATE_q\) # ((\ConfigureCodec|R.FrameState.Data1~q\ & \ConfigureCodec|NextR~8_combout\))) # (\ConfigureCodec|R.AckError~q\))) ) ) # ( \ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( (!\ConfigureCodec|R.FrameState.Ack2~q\ & 
-- (\ConfigureCodec|R.FrameState.Data1~q\ & (((\ConfigureCodec|NextR~8_combout\))))) # (\ConfigureCodec|R.FrameState.Ack2~q\ & ((!\ioI2cSdin~input_o\) # ((!\GenStrobeI2C|oStrobe~DUPLICATE_q\) # ((\ConfigureCodec|R.FrameState.Data1~q\ & 
-- \ConfigureCodec|NextR~8_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0011001101110111001100110111011100000011010101110011000001110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	datac => \ALT_INV_ioI2cSdin~input_o\,
	datad => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	datae => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datag => \ConfigureCodec|ALT_INV_R.AckError~q\,
	combout => \ConfigureCodec|Selector6~0_combout\);

-- Location: FF_X34_Y3_N14
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

-- Location: MLABCELL_X34_Y3_N45
\ConfigureCodec|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector0~0_combout\ = ( !\ConfigureCodec|R.FrameState.Ack2~q\ & ( (!\ConfigureCodec|R.FrameState.Ack3~q\ & !\ConfigureCodec|R.FrameState.Ack1~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000101010100000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Ack2~q\,
	combout => \ConfigureCodec|Selector0~0_combout\);

-- Location: MLABCELL_X34_Y3_N30
\ConfigureCodec|Selector0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector0~2_combout\ = ( \ConfigureCodec|R.AckError~q\ & ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( ((!\ConfigureCodec|R.FrameState.Idle~q\ & !\ConfigureCodec|Selector0~0_combout\)) # (\ConfigureCodec|R.FrameState.Stop~q\) ) ) ) # 
-- ( !\ConfigureCodec|R.AckError~q\ & ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( ((!\ConfigureCodec|R.FrameState.Idle~q\ & (!\ConfigureCodec|Selector0~0_combout\ & !\GenStrobeI2C|oStrobe~DUPLICATE_q\))) # (\ConfigureCodec|R.FrameState.Stop~q\) ) ) ) 
-- # ( \ConfigureCodec|R.AckError~q\ & ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( (!\ConfigureCodec|R.FrameState.Idle~q\ & !\ConfigureCodec|Selector0~0_combout\) ) ) ) # ( !\ConfigureCodec|R.AckError~q\ & ( 
-- !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( (!\ConfigureCodec|R.FrameState.Idle~q\ & (!\ConfigureCodec|Selector0~0_combout\ & !\GenStrobeI2C|oStrobe~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100000000000100010001000100010001111000011111000111110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datab => \ConfigureCodec|ALT_INV_Selector0~0_combout\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.AckError~q\,
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	combout => \ConfigureCodec|Selector0~2_combout\);

-- Location: LABCELL_X33_Y3_N42
\ConfigureCodec|Selector0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector0~3_combout\ = ( !\ConfigureCodec|R.FrameState.Idle~q\ & ( (!\ConfigureCodec|R.Activity~q\) # ((!\GenStrobeI2C|oStrobe~q\) # (((!\ConfigureCodec|Selector0~0_combout\ & \ConfigureCodec|R.Sclk~DUPLICATE_q\)) # 
-- (\ConfigureCodec|Selector0~2_combout\))) ) ) # ( \ConfigureCodec|R.FrameState.Idle~q\ & ( ((!\ConfigureCodec|Selector0~0_combout\ & (\ConfigureCodec|R.Sclk~DUPLICATE_q\ & (\ioI2cSdin~input_o\ & \GenStrobeI2C|oStrobe~q\)))) # 
-- (\ConfigureCodec|Selector0~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "1111111111110010000000000000001011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector0~0_combout\,
	datab => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	datac => \ALT_INV_ioI2cSdin~input_o\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	dataf => \ConfigureCodec|ALT_INV_Selector0~2_combout\,
	datag => \ConfigureCodec|ALT_INV_R.Activity~q\,
	combout => \ConfigureCodec|Selector0~3_combout\);

-- Location: LABCELL_X33_Y3_N48
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

-- Location: FF_X33_Y3_N50
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

-- Location: LABCELL_X33_Y3_N0
\ConfigureCodec|Selector16~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector16~1_combout\ = ( \ConfigureCodec|R.FrameState.Start~q\ & ( \ConfigureCodec|Selector0~0_combout\ ) ) # ( !\ConfigureCodec|R.FrameState.Start~q\ & ( \ConfigureCodec|Selector0~0_combout\ & ( (!\ConfigureCodec|R.FrameState.Idle~q\ & 
-- (\Start~q\ & (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & !\ConfigureCodec|R.Activity~q\))) ) ) ) # ( \ConfigureCodec|R.FrameState.Start~q\ & ( !\ConfigureCodec|Selector0~0_combout\ & ( (!\ConfigureCodec|R.FrameState.Idle~q\ & (\Start~q\ & 
-- (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & !\ConfigureCodec|R.Activity~q\))) ) ) ) # ( !\ConfigureCodec|R.FrameState.Start~q\ & ( !\ConfigureCodec|Selector0~0_combout\ & ( (!\ConfigureCodec|R.FrameState.Idle~q\ & (\Start~q\ & 
-- (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & !\ConfigureCodec|R.Activity~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000000000000100000000000000010000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	datab => \ALT_INV_Start~q\,
	datac => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.Activity~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Start~q\,
	dataf => \ConfigureCodec|ALT_INV_Selector0~0_combout\,
	combout => \ConfigureCodec|Selector16~1_combout\);

-- Location: LABCELL_X33_Y3_N24
\ConfigureCodec|Selector16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector16~0_combout\ = ( \ConfigureCodec|R.AckError~q\ & ( \ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( (!\ConfigureCodec|Selector0~0_combout\ & (((!\GenStrobeI2C|oStrobe~q\) # (\ioI2cSdin~input_o\)))) # (\ConfigureCodec|Selector0~0_combout\ & 
-- (!\ConfigureCodec|Selector16~1_combout\)) ) ) ) # ( !\ConfigureCodec|R.AckError~q\ & ( \ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( (\ioI2cSdin~input_o\ & (!\ConfigureCodec|Selector0~0_combout\ & \GenStrobeI2C|oStrobe~q\)) ) ) ) # ( 
-- \ConfigureCodec|R.AckError~q\ & ( !\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( !\ConfigureCodec|Selector16~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000001100001111101000111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector16~1_combout\,
	datab => \ALT_INV_ioI2cSdin~input_o\,
	datac => \ConfigureCodec|ALT_INV_Selector0~0_combout\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datae => \ConfigureCodec|ALT_INV_R.AckError~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector16~0_combout\);

-- Location: FF_X33_Y3_N26
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

-- Location: MLABCELL_X34_Y3_N0
\ConfigureCodec|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector4~0_combout\ = ( \ConfigureCodec|R.FrameState.Ack1~q\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( (!\ConfigureCodec|R.Sclk~DUPLICATE_q\ & (((\ConfigureCodec|R.FrameState.RWBit~q\)) # (\ConfigureCodec|R.AckError~q\))) # 
-- (\ConfigureCodec|R.Sclk~DUPLICATE_q\ & (((!\ioI2cSdin~input_o\)))) ) ) ) # ( !\ConfigureCodec|R.FrameState.Ack1~q\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( (\ConfigureCodec|R.FrameState.RWBit~q\ & !\ConfigureCodec|R.Sclk~DUPLICATE_q\) ) ) ) # ( 
-- \ConfigureCodec|R.FrameState.Ack1~q\ & ( !\GenStrobeI2C|oStrobe~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100110000001100000111111101110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\,
	datac => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	datad => \ALT_INV_ioI2cSdin~input_o\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector4~0_combout\);

-- Location: FF_X34_Y3_N2
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

-- Location: MLABCELL_X34_Y3_N57
\ConfigureCodec|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector5~0_combout\ = ( !\ConfigureCodec|R.AckError~q\ & ( \GenStrobeI2C|oStrobe~DUPLICATE_q\ & ( (!\ConfigureCodec|R.Sclk~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Ack1~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Ack1~q\,
	datae => \ConfigureCodec|ALT_INV_R.AckError~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector5~0_combout\);

-- Location: LABCELL_X36_Y3_N42
\ConfigureCodec|Selector5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector5~1_combout\ = ( \ConfigureCodec|NextR~8_combout\ & ( \ConfigureCodec|Selector5~0_combout\ ) ) # ( !\ConfigureCodec|NextR~8_combout\ & ( (\ConfigureCodec|R.FrameState.Data1~q\) # (\ConfigureCodec|Selector5~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_Selector5~0_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	dataf => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	combout => \ConfigureCodec|Selector5~1_combout\);

-- Location: FF_X36_Y3_N43
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

-- Location: LABCELL_X35_Y3_N39
\ConfigureCodec|Selector15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~0_combout\ = ( !\ConfigureCodec|R.BitCtr\(0) & ( !\ConfigureCodec|R.BitCtr\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	combout => \ConfigureCodec|Selector15~0_combout\);

-- Location: LABCELL_X35_Y3_N6
\ConfigureCodec|Selector11~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector11~2_combout\ = ( \ConfigureCodec|Selector10~0_combout\ & ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( (\ConfigureCodec|R.FrameState.Data1~q\ & (!\ConfigureCodec|R.BitCtr\(2) $ (!\ConfigureCodec|Selector15~0_combout\))) ) ) 
-- ) # ( !\ConfigureCodec|Selector10~0_combout\ & ( \ConfigureCodec|NextStateAndOutput~2_combout\ & ( (!\ConfigureCodec|R.BitCtr\(2) & (\ConfigureCodec|Selector15~0_combout\ & ((\ConfigureCodec|R.BitCtr\(3)) # (\ConfigureCodec|R.FrameState.Data1~q\)))) # 
-- (\ConfigureCodec|R.BitCtr\(2) & (((!\ConfigureCodec|Selector15~0_combout\)))) ) ) ) # ( !\ConfigureCodec|Selector10~0_combout\ & ( !\ConfigureCodec|NextStateAndOutput~2_combout\ & ( \ConfigureCodec|R.BitCtr\(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101000000000000000001010101001010100001000100100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	datab => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datad => \ConfigureCodec|ALT_INV_Selector15~0_combout\,
	datae => \ConfigureCodec|ALT_INV_Selector10~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_NextStateAndOutput~2_combout\,
	combout => \ConfigureCodec|Selector11~2_combout\);

-- Location: LABCELL_X35_Y3_N54
\ConfigureCodec|Selector11~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector11~3_combout\ = ( \ConfigureCodec|Selector11~1_combout\ ) # ( !\ConfigureCodec|Selector11~1_combout\ & ( ((!\ConfigureCodec|Selector11~0_combout\ & \ConfigureCodec|R.BitCtr\(2))) # (\ConfigureCodec|Selector11~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111110101010101011111010111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector11~2_combout\,
	datac => \ConfigureCodec|ALT_INV_Selector11~0_combout\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_Selector11~1_combout\,
	combout => \ConfigureCodec|Selector11~3_combout\);

-- Location: FF_X35_Y3_N55
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

-- Location: LABCELL_X36_Y3_N6
\ConfigureCodec|NextR~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|NextR~9_combout\ = ( !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( !\ConfigureCodec|R.Sclk~q\ & ( (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (!\ConfigureCodec|R.BitCtr\(1) & (!\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & 
-- \GenStrobeI2C|oStrobe~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datae => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	combout => \ConfigureCodec|NextR~9_combout\);

-- Location: MLABCELL_X34_Y3_N48
\ConfigureCodec|Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector8~0_combout\ = ( !\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( (!\ConfigureCodec|R.FrameState.Ack3~q\ & (\ConfigureCodec|NextR~9_combout\ & (((\ConfigureCodec|R.FrameState.Data2~q\))))) # (\ConfigureCodec|R.FrameState.Ack3~q\ & 
-- (((!\GenStrobeI2C|oStrobe~DUPLICATE_q\) # ((\ConfigureCodec|NextR~9_combout\ & \ConfigureCodec|R.FrameState.Data2~q\))) # (\ConfigureCodec|R.AckError~q\))) ) ) # ( \ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( (!\ConfigureCodec|R.FrameState.Ack3~q\ & 
-- (\ConfigureCodec|NextR~9_combout\ & (((\ConfigureCodec|R.FrameState.Data2~q\))))) # (\ConfigureCodec|R.FrameState.Ack3~q\ & ((!\ioI2cSdin~input_o\) # ((!\GenStrobeI2C|oStrobe~DUPLICATE_q\) # ((\ConfigureCodec|NextR~9_combout\ & 
-- \ConfigureCodec|R.FrameState.Data2~q\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0101010100000101010101010101000001110111001101110111011101110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	datab => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	datac => \ALT_INV_ioI2cSdin~input_o\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Data2~q\,
	datag => \ConfigureCodec|ALT_INV_R.AckError~q\,
	combout => \ConfigureCodec|Selector8~0_combout\);

-- Location: FF_X34_Y3_N50
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

-- Location: LABCELL_X33_Y3_N33
\ConfigureCodec|Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector9~0_combout\ = ( \ConfigureCodec|R.FrameState.Stop~q\ & ( \ConfigureCodec|R.Sclk~DUPLICATE_q\ ) ) # ( \ConfigureCodec|R.FrameState.Stop~q\ & ( !\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( (!\GenStrobeI2C|oStrobe~DUPLICATE_q\) # 
-- ((\ConfigureCodec|R.FrameState.Ack3~q\ & !\ConfigureCodec|R.AckError~q\)) ) ) ) # ( !\ConfigureCodec|R.FrameState.Stop~q\ & ( !\ConfigureCodec|R.Sclk~DUPLICATE_q\ & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & (\ConfigureCodec|R.FrameState.Ack3~q\ & 
-- !\ConfigureCodec|R.AckError~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000000101011111010101000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Ack3~q\,
	datad => \ConfigureCodec|ALT_INV_R.AckError~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector9~0_combout\);

-- Location: FF_X33_Y3_N34
\ConfigureCodec|R.FrameState.Stop\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Selector9~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.FrameState.Stop~q\);

-- Location: LABCELL_X36_Y3_N36
\ConfigureCodec|Selector14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector14~0_combout\ = ( \ConfigureCodec|R.FrameState.Idle~q\ & ( \ConfigureCodec|R.Activity~q\ & ( (!\ConfigureCodec|R.FrameState.Stop~q\ & (!\GenStrobeI2C|oStrobe~q\ $ (((!\ConfigureCodec|R.Sclk~q\) # 
-- (\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\))))) # (\ConfigureCodec|R.FrameState.Stop~q\ & ((!\GenStrobeI2C|oStrobe~q\ & (\ConfigureCodec|R.Sclk~q\)) # (\GenStrobeI2C|oStrobe~q\ & ((\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\))))) ) ) ) # ( 
-- !\ConfigureCodec|R.FrameState.Idle~q\ & ( \ConfigureCodec|R.Activity~q\ & ( (!\GenStrobeI2C|oStrobe~q\ & (\ConfigureCodec|R.FrameState.Stop~q\ & (\ConfigureCodec|R.Sclk~q\))) # (\GenStrobeI2C|oStrobe~q\ & 
-- (((\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\)))) ) ) ) # ( \ConfigureCodec|R.FrameState.Idle~q\ & ( !\ConfigureCodec|R.Activity~q\ & ( (!\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ & (((\ConfigureCodec|R.Sclk~q\)))) # 
-- (\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ & (((\ConfigureCodec|R.FrameState.Stop~q\ & \ConfigureCodec|R.Sclk~q\)) # (\GenStrobeI2C|oStrobe~q\))) ) ) ) # ( !\ConfigureCodec|R.FrameState.Idle~q\ & ( !\ConfigureCodec|R.Activity~q\ & ( 
-- (!\ConfigureCodec|R.FrameState.Stop~q\ & (((\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ & \GenStrobeI2C|oStrobe~q\)))) # (\ConfigureCodec|R.FrameState.Stop~q\ & (((\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\ & \GenStrobeI2C|oStrobe~q\)) # 
-- (\ConfigureCodec|R.Sclk~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111001100010011111100010001000011110011000110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Stop~q\,
	datab => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datac => \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\,
	datad => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Idle~q\,
	dataf => \ConfigureCodec|ALT_INV_R.Activity~q\,
	combout => \ConfigureCodec|Selector14~0_combout\);

-- Location: FF_X34_Y3_N56
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

-- Location: FF_X36_Y3_N26
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

-- Location: LABCELL_X36_Y3_N0
\ConfigureCodec|Selector15~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~4_combout\ = ( \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (\ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ & (\ConfigureCodec|R.Sclk~q\ & 
-- !\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\)) ) ) ) # ( !\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (\ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ & (\ConfigureCodec|R.Sclk~q\ & 
-- (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & !\ConfigureCodec|R.BitCtr\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000000000100000001000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Address~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.Sclk~q\,
	datac => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datae => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	combout => \ConfigureCodec|Selector15~4_combout\);

-- Location: LABCELL_X36_Y3_N45
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

-- Location: LABCELL_X35_Y3_N36
\ConfigureCodec|Selector15~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~3_combout\ = ( \ConfigureCodec|R.FrameState.Address~q\ & ( ((\ConfigureCodec|R.BitCtr\(0) & (\ConfigureCodec|R.BitCtr\(2) & \ConfigureCodec|R.BitCtr\(1)))) # (\ConfigureCodec|R.BitCtr\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101110101010101010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(3),
	datab => \ConfigureCodec|ALT_INV_R.BitCtr\(0),
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(2),
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	dataf => \ConfigureCodec|ALT_INV_R.FrameState.Address~q\,
	combout => \ConfigureCodec|Selector15~3_combout\);

-- Location: LABCELL_X36_Y3_N54
\ConfigureCodec|Selector15~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~5_combout\ = ( !\ConfigureCodec|Selector0~1_combout\ & ( \ConfigureCodec|Selector15~3_combout\ & ( (\ConfigureCodec|R.Sdin~DUPLICATE_q\ & !\ConfigureCodec|Selector15~4_combout\) ) ) ) # ( !\ConfigureCodec|Selector0~1_combout\ & 
-- ( !\ConfigureCodec|Selector15~3_combout\ & ( (!\ConfigureCodec|Selector15~4_combout\ & (((\ConfigureCodec|Selector0~0_combout\ & !\ConfigureCodec|R.FrameState.Start~DUPLICATE_q\)) # (\ConfigureCodec|R.Sdin~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000001010000000000000000000001010000010100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Sdin~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_Selector0~0_combout\,
	datac => \ConfigureCodec|ALT_INV_Selector15~4_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_Selector0~1_combout\,
	dataf => \ConfigureCodec|ALT_INV_Selector15~3_combout\,
	combout => \ConfigureCodec|Selector15~5_combout\);

-- Location: LABCELL_X36_Y3_N48
\ConfigureCodec|Selector15~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~1_combout\ = ( \ConfigureCodec|R.FrameState.Data1~q\ & ( \GenStrobeI2C|oStrobe~q\ & ( (!\ConfigureCodec|R.FrameState.RWBit~q\ & \ConfigureCodec|R.Sdin~DUPLICATE_q\) ) ) ) # ( !\ConfigureCodec|R.FrameState.Data1~q\ & ( 
-- \GenStrobeI2C|oStrobe~q\ & ( (!\ConfigureCodec|R.FrameState.RWBit~q\ & (((!\ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ & !\ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\)) # (\ConfigureCodec|R.Sdin~DUPLICATE_q\))) ) ) ) # ( 
-- \ConfigureCodec|R.FrameState.Data1~q\ & ( !\GenStrobeI2C|oStrobe~q\ & ( \ConfigureCodec|R.Sdin~DUPLICATE_q\ ) ) ) # ( !\ConfigureCodec|R.FrameState.Data1~q\ & ( !\GenStrobeI2C|oStrobe~q\ & ( ((!\ConfigureCodec|R.FrameState.Address~DUPLICATE_q\ & 
-- (!\ConfigureCodec|R.FrameState.RWBit~q\ & !\ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\))) # (\ConfigureCodec|R.Sdin~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000111100001111000011110000111110001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.FrameState.Address~DUPLICATE_q\,
	datab => \ConfigureCodec|ALT_INV_R.FrameState.RWBit~q\,
	datac => \ConfigureCodec|ALT_INV_R.Sdin~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data2~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	dataf => \GenStrobeI2C|ALT_INV_oStrobe~q\,
	combout => \ConfigureCodec|Selector15~1_combout\);

-- Location: LABCELL_X36_Y3_N30
\ConfigureCodec|Selector15~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~2_combout\ = ( \ConfigureCodec|R.FrameState.Data1~q\ & ( \ConfigureCodec|NextR~9_combout\ & ( (!\ConfigureCodec|NextR~8_combout\ & (\ConfigureCodec|Selector15~1_combout\ & !\ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\)) ) ) ) 
-- # ( !\ConfigureCodec|R.FrameState.Data1~q\ & ( \ConfigureCodec|NextR~9_combout\ & ( (\ConfigureCodec|Selector15~1_combout\ & !\ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\) ) ) ) # ( \ConfigureCodec|R.FrameState.Data1~q\ & ( 
-- !\ConfigureCodec|NextR~9_combout\ & ( (!\ConfigureCodec|NextR~8_combout\ & \ConfigureCodec|Selector15~1_combout\) ) ) ) # ( !\ConfigureCodec|R.FrameState.Data1~q\ & ( !\ConfigureCodec|NextR~9_combout\ & ( \ConfigureCodec|Selector15~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011000000110000001111000000000000110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_NextR~8_combout\,
	datac => \ConfigureCodec|ALT_INV_Selector15~1_combout\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data2~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	dataf => \ConfigureCodec|ALT_INV_NextR~9_combout\,
	combout => \ConfigureCodec|Selector15~2_combout\);

-- Location: LABCELL_X37_Y3_N0
\ConfigureCodec|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux4~0_combout\ = ( \ConfigureCodec|R.AddrCtr\(1) & ( !\ConfigureCodec|R.AddrCtr\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	combout => \ConfigureCodec|Mux4~0_combout\);

-- Location: MLABCELL_X34_Y3_N42
\ConfigureCodec|R.Data[15]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|R.Data[15]~0_combout\ = ( \ConfigureCodec|R.Activity~q\ & ( (\GenStrobeI2C|oStrobe~DUPLICATE_q\ & \ConfigureCodec|R.FrameState.Start~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001100110000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenStrobeI2C|ALT_INV_oStrobe~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Start~DUPLICATE_q\,
	dataf => \ConfigureCodec|ALT_INV_R.Activity~q\,
	combout => \ConfigureCodec|R.Data[15]~0_combout\);

-- Location: FF_X37_Y3_N2
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

-- Location: LABCELL_X37_Y3_N9
\ConfigureCodec|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux6~0_combout\ = ( \ConfigureCodec|R.AddrCtr\(1) & ( (\ConfigureCodec|R.AddrCtr\(0) & (!\ConfigureCodec|R.AddrCtr\(3) & \ConfigureCodec|R.AddrCtr\(2))) ) ) # ( !\ConfigureCodec|R.AddrCtr\(1) & ( (!\ConfigureCodec|R.AddrCtr\(0) & 
-- (\ConfigureCodec|R.AddrCtr\(3) & !\ConfigureCodec|R.AddrCtr\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000000000000011000000000000000000001100000000000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	combout => \ConfigureCodec|Mux6~0_combout\);

-- Location: FF_X37_Y3_N11
\ConfigureCodec|R.Data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux6~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(1));

-- Location: FF_X37_Y3_N28
\ConfigureCodec|R.Data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(0),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(9));

-- Location: FF_X37_Y3_N56
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

-- Location: LABCELL_X37_Y3_N54
\ConfigureCodec|Mux9~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~2_combout\ = ( \ConfigureCodec|R.Data\(11) & ( \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (\ConfigureCodec|R.Data\(9)) # (\ConfigureCodec|R.BitCtr\(1)) ) ) ) # ( !\ConfigureCodec|R.Data\(11) & ( 
-- \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(1) & \ConfigureCodec|R.Data\(9)) ) ) ) # ( \ConfigureCodec|R.Data\(11) & ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(1) & 
-- ((\ConfigureCodec|R.Data\(1)))) # (\ConfigureCodec|R.BitCtr\(1) & (\ConfigureCodec|R.Data\(3))) ) ) ) # ( !\ConfigureCodec|R.Data\(11) & ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(1) & ((\ConfigureCodec|R.Data\(1)))) # 
-- (\ConfigureCodec|R.BitCtr\(1) & (\ConfigureCodec|R.Data\(3))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011010100110101001101010011010100000000111100000000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data\(3),
	datab => \ConfigureCodec|ALT_INV_R.Data\(1),
	datac => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datad => \ConfigureCodec|ALT_INV_R.Data\(9),
	datae => \ConfigureCodec|ALT_INV_R.Data\(11),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux9~2_combout\);

-- Location: FF_X37_Y3_N59
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

-- Location: FF_X37_Y3_N32
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

-- Location: LABCELL_X37_Y3_N48
\ConfigureCodec|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux2~0_combout\ = ( \ConfigureCodec|R.AddrCtr\(0) & ( \ConfigureCodec|R.AddrCtr\(1) & ( (!\ConfigureCodec|R.AddrCtr\(3) & !\ConfigureCodec|R.AddrCtr\(2)) ) ) ) # ( !\ConfigureCodec|R.AddrCtr\(0) & ( \ConfigureCodec|R.AddrCtr\(1) & ( 
-- !\ConfigureCodec|R.AddrCtr\(3) ) ) ) # ( !\ConfigureCodec|R.AddrCtr\(0) & ( !\ConfigureCodec|R.AddrCtr\(1) & ( (\ConfigureCodec|R.AddrCtr\(3) & !\ConfigureCodec|R.AddrCtr\(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000000000000000000011001100110011001100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datae => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	combout => \ConfigureCodec|Mux2~0_combout\);

-- Location: FF_X37_Y3_N50
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

-- Location: LABCELL_X37_Y3_N21
\ConfigureCodec|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux0~0_combout\ = ( \ConfigureCodec|R.AddrCtr\(0) & ( !\ConfigureCodec|R.AddrCtr\(1) & ( (!\ConfigureCodec|R.AddrCtr\(2) & !\ConfigureCodec|R.AddrCtr\(3)) ) ) ) # ( !\ConfigureCodec|R.AddrCtr\(0) & ( !\ConfigureCodec|R.AddrCtr\(1) & ( 
-- !\ConfigureCodec|R.AddrCtr\(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000110000001100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	datae => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	combout => \ConfigureCodec|Mux0~0_combout\);

-- Location: FF_X37_Y3_N23
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

-- Location: LABCELL_X37_Y3_N33
\ConfigureCodec|Mux9~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~3_combout\ = ( \ConfigureCodec|R.Data\(7) & ( \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(1) & (\ConfigureCodec|R.Data\(13))) # (\ConfigureCodec|R.BitCtr\(1) & ((\ConfigureCodec|R.Data\(15)))) ) ) ) # ( 
-- !\ConfigureCodec|R.Data\(7) & ( \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(1) & (\ConfigureCodec|R.Data\(13))) # (\ConfigureCodec|R.BitCtr\(1) & ((\ConfigureCodec|R.Data\(15)))) ) ) ) # ( \ConfigureCodec|R.Data\(7) & ( 
-- !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (\ConfigureCodec|R.Data\(5)) # (\ConfigureCodec|R.BitCtr\(1)) ) ) ) # ( !\ConfigureCodec|R.Data\(7) & ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(1) & 
-- \ConfigureCodec|R.Data\(5)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010010101011111111100100111001001110010011100100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.Data\(13),
	datac => \ConfigureCodec|ALT_INV_R.Data\(15),
	datad => \ConfigureCodec|ALT_INV_R.Data\(5),
	datae => \ConfigureCodec|ALT_INV_R.Data\(7),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux9~3_combout\);

-- Location: LABCELL_X37_Y3_N42
\ConfigureCodec|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux7~0_combout\ = ( \ConfigureCodec|R.AddrCtr\(0) & ( (!\ConfigureCodec|R.AddrCtr\(1) $ (!\ConfigureCodec|R.AddrCtr\(2))) # (\ConfigureCodec|R.AddrCtr\(3)) ) ) # ( !\ConfigureCodec|R.AddrCtr\(0) & ( (\ConfigureCodec|R.AddrCtr\(3)) # 
-- (\ConfigureCodec|R.AddrCtr\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111111111010101011111111101100110111111110110011011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(3),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	combout => \ConfigureCodec|Mux7~0_combout\);

-- Location: FF_X37_Y3_N44
\ConfigureCodec|R.Data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux7~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(0));

-- Location: LABCELL_X37_Y3_N39
\ConfigureCodec|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux5~0_combout\ = ( !\ConfigureCodec|R.AddrCtr\(0) & ( !\ConfigureCodec|R.AddrCtr\(1) & ( \ConfigureCodec|R.AddrCtr\(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	datae => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	combout => \ConfigureCodec|Mux5~0_combout\);

-- Location: FF_X37_Y3_N41
\ConfigureCodec|R.Data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \ConfigureCodec|Mux5~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(2));

-- Location: FF_X37_Y3_N38
\ConfigureCodec|R.Data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \ConfigureCodec|R.AddrCtr\(1),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \ConfigureCodec|R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ConfigureCodec|R.Data\(10));

-- Location: LABCELL_X37_Y3_N3
\ConfigureCodec|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~0_combout\ = ( \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (\ConfigureCodec|R.BitCtr\(1) & \ConfigureCodec|R.Data\(10)) ) ) # ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(1) & 
-- (\ConfigureCodec|R.Data\(0))) # (\ConfigureCodec|R.BitCtr\(1) & ((\ConfigureCodec|R.Data\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010011100100111001001110010011100000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.Data\(0),
	datac => \ConfigureCodec|ALT_INV_R.Data\(2),
	datad => \ConfigureCodec|ALT_INV_R.Data\(10),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux9~0_combout\);

-- Location: FF_X31_Y3_N46
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

-- Location: FF_X37_Y3_N20
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

-- Location: FF_X37_Y3_N14
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

-- Location: LABCELL_X37_Y3_N6
\ConfigureCodec|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux3~0_combout\ = ( \ConfigureCodec|R.AddrCtr\(1) & ( !\ConfigureCodec|R.AddrCtr\(2) ) ) # ( !\ConfigureCodec|R.AddrCtr\(1) & ( (!\ConfigureCodec|R.AddrCtr\(0) & \ConfigureCodec|R.AddrCtr\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	datad => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	combout => \ConfigureCodec|Mux3~0_combout\);

-- Location: FF_X37_Y3_N8
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

-- Location: LABCELL_X37_Y3_N45
\ConfigureCodec|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux1~0_combout\ = ( \ConfigureCodec|R.AddrCtr\(0) & ( (\ConfigureCodec|R.AddrCtr\(1) & !\ConfigureCodec|R.AddrCtr\(2)) ) ) # ( !\ConfigureCodec|R.AddrCtr\(0) & ( (\ConfigureCodec|R.AddrCtr\(2)) # (\ConfigureCodec|R.AddrCtr\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111011101110111011101000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.AddrCtr\(1),
	datab => \ConfigureCodec|ALT_INV_R.AddrCtr\(2),
	dataf => \ConfigureCodec|ALT_INV_R.AddrCtr\(0),
	combout => \ConfigureCodec|Mux1~0_combout\);

-- Location: FF_X37_Y3_N47
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

-- Location: LABCELL_X37_Y3_N15
\ConfigureCodec|Mux9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~1_combout\ = ( \ConfigureCodec|R.Data\(6) & ( \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(1) & ((\ConfigureCodec|R.Data\(12)))) # (\ConfigureCodec|R.BitCtr\(1) & (\ConfigureCodec|R.Data\(14))) ) ) ) # ( 
-- !\ConfigureCodec|R.Data\(6) & ( \ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (!\ConfigureCodec|R.BitCtr\(1) & ((\ConfigureCodec|R.Data\(12)))) # (\ConfigureCodec|R.BitCtr\(1) & (\ConfigureCodec|R.Data\(14))) ) ) ) # ( \ConfigureCodec|R.Data\(6) & ( 
-- !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (\ConfigureCodec|R.BitCtr\(1)) # (\ConfigureCodec|R.Data\(4)) ) ) ) # ( !\ConfigureCodec|R.Data\(6) & ( !\ConfigureCodec|R.BitCtr[3]~DUPLICATE_q\ & ( (\ConfigureCodec|R.Data\(4) & 
-- !\ConfigureCodec|R.BitCtr\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011111111111100110011010101010011001101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_R.Data\(14),
	datab => \ConfigureCodec|ALT_INV_R.Data\(12),
	datac => \ConfigureCodec|ALT_INV_R.Data\(4),
	datad => \ConfigureCodec|ALT_INV_R.BitCtr\(1),
	datae => \ConfigureCodec|ALT_INV_R.Data\(6),
	dataf => \ConfigureCodec|ALT_INV_R.BitCtr[3]~DUPLICATE_q\,
	combout => \ConfigureCodec|Mux9~1_combout\);

-- Location: LABCELL_X37_Y3_N24
\ConfigureCodec|Mux9~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Mux9~4_combout\ = ( \ConfigureCodec|Mux9~0_combout\ & ( \ConfigureCodec|Mux9~1_combout\ & ( (!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\) # ((!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (\ConfigureCodec|Mux9~2_combout\)) # 
-- (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ((\ConfigureCodec|Mux9~3_combout\)))) ) ) ) # ( !\ConfigureCodec|Mux9~0_combout\ & ( \ConfigureCodec|Mux9~1_combout\ & ( (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (\ConfigureCodec|Mux9~2_combout\ & 
-- ((\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\)))) # (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (((!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\) # (\ConfigureCodec|Mux9~3_combout\)))) ) ) ) # ( \ConfigureCodec|Mux9~0_combout\ & ( 
-- !\ConfigureCodec|Mux9~1_combout\ & ( (!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (((!\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\)) # (\ConfigureCodec|Mux9~2_combout\))) # (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (((\ConfigureCodec|Mux9~3_combout\ & 
-- \ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\)))) ) ) ) # ( !\ConfigureCodec|Mux9~0_combout\ & ( !\ConfigureCodec|Mux9~1_combout\ & ( (\ConfigureCodec|R.BitCtr[0]~DUPLICATE_q\ & ((!\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & (\ConfigureCodec|Mux9~2_combout\)) # 
-- (\ConfigureCodec|R.BitCtr[2]~DUPLICATE_q\ & ((\ConfigureCodec|Mux9~3_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000111110011000100011100110011010001111111111101000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Mux9~2_combout\,
	datab => \ConfigureCodec|ALT_INV_R.BitCtr[2]~DUPLICATE_q\,
	datac => \ConfigureCodec|ALT_INV_Mux9~3_combout\,
	datad => \ConfigureCodec|ALT_INV_R.BitCtr[0]~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_Mux9~0_combout\,
	dataf => \ConfigureCodec|ALT_INV_Mux9~1_combout\,
	combout => \ConfigureCodec|Mux9~4_combout\);

-- Location: LABCELL_X36_Y3_N24
\ConfigureCodec|Selector15~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ConfigureCodec|Selector15~6_combout\ = ( \ConfigureCodec|R.FrameState.Data1~q\ & ( \ConfigureCodec|Mux9~4_combout\ & ( (\ConfigureCodec|Selector15~5_combout\ & (\ConfigureCodec|Selector15~2_combout\ & !\ConfigureCodec|R.Sclk~DUPLICATE_q\)) ) ) ) # ( 
-- !\ConfigureCodec|R.FrameState.Data1~q\ & ( \ConfigureCodec|Mux9~4_combout\ & ( (\ConfigureCodec|Selector15~5_combout\ & ((!\ConfigureCodec|R.Sclk~DUPLICATE_q\ & (\ConfigureCodec|Selector15~2_combout\)) # (\ConfigureCodec|R.Sclk~DUPLICATE_q\ & 
-- ((!\ConfigureCodec|R.FrameState.Data2~DUPLICATE_q\))))) ) ) ) # ( \ConfigureCodec|R.FrameState.Data1~q\ & ( !\ConfigureCodec|Mux9~4_combout\ & ( (\ConfigureCodec|Selector15~5_combout\ & ((\ConfigureCodec|R.Sclk~DUPLICATE_q\) # 
-- (\ConfigureCodec|Selector15~2_combout\))) ) ) ) # ( !\ConfigureCodec|R.FrameState.Data1~q\ & ( !\ConfigureCodec|Mux9~4_combout\ & ( (\ConfigureCodec|Selector15~5_combout\ & ((\ConfigureCodec|R.Sclk~DUPLICATE_q\) # (\ConfigureCodec|Selector15~2_combout\))) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010100010101000101010001010100010101000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ConfigureCodec|ALT_INV_Selector15~5_combout\,
	datab => \ConfigureCodec|ALT_INV_Selector15~2_combout\,
	datac => \ConfigureCodec|ALT_INV_R.Sclk~DUPLICATE_q\,
	datad => \ConfigureCodec|ALT_INV_R.FrameState.Data2~DUPLICATE_q\,
	datae => \ConfigureCodec|ALT_INV_R.FrameState.Data1~q\,
	dataf => \ConfigureCodec|ALT_INV_Mux9~4_combout\,
	combout => \ConfigureCodec|Selector15~6_combout\);

-- Location: FF_X36_Y3_N25
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

-- Location: LABCELL_X22_Y74_N24
\GenCodecClk|MclkCounter[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|MclkCounter[0]~0_combout\ = ( !\GenCodecClk|MclkCounter\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \GenCodecClk|ALT_INV_MclkCounter\(0),
	combout => \GenCodecClk|MclkCounter[0]~0_combout\);

-- Location: FF_X22_Y74_N25
\GenCodecClk|MclkCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \GenCodecClk|MclkCounter[0]~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenCodecClk|MclkCounter\(0));

-- Location: MLABCELL_X21_Y74_N57
\GenCodecClk|Mclk~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|Mclk~0_combout\ = ( \GenCodecClk|MclkCounter\(0) & ( !\GenCodecClk|Mclk~q\ ) ) # ( !\GenCodecClk|MclkCounter\(0) & ( \GenCodecClk|Mclk~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111100001111000000001111000011111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenCodecClk|ALT_INV_Mclk~q\,
	datae => \GenCodecClk|ALT_INV_MclkCounter\(0),
	combout => \GenCodecClk|Mclk~0_combout\);

-- Location: FF_X21_Y74_N14
\GenCodecClk|Mclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \PLL50to48MHz|GeneratePLLForSyn:AlteraPLL50to48_rtl|alterapll50to48_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \GenCodecClk|Mclk~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenCodecClk|Mclk~q\);

-- Location: MLABCELL_X21_Y74_N30
\GenCodecClk|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|Add1~9_sumout\ = SUM(( \GenCodecClk|ADCCounter\(0) ) + ( VCC ) + ( !VCC ))
-- \GenCodecClk|Add1~10\ = CARRY(( \GenCodecClk|ADCCounter\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenCodecClk|ALT_INV_ADCCounter\(0),
	cin => GND,
	sumout => \GenCodecClk|Add1~9_sumout\,
	cout => \GenCodecClk|Add1~10\);

-- Location: MLABCELL_X21_Y74_N24
\GenCodecClk|ADCCounter[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|ADCCounter[0]~feeder_combout\ = ( \GenCodecClk|Add1~9_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \GenCodecClk|ALT_INV_Add1~9_sumout\,
	combout => \GenCodecClk|ADCCounter[0]~feeder_combout\);

-- Location: FF_X21_Y74_N26
\GenCodecClk|ADCCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenCodecClk|ALT_INV_Mclk~q\,
	d => \GenCodecClk|ADCCounter[0]~feeder_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenCodecClk|ADCCounter\(0));

-- Location: MLABCELL_X21_Y74_N33
\GenCodecClk|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|Add1~5_sumout\ = SUM(( \GenCodecClk|ADCCounter[1]~DUPLICATE_q\ ) + ( GND ) + ( \GenCodecClk|Add1~10\ ))
-- \GenCodecClk|Add1~6\ = CARRY(( \GenCodecClk|ADCCounter[1]~DUPLICATE_q\ ) + ( GND ) + ( \GenCodecClk|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenCodecClk|ALT_INV_ADCCounter[1]~DUPLICATE_q\,
	cin => \GenCodecClk|Add1~10\,
	sumout => \GenCodecClk|Add1~5_sumout\,
	cout => \GenCodecClk|Add1~6\);

-- Location: MLABCELL_X21_Y74_N27
\GenCodecClk|ADCCounter[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|ADCCounter[1]~feeder_combout\ = ( \GenCodecClk|Add1~5_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \GenCodecClk|ALT_INV_Add1~5_sumout\,
	combout => \GenCodecClk|ADCCounter[1]~feeder_combout\);

-- Location: FF_X21_Y74_N28
\GenCodecClk|ADCCounter[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenCodecClk|ALT_INV_Mclk~q\,
	d => \GenCodecClk|ADCCounter[1]~feeder_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenCodecClk|ADCCounter[1]~DUPLICATE_q\);

-- Location: MLABCELL_X21_Y74_N36
\GenCodecClk|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|Add1~1_sumout\ = SUM(( \GenCodecClk|ADCCounter\(2) ) + ( GND ) + ( \GenCodecClk|Add1~6\ ))
-- \GenCodecClk|Add1~2\ = CARRY(( \GenCodecClk|ADCCounter\(2) ) + ( GND ) + ( \GenCodecClk|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \GenCodecClk|ALT_INV_ADCCounter\(2),
	cin => \GenCodecClk|Add1~6\,
	sumout => \GenCodecClk|Add1~1_sumout\,
	cout => \GenCodecClk|Add1~2\);

-- Location: FF_X21_Y74_N11
\GenCodecClk|ADCCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenCodecClk|ALT_INV_Mclk~q\,
	asdata => \GenCodecClk|Add1~1_sumout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenCodecClk|ADCCounter\(2));

-- Location: FF_X21_Y74_N29
\GenCodecClk|ADCCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenCodecClk|ALT_INV_Mclk~q\,
	d => \GenCodecClk|ADCCounter[1]~feeder_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenCodecClk|ADCCounter\(1));

-- Location: MLABCELL_X21_Y74_N39
\GenCodecClk|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|Add1~29_sumout\ = SUM(( \GenCodecClk|ADCCounter\(3) ) + ( GND ) + ( \GenCodecClk|Add1~2\ ))
-- \GenCodecClk|Add1~30\ = CARRY(( \GenCodecClk|ADCCounter\(3) ) + ( GND ) + ( \GenCodecClk|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenCodecClk|ALT_INV_ADCCounter\(3),
	cin => \GenCodecClk|Add1~2\,
	sumout => \GenCodecClk|Add1~29_sumout\,
	cout => \GenCodecClk|Add1~30\);

-- Location: MLABCELL_X21_Y74_N21
\GenCodecClk|ADCCounter~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|ADCCounter~1_combout\ = ( \GenCodecClk|Add1~29_sumout\ & ( (!\GenCodecClk|ADCCounter\(0)) # ((!\GenCodecClk|ADCCounter\(2)) # ((!\GenCodecClk|Equal0~0_combout\) # (!\GenCodecClk|ADCCounter\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111101111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenCodecClk|ALT_INV_ADCCounter\(0),
	datab => \GenCodecClk|ALT_INV_ADCCounter\(2),
	datac => \GenCodecClk|ALT_INV_Equal0~0_combout\,
	datad => \GenCodecClk|ALT_INV_ADCCounter\(1),
	dataf => \GenCodecClk|ALT_INV_Add1~29_sumout\,
	combout => \GenCodecClk|ADCCounter~1_combout\);

-- Location: FF_X21_Y74_N22
\GenCodecClk|ADCCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenCodecClk|ALT_INV_Mclk~q\,
	d => \GenCodecClk|ADCCounter~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenCodecClk|ADCCounter\(3));

-- Location: MLABCELL_X21_Y74_N42
\GenCodecClk|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|Add1~25_sumout\ = SUM(( \GenCodecClk|ADCCounter\(4) ) + ( GND ) + ( \GenCodecClk|Add1~30\ ))
-- \GenCodecClk|Add1~26\ = CARRY(( \GenCodecClk|ADCCounter\(4) ) + ( GND ) + ( \GenCodecClk|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenCodecClk|ALT_INV_ADCCounter\(4),
	cin => \GenCodecClk|Add1~30\,
	sumout => \GenCodecClk|Add1~25_sumout\,
	cout => \GenCodecClk|Add1~26\);

-- Location: FF_X21_Y74_N7
\GenCodecClk|ADCCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenCodecClk|ALT_INV_Mclk~q\,
	asdata => \GenCodecClk|Add1~25_sumout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenCodecClk|ADCCounter\(4));

-- Location: MLABCELL_X21_Y74_N45
\GenCodecClk|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|Add1~21_sumout\ = SUM(( \GenCodecClk|ADCCounter\(5) ) + ( GND ) + ( \GenCodecClk|Add1~26\ ))
-- \GenCodecClk|Add1~22\ = CARRY(( \GenCodecClk|ADCCounter\(5) ) + ( GND ) + ( \GenCodecClk|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenCodecClk|ALT_INV_ADCCounter\(5),
	cin => \GenCodecClk|Add1~26\,
	sumout => \GenCodecClk|Add1~21_sumout\,
	cout => \GenCodecClk|Add1~22\);

-- Location: FF_X21_Y74_N2
\GenCodecClk|ADCCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenCodecClk|ALT_INV_Mclk~q\,
	asdata => \GenCodecClk|Add1~21_sumout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenCodecClk|ADCCounter\(5));

-- Location: MLABCELL_X21_Y74_N48
\GenCodecClk|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|Add1~17_sumout\ = SUM(( \GenCodecClk|ADCCounter\(6) ) + ( GND ) + ( \GenCodecClk|Add1~22\ ))
-- \GenCodecClk|Add1~18\ = CARRY(( \GenCodecClk|ADCCounter\(6) ) + ( GND ) + ( \GenCodecClk|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \GenCodecClk|ALT_INV_ADCCounter\(6),
	cin => \GenCodecClk|Add1~22\,
	sumout => \GenCodecClk|Add1~17_sumout\,
	cout => \GenCodecClk|Add1~18\);

-- Location: MLABCELL_X21_Y74_N3
\GenCodecClk|ADCCounter[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|ADCCounter[6]~feeder_combout\ = ( \GenCodecClk|Add1~17_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \GenCodecClk|ALT_INV_Add1~17_sumout\,
	combout => \GenCodecClk|ADCCounter[6]~feeder_combout\);

-- Location: FF_X21_Y74_N5
\GenCodecClk|ADCCounter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenCodecClk|ALT_INV_Mclk~q\,
	d => \GenCodecClk|ADCCounter[6]~feeder_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenCodecClk|ADCCounter\(6));

-- Location: MLABCELL_X21_Y74_N51
\GenCodecClk|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|Add1~13_sumout\ = SUM(( \GenCodecClk|ADCCounter\(7) ) + ( GND ) + ( \GenCodecClk|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenCodecClk|ALT_INV_ADCCounter\(7),
	cin => \GenCodecClk|Add1~18\,
	sumout => \GenCodecClk|Add1~13_sumout\);

-- Location: MLABCELL_X21_Y74_N18
\GenCodecClk|ADCCounter~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|ADCCounter~0_combout\ = ( \GenCodecClk|Equal0~0_combout\ & ( (\GenCodecClk|Add1~13_sumout\ & ((!\GenCodecClk|ADCCounter\(0)) # ((!\GenCodecClk|ADCCounter\(2)) # (!\GenCodecClk|ADCCounter\(1))))) ) ) # ( !\GenCodecClk|Equal0~0_combout\ & ( 
-- \GenCodecClk|Add1~13_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011100000111100001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenCodecClk|ALT_INV_ADCCounter\(0),
	datab => \GenCodecClk|ALT_INV_ADCCounter\(2),
	datac => \GenCodecClk|ALT_INV_Add1~13_sumout\,
	datad => \GenCodecClk|ALT_INV_ADCCounter\(1),
	dataf => \GenCodecClk|ALT_INV_Equal0~0_combout\,
	combout => \GenCodecClk|ADCCounter~0_combout\);

-- Location: FF_X21_Y74_N20
\GenCodecClk|ADCCounter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenCodecClk|ALT_INV_Mclk~q\,
	d => \GenCodecClk|ADCCounter~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenCodecClk|ADCCounter\(7));

-- Location: MLABCELL_X21_Y74_N6
\GenCodecClk|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|Equal0~0_combout\ = ( !\GenCodecClk|ADCCounter\(4) & ( \GenCodecClk|ADCCounter\(7) & ( (!\GenCodecClk|ADCCounter\(5) & (!\GenCodecClk|ADCCounter\(3) & !\GenCodecClk|ADCCounter\(6))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenCodecClk|ALT_INV_ADCCounter\(5),
	datab => \GenCodecClk|ALT_INV_ADCCounter\(3),
	datac => \GenCodecClk|ALT_INV_ADCCounter\(6),
	datae => \GenCodecClk|ALT_INV_ADCCounter\(4),
	dataf => \GenCodecClk|ALT_INV_ADCCounter\(7),
	combout => \GenCodecClk|Equal0~0_combout\);

-- Location: MLABCELL_X21_Y74_N15
\GenCodecClk|ADClrc~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \GenCodecClk|ADClrc~0_combout\ = ( \inResetAsync~input_o\ & ( \GenCodecClk|ADCCounter[1]~DUPLICATE_q\ & ( !\GenCodecClk|ADClrc~q\ $ (((!\GenCodecClk|ADCCounter\(2)) # ((!\GenCodecClk|Equal0~0_combout\) # (!\GenCodecClk|ADCCounter\(0))))) ) ) ) # ( 
-- !\inResetAsync~input_o\ & ( \GenCodecClk|ADCCounter[1]~DUPLICATE_q\ & ( \GenCodecClk|ADClrc~q\ ) ) ) # ( \inResetAsync~input_o\ & ( !\GenCodecClk|ADCCounter[1]~DUPLICATE_q\ & ( \GenCodecClk|ADClrc~q\ ) ) ) # ( !\inResetAsync~input_o\ & ( 
-- !\GenCodecClk|ADCCounter[1]~DUPLICATE_q\ & ( \GenCodecClk|ADClrc~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \GenCodecClk|ALT_INV_ADClrc~q\,
	datab => \GenCodecClk|ALT_INV_ADCCounter\(2),
	datac => \GenCodecClk|ALT_INV_Equal0~0_combout\,
	datad => \GenCodecClk|ALT_INV_ADCCounter\(0),
	datae => \ALT_INV_inResetAsync~input_o\,
	dataf => \GenCodecClk|ALT_INV_ADCCounter[1]~DUPLICATE_q\,
	combout => \GenCodecClk|ADClrc~0_combout\);

-- Location: FF_X21_Y74_N56
\GenCodecClk|ADClrc\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GenCodecClk|ALT_INV_Mclk~q\,
	asdata => \GenCodecClk|ADClrc~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \GenCodecClk|ADClrc~q\);

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

-- Location: LABCELL_X12_Y69_N3
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


