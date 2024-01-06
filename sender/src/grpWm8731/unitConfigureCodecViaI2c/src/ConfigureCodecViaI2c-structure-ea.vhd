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

-- DATE "10/03/2021 20:27:46"

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

ENTITY 	ConfigureCodecViaI2c IS
    PORT (
	iClk : IN std_logic;
	inResetAsync : IN std_logic;
	iStrobeI2C : IN std_logic;
	iStart : IN std_logic;
	oConfigured : OUT std_logic;
	oAckError : OUT std_logic;
	oI2cSclk : OUT std_logic;
	ioI2cSdin : INOUT std_logic
	);
END ConfigureCodecViaI2c;

-- Design Ports Information
-- oConfigured	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oAckError	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oI2cSclk	=>  Location: PIN_AK27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ioI2cSdin	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iStrobeI2C	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iStart	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iClk	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inResetAsync	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ConfigureCodecViaI2c IS
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
SIGNAL ww_iStrobeI2C : std_logic;
SIGNAL ww_iStart : std_logic;
SIGNAL ww_oConfigured : std_logic;
SIGNAL ww_oAckError : std_logic;
SIGNAL ww_oI2cSclk : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \iClk~input_o\ : std_logic;
SIGNAL \iClk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \iStrobeI2C~input_o\ : std_logic;
SIGNAL \NextStateAndOutput~2_combout\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \inResetAsync~input_o\ : std_logic;
SIGNAL \R.Configured~4_combout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \iStart~input_o\ : std_logic;
SIGNAL \R.Configured~3_combout\ : std_logic;
SIGNAL \R.AddrCtr[6]~0_combout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \R.Configured~1_combout\ : std_logic;
SIGNAL \R.Configured~0_combout\ : std_logic;
SIGNAL \R.Activity~0_combout\ : std_logic;
SIGNAL \R.Activity~q\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \R.FrameState.Start~q\ : std_logic;
SIGNAL \Selector11~2_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \R.FrameState.Ack2~q\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \Selector11~1_combout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \NextR~9_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \R.FrameState.Data2~q\ : std_logic;
SIGNAL \Selector10~1_combout\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \Selector11~3_combout\ : std_logic;
SIGNAL \NextR~10_combout\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \Selector13~1_combout\ : std_logic;
SIGNAL \Selector13~2_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \Selector12~1_combout\ : std_logic;
SIGNAL \NextR~8_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Selector5~1_combout\ : std_logic;
SIGNAL \R.FrameState.Data1~q\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \Selector10~2_combout\ : std_logic;
SIGNAL \Selector10~3_combout\ : std_logic;
SIGNAL \Selector10~4_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \R.FrameState.Address~q\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \R.FrameState.RWBit~q\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \R.FrameState.Ack1~q\ : std_logic;
SIGNAL \Selector16~0_combout\ : std_logic;
SIGNAL \ioI2cSdin~input_o\ : std_logic;
SIGNAL \Selector16~1_combout\ : std_logic;
SIGNAL \R.AckError~q\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \R.FrameState.Ack3~q\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \R.FrameState.Stop~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \R.FrameState.Idle~q\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \R.Sclk~q\ : std_logic;
SIGNAL \Selector15~1_combout\ : std_logic;
SIGNAL \Selector15~2_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \R.Data[15]~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux9~1_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux9~2_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux9~3_combout\ : std_logic;
SIGNAL \Mux9~4_combout\ : std_logic;
SIGNAL \Selector15~4_combout\ : std_logic;
SIGNAL \Selector15~5_combout\ : std_logic;
SIGNAL \Selector15~3_combout\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \Selector15~6_combout\ : std_logic;
SIGNAL \Selector15~7_combout\ : std_logic;
SIGNAL \R.Sdin~q\ : std_logic;
SIGNAL \R.Configured~2_combout\ : std_logic;
SIGNAL \R.Configured~q\ : std_logic;
SIGNAL \R.AddrCtr\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \R.BitCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \R.Data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_iStart~input_o\ : std_logic;
SIGNAL \ALT_INV_iStrobeI2C~input_o\ : std_logic;
SIGNAL \ALT_INV_ioI2cSdin~input_o\ : std_logic;
SIGNAL \ALT_INV_Selector15~6_combout\ : std_logic;
SIGNAL \ALT_INV_Selector15~5_combout\ : std_logic;
SIGNAL \ALT_INV_Selector15~4_combout\ : std_logic;
SIGNAL \ALT_INV_Selector15~3_combout\ : std_logic;
SIGNAL \ALT_INV_Selector0~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector15~2_combout\ : std_logic;
SIGNAL \ALT_INV_Selector15~1_combout\ : std_logic;
SIGNAL \ALT_INV_Mux9~4_combout\ : std_logic;
SIGNAL \ALT_INV_Mux9~3_combout\ : std_logic;
SIGNAL \ALT_INV_R.Data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_Mux9~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux9~1_combout\ : std_logic;
SIGNAL \ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector13~1_combout\ : std_logic;
SIGNAL \ALT_INV_NextR~10_combout\ : std_logic;
SIGNAL \ALT_INV_Selector1~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector12~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector11~2_combout\ : std_logic;
SIGNAL \ALT_INV_Selector11~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector11~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector15~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector10~3_combout\ : std_logic;
SIGNAL \ALT_INV_Selector13~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector10~2_combout\ : std_logic;
SIGNAL \ALT_INV_Selector10~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector10~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector5~0_combout\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Address~q\ : std_logic;
SIGNAL \ALT_INV_Add1~0_combout\ : std_logic;
SIGNAL \ALT_INV_R.Sdin~q\ : std_logic;
SIGNAL \ALT_INV_NextR~9_combout\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Data2~q\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Data1~q\ : std_logic;
SIGNAL \ALT_INV_NextR~8_combout\ : std_logic;
SIGNAL \ALT_INV_R.BitCtr\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_NextStateAndOutput~2_combout\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.RWBit~q\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Start~q\ : std_logic;
SIGNAL \ALT_INV_R.Configured~4_combout\ : std_logic;
SIGNAL \ALT_INV_R.Configured~3_combout\ : std_logic;
SIGNAL \ALT_INV_Selector16~0_combout\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Ack3~q\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Ack2~q\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Ack1~q\ : std_logic;
SIGNAL \ALT_INV_R.Configured~1_combout\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Stop~q\ : std_logic;
SIGNAL \ALT_INV_R.Sclk~q\ : std_logic;
SIGNAL \ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \ALT_INV_R.Configured~0_combout\ : std_logic;
SIGNAL \ALT_INV_R.FrameState.Idle~q\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_R.Activity~q\ : std_logic;
SIGNAL \ALT_INV_R.AckError~q\ : std_logic;
SIGNAL \ALT_INV_R.Configured~q\ : std_logic;
SIGNAL \ALT_INV_R.AddrCtr\ : std_logic_vector(6 DOWNTO 0);

BEGIN

