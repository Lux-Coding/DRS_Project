--------------------------------------------------------------------------------
-- Title       : Testbench for design "TbdI2sParI2s"
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: tbTbdI2sParI2s-Bhv-ea.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.Global.all;
use work.DefinitionsCodec.all;
use work.ParamCodec.all;

--------------------------------------------------------------------------------

entity tbTbdI2sParI2s is
end entity tbTbdI2sParI2s;

-------------------------------------------------------------------------------

architecture Bhv of tbTbdI2sParI2s is

  constant cClkFrequency               : natural := 48E6;
  constant cIsLowPercentageOfDutyCycle : natural := 65;
  constant cInResetDuration            : time    := 140 ns;
  constant cClkFrequency48             : natural := 48E6;
  constant cGenFrequencyL              : natural := 100;
  constant cGenFrequencyR              : natural := 440;
  constant cAudioBitWidth              : natural := 16;
  constant cSampleRate                 : natural := 44117;

      -- timing parameters
  constant cMPUSclkFrequency           : natural := 526E3;
  constant cMPUSclkLowPulsewidth       : time    := 1300 ns - 20 ns; -- account for potential rounding errors at 48 MHz and nanosecond simulator resolution
  constant cMPUSclkHighPulsewidth      : time    :=  600 ns;
  constant cMPUStartConditionHoldTime  : time    :=  600 ns;
  constant cMPUStartConditionSetupTime : time    :=  600 ns;
  constant cMPUDataSetupTime           : time    :=  100 ns;
  constant cMPUDataHoldTime            : time    :=  900 ns;
  constant cMPUStopConditionSetupTime  : time    :=  600 ns;
  constant cStrobeFrequency            : natural       := 750E3;

  constant cChoosenParamSet            : aParamSetName := MicroSlaveSampleRate44k1;
  constant cI2cAddress                 : std_ulogic_vector(6 downto 0) := "0011010";

  type aPhase is (Idle, Data, Ack, Stop);
  signal Phase : aPhase := Idle;
  signal TransmittedRegisters : integer := 0;
  signal AckError     : std_ulogic;
  signal Configured   : std_ulogic; 
  constant cRegisterBitMap : aRegBitMap := toCodecRegBitMap(cParamSets(cChoosenParamSet));

  signal Clk         : std_ulogic;
  signal nResetAsync : std_ulogic;
  signal I2CSclk     : std_logic := 'H';
  signal I2cSdin     : std_logic := 'H';
  signal Mclk        : std_ulogic;
  signal Bclk        : std_ulogic;
  signal ADCdat      : std_ulogic := '0';
  signal ADClrc      : std_ulogic;
  signal DACdat      : std_ulogic;
  signal DAClrc      : std_ulogic;
  signal Led         : std_ulogic_vector(9 downto 0);

  signal LeftChannelData : std_ulogic_vector(cAudioBitWidth - 1 downto 0) := (others => '0');
  signal RightChannelData : std_ulogic_vector(cAudioBitWidth - 1 downto 0) := (others => '0');
  signal TestOutput       : std_ulogic_vector(cAudioBitWidth - 1 downto 0) := (others => '0');

begin  -- architecture Bhv


