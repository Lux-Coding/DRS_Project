--------------------------------------------------------------------------------
-- Title       : FSK transmitter
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TxFsk-Rtl-a.vhd 733 2017-12-04 02:28:35Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of TxFsk is
  
  constant cPhaseResolution : natural := 20;
  constant cWaveTableBitWidth : natural := 14;


  function CalculatePhaseIncrements return aSetOfPhaseIncrements is
      variable tempSetPhaseInc    : aSetOfPhaseIncrements(gChannels'range);
      variable tempSfixed_long    : aAudioData(0 downto -(cPhaseResolution));
      variable tempSfixed_rounded : aAudioData(0 downto -(cPhaseResolution-1));
      variable temp_unsigned      : unsigned(cPhaseResolution-1 downto 0);

  begin
      for I in gChannels'range loop

      tempSfixed_long := to_sfixed(((2.0*gChannels(I).Frequency0) / Real(gSampleRate)), 0 , -(cPhaseResolution), fixed_saturate, fixed_truncate, 0);
      tempSfixed_rounded := ResizeTruncAbsVal(tempSfixed_long,tempSfixed_rounded);

        for K in tempSfixed_rounded'range loop
          temp_unsigned(temp_unsigned'left+K) := tempSfixed_rounded(K);
        end loop;

      tempSetPhaseInc(I).PhaseIncrement0 := to_integer(temp_unsigned);

      tempSfixed_long := to_sfixed(((2.0*gChannels(I).Frequency1) / Real(gSampleRate)), 0 , -(cPhaseResolution), fixed_saturate, fixed_truncate, 0);
      tempSfixed_rounded := ResizeTruncAbsVal(tempSfixed_long,tempSfixed_rounded);

        for K in tempSfixed_rounded'range loop
          temp_unsigned(temp_unsigned'left+K) := tempSfixed_rounded(K);
        end loop;

      tempSetPhaseInc(I).PhaseIncrement1 := to_integer(temp_unsigned);

      end loop;
      return tempSetPhaseInc;
  end function;

  
  constant PhaseIncrements : aSetOfPhaseIncrements := CalculatePhaseIncrements;
  signal PhaseIncrement  :  natural;

begin
  
    -- DUT:
	TheDDS: entity work.DspDds(Rtl)
		generic map(
			gClkFrequency 		  => gClkFrequency,
			gAudioBitWidth		  => gAudioBitWidth,
			gPhaseResolution	  => cPhaseResolution,
			gWaveTableBitWidth		=> cWaveTableBitWidth)
		
    port map(
			iClk			=> iClk,
			inResetAsync	=> inResetAsync,
			iPhaseIncrement	=> PhaseIncrement,
			iSampleStrobe	=> iSampleStrobe,
			oVal			=> oVal,
			oD				=> oD);

    PhaseIncrement <= PhaseIncrements(iChannelSelect).PhaseIncrement0 when iD = '0' else PhaseIncrements(iChannelSelect).PhaseIncrement1; 

end architecture Rtl;