ww_iClk <= iClk;
ww_inResetAsync <= inResetAsync;
ww_iStrobeI2C <= iStrobeI2C;
ww_iStart <= iStart;
oConfigured <= ww_oConfigured;
oAckError <= ww_oAckError;
oI2cSclk <= ww_oI2cSclk;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_iStart~input_o\ <= NOT \iStart~input_o\;
\ALT_INV_iStrobeI2C~input_o\ <= NOT \iStrobeI2C~input_o\;
\ALT_INV_ioI2cSdin~input_o\ <= NOT \ioI2cSdin~input_o\;
\ALT_INV_Selector15~6_combout\ <= NOT \Selector15~6_combout\;
\ALT_INV_Selector15~5_combout\ <= NOT \Selector15~5_combout\;
\ALT_INV_Selector15~4_combout\ <= NOT \Selector15~4_combout\;
\ALT_INV_Selector15~3_combout\ <= NOT \Selector15~3_combout\;
\ALT_INV_Selector0~1_combout\ <= NOT \Selector0~1_combout\;
\ALT_INV_Selector15~2_combout\ <= NOT \Selector15~2_combout\;
\ALT_INV_Selector15~1_combout\ <= NOT \Selector15~1_combout\;
\ALT_INV_Mux9~4_combout\ <= NOT \Mux9~4_combout\;
\ALT_INV_Mux9~3_combout\ <= NOT \Mux9~3_combout\;
\ALT_INV_R.Data\(15) <= NOT \R.Data\(15);
\ALT_INV_R.Data\(7) <= NOT \R.Data\(7);
\ALT_INV_R.Data\(13) <= NOT \R.Data\(13);
\ALT_INV_R.Data\(5) <= NOT \R.Data\(5);
\ALT_INV_Mux9~2_combout\ <= NOT \Mux9~2_combout\;
\ALT_INV_R.Data\(11) <= NOT \R.Data\(11);
\ALT_INV_R.Data\(3) <= NOT \R.Data\(3);
\ALT_INV_R.Data\(9) <= NOT \R.Data\(9);
\ALT_INV_R.Data\(1) <= NOT \R.Data\(1);
\ALT_INV_Mux9~1_combout\ <= NOT \Mux9~1_combout\;
\ALT_INV_R.Data\(14) <= NOT \R.Data\(14);
\ALT_INV_R.Data\(6) <= NOT \R.Data\(6);
\ALT_INV_R.Data\(12) <= NOT \R.Data\(12);
\ALT_INV_R.Data\(4) <= NOT \R.Data\(4);
\ALT_INV_Mux9~0_combout\ <= NOT \Mux9~0_combout\;
\ALT_INV_R.Data\(2) <= NOT \R.Data\(2);
\ALT_INV_R.Data\(0) <= NOT \R.Data\(0);
\ALT_INV_R.Data\(10) <= NOT \R.Data\(10);
\ALT_INV_Selector13~1_combout\ <= NOT \Selector13~1_combout\;
\ALT_INV_NextR~10_combout\ <= NOT \NextR~10_combout\;
\ALT_INV_Selector1~1_combout\ <= NOT \Selector1~1_combout\;
\ALT_INV_Selector12~0_combout\ <= NOT \Selector12~0_combout\;
\ALT_INV_Equal1~0_combout\ <= NOT \Equal1~0_combout\;
\ALT_INV_Selector11~2_combout\ <= NOT \Selector11~2_combout\;
\ALT_INV_Selector11~1_combout\ <= NOT \Selector11~1_combout\;
\ALT_INV_Selector11~0_combout\ <= NOT \Selector11~0_combout\;
\ALT_INV_Selector15~0_combout\ <= NOT \Selector15~0_combout\;
\ALT_INV_Selector10~3_combout\ <= NOT \Selector10~3_combout\;
\ALT_INV_Selector13~0_combout\ <= NOT \Selector13~0_combout\;
\ALT_INV_Selector10~2_combout\ <= NOT \Selector10~2_combout\;
\ALT_INV_Selector10~1_combout\ <= NOT \Selector10~1_combout\;
\ALT_INV_Selector10~0_combout\ <= NOT \Selector10~0_combout\;
\ALT_INV_Selector5~0_combout\ <= NOT \Selector5~0_combout\;
\ALT_INV_R.FrameState.Address~q\ <= NOT \R.FrameState.Address~q\;
\ALT_INV_Add1~0_combout\ <= NOT \Add1~0_combout\;
\ALT_INV_R.Sdin~q\ <= NOT \R.Sdin~q\;
\ALT_INV_NextR~9_combout\ <= NOT \NextR~9_combout\;
\ALT_INV_R.FrameState.Data2~q\ <= NOT \R.FrameState.Data2~q\;
\ALT_INV_R.FrameState.Data1~q\ <= NOT \R.FrameState.Data1~q\;
\ALT_INV_NextR~8_combout\ <= NOT \NextR~8_combout\;
\ALT_INV_R.BitCtr\(0) <= NOT \R.BitCtr\(0);
\ALT_INV_R.BitCtr\(1) <= NOT \R.BitCtr\(1);
\ALT_INV_R.BitCtr\(2) <= NOT \R.BitCtr\(2);
\ALT_INV_R.BitCtr\(3) <= NOT \R.BitCtr\(3);
\ALT_INV_NextStateAndOutput~2_combout\ <= NOT \NextStateAndOutput~2_combout\;
\ALT_INV_R.FrameState.RWBit~q\ <= NOT \R.FrameState.RWBit~q\;
\ALT_INV_R.FrameState.Start~q\ <= NOT \R.FrameState.Start~q\;
\ALT_INV_R.Configured~4_combout\ <= NOT \R.Configured~4_combout\;
\ALT_INV_R.Configured~3_combout\ <= NOT \R.Configured~3_combout\;
\ALT_INV_Selector16~0_combout\ <= NOT \Selector16~0_combout\;
\ALT_INV_R.FrameState.Ack3~q\ <= NOT \R.FrameState.Ack3~q\;
\ALT_INV_R.FrameState.Ack2~q\ <= NOT \R.FrameState.Ack2~q\;
\ALT_INV_R.FrameState.Ack1~q\ <= NOT \R.FrameState.Ack1~q\;
\ALT_INV_R.Configured~1_combout\ <= NOT \R.Configured~1_combout\;
\ALT_INV_R.FrameState.Stop~q\ <= NOT \R.FrameState.Stop~q\;
\ALT_INV_R.Sclk~q\ <= NOT \R.Sclk~q\;
\ALT_INV_Equal0~1_combout\ <= NOT \Equal0~1_combout\;
\ALT_INV_R.Configured~0_combout\ <= NOT \R.Configured~0_combout\;
\ALT_INV_R.FrameState.Idle~q\ <= NOT \R.FrameState.Idle~q\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
\ALT_INV_R.Activity~q\ <= NOT \R.Activity~q\;
\ALT_INV_R.AckError~q\ <= NOT \R.AckError~q\;
\ALT_INV_R.Configured~q\ <= NOT \R.Configured~q\;
\ALT_INV_R.AddrCtr\(0) <= NOT \R.AddrCtr\(0);
\ALT_INV_R.AddrCtr\(3) <= NOT \R.AddrCtr\(3);
\ALT_INV_R.AddrCtr\(4) <= NOT \R.AddrCtr\(4);
\ALT_INV_R.AddrCtr\(5) <= NOT \R.AddrCtr\(5);
\ALT_INV_R.AddrCtr\(6) <= NOT \R.AddrCtr\(6);
\ALT_INV_R.AddrCtr\(1) <= NOT \R.AddrCtr\(1);
\ALT_INV_R.AddrCtr\(2) <= NOT \R.AddrCtr\(2);

-- Location: IOOBUF_X80_Y0_N53
\oI2cSclk~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_R.Sclk~q\,
	devoe => ww_devoe,
	o => ww_oI2cSclk);

-- Location: IOOBUF_X89_Y9_N56
\oConfigured~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \R.Configured~q\,
	devoe => ww_devoe,
	o => ww_oConfigured);

-- Location: IOOBUF_X89_Y9_N39
\oAckError~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \R.AckError~q\,
	devoe => ww_devoe,
	o => ww_oAckError);

-- Location: IOOBUF_X89_Y9_N22
\ioI2cSdin~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_R.Sdin~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => ioI2cSdin);

-- Location: IOIBUF_X89_Y25_N21
\iClk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iClk,
	o => \iClk~input_o\);

-- Location: CLKCTRL_G10
\iClk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \iClk~input_o\,
	outclk => \iClk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y8_N21
\iStrobeI2C~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iStrobeI2C,
	o => \iStrobeI2C~input_o\);

-- Location: MLABCELL_X78_Y9_N18
\NextStateAndOutput~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \NextStateAndOutput~2_combout\ = (\iStrobeI2C~input_o\ & !\R.Sclk~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_iStrobeI2C~input_o\,
	datad => \ALT_INV_R.Sclk~q\,
	combout => \NextStateAndOutput~2_combout\);

-- Location: LABCELL_X81_Y9_N0
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( \R.AddrCtr\(0) ) + ( VCC ) + ( !VCC ))
-- \Add0~26\ = CARRY(( \R.AddrCtr\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(0),
	cin => GND,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: IOIBUF_X89_Y9_N4
\inResetAsync~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inResetAsync,
	o => \inResetAsync~input_o\);

-- Location: LABCELL_X77_Y9_N12
\R.Configured~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.Configured~4_combout\ = ( \R.FrameState.Stop~q\ & ( (\R.Activity~q\ & !\R.Sclk~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010000010100000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Activity~q\,
	datac => \ALT_INV_R.Sclk~q\,
	dataf => \ALT_INV_R.FrameState.Stop~q\,
	combout => \R.Configured~4_combout\);

-- Location: LABCELL_X81_Y9_N3
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( \R.AddrCtr\(1) ) + ( GND ) + ( \Add0~26\ ))
-- \Add0~6\ = CARRY(( \R.AddrCtr\(1) ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(1),
	cin => \Add0~26\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: LABCELL_X81_Y9_N6
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( \R.AddrCtr\(2) ) + ( GND ) + ( \Add0~6\ ))
-- \Add0~2\ = CARRY(( \R.AddrCtr\(2) ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(2),
	cin => \Add0~6\,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: FF_X81_Y9_N8
\R.AddrCtr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add0~1_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ALT_INV_R.Activity~q\,
	ena => \R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AddrCtr\(2));

-- Location: LABCELL_X81_Y9_N9
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( \R.AddrCtr\(3) ) + ( GND ) + ( \Add0~2\ ))
-- \Add0~22\ = CARRY(( \R.AddrCtr\(3) ) + ( GND ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(3),
	cin => \Add0~2\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X81_Y9_N11
\R.AddrCtr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add0~21_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ALT_INV_R.Activity~q\,
	ena => \R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AddrCtr\(3));

-- Location: LABCELL_X81_Y9_N12
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( \R.AddrCtr\(4) ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~18\ = CARRY(( \R.AddrCtr\(4) ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(4),
	cin => \Add0~22\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X81_Y9_N14
\R.AddrCtr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add0~17_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ALT_INV_R.Activity~q\,
	ena => \R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AddrCtr\(4));

-- Location: LABCELL_X81_Y9_N15
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( \R.AddrCtr\(5) ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~14\ = CARRY(( \R.AddrCtr\(5) ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(5),
	cin => \Add0~18\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X81_Y9_N17
\R.AddrCtr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add0~13_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ALT_INV_R.Activity~q\,
	ena => \R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AddrCtr\(5));

-- Location: LABCELL_X81_Y9_N18
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( \R.AddrCtr\(6) ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(6),
	cin => \Add0~14\,
	sumout => \Add0~9_sumout\);

-- Location: FF_X81_Y9_N20
\R.AddrCtr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add0~9_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ALT_INV_R.Activity~q\,
	ena => \R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AddrCtr\(6));

-- Location: LABCELL_X81_Y9_N54
\Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( !\R.AddrCtr\(4) & ( (\R.AddrCtr\(0) & (!\R.AddrCtr\(5) & (!\R.AddrCtr\(6) & \R.AddrCtr\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000000000000000100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.AddrCtr\(0),
	datab => \ALT_INV_R.AddrCtr\(5),
	datac => \ALT_INV_R.AddrCtr\(6),
	datad => \ALT_INV_R.AddrCtr\(3),
	dataf => \ALT_INV_R.AddrCtr\(4),
	combout => \Equal0~1_combout\);

-- Location: IOIBUF_X89_Y11_N78
\iStart~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iStart,
	o => \iStart~input_o\);

-- Location: MLABCELL_X78_Y9_N3
\R.Configured~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.Configured~3_combout\ = ( !\R.Activity~q\ & ( (\iStart~input_o\ & !\R.FrameState.Idle~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_iStart~input_o\,
	datac => \ALT_INV_R.FrameState.Idle~q\,
	dataf => \ALT_INV_R.Activity~q\,
	combout => \R.Configured~3_combout\);

-- Location: LABCELL_X81_Y9_N24
\R.AddrCtr[6]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.AddrCtr[6]~0_combout\ = ( \Equal0~1_combout\ & ( \R.Configured~3_combout\ & ( \iStrobeI2C~input_o\ ) ) ) # ( !\Equal0~1_combout\ & ( \R.Configured~3_combout\ & ( \iStrobeI2C~input_o\ ) ) ) # ( \Equal0~1_combout\ & ( !\R.Configured~3_combout\ & ( 
-- (\iStrobeI2C~input_o\ & (!\Equal0~0_combout\ & \R.Configured~4_combout\)) ) ) ) # ( !\Equal0~1_combout\ & ( !\R.Configured~3_combout\ & ( (\iStrobeI2C~input_o\ & \R.Configured~4_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000100010001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_Equal0~0_combout\,
	datad => \ALT_INV_R.Configured~4_combout\,
	datae => \ALT_INV_Equal0~1_combout\,
	dataf => \ALT_INV_R.Configured~3_combout\,
	combout => \R.AddrCtr[6]~0_combout\);

-- Location: FF_X81_Y9_N2
\R.AddrCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add0~25_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ALT_INV_R.Activity~q\,
	ena => \R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AddrCtr\(0));

-- Location: FF_X81_Y9_N5
\R.AddrCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Add0~5_sumout\,
	clrn => \inResetAsync~input_o\,
	sclr => \ALT_INV_R.Activity~q\,
	ena => \R.AddrCtr[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AddrCtr\(1));

-- Location: LABCELL_X81_Y9_N39
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( !\R.AddrCtr\(2) & ( !\R.AddrCtr\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(1),
	dataf => \ALT_INV_R.AddrCtr\(2),
	combout => \Equal0~0_combout\);

-- Location: LABCELL_X77_Y9_N6
\R.Configured~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.Configured~1_combout\ = ( \R.Activity~q\ & ( (\iStrobeI2C~input_o\ & (!\R.Sclk~q\ & \R.FrameState.Stop~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001100000000000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_iStrobeI2C~input_o\,
	datac => \ALT_INV_R.Sclk~q\,
	datad => \ALT_INV_R.FrameState.Stop~q\,
	dataf => \ALT_INV_R.Activity~q\,
	combout => \R.Configured~1_combout\);

-- Location: MLABCELL_X78_Y9_N9
\R.Configured~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.Configured~0_combout\ = ( !\R.Activity~q\ & ( (\iStrobeI2C~input_o\ & (\iStart~input_o\ & !\R.FrameState.Idle~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010000000100000001000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_iStart~input_o\,
	datac => \ALT_INV_R.FrameState.Idle~q\,
	dataf => \ALT_INV_R.Activity~q\,
	combout => \R.Configured~0_combout\);

-- Location: LABCELL_X77_Y9_N51
\R.Activity~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.Activity~0_combout\ = ( !\R.Activity~q\ & ( \R.Configured~0_combout\ ) ) # ( \R.Activity~q\ & ( !\R.Configured~0_combout\ & ( (!\Equal0~0_combout\) # ((!\R.Configured~1_combout\) # (!\Equal0~1_combout\)) ) ) ) # ( !\R.Activity~q\ & ( 
-- !\R.Configured~0_combout\ & ( (\Equal0~0_combout\ & (\R.Configured~1_combout\ & \Equal0~1_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000011111111111111110011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Equal0~0_combout\,
	datac => \ALT_INV_R.Configured~1_combout\,
	datad => \ALT_INV_Equal0~1_combout\,
	datae => \ALT_INV_R.Activity~q\,
	dataf => \ALT_INV_R.Configured~0_combout\,
	combout => \R.Activity~0_combout\);

-- Location: FF_X77_Y9_N53
\R.Activity\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \R.Activity~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Activity~q\);

-- Location: LABCELL_X77_Y9_N57
\Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = ( \R.FrameState.Start~q\ & ( \R.Activity~q\ & ( (!\iStrobeI2C~input_o\) # (!\R.FrameState.Idle~q\) ) ) ) # ( !\R.FrameState.Start~q\ & ( \R.Activity~q\ & ( (\iStrobeI2C~input_o\ & !\R.FrameState.Idle~q\) ) ) ) # ( 
-- \R.FrameState.Start~q\ & ( !\R.Activity~q\ & ( !\iStrobeI2C~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000110011000000001111111111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_iStrobeI2C~input_o\,
	datad => \ALT_INV_R.FrameState.Idle~q\,
	datae => \ALT_INV_R.FrameState.Start~q\,
	dataf => \ALT_INV_R.Activity~q\,
	combout => \Selector1~0_combout\);

-- Location: FF_X78_Y9_N50
\R.FrameState.Start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \Selector1~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Start~q\);

-- Location: MLABCELL_X78_Y9_N36
\Selector11~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector11~2_combout\ = ( \R.FrameState.Ack1~q\ & ( (\iStrobeI2C~input_o\ & (((!\R.AckError~q\ & !\R.Sclk~q\)) # (\R.FrameState.Start~q\))) ) ) # ( !\R.FrameState.Ack1~q\ & ( (\R.FrameState.Start~q\ & \iStrobeI2C~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100001101000001010000110100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.FrameState.Start~q\,
	datab => \ALT_INV_R.AckError~q\,
	datac => \ALT_INV_iStrobeI2C~input_o\,
	datad => \ALT_INV_R.Sclk~q\,
	dataf => \ALT_INV_R.FrameState.Ack1~q\,
	combout => \Selector11~2_combout\);

-- Location: MLABCELL_X78_Y9_N45
\Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = ( \R.AckError~q\ & ( ((\R.FrameState.Data1~q\ & \NextR~8_combout\)) # (\R.FrameState.Ack2~q\) ) ) # ( !\R.AckError~q\ & ( (!\NextStateAndOutput~2_combout\ & (((\R.FrameState.Data1~q\ & \NextR~8_combout\)) # 
-- (\R.FrameState.Ack2~q\))) # (\NextStateAndOutput~2_combout\ & (((\R.FrameState.Data1~q\ & \NextR~8_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000101111001000100010111100110011001111110011001100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_NextStateAndOutput~2_combout\,
	datab => \ALT_INV_R.FrameState.Ack2~q\,
	datac => \ALT_INV_R.FrameState.Data1~q\,
	datad => \ALT_INV_NextR~8_combout\,
	dataf => \ALT_INV_R.AckError~q\,
	combout => \Selector6~0_combout\);

-- Location: FF_X78_Y9_N47
\R.FrameState.Ack2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector6~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Ack2~q\);

-- Location: LABCELL_X77_Y9_N30
\Selector13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = ( !\R.FrameState.Ack3~q\ & ( !\R.FrameState.RWBit~q\ & ( (!\R.FrameState.Ack2~q\ & (!\R.FrameState.Stop~q\ & (\R.FrameState.Idle~q\ & !\R.FrameState.Ack1~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.FrameState.Ack2~q\,
	datab => \ALT_INV_R.FrameState.Stop~q\,
	datac => \ALT_INV_R.FrameState.Idle~q\,
	datad => \ALT_INV_R.FrameState.Ack1~q\,
	datae => \ALT_INV_R.FrameState.Ack3~q\,
	dataf => \ALT_INV_R.FrameState.RWBit~q\,
	combout => \Selector13~0_combout\);

-- Location: MLABCELL_X78_Y9_N21
\Selector11~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector11~1_combout\ = ( \Selector13~0_combout\ & ( (!\R.FrameState.Start~q\ & ((!\R.FrameState.Data1~q\) # ((\iStrobeI2C~input_o\ & !\R.Sclk~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110100000000001111010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_R.Sclk~q\,
	datac => \ALT_INV_R.FrameState.Data1~q\,
	datad => \ALT_INV_R.FrameState.Start~q\,
	dataf => \ALT_INV_Selector13~0_combout\,
	combout => \Selector11~1_combout\);

-- Location: MLABCELL_X78_Y9_N0
\Selector15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = ( !\R.BitCtr\(1) & ( !\R.BitCtr\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.BitCtr\(0),
	dataf => \ALT_INV_R.BitCtr\(1),
	combout => \Selector15~0_combout\);

-- Location: LABCELL_X79_Y9_N0
\NextR~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \NextR~9_combout\ = ( !\R.Sclk~q\ & ( !\R.BitCtr\(0) & ( (\iStrobeI2C~input_o\ & (!\R.BitCtr\(3) & (!\R.BitCtr\(1) & !\R.BitCtr\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_R.BitCtr\(3),
	datac => \ALT_INV_R.BitCtr\(1),
	datad => \ALT_INV_R.BitCtr\(2),
	datae => \ALT_INV_R.Sclk~q\,
	dataf => \ALT_INV_R.BitCtr\(0),
	combout => \NextR~9_combout\);

-- Location: LABCELL_X79_Y9_N9
\Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = ( \R.FrameState.Ack2~q\ & ( (!\NextR~9_combout\ & (((\NextStateAndOutput~2_combout\ & !\R.AckError~q\)) # (\R.FrameState.Data2~q\))) # (\NextR~9_combout\ & (((\NextStateAndOutput~2_combout\ & !\R.AckError~q\)))) ) ) # ( 
-- !\R.FrameState.Ack2~q\ & ( (!\NextR~9_combout\ & \R.FrameState.Data2~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000101111001000100010111100100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_NextR~9_combout\,
	datab => \ALT_INV_R.FrameState.Data2~q\,
	datac => \ALT_INV_NextStateAndOutput~2_combout\,
	datad => \ALT_INV_R.AckError~q\,
	dataf => \ALT_INV_R.FrameState.Ack2~q\,
	combout => \Selector7~0_combout\);

-- Location: FF_X79_Y9_N11
\R.FrameState.Data2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector7~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Data2~q\);

-- Location: LABCELL_X79_Y9_N15
\Selector10~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector10~1_combout\ = ( !\R.FrameState.Address~q\ & ( !\R.FrameState.Data2~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_R.FrameState.Data2~q\,
	dataf => \ALT_INV_R.FrameState.Address~q\,
	combout => \Selector10~1_combout\);

-- Location: LABCELL_X79_Y9_N30
\Selector11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = ( \R.BitCtr\(3) & ( !\Selector10~1_combout\ & ( !\R.BitCtr\(2) $ ((((!\iStrobeI2C~input_o\) # (!\Selector15~0_combout\)) # (\R.Sclk~q\))) ) ) ) # ( !\R.BitCtr\(3) & ( !\Selector10~1_combout\ & ( (\R.BitCtr\(2) & 
-- (((!\iStrobeI2C~input_o\) # (!\Selector15~0_combout\)) # (\R.Sclk~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110001001100110011100100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Sclk~q\,
	datab => \ALT_INV_R.BitCtr\(2),
	datac => \ALT_INV_iStrobeI2C~input_o\,
	datad => \ALT_INV_Selector15~0_combout\,
	datae => \ALT_INV_R.BitCtr\(3),
	dataf => \ALT_INV_Selector10~1_combout\,
	combout => \Selector11~0_combout\);

-- Location: LABCELL_X79_Y9_N42
\Selector11~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector11~3_combout\ = ( \R.BitCtr\(2) & ( \Selector11~0_combout\ ) ) # ( !\R.BitCtr\(2) & ( \Selector11~0_combout\ ) ) # ( \R.BitCtr\(2) & ( !\Selector11~0_combout\ & ( ((!\Selector11~1_combout\) # ((\Selector10~0_combout\ & !\Selector15~0_combout\))) 
-- # (\Selector11~2_combout\) ) ) ) # ( !\R.BitCtr\(2) & ( !\Selector11~0_combout\ & ( ((\Selector10~0_combout\ & \Selector15~0_combout\)) # (\Selector11~2_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001101110111111101111111001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector10~0_combout\,
	datab => \ALT_INV_Selector11~2_combout\,
	datac => \ALT_INV_Selector11~1_combout\,
	datad => \ALT_INV_Selector15~0_combout\,
	datae => \ALT_INV_R.BitCtr\(2),
	dataf => \ALT_INV_Selector11~0_combout\,
	combout => \Selector11~3_combout\);

-- Location: FF_X79_Y9_N44
\R.BitCtr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector11~3_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.BitCtr\(2));

-- Location: MLABCELL_X78_Y9_N30
\NextR~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \NextR~10_combout\ = ( \R.BitCtr\(2) & ( !\R.Sclk~q\ & ( \iStrobeI2C~input_o\ ) ) ) # ( !\R.BitCtr\(2) & ( !\R.Sclk~q\ & ( (\iStrobeI2C~input_o\ & (((\R.BitCtr\(3)) # (\R.BitCtr\(0))) # (\R.BitCtr\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001100110011001100110011001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr\(1),
	datab => \ALT_INV_iStrobeI2C~input_o\,
	datac => \ALT_INV_R.BitCtr\(0),
	datad => \ALT_INV_R.BitCtr\(3),
	datae => \ALT_INV_R.BitCtr\(2),
	dataf => \ALT_INV_R.Sclk~q\,
	combout => \NextR~10_combout\);

-- Location: LABCELL_X77_Y9_N15
\Selector1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = ( !\iStrobeI2C~input_o\ & ( \R.FrameState.Start~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_R.FrameState.Start~q\,
	dataf => \ALT_INV_iStrobeI2C~input_o\,
	combout => \Selector1~1_combout\);

-- Location: LABCELL_X77_Y9_N0
\Selector13~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector13~1_combout\ = ( \R.FrameState.Ack1~q\ & ( \R.FrameState.Data1~q\ & ( (!\iStrobeI2C~input_o\ & (\R.BitCtr\(0))) # (\iStrobeI2C~input_o\ & ((!\R.BitCtr\(0) & (!\R.Sclk~q\)) # (\R.BitCtr\(0) & ((!\R.AckError~q\) # (\R.Sclk~q\))))) ) ) ) # ( 
-- !\R.FrameState.Ack1~q\ & ( \R.FrameState.Data1~q\ & ( !\R.BitCtr\(0) $ (((!\iStrobeI2C~input_o\) # (\R.Sclk~q\))) ) ) ) # ( \R.FrameState.Ack1~q\ & ( !\R.FrameState.Data1~q\ & ( (\iStrobeI2C~input_o\ & (!\R.Sclk~q\ & !\R.AckError~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100000000000001100011011000110111001101100011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_R.BitCtr\(0),
	datac => \ALT_INV_R.Sclk~q\,
	datad => \ALT_INV_R.AckError~q\,
	datae => \ALT_INV_R.FrameState.Ack1~q\,
	dataf => \ALT_INV_R.FrameState.Data1~q\,
	combout => \Selector13~1_combout\);

-- Location: MLABCELL_X78_Y9_N54
\Selector13~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector13~2_combout\ = ( \R.BitCtr\(0) & ( \Selector13~0_combout\ & ( (((!\NextR~10_combout\ & !\Selector10~1_combout\)) # (\Selector13~1_combout\)) # (\Selector1~1_combout\) ) ) ) # ( !\R.BitCtr\(0) & ( \Selector13~0_combout\ & ( ((\NextR~10_combout\ & 
-- !\Selector10~1_combout\)) # (\Selector13~1_combout\) ) ) ) # ( \R.BitCtr\(0) & ( !\Selector13~0_combout\ ) ) # ( !\R.BitCtr\(0) & ( !\Selector13~0_combout\ & ( ((\NextR~10_combout\ & !\Selector10~1_combout\)) # (\Selector13~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000011111111111111111111111101010000111111111011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_NextR~10_combout\,
	datab => \ALT_INV_Selector1~1_combout\,
	datac => \ALT_INV_Selector10~1_combout\,
	datad => \ALT_INV_Selector13~1_combout\,
	datae => \ALT_INV_R.BitCtr\(0),
	dataf => \ALT_INV_Selector13~0_combout\,
	combout => \Selector13~2_combout\);

-- Location: FF_X78_Y9_N56
\R.BitCtr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector13~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.BitCtr\(0));

-- Location: LABCELL_X79_Y9_N39
\Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = ( !\R.BitCtr\(0) & ( (!\R.BitCtr\(1) & (!\R.BitCtr\(2) & !\R.BitCtr\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr\(1),
	datac => \ALT_INV_R.BitCtr\(2),
	datad => \ALT_INV_R.BitCtr\(3),
	dataf => \ALT_INV_R.BitCtr\(0),
	combout => \Equal1~0_combout\);

-- Location: LABCELL_X80_Y9_N0
\Selector12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector12~0_combout\ = ( \R.Sclk~q\ & ( !\Selector10~1_combout\ & ( \R.BitCtr\(1) ) ) ) # ( !\R.Sclk~q\ & ( !\Selector10~1_combout\ & ( !\R.BitCtr\(1) $ ((((!\iStrobeI2C~input_o\) # (\Equal1~0_combout\)) # (\R.BitCtr\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000011011111000000001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr\(0),
	datab => \ALT_INV_iStrobeI2C~input_o\,
	datac => \ALT_INV_Equal1~0_combout\,
	datad => \ALT_INV_R.BitCtr\(1),
	datae => \ALT_INV_R.Sclk~q\,
	dataf => \ALT_INV_Selector10~1_combout\,
	combout => \Selector12~0_combout\);

-- Location: LABCELL_X80_Y9_N30
\Selector12~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector12~1_combout\ = ( \R.BitCtr\(1) & ( \Selector11~1_combout\ & ( (((\Selector10~0_combout\ & \R.BitCtr\(0))) # (\Selector12~0_combout\)) # (\Selector11~2_combout\) ) ) ) # ( !\R.BitCtr\(1) & ( \Selector11~1_combout\ & ( (((\Selector10~0_combout\ & 
-- !\R.BitCtr\(0))) # (\Selector12~0_combout\)) # (\Selector11~2_combout\) ) ) ) # ( \R.BitCtr\(1) & ( !\Selector11~1_combout\ ) ) # ( !\R.BitCtr\(1) & ( !\Selector11~1_combout\ & ( (((\Selector10~0_combout\ & !\R.BitCtr\(0))) # (\Selector12~0_combout\)) # 
-- (\Selector11~2_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111100111111111111111111111101111111001111110011111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector10~0_combout\,
	datab => \ALT_INV_Selector11~2_combout\,
	datac => \ALT_INV_Selector12~0_combout\,
	datad => \ALT_INV_R.BitCtr\(0),
	datae => \ALT_INV_R.BitCtr\(1),
	dataf => \ALT_INV_Selector11~1_combout\,
	combout => \Selector12~1_combout\);

-- Location: FF_X80_Y9_N32
\R.BitCtr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector12~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.BitCtr\(1));

-- Location: LABCELL_X79_Y9_N24
\NextR~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \NextR~8_combout\ = ( !\R.Sclk~q\ & ( !\R.BitCtr\(0) & ( (\R.BitCtr\(3) & (\iStrobeI2C~input_o\ & (!\R.BitCtr\(1) & !\R.BitCtr\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr\(3),
	datab => \ALT_INV_iStrobeI2C~input_o\,
	datac => \ALT_INV_R.BitCtr\(1),
	datad => \ALT_INV_R.BitCtr\(2),
	datae => \ALT_INV_R.Sclk~q\,
	dataf => \ALT_INV_R.BitCtr\(0),
	combout => \NextR~8_combout\);

-- Location: MLABCELL_X78_Y9_N6
\Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = ( !\R.AckError~q\ & ( (\iStrobeI2C~input_o\ & (\R.FrameState.Ack1~q\ & !\R.Sclk~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000000000001010000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datac => \ALT_INV_R.FrameState.Ack1~q\,
	datad => \ALT_INV_R.Sclk~q\,
	dataf => \ALT_INV_R.AckError~q\,
	combout => \Selector5~0_combout\);

-- Location: MLABCELL_X78_Y9_N39
\Selector5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector5~1_combout\ = ( \Selector5~0_combout\ ) # ( !\Selector5~0_combout\ & ( (!\NextR~8_combout\ & \R.FrameState.Data1~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_NextR~8_combout\,
	datad => \ALT_INV_R.FrameState.Data1~q\,
	dataf => \ALT_INV_Selector5~0_combout\,
	combout => \Selector5~1_combout\);

-- Location: FF_X78_Y9_N41
\R.FrameState.Data1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector5~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Data1~q\);

-- Location: LABCELL_X80_Y9_N27
\Selector10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = ( \R.FrameState.Data1~q\ & ( (\iStrobeI2C~input_o\ & !\R.Sclk~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datad => \ALT_INV_R.Sclk~q\,
	dataf => \ALT_INV_R.FrameState.Data1~q\,
	combout => \Selector10~0_combout\);

-- Location: LABCELL_X80_Y9_N15
\Add1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = ( !\R.BitCtr\(1) & ( (!\R.BitCtr\(2) & !\R.BitCtr\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_R.BitCtr\(2),
	datad => \ALT_INV_R.BitCtr\(0),
	dataf => \ALT_INV_R.BitCtr\(1),
	combout => \Add1~0_combout\);

-- Location: LABCELL_X80_Y9_N42
\Selector10~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector10~2_combout\ = ( !\Selector10~1_combout\ & ( (\R.BitCtr\(3) & ((!\Add1~0_combout\) # ((!\iStrobeI2C~input_o\) # (\R.Sclk~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010001010101010101000101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr\(3),
	datab => \ALT_INV_Add1~0_combout\,
	datac => \ALT_INV_iStrobeI2C~input_o\,
	datad => \ALT_INV_R.Sclk~q\,
	dataf => \ALT_INV_Selector10~1_combout\,
	combout => \Selector10~2_combout\);

-- Location: LABCELL_X77_Y9_N36
\Selector10~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector10~3_combout\ = ( \Selector13~0_combout\ & ( (!\iStrobeI2C~input_o\ & (((!\R.FrameState.Data1~q\ & !\R.FrameState.Start~q\)))) # (\iStrobeI2C~input_o\ & ((!\R.Sclk~q\) # ((!\R.FrameState.Data1~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110010001100101111001000110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Sclk~q\,
	datab => \ALT_INV_iStrobeI2C~input_o\,
	datac => \ALT_INV_R.FrameState.Data1~q\,
	datad => \ALT_INV_R.FrameState.Start~q\,
	dataf => \ALT_INV_Selector13~0_combout\,
	combout => \Selector10~3_combout\);

-- Location: LABCELL_X80_Y9_N36
\Selector10~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector10~4_combout\ = ( \R.BitCtr\(3) & ( \Selector10~3_combout\ & ( (((\Selector10~0_combout\ & !\Add1~0_combout\)) # (\Selector5~0_combout\)) # (\Selector10~2_combout\) ) ) ) # ( !\R.BitCtr\(3) & ( \Selector10~3_combout\ & ( (((\Selector10~0_combout\ 
-- & \Add1~0_combout\)) # (\Selector5~0_combout\)) # (\Selector10~2_combout\) ) ) ) # ( \R.BitCtr\(3) & ( !\Selector10~3_combout\ ) ) # ( !\R.BitCtr\(3) & ( !\Selector10~3_combout\ & ( (((\Selector10~0_combout\ & \Add1~0_combout\)) # (\Selector5~0_combout\)) 
-- # (\Selector10~2_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111101111111111111111111111100111111011111110111111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector10~0_combout\,
	datab => \ALT_INV_Selector10~2_combout\,
	datac => \ALT_INV_Selector5~0_combout\,
	datad => \ALT_INV_Add1~0_combout\,
	datae => \ALT_INV_R.BitCtr\(3),
	dataf => \ALT_INV_Selector10~3_combout\,
	combout => \Selector10~4_combout\);

-- Location: FF_X80_Y9_N38
\R.BitCtr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector10~4_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.BitCtr\(3));

-- Location: MLABCELL_X78_Y9_N51
\Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = ( \R.FrameState.Address~q\ & ( \R.FrameState.Start~q\ ) ) # ( !\R.FrameState.Address~q\ & ( \R.FrameState.Start~q\ & ( \iStrobeI2C~input_o\ ) ) ) # ( \R.FrameState.Address~q\ & ( !\R.FrameState.Start~q\ & ( (!\iStrobeI2C~input_o\) 
-- # (((!\Add1~0_combout\) # (\R.Sclk~q\)) # (\R.BitCtr\(3))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111011111101010101010101011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_R.BitCtr\(3),
	datac => \ALT_INV_R.Sclk~q\,
	datad => \ALT_INV_Add1~0_combout\,
	datae => \ALT_INV_R.FrameState.Address~q\,
	dataf => \ALT_INV_R.FrameState.Start~q\,
	combout => \Selector2~0_combout\);

-- Location: FF_X78_Y9_N53
\R.FrameState.Address\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector2~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Address~q\);

-- Location: LABCELL_X80_Y9_N54
\Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = ( \R.BitCtr\(3) & ( \Add1~0_combout\ & ( (\R.FrameState.RWBit~q\ & ((!\iStrobeI2C~input_o\) # (\R.Sclk~q\))) ) ) ) # ( !\R.BitCtr\(3) & ( \Add1~0_combout\ & ( (!\iStrobeI2C~input_o\ & (((\R.FrameState.RWBit~q\)))) # 
-- (\iStrobeI2C~input_o\ & ((!\R.Sclk~q\ & ((\R.FrameState.Address~q\))) # (\R.Sclk~q\ & (\R.FrameState.RWBit~q\)))) ) ) ) # ( \R.BitCtr\(3) & ( !\Add1~0_combout\ & ( (\R.FrameState.RWBit~q\ & ((!\iStrobeI2C~input_o\) # (\R.Sclk~q\))) ) ) ) # ( 
-- !\R.BitCtr\(3) & ( !\Add1~0_combout\ & ( (\R.FrameState.RWBit~q\ & ((!\iStrobeI2C~input_o\) # (\R.Sclk~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101100001011000010110000101100001011010011110000101100001011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_iStrobeI2C~input_o\,
	datab => \ALT_INV_R.Sclk~q\,
	datac => \ALT_INV_R.FrameState.RWBit~q\,
	datad => \ALT_INV_R.FrameState.Address~q\,
	datae => \ALT_INV_R.BitCtr\(3),
	dataf => \ALT_INV_Add1~0_combout\,
	combout => \Selector3~0_combout\);

-- Location: FF_X79_Y9_N53
\R.FrameState.RWBit\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \Selector3~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.RWBit~q\);

-- Location: LABCELL_X77_Y9_N42
\Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = ( \R.AckError~q\ & ( ((!\R.Sclk~q\ & (\iStrobeI2C~input_o\ & \R.FrameState.RWBit~q\))) # (\R.FrameState.Ack1~q\) ) ) # ( !\R.AckError~q\ & ( (!\R.Sclk~q\ & ((!\iStrobeI2C~input_o\ & ((\R.FrameState.Ack1~q\))) # 
-- (\iStrobeI2C~input_o\ & (\R.FrameState.RWBit~q\)))) # (\R.Sclk~q\ & (((\R.FrameState.Ack1~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001011011111000000101101111100000010111111110000001011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Sclk~q\,
	datab => \ALT_INV_iStrobeI2C~input_o\,
	datac => \ALT_INV_R.FrameState.RWBit~q\,
	datad => \ALT_INV_R.FrameState.Ack1~q\,
	dataf => \ALT_INV_R.AckError~q\,
	combout => \Selector4~0_combout\);

-- Location: FF_X78_Y9_N11
\R.FrameState.Ack1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \Selector4~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Ack1~q\);

-- Location: LABCELL_X77_Y9_N39
\Selector16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector16~0_combout\ = ( \R.FrameState.Ack2~q\ & ( (\R.Sclk~q\ & \iStrobeI2C~input_o\) ) ) # ( !\R.FrameState.Ack2~q\ & ( (\R.Sclk~q\ & (\iStrobeI2C~input_o\ & ((\R.FrameState.Ack3~q\) # (\R.FrameState.Ack1~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100010001000000010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Sclk~q\,
	datab => \ALT_INV_iStrobeI2C~input_o\,
	datac => \ALT_INV_R.FrameState.Ack1~q\,
	datad => \ALT_INV_R.FrameState.Ack3~q\,
	dataf => \ALT_INV_R.FrameState.Ack2~q\,
	combout => \Selector16~0_combout\);

-- Location: IOIBUF_X89_Y9_N21
\ioI2cSdin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ioI2cSdin,
	o => \ioI2cSdin~input_o\);

-- Location: MLABCELL_X78_Y9_N12
\Selector16~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector16~1_combout\ = ( \R.Configured~0_combout\ & ( (\Selector16~0_combout\ & \ioI2cSdin~input_o\) ) ) # ( !\R.Configured~0_combout\ & ( (!\Selector16~0_combout\ & (\R.AckError~q\)) # (\Selector16~0_combout\ & ((\ioI2cSdin~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000111111001100000011111100000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_R.AckError~q\,
	datac => \ALT_INV_Selector16~0_combout\,
	datad => \ALT_INV_ioI2cSdin~input_o\,
	dataf => \ALT_INV_R.Configured~0_combout\,
	combout => \Selector16~1_combout\);

-- Location: FF_X78_Y9_N14
\R.AckError\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector16~1_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.AckError~q\);

-- Location: MLABCELL_X78_Y9_N15
\Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = ( \NextR~9_combout\ & ( ((\R.FrameState.Ack3~q\ & ((!\NextStateAndOutput~2_combout\) # (\R.AckError~q\)))) # (\R.FrameState.Data2~q\) ) ) # ( !\NextR~9_combout\ & ( (\R.FrameState.Ack3~q\ & ((!\NextStateAndOutput~2_combout\) # 
-- (\R.AckError~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010111011000000001011101100001111101111110000111110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_NextStateAndOutput~2_combout\,
	datab => \ALT_INV_R.AckError~q\,
	datac => \ALT_INV_R.FrameState.Data2~q\,
	datad => \ALT_INV_R.FrameState.Ack3~q\,
	dataf => \ALT_INV_NextR~9_combout\,
	combout => \Selector8~0_combout\);

-- Location: FF_X78_Y9_N17
\R.FrameState.Ack3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector8~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Ack3~q\);

-- Location: LABCELL_X77_Y9_N9
\Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector9~0_combout\ = ( \R.AckError~q\ & ( (\R.FrameState.Stop~q\ & ((!\iStrobeI2C~input_o\) # (\R.Sclk~q\))) ) ) # ( !\R.AckError~q\ & ( (!\R.Sclk~q\ & ((!\iStrobeI2C~input_o\ & ((\R.FrameState.Stop~q\))) # (\iStrobeI2C~input_o\ & 
-- (\R.FrameState.Ack3~q\)))) # (\R.Sclk~q\ & (((\R.FrameState.Stop~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001011011111000000101101111100000000110111010000000011011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Sclk~q\,
	datab => \ALT_INV_iStrobeI2C~input_o\,
	datac => \ALT_INV_R.FrameState.Ack3~q\,
	datad => \ALT_INV_R.FrameState.Stop~q\,
	dataf => \ALT_INV_R.AckError~q\,
	combout => \Selector9~0_combout\);

-- Location: FF_X77_Y9_N11
\R.FrameState.Stop\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector9~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Stop~q\);

-- Location: LABCELL_X77_Y9_N45
\Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = ( \R.FrameState.Idle~q\ & ( ((!\iStrobeI2C~input_o\) # (!\R.FrameState.Stop~q\)) # (\R.Sclk~q\) ) ) # ( !\R.FrameState.Idle~q\ & ( (\iStrobeI2C~input_o\ & (\R.Activity~q\ & ((!\R.FrameState.Stop~q\) # (\R.Sclk~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110001000000000011000111111101111111011111110111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Sclk~q\,
	datab => \ALT_INV_iStrobeI2C~input_o\,
	datac => \ALT_INV_R.FrameState.Stop~q\,
	datad => \ALT_INV_R.Activity~q\,
	dataf => \ALT_INV_R.FrameState.Idle~q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X78_Y9_N32
\R.FrameState.Idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \Selector0~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.FrameState.Idle~q\);

-- Location: LABCELL_X77_Y9_N18
\Selector14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = ( \R.Sclk~q\ & ( \R.FrameState.Stop~q\ & ( ((!\R.Activity~q\) # (!\iStrobeI2C~input_o\)) # (\R.FrameState.Start~q\) ) ) ) # ( !\R.Sclk~q\ & ( \R.FrameState.Stop~q\ & ( (\R.FrameState.Start~q\ & \iStrobeI2C~input_o\) ) ) ) # ( 
-- \R.Sclk~q\ & ( !\R.FrameState.Stop~q\ & ( (!\R.FrameState.Start~q\ & (\R.FrameState.Idle~q\ & ((!\R.Activity~q\) # (!\iStrobeI2C~input_o\)))) # (\R.FrameState.Start~q\ & (((\iStrobeI2C~input_o\)))) ) ) ) # ( !\R.Sclk~q\ & ( !\R.FrameState.Stop~q\ & ( 
-- (\iStrobeI2C~input_o\ & (((\R.FrameState.Idle~q\ & \R.Activity~q\)) # (\R.FrameState.Start~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110111010001000111001100000000001100111111111111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.FrameState.Idle~q\,
	datab => \ALT_INV_R.FrameState.Start~q\,
	datac => \ALT_INV_R.Activity~q\,
	datad => \ALT_INV_iStrobeI2C~input_o\,
	datae => \ALT_INV_R.Sclk~q\,
	dataf => \ALT_INV_R.FrameState.Stop~q\,
	combout => \Selector14~0_combout\);

-- Location: FF_X77_Y9_N20
\R.Sclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector14~0_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Sclk~q\);

-- Location: LABCELL_X79_Y9_N54
\Selector15~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~1_combout\ = ( \iStrobeI2C~input_o\ & ( \R.FrameState.Data1~q\ & ( (!\R.FrameState.RWBit~q\ & \R.Sdin~q\) ) ) ) # ( !\iStrobeI2C~input_o\ & ( \R.FrameState.Data1~q\ & ( \R.Sdin~q\ ) ) ) # ( \iStrobeI2C~input_o\ & ( !\R.FrameState.Data1~q\ & ( 
-- (!\R.FrameState.RWBit~q\ & (((!\R.FrameState.Data2~q\ & !\R.FrameState.Address~q\)) # (\R.Sdin~q\))) ) ) ) # ( !\iStrobeI2C~input_o\ & ( !\R.FrameState.Data1~q\ & ( ((!\R.FrameState.RWBit~q\ & (!\R.FrameState.Data2~q\ & !\R.FrameState.Address~q\))) # 
-- (\R.Sdin~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000111100001111100010100000101000001111000011110000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.FrameState.RWBit~q\,
	datab => \ALT_INV_R.FrameState.Data2~q\,
	datac => \ALT_INV_R.Sdin~q\,
	datad => \ALT_INV_R.FrameState.Address~q\,
	datae => \ALT_INV_iStrobeI2C~input_o\,
	dataf => \ALT_INV_R.FrameState.Data1~q\,
	combout => \Selector15~1_combout\);

-- Location: LABCELL_X79_Y9_N6
\Selector15~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~2_combout\ = ( \NextR~8_combout\ & ( (!\R.FrameState.Data1~q\ & (\Selector15~1_combout\ & ((!\NextR~9_combout\) # (!\R.FrameState.Data2~q\)))) ) ) # ( !\NextR~8_combout\ & ( (\Selector15~1_combout\ & ((!\NextR~9_combout\) # 
-- (!\R.FrameState.Data2~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011101110000000001110111000000000111000000000000011100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_NextR~9_combout\,
	datab => \ALT_INV_R.FrameState.Data2~q\,
	datac => \ALT_INV_R.FrameState.Data1~q\,
	datad => \ALT_INV_Selector15~1_combout\,
	dataf => \ALT_INV_NextR~8_combout\,
	combout => \Selector15~2_combout\);

-- Location: LABCELL_X80_Y9_N21
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( \R.AddrCtr\(0) & ( (!\R.AddrCtr\(2) & \R.AddrCtr\(1)) ) ) # ( !\R.AddrCtr\(0) & ( \R.AddrCtr\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_R.AddrCtr\(2),
	datad => \ALT_INV_R.AddrCtr\(1),
	dataf => \ALT_INV_R.AddrCtr\(0),
	combout => \Mux1~0_combout\);

-- Location: MLABCELL_X78_Y9_N27
\R.Data[15]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.Data[15]~0_combout\ = ( \R.FrameState.Start~q\ & ( (\R.Activity~q\ & \iStrobeI2C~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Activity~q\,
	datad => \ALT_INV_iStrobeI2C~input_o\,
	dataf => \ALT_INV_R.FrameState.Start~q\,
	combout => \R.Data[15]~0_combout\);

-- Location: FF_X80_Y9_N23
\R.Data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux1~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(6));

-- Location: FF_X80_Y9_N11
\R.Data[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.AddrCtr\(5),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(14));

-- Location: LABCELL_X80_Y9_N45
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( \R.AddrCtr\(1) & ( !\R.AddrCtr\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_R.AddrCtr\(2),
	dataf => \ALT_INV_R.AddrCtr\(1),
	combout => \Mux3~0_combout\);

-- Location: FF_X80_Y9_N47
\R.Data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux3~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(4));

-- Location: FF_X80_Y9_N50
\R.Data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.AddrCtr\(3),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(12));

-- Location: LABCELL_X80_Y9_N51
\Mux9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux9~1_combout\ = ( \R.Data\(4) & ( \R.Data\(12) & ( (!\R.BitCtr\(1)) # ((!\R.BitCtr\(3) & (\R.Data\(6))) # (\R.BitCtr\(3) & ((\R.Data\(14))))) ) ) ) # ( !\R.Data\(4) & ( \R.Data\(12) & ( (!\R.BitCtr\(1) & (((\R.BitCtr\(3))))) # (\R.BitCtr\(1) & 
-- ((!\R.BitCtr\(3) & (\R.Data\(6))) # (\R.BitCtr\(3) & ((\R.Data\(14)))))) ) ) ) # ( \R.Data\(4) & ( !\R.Data\(12) & ( (!\R.BitCtr\(1) & (((!\R.BitCtr\(3))))) # (\R.BitCtr\(1) & ((!\R.BitCtr\(3) & (\R.Data\(6))) # (\R.BitCtr\(3) & ((\R.Data\(14)))))) ) ) ) 
-- # ( !\R.Data\(4) & ( !\R.Data\(12) & ( (\R.BitCtr\(1) & ((!\R.BitCtr\(3) & (\R.Data\(6))) # (\R.BitCtr\(3) & ((\R.Data\(14)))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100000011110111010000001100010001110011111101110111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Data\(6),
	datab => \ALT_INV_R.BitCtr\(1),
	datac => \ALT_INV_R.Data\(14),
	datad => \ALT_INV_R.BitCtr\(3),
	datae => \ALT_INV_R.Data\(4),
	dataf => \ALT_INV_R.Data\(12),
	combout => \Mux9~1_combout\);

-- Location: FF_X80_Y9_N26
\R.Data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.AddrCtr\(1),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(10));

-- Location: LABCELL_X80_Y9_N24
\Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = ( \R.AddrCtr\(0) & ( (!\R.AddrCtr\(2) $ (!\R.AddrCtr\(1))) # (\R.AddrCtr\(3)) ) ) # ( !\R.AddrCtr\(0) & ( (\R.AddrCtr\(1)) # (\R.AddrCtr\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100111111111100110011111111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_R.AddrCtr\(3),
	datac => \ALT_INV_R.AddrCtr\(2),
	datad => \ALT_INV_R.AddrCtr\(1),
	dataf => \ALT_INV_R.AddrCtr\(0),
	combout => \Mux7~0_combout\);

-- Location: FF_X80_Y9_N20
\R.Data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \Mux7~0_combout\,
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(0));

-- Location: LABCELL_X80_Y9_N12
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (!\R.AddrCtr\(0) & \R.AddrCtr\(2))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_R.AddrCtr\(0),
	datac => \ALT_INV_R.AddrCtr\(2),
	combout => \Mux5~0_combout\);

-- Location: FF_X80_Y9_N14
\R.Data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux5~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(2));

-- Location: LABCELL_X80_Y9_N18
\Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = ( \R.Data\(2) & ( (!\R.BitCtr\(1) & (((!\R.BitCtr\(3) & \R.Data\(0))))) # (\R.BitCtr\(1) & (((!\R.BitCtr\(3))) # (\R.Data\(10)))) ) ) # ( !\R.Data\(2) & ( (!\R.BitCtr\(1) & (((!\R.BitCtr\(3) & \R.Data\(0))))) # (\R.BitCtr\(1) & 
-- (\R.Data\(10) & (\R.BitCtr\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111000001000000011100000100110001111100010011000111110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Data\(10),
	datab => \ALT_INV_R.BitCtr\(1),
	datac => \ALT_INV_R.BitCtr\(3),
	datad => \ALT_INV_R.Data\(0),
	dataf => \ALT_INV_R.Data\(2),
	combout => \Mux9~0_combout\);

-- Location: FF_X81_Y9_N29
\R.Data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.AddrCtr\(0),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(9));

-- Location: LABCELL_X81_Y9_N30
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (!\R.AddrCtr\(0) & (!\R.AddrCtr\(1) & (!\R.AddrCtr\(3) $ (!\R.AddrCtr\(2))))) # (\R.AddrCtr\(0) & (!\R.AddrCtr\(3) & (\R.AddrCtr\(1) & \R.AddrCtr\(2))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000010000100001000001000010000100000100001000010000010000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.AddrCtr\(0),
	datab => \ALT_INV_R.AddrCtr\(3),
	datac => \ALT_INV_R.AddrCtr\(1),
	datad => \ALT_INV_R.AddrCtr\(2),
	combout => \Mux6~0_combout\);

-- Location: FF_X81_Y9_N32
\R.Data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux6~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(1));

-- Location: LABCELL_X81_Y9_N57
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = !\R.AddrCtr\(1) $ (((!\R.AddrCtr\(0)) # (!\R.AddrCtr\(2))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111111010000001011111101000000101111110100000010111111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.AddrCtr\(0),
	datac => \ALT_INV_R.AddrCtr\(2),
	datad => \ALT_INV_R.AddrCtr\(1),
	combout => \Mux4~0_combout\);

-- Location: FF_X81_Y9_N58
\R.Data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux4~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(3));

-- Location: FF_X81_Y9_N50
\R.Data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.AddrCtr\(2),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(11));

-- Location: LABCELL_X81_Y9_N48
\Mux9~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux9~2_combout\ = ( \R.Data\(11) & ( \R.BitCtr\(1) & ( (\R.BitCtr\(3)) # (\R.Data\(3)) ) ) ) # ( !\R.Data\(11) & ( \R.BitCtr\(1) & ( (\R.Data\(3) & !\R.BitCtr\(3)) ) ) ) # ( \R.Data\(11) & ( !\R.BitCtr\(1) & ( (!\R.BitCtr\(3) & ((\R.Data\(1)))) # 
-- (\R.BitCtr\(3) & (\R.Data\(9))) ) ) ) # ( !\R.Data\(11) & ( !\R.BitCtr\(1) & ( (!\R.BitCtr\(3) & ((\R.Data\(1)))) # (\R.BitCtr\(3) & (\R.Data\(9))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001101010101001100110101010100001111000000000000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Data\(9),
	datab => \ALT_INV_R.Data\(1),
	datac => \ALT_INV_R.Data\(3),
	datad => \ALT_INV_R.BitCtr\(3),
	datae => \ALT_INV_R.Data\(11),
	dataf => \ALT_INV_R.BitCtr\(1),
	combout => \Mux9~2_combout\);

-- Location: LABCELL_X81_Y9_N33
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (!\R.AddrCtr\(0) & (!\R.AddrCtr\(3) $ (((!\R.AddrCtr\(2) & !\R.AddrCtr\(1)))))) # (\R.AddrCtr\(0) & (!\R.AddrCtr\(3) & (!\R.AddrCtr\(2) & \R.AddrCtr\(1))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010100011001000001010001100100000101000110010000010100011001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.AddrCtr\(0),
	datab => \ALT_INV_R.AddrCtr\(3),
	datac => \ALT_INV_R.AddrCtr\(2),
	datad => \ALT_INV_R.AddrCtr\(1),
	combout => \Mux2~0_combout\);

-- Location: FF_X81_Y9_N35
\R.Data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux2~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(5));

-- Location: FF_X81_Y9_N44
\R.Data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.AddrCtr\(6),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(15));

-- Location: FF_X81_Y9_N53
\R.Data[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	asdata => \R.AddrCtr\(4),
	clrn => \inResetAsync~input_o\,
	sload => VCC,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(13));

-- Location: LABCELL_X81_Y9_N36
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (!\R.AddrCtr\(1) & (!\R.AddrCtr\(2) & !\R.AddrCtr\(3)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100000000000100010000000000010001000000000001000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.AddrCtr\(1),
	datab => \ALT_INV_R.AddrCtr\(2),
	datad => \ALT_INV_R.AddrCtr\(3),
	combout => \Mux0~0_combout\);

-- Location: FF_X81_Y9_N38
\R.Data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Mux0~0_combout\,
	clrn => \inResetAsync~input_o\,
	ena => \R.Data[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Data\(7));

-- Location: LABCELL_X81_Y9_N45
\Mux9~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux9~3_combout\ = ( \R.Data\(7) & ( \R.BitCtr\(1) & ( (!\R.BitCtr\(3)) # (\R.Data\(15)) ) ) ) # ( !\R.Data\(7) & ( \R.BitCtr\(1) & ( (\R.Data\(15) & \R.BitCtr\(3)) ) ) ) # ( \R.Data\(7) & ( !\R.BitCtr\(1) & ( (!\R.BitCtr\(3) & (\R.Data\(5))) # 
-- (\R.BitCtr\(3) & ((\R.Data\(13)))) ) ) ) # ( !\R.Data\(7) & ( !\R.BitCtr\(1) & ( (!\R.BitCtr\(3) & (\R.Data\(5))) # (\R.BitCtr\(3) & ((\R.Data\(13)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001011111010100000101111100000011000000111111001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Data\(5),
	datab => \ALT_INV_R.Data\(15),
	datac => \ALT_INV_R.BitCtr\(3),
	datad => \ALT_INV_R.Data\(13),
	datae => \ALT_INV_R.Data\(7),
	dataf => \ALT_INV_R.BitCtr\(1),
	combout => \Mux9~3_combout\);

-- Location: LABCELL_X80_Y9_N6
\Mux9~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux9~4_combout\ = ( \Mux9~2_combout\ & ( \Mux9~3_combout\ & ( ((!\R.BitCtr\(2) & ((\Mux9~0_combout\))) # (\R.BitCtr\(2) & (\Mux9~1_combout\))) # (\R.BitCtr\(0)) ) ) ) # ( !\Mux9~2_combout\ & ( \Mux9~3_combout\ & ( (!\R.BitCtr\(2) & (((\Mux9~0_combout\ & 
-- !\R.BitCtr\(0))))) # (\R.BitCtr\(2) & (((\R.BitCtr\(0))) # (\Mux9~1_combout\))) ) ) ) # ( \Mux9~2_combout\ & ( !\Mux9~3_combout\ & ( (!\R.BitCtr\(2) & (((\R.BitCtr\(0)) # (\Mux9~0_combout\)))) # (\R.BitCtr\(2) & (\Mux9~1_combout\ & ((!\R.BitCtr\(0))))) ) 
-- ) ) # ( !\Mux9~2_combout\ & ( !\Mux9~3_combout\ & ( (!\R.BitCtr\(0) & ((!\R.BitCtr\(2) & ((\Mux9~0_combout\))) # (\R.BitCtr\(2) & (\Mux9~1_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100000000000111011100110000011101001100110001110111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux9~1_combout\,
	datab => \ALT_INV_R.BitCtr\(2),
	datac => \ALT_INV_Mux9~0_combout\,
	datad => \ALT_INV_R.BitCtr\(0),
	datae => \ALT_INV_Mux9~2_combout\,
	dataf => \ALT_INV_Mux9~3_combout\,
	combout => \Mux9~4_combout\);

-- Location: MLABCELL_X78_Y9_N42
\Selector15~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~4_combout\ = ( !\R.FrameState.Ack1~q\ & ( (!\R.FrameState.Ack2~q\ & (!\R.FrameState.Start~q\ & !\R.FrameState.Ack3~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000110000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_R.FrameState.Ack2~q\,
	datac => \ALT_INV_R.FrameState.Start~q\,
	datad => \ALT_INV_R.FrameState.Ack3~q\,
	dataf => \ALT_INV_R.FrameState.Ack1~q\,
	combout => \Selector15~4_combout\);

-- Location: LABCELL_X79_Y9_N48
\Selector15~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~5_combout\ = ( \R.Sclk~q\ & ( \R.FrameState.Address~q\ & ( (!\R.BitCtr\(3) & ((!\R.BitCtr\(0) & (!\R.BitCtr\(1) & \R.BitCtr\(2))) # (\R.BitCtr\(0) & ((!\R.BitCtr\(2)))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000110010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr\(1),
	datab => \ALT_INV_R.BitCtr\(3),
	datac => \ALT_INV_R.BitCtr\(0),
	datad => \ALT_INV_R.BitCtr\(2),
	datae => \ALT_INV_R.Sclk~q\,
	dataf => \ALT_INV_R.FrameState.Address~q\,
	combout => \Selector15~5_combout\);

-- Location: LABCELL_X79_Y9_N36
\Selector15~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~3_combout\ = ( \R.BitCtr\(2) & ( (\R.FrameState.Address~q\ & (((\R.BitCtr\(1) & \R.BitCtr\(0))) # (\R.BitCtr\(3)))) ) ) # ( !\R.BitCtr\(2) & ( (\R.FrameState.Address~q\ & \R.BitCtr\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000001000011110000000100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.BitCtr\(1),
	datab => \ALT_INV_R.BitCtr\(0),
	datac => \ALT_INV_R.FrameState.Address~q\,
	datad => \ALT_INV_R.BitCtr\(3),
	dataf => \ALT_INV_R.BitCtr\(2),
	combout => \Selector15~3_combout\);

-- Location: MLABCELL_X78_Y9_N24
\Selector0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = ( !\R.FrameState.Idle~q\ & ( (!\R.Activity~q\) # (!\iStrobeI2C~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101011111010111110101111101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Activity~q\,
	datac => \ALT_INV_iStrobeI2C~input_o\,
	dataf => \ALT_INV_R.FrameState.Idle~q\,
	combout => \Selector0~1_combout\);

-- Location: LABCELL_X79_Y9_N12
\Selector15~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~6_combout\ = ( !\Selector0~1_combout\ & ( (!\Selector15~5_combout\ & (((\Selector15~4_combout\ & !\Selector15~3_combout\)) # (\R.Sdin~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000001010000011100000101000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.Sdin~q\,
	datab => \ALT_INV_Selector15~4_combout\,
	datac => \ALT_INV_Selector15~5_combout\,
	datad => \ALT_INV_Selector15~3_combout\,
	dataf => \ALT_INV_Selector0~1_combout\,
	combout => \Selector15~6_combout\);

-- Location: LABCELL_X79_Y9_N18
\Selector15~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~7_combout\ = ( \Mux9~4_combout\ & ( \Selector15~6_combout\ & ( (!\R.Sclk~q\ & (((\Selector15~2_combout\)))) # (\R.Sclk~q\ & (!\R.FrameState.Data1~q\ & ((!\R.FrameState.Data2~q\)))) ) ) ) # ( !\Mux9~4_combout\ & ( \Selector15~6_combout\ & ( 
-- (\R.Sclk~q\) # (\Selector15~2_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000111111001111110011101000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_R.FrameState.Data1~q\,
	datab => \ALT_INV_Selector15~2_combout\,
	datac => \ALT_INV_R.Sclk~q\,
	datad => \ALT_INV_R.FrameState.Data2~q\,
	datae => \ALT_INV_Mux9~4_combout\,
	dataf => \ALT_INV_Selector15~6_combout\,
	combout => \Selector15~7_combout\);

-- Location: FF_X79_Y9_N20
\R.Sdin\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \Selector15~7_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Sdin~q\);

-- Location: LABCELL_X77_Y9_N24
\R.Configured~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \R.Configured~2_combout\ = ( \R.Configured~q\ & ( \R.Configured~1_combout\ & ( ((!\R.Configured~0_combout\ & ((!\Equal0~1_combout\) # (!\Equal0~0_combout\)))) # (\R.Activity~q\) ) ) ) # ( !\R.Configured~q\ & ( \R.Configured~1_combout\ & ( (\R.Activity~q\ 
-- & (((\Equal0~1_combout\ & \Equal0~0_combout\)) # (\R.Configured~0_combout\))) ) ) ) # ( \R.Configured~q\ & ( !\R.Configured~1_combout\ & ( (!\R.Configured~0_combout\) # (\R.Activity~q\) ) ) ) # ( !\R.Configured~q\ & ( !\R.Configured~1_combout\ & ( 
-- (\R.Activity~q\ & \R.Configured~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111111110000111100000001000011111110111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~1_combout\,
	datab => \ALT_INV_Equal0~0_combout\,
	datac => \ALT_INV_R.Activity~q\,
	datad => \ALT_INV_R.Configured~0_combout\,
	datae => \ALT_INV_R.Configured~q\,
	dataf => \ALT_INV_R.Configured~1_combout\,
	combout => \R.Configured~2_combout\);

-- Location: FF_X77_Y9_N25
\R.Configured\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputCLKENA0_outclk\,
	d => \R.Configured~2_combout\,
	clrn => \inResetAsync~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R.Configured~q\);

-- Location: LABCELL_X33_Y10_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