------------------ Collect the testinput ------------------------------

  CollectTestIn: process is
    variable counter          : natural := 0;
    variable SequenceComplete : std_ulogic := '0';
    variable CurrentMode      : std_ulogic := '0';
  begin

    -- wait for rising clock edge
    wait until Bclk'event and (Bclk = '1');

      -- check if a new dataset is about to arrive
      if (ADClrc /= CurrentMode) then
        SequenceComplete := '0';
      end if;

      -- track the current channel
      CurrentMode := ADClrc;

      -- safe data for left channel -> first arriving bit is don't care
      if ADClrc = '0' and counter /= 0 and SequenceComplete /= '1' then
        LeftChannelData(counter - 1 ) <= ADCdat;
      -- safe data for right channel-> first arriving bit is don't care
      elsif ADClrc = '1' and counter /= 0 and SequenceComplete /= '1' then
        RightChannelData(counter - 1 ) <= ADCdat;
      end if;

      -- if all databits have been read -> wait for new dataset
      if (counter = cAudioBitWidth) then
        counter := 0;
        SequenceComplete := '1';
      elsif (SequenceComplete /= '1') then
        counter := counter + 1;
      end if;
  end process;

  ------------------ Compare the testoutput ------------------------------

  CollectTestOut: process is
    variable counter          : natural := 0;
    variable SequenceComplete : std_ulogic := '0';
    variable CurrentMode      : std_ulogic := '0';
  begin

    -- wait for rising clock edge
    wait until Bclk'event and (Bclk = '1');

      -- check if a new dataset is about to arrive
      if (DAClrc /= CurrentMode) then
        SequenceComplete := '0';
      end if;

      -- track the current channel
      CurrentMode := DAClrc;

      -- first arriving bit is don't care
      if counter /= 0  then
        TestOutput(counter - 1 ) <= DacDat;
      end if;

      -- if all databits have been read -> wait for new dataset
      if (counter = cAudioBitWidth) then
        counter := 0;
        SequenceComplete := '1';

        -- update the signal
        wait for 0 ns;

        if DAClrc = '0' then
          assert (TestOutput = LeftChannelData)
          report "Data for the left channel is faulty!"
          severity error;
        else
          assert (TestOutput = RightChannelData)
          report "Data for the right channel is faulty!"
          severity error;
        end if;
      elsif (SequenceComplete /= '1') then
        counter := counter + 1;
      end if;
  end process;


  -------------------- create the random data ------------------

  -- Generate pseudo random data with an LFSR.
  RandomBit : process is
    -- Define a data structure for an LFSR.
    variable Lfsr : std_ulogic_vector(31 downto 0) := (others => '1');
  begin
    -- With every falling edge of Bclk.
    wait until Bclk'event and (Bclk = '0');
    -- Shift the LFSR once. Shift in a new bit based on linear automata theory.
    Lfsr := Lfsr(Lfsr'left-1 downto 0) & (Lfsr(Lfsr'left) xor Lfsr(11));
    -- Take any of the bits in the LFSR as source for the output.
    ADCdat <= Lfsr(0);
  end process;


---------------- general connections ----------
  
I2cSdin <= 'H';
I2CSclk <= 'H';


Configured <= Led(1);
AckError <= Led(2);

---------------- unit under test ---------------
    DUT : entity work.TbdI2sParI2s
    generic map (
        gClkFrequency   => cClkFrequency48,
        gAudioBitWidth  => cAudioBitWidth,
        gSampleRate     => cSampleRate)
    port map (
        iClk            => Clk,
        inResetAsync    => nResetAsync,
        oI2cSclk        => I2CSclk,
        ioI2cSdin       => I2cSdin,
        oMclk           => Mclk,
        oBclk           => Bclk,
        iADCdat         => ADCdat,
        oADClrc         => ADClrc,
        oDACdat         => DACdat,
        oDAClrc         => DAClrc,
        oLed            => Led);


--------------- create the clock ---------------

    ClkGen : entity work.Oscillator
    generic map (
        gFrequency                  => cClkFrequency,
        gIsLowPercentageOfDutyCycle => cIsLowPercentageOfDutyCycle)
    port map (
        oRectangleWave => Clk);

--------------- emulate power on reset ----------

    PwrOnResetSource : entity work.PwrOnReset
    generic map (
        gInResetDuration => cInResetDuration,
        gResetLevel      => cResetActive)
    port map (
        onResetAsync => nResetAsync);




--------------- check the configuration over I2C ----------

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
        vExpectedDataWord := std_ulogic_vector(to_unsigned(TransmittedRegisters, 7)) &
                             cRegisterBitMap(TransmittedRegisters);
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
  assert (TransmittedRegisters = 10)
    report "Unexpected number of registers received! (expected: 10, actual: " & integer'image(TransmittedRegisters) & ")"
    severity error;
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