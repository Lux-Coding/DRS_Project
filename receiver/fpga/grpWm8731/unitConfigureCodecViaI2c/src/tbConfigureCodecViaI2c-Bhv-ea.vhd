--------------------------------------------------------------------------------
-- Title       : Testbench for design "ConfigureCodecViaI2c"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbConfigureCodecViaI2c-Bhv-ea.vhd 664 2017-09-26 19:39:57Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2012-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Global.all;
use work.DefinitionsCodec.all;
use work.ParamCodec.all;

entity tbConfigureCodecViaI2c is
end entity tbConfigureCodecViaI2c;


architecture Bhv of tbConfigureCodecViaI2c is

  -- component generics
  constant cClkFrequency               : natural       := 48E6;
  constant cIsLowPercentageOfDutyCycle : natural       := 65;
  constant cInResetDuration            : time          := 140 ns;
  constant cStrobeFrequency            : natural       := 750E3;
  constant cChoosenParamSet            : aParamSetName := MicroOverSidetone;
  constant cI2cAddress                 : std_ulogic_vector(6 downto 0) := "0011010";
  
  -- timing parameters
  constant cMPUSclkFrequency           : natural := 526E3;
  constant cMPUSclkLowPulsewidth       : time    := 1300 ns - 20 ns; -- account for potential rounding errors at 48 MHz and nanosecond simulator resolution
  constant cMPUSclkHighPulsewidth      : time    :=  600 ns;
  constant cMPUStartConditionHoldTime  : time    :=  600 ns;
  constant cMPUStartConditionSetupTime : time    :=  600 ns;
  constant cMPUDataSetupTime           : time    :=  100 ns;
  constant cMPUDataHoldTime            : time    :=  900 ns;
  constant cMPUStopConditionSetupTime  : time    :=  600 ns;
  
  -- component ports
  signal Clk         : std_ulogic;
  signal nResetAsync : std_ulogic;
  signal StrobeI2C   : std_ulogic;
  signal Start       : std_ulogic;
  signal Configured  : std_ulogic;
  signal AckError    : std_ulogic;
  signal I2cSclk     : std_logic := 'H';
  signal I2cSdin     : std_logic := 'H';

  type aPhase is (Idle, Data, Ack, Stop);
  signal Phase : aPhase := Idle;
  signal TransmittedRegisters : integer := 0;
  constant cRegisterBitMap : aRegBitMap := toCodecRegBitMap(cParamSets(cChoosenParamSet));

  -- simulate multiple configuration runs
  constant cIterations : integer := 3;
  signal Iteration : integer := 1;

begin  -- architecture Bhv

  I2cSclk <= 'H';
  I2cSdin <= 'H';

  -- component instantiation
  DUT : entity work.ConfigureCodecViaI2c
    generic map (
      gChoosenParamSet => cChoosenParamSet,
      gI2cAddress      => cI2cAddress)
    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,
      iStrobeI2C   => StrobeI2C,
      iStart       => Start,
      oConfigured  => Configured,
      oAckError    => AckError,
      oI2cSclk     => I2cSclk,
      ioI2cSdin    => I2cSdin);

  -- clock generation
  ClkGen : entity work.Oscillator
    generic map (
      gFrequency                  => cClkFrequency,
      gIsLowPercentageOfDutyCycle => cIsLowPercentageOfDutyCycle)
    port map (
      oRectangleWave => Clk);

  -- reset generation
  PwrOnResetSource : entity work.PwrOnReset
    generic map (
      gInResetDuration => cInResetDuration,
      gResetLevel      => cResetActive)
    port map (
      onResetAsync => nResetAsync);

  -- component instantiation
  GenStrobeI2C : entity work.StrobeGen
    generic map (
      gClkFrequency    => cClkFrequency,
      gStrobeFrequency => cStrobeFrequency)
    port map (
      iClk         => Clk,
      inResetAsync => nResetAsync,
      oStrobe      => StrobeI2C);

  -- Start generation
  StartGen_Proc : process
  begin
    -- insert signal assignments here

    Start <= cInactivated;
    wait for 3 * cInResetDuration;

    -- simulate multiple configuration runs
    for vIteration in 1 to cIterations loop
      Start <= cActivated;
      wait until Configured = cActivated and Configured'last_value = cInactivated;
      Start <= cInactivated;
      report "Configuration " & integer'image(vIteration) & " completed.";

      -- wait some time between first and second configuration run
      -- the third and subsequent runs start immediately after the previous one
      if (vIteration = 1) then
        wait for 100 us;
      end if;
      
    end loop;

    wait;
  end process StartGen_Proc;
  
  -- Phase tracking
  PhaseTracking_Proc : process (I2cSclk, I2cSdin)
    variable vSclkCycleCount   : integer := 0;
    variable vByteCycleCount   : integer := 0;
    variable vDataBits         : std_ulogic_vector(7 downto 0)  := (others => '0');
    variable vExpectedDataWord : std_ulogic_vector(15 downto 0) := (others => 'X');
    variable vSclkLastRisingEdge  : time := now;
    variable vSclkLastFallingEdge : time := now;
    variable vSdinLastEdge        : time := now;
  begin
    if (to_X01(nResetAsync) /= not cResetActive) then
      Phase <= Idle;
      
    else
      if I2cSclk'event then
        if (to_X01(I2cSclk) = cActivated) then
          vSclkLastRisingEdge := now;
        elsif (to_X01(I2cSclk) = cInactivated) then
          vSclkLastFallingEdge := now;
        end if;
      end if;
      if I2cSdin'event then
        vSdinLastEdge := now;
      end if;
      
      case Phase is
        when Idle =>
          if I2cSdin'event then
            assert (to_X01(I2cSdin) = cInactivated) and (to_X01(I2cSclk) = cActivated)
              report "Invalid start condition! Sdin must be pulled low while Sclk is high."
              severity error;
            assert ((now - vSclkLastFallingEdge) >= cMPUStartConditionHoldTime)
              report "Minimum start condition hold time not met! (expected: >= " & time'image(cMPUStartConditionHoldTime) & ", actual: " & time'image(now - vSclkLastFallingEdge) & ")"
              severity error;
            Phase <= Data;
            vSclkCycleCount := 0;
            vByteCycleCount := 0;
            vExpectedDataWord := std_ulogic_vector(to_unsigned(TransmittedRegisters mod 10, 7)) &
                                 cRegisterBitMap(TransmittedRegisters mod 10);
            vDataBits := (others => 'X');
          else
            assert (to_X01(I2cSclk) = cActivated)
              report "Missing start condition! Sclk may toggle only after start condition."
              severity error;
            assert ((now - vSdinLastEdge) >= cMPUStartConditionSetupTime)
              report "Minimum start condition setup time not met! (expected: >= " & time'image(cMPUStartConditionSetupTime) & ", actual: " & time'image(now - vSdinLastEdge) & ")"
              severity error;
          end if;
        
        when Data =>
          if I2cSclk'event and (to_X01(I2cSclk) = cInactivated) then
            vSclkCycleCount := vSclkCycleCount + 1;
            if (vSclkCycleCount = 9) then
              Phase <= Ack;
            end if;
          elsif I2cSclk'event and (to_X01(I2cSclk) = cActivated) then
            vDataBits(8 - vSclkCycleCount) := I2cSdin;
            assert ((now - vSdinLastEdge) >= cMPUDataSetupTime)
              report "Minimum data setup time not met! (expected: >= " & time'image(cMPUDataSetupTime) & ", actual: " & time'image(now - vSdinLastEdge) & ")"
              severity error;
          elsif I2cSdin'event then
            assert (to_X01(I2cSclk) = cInactivated)
              report "Unexpected change of Sdin! Sdin may only toggle while Sclk is low in data phase."
              severity error;
            assert ((now - vSclkLastFallingEdge) <= cMPUDataHoldTime)
              report "Maximum data hold time not met! (expected: <= " & time'image(cMPUDataHoldTime) & ", actual: " & time'image(now - vSclkLastFallingEdge) & ")"
              severity error;
          end if;
        
        when Ack =>
          if I2cSclk'event and (to_X01(I2cSclk) = cInactivated) then
            vSclkCycleCount := 1;
            vByteCycleCount := vByteCycleCount + 1;
            Phase <= Data;
            if (vByteCycleCount = 1) then
              assert (to_X01(vDataBits) = cI2cAddress & "0")
                report "Incorrect I2C address detected! (detected: """ &
                       VectorToString(to_X01(vDataBits)) &
                       """, expected: """ &
                       VectorToString(cI2cAddress & "0") &
                       """)"
                severity error;
            elsif (vByteCycleCount = 2) then
              assert (to_X01(vDataBits) = vExpectedDataWord(15 downto 8))
                report "Incorrect data word (bits 15 downto 8) detected! (detected: """ &
                       VectorToString(to_X01(vDataBits)) &
                       """, expected: """ &
                       VectorToString(vExpectedDataWord(15 downto 8)) &
                       """)"
                severity error;
            elsif (vByteCycleCount = 3) then
              assert (to_X01(vDataBits) = vExpectedDataWord(7 downto 0))
                report "Incorrect data word (bits 7 downto 0) detected! (detected: """ &
                       VectorToString(to_X01(vDataBits)) &
                       """, expected: """ &
                       VectorToString(vExpectedDataWord(7 downto 0)) &
                       """)"
                severity error;
              Phase <= Stop;
            else
              report "Unexpected amount of bytes transmitted within one I2C frame! (expected: 3, actual: " & integer'image(vByteCycleCount) & ")"
                severity error;
            end if;
          elsif I2cSclk'event and (to_X01(I2cSclk) = cActivated) then
            assert ((now - vSdinLastEdge) >= cMPUDataSetupTime)
              report "Minimum data setup time not met! (expected: >= " & time'image(cMPUDataSetupTime) & ", actual: " & time'image(now - vSdinLastEdge) & ")"
              severity error;
          elsif I2cSdin'event then
            -- ignore toggle on I2cSdin introduced by AckGen_Proc
          end if;
        
        when Stop =>
          if I2cSclk'event then
            assert (to_X01(I2cSclk) = cActivated)
              report "Invalid stop condition! Sclk must be pulled high."
              severity error;
            assert ((now - vSdinLastEdge) >= cMPUDataSetupTime)
              report "Minimum data setup time not met! (expected: >= " & time'image(cMPUDataSetupTime) & ", actual: " & time'image(now - vSdinLastEdge) & ")"
              severity error;
          elsif I2cSdin'event then
            if (to_X01(I2cSdin) = cActivated) then
              assert (to_X01(I2cSclk) = cActivated)
                report "Invalid stop condition! Sdin may only change to high after Sclk was pulled high."
                severity error;
              assert ((now - vSclkLastRisingEdge) >= cMPUStopConditionSetupTime)
                report "Minimum stop condition setup time not met! (expected: >= " & time'image(cMPUStopConditionSetupTime) & ", actual: " & time'image(now - vSclkLastRisingEdge) & ")"
                severity error;
              Phase <= Idle;
              TransmittedRegisters <= TransmittedRegisters + 1;
            else
              assert (to_X01(I2cSclk) = cInactivated)
                report "Invalid stop condition! Sdin must be kept low while Sclk is low."
                severity error;
              assert ((now - vSclkLastFallingEdge) <= cMPUDataHoldTime)
                report "Maximum data hold time not met! (expected: <= " & time'image(cMPUDataHoldTime) & ", actual: " & time'image(now - vSclkLastFallingEdge) & ")"
                severity error;
            end if;
          end if;
        
      end case;
    end if;
  end process PhaseTracking_Proc;

  -- Ack generation
  AckGen_Proc : process
  begin
    wait until Phase = Ack;
    wait for 1 sec / cClkFrequency * 1.5;
    assert (to_X01(I2cSdin) = cActivated)
      report "Invalid ACK condition! Sdin must not be pulled low during ACK phase."
      severity error;
    wait for 1 sec / cStrobeFrequency / 4 * 3;  -- use more restrictive timing than allowed by data sheet to stress test ACK checking
    I2cSdin <= cInactivated;
    wait until to_X01(I2cSclk) = cActivated;
    wait for 1 sec / cStrobeFrequency / 4 * 1;  -- use more restrictive timing than allowed by data sheet to stress test ACK checking
    I2cSdin <= 'Z';
    wait for 0 sec;
    assert (to_X01(I2cSdin) = cActivated)
      report "Invalid ACK condition! Sdin must not be pulled low during ACK phase."
      severity error;
    wait until Phase /= Ack;
    assert (to_X01(I2cSdin) = cActivated)
      report "Invalid ACK condition! Sdin must not be pulled low during ACK phase."
      severity error;
  end process AckGen_Proc;

  assert (to_X01(AckError) /= cActivated)
    report "ACK error detected!"
    severity error;

  -- Completion tracking
  CompletionTracking_Proc : process (Configured, Phase)
  begin
    if (to_X01(Configured) = cActivated) and (Phase = Idle) then
      assert (TransmittedRegisters = Iteration * 10)
        report "Unexpected number of registers received! (expected: " & integer'image(Iteration * 10) & ", actual: " & integer'image(TransmittedRegisters) & ")"
        severity error;

      -- Next iteration
      Iteration <= Iteration + 1;
    end if;
  end process CompletionTracking_Proc;

  -- I2C Sclk tracking
  I2CSclkTracking_Proc : process (I2cSclk)
    variable vLastRisingEdge : time := now;
    variable vLastFallingEdge : time := now;
    variable vLowPulseWidth : time;
    variable vHighPulseWidth : time;
    variable vCycleTime : time;
  begin
    if (to_X01(I2cSclk) = cActivated) and (to_X01(I2cSclk'last_value) = cInactivated) then
      vLowPulseWidth := now - vLastFallingEdge;
      vCycleTime := now - vLastRisingEdge;
      vLastRisingEdge := now;
      assert (vLowPulseWidth >= cMPUSclkLowPulsewidth)
        report "Minimum Sclk Low Pulsewidth not met! (expected: >= " & time'image(cMPUSclkLowPulsewidth) & ", actual: " & time'image(vLowPulseWidth) & ")"
        severity error;
    elsif (to_X01(I2cSclk) = cInactivated) and (to_X01(I2cSclk'last_value) = cActivated) then
      vHighPulseWidth := now - vLastRisingEdge;
      vCycleTime := now - vLastFallingEdge;
      vLastFallingEdge := now;
      assert (vHighPulseWidth >= cMPUSclkHighPulsewidth)
        report "Minimum Sclk High Pulsewidth not met! (expected: >= " & time'image(cMPUSclkHighPulsewidth) & ", actual: " & time'image(vHighPulseWidth) & ")"
        severity error;
    end if;
    
    assert ((1 sec / vCycleTime) <= cMPUSclkFrequency)
      report "Maximum Sclk frequency not met not met! (expected: <= " & integer'image(cMPUSclkFrequency) & ", actual: " & integer'image(1 sec / vCycleTime) & ")"
      severity error;
  end process I2CSclkTracking_Proc;
  
end architecture Bhv;

