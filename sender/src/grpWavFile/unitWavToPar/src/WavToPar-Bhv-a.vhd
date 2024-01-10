--------------------------------------------------------------------------------
-- Title       : Read .wav files and stream into parallel digital audio protocol
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: WavToPar-Bhv-a.vhd 704 2017-10-27 19:25:59Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Not intended for synthesis!
-------------------------------------------------------------------------------

--assert if samplerate in file differs to much from system sample rate.

architecture Bhv of WavToPar is

  constant cSilence : aAudioData(0 downto -(gAudioBitWidth-1)) :=
    (0 downto -(gAudioBitWidth-1) => '0');

  constant cWavFileBitWidth : natural := 16;

  file WaveInFile : aBinaryFile;
  
  -- subtype definitions needed for type conversion
  subtype aAudioDataHByte is aAudioData(0 downto -7);
  subtype aSignedByte is signed(7 downto 0);
  
begin

  ReadItIn : process

    variable vDL, vDR : aAudioData(0 downto -(gAudioBitWidth-1)) := cSilence;

    variable vWaveInFileState : file_open_status;
    variable vChunkId         : a4Cc := "    ";
    variable vRiffCkLength,
      vFmtCkLength,
      vDataCkLength,
      vIgnoreCkLength : aDword;

    variable vRemainingRiffCkLength : aDword;
    variable vRemainingFmtCkLength  : aDword;
    variable vRemainingDataCkLength : aDword;

    variable vFormatTag         : aWord;
    variable vNumChannels       : aWord;
    variable vSampleRate        : aDword;
    variable vBytesRate         : aDword;
    variable vBlockAlign        : aWord;
    variable vBitsPerSample     : aWord;
    variable vUninterestingByte : aByte;

    variable vByteRead    : aByte;
    variable vFmtCkWentBy : boolean := false;
    
  begin

    -- The file we will read from is not even opened. It cannot be at its end then.
    oWaveAtEnd <= false;
    -- Open the file to read from.
    report "Mp: File to read from is: " & gWaveFileName & LF &
      "Opening read file.";
    file_open (vWaveInFileState, WaveInFile, gWaveFileName, read_mode);
    -- Check for errors during opening of the file.
    assert vWaveInFileState = open_ok
      report "Mp: This error occured while trying to open the .wav file: " &
      file_open_status'image(vWaveInFileState)
      severity failure;

    -- Evaluate the RIFF chunk.
    -- We don't know the chunk length from beginning, but we expect the string
    -- "RIFF" followed by the length in unsigned long int format. Adding up the
    -- bytes needed for this information results in 8.
    vRemainingRiffCkLength := 8;
    -- Read the string at the beginning of the chunk.
    Read4Cc (WaveInFile, vChunkId, vRemainingRiffCkLength);
    -- Is it the string we hope to find at the beginning of the file?
    assert vChunkId = "RIFF"
      -- Break the reading sequence if an error occured.
      report "Mp: Input file is not a valid RIFF file (e.g. .wav)!"
      severity failure;
    -- The file is ok up to here so...
    report "Mp: Encounterd RIFF chunk";
    -- Read the length of the RIFF chunk.
    ReadIntelDword (WaveInFile, vRiffCkLength, vRemainingRiffCkLength);
    -- Keep in mind how long we have to go before the end of the file is reached.
    vRemainingRiffCkLength := vRiffCkLength;
    -- There are a lot of different RIFF formats out there. The only one we are
    -- interested in is the WAVE format.
    Read4Cc (WaveInFile, vChunkId, vRemainingRiffCkLength);
    assert vChunkId = "WAVE"
      -- Break the reading sequence because an error occured.
      report "Mp: Input file is not a valid WAVE file (.wav)!"
      severity warning;
    -- The file is still ok, go ahead...
    report "Mp: WAVE format is indicated for RIFF file.";

    ----------------------------------------------------------------------------
    -- Read in format and all data chunks
    ----------------------------------------------------------------------------
    -- Read until you reach the end of the file.
    AllOfRiffCk : while vRemainingRiffCkLength > 0 loop
      -- The next information we should encounter is a chunk ID. We are capable
      -- of reading a single "fmt" followed by several "data" chunks.
      Read4Cc (WaveInFile, vChunkId, vRemainingRiffCkLength);
      case vChunkId is

        ------------------------------------------------------------------------
        -- "fmt" chunk
        ------------------------------------------------------------------------
        when "fmt " =>
          -- Be sure that there's only a single format chunk in this file.
          assert not(vFmtCkWentBy)
            -- Failure: Break the reading sequence.
            report "Mp: Second format chunk found in .wav input file."
            severity failure;
          -- We are so happy that we've found the format chunk that we should
          -- tell the user about it.
          report "Mp: Encountered fmt chunk.";
          -- Notify that a format chunk was encountered. This is done only for
          -- the case that there is a second format chunk in this file. This
          -- would be an error.
          vFmtCkWentBy           := true;
          -- How long is the format chunk?
          ReadIntelDword (WaveInFile, vFmtCkLength, vRemainingRiffCkLength);
          -- Now that we know the length of the format chunk, let's adjust the
          -- remaining length of the whole RIFF chunk for the time after the
          -- format chunk is completely read.
          vRemainingRiffCkLength := vRemainingRiffCkLength - vFmtCkLength;
          -- Counting down the chunk length of the chunk we are actually in.
          -- Initialize the "bytes to go" counter.
          vRemainingFmtCkLength  := vFmtCkLength;
          -- What is the format of the wave data in this file?
          ReadIntelWord (WaveInFile, vFormatTag, vRemainingFmtCkLength);
          -- Are we able to interpret this particular format?
          assert vFormatTag = 1
            -- Failure: Break the reading sequence.
            report "Mp: Only format allowed for .wav files is Microsoft PCM" & LF &
            "Used format: " & aWord'image(vFormatTag) & " ."
            severity failure;
          -- Read the number of audio channels. 1 means mono, 2 stereo, no more
          -- than 2 channels are allowed.
          ReadIntelWord (WaveInFile, vNumChannels, vRemainingFmtCkLength);
          assert (vNumChannels <= 2)
            -- Failure: Brak the reading sequence.
            report "Mp: More than 2 channels in .wav file. Only stereo and" & LF &
            "mono are allowd."
            severity failure;
          assert vNumChannels = 2
            report "Mp: Will send mono signal to both channels."
            severity warning;
          -- Read the sample rate.
          ReadIntelDword (WaveInFile, vSampleRate, vRemainingFmtCkLength);
          report "Mp: Sampling rate in .wav file is: " & aDword'image(vSampleRate);
          -- We are able to us a custom sample rate on the data in the wave
          -- file. This sample rate replaces the sample rate we just read. It is
          -- given via generic gSampleRate. Only if that generic has the value 0
          -- the sample rate defined in the .wav file will be used.
          assert abs(gSampleRate-vSampleRate) < 100
            report "Mp: Sample rates of .wav file and generic setting differ more than 10 Hz."
            severity warning;
          -- Read the byte rate and the byte alignment. These values are not
          -- very useful, because we can compute them from the other information
          -- contained in the format chunk.
          ReadIntelDword (WaveInFile, vBytesRate, vRemainingFmtCkLength);
          ReadIntelWord (WaveInFile, vBlockAlign, vRemainingFmtCkLength);
          -- What is the bit width of the sample data?
          ReadIntelWord (WaveInFile, vBitsPerSample, vRemainingFmtCkLength);
          assert (vBitsPerSample = 16)
            report "Mp: Only 16 bits per sample are allowed." & LF &
            "Bits per sample in the file: " & aWord'image(vBitsPerSample)
            severity failure;
          -- While the format chunk will be at its end in most cases, some .wav
          -- files encountered have additional information in this chunk. Read
          -- on, even though we do not understand what we read.
          while vRemainingFmtCkLength > 0 loop
            ReadByte (WaveInFile, vUninterestingByte, vRemainingFmtCkLength);
          end loop;

          ------------------------------------------------------------------------
          -- "data" chunk
          ------------------------------------------------------------------------
        when "data" =>
          -- If we encounter a data chunk we should have read a format chunk
          -- before. Otherwise there's no way to know how to interpret the data chunk.
          assert vFmtCkWentBy
            report "Mp: Data chunk appeared before fmt chunk."
            severity failure;
          -- Inform the user about the arrival of the data chunk.
          report "Mp: Encountered data chunk.";
          -- No data at the digital interface for this moment.
          oValL <= cInactivated;
          oValR <= cInactivated;
          oDL   <= (oDL'range => '0');
          oDR   <= (oDR'range => '0');
          -- Initialize the reading of data words from the .wav file.
          ReadIntelDword(WaveInFile, vDataCkLength, vRemainingRiffCkLength);
          -- Simulation of .wav files may take an enormous amount of time. Tell
          -- the user how long this particular data chunk will last.
          report "Mp: Current data chunk in input .wav file will last for " &
            time'image((1 sec / vSampleRate) * vDataCkLength /
                       (vBitsPerSample/8 * vNumChannels)) & LF &
            "of simulation time.";
          -- We will organize the count down for the chunk length locally for
          -- this chunk.
          vRemainingDataCkLength := vDataCkLength;
          -- Adjust the remaining RIFF chunk length for the time when we come
          -- back from reading this data chunk.
          vRemainingRiffCkLength := vRemainingRiffCkLength - vDataCkLength;
          -- Wait for the left side of iLrc
          wait until (iLrc = '0' and iLrc'last_value = '1');
          -- Go through the whole data section of the .wav file.
          OverAllSamples : while vRemainingDataCkLength > 0 loop
            ReadSample : if vNumChannels = 1 then
              -- Mono, 16 bit samples: 2's complement
              ReadByte (WaveInFile, vByteRead, vRemainingDataCkLength);
              vDL(-8 downto -15) := aAudioDataHByte(
                aSignedByte(
                  to_unsigned(vByteRead, 8)
                  )
                );
              ReadByte (WaveInFile, vByteRead, vRemainingDataCkLength);
              vDL(0 downto -7) := aAudioDataHByte(
                aSignedByte(
                  to_unsigned(vByteRead, 8)
                  )
                );
              vDR := vDL;
            else
              -- Stereo, 16 bit samples: 2's complement
              ReadByte (WaveInFile, vByteRead, vRemainingDataCkLength);
              vDL(-8 downto -15) := aAudioDataHByte(
                aSignedByte(to_unsigned(vByteRead, 8))
                );
              ReadByte (WaveInFile, vByteRead, vRemainingDataCkLength);
              vDL(-0 downto -7) := aAudioDataHByte(
                aSignedByte(to_unsigned(vByteRead, 8))
                );
              ReadByte (WaveInFile, vByteRead, vRemainingDataCkLength);
              vDR(-8 downto -15) := aAudioDataHByte(
                aSignedByte(to_unsigned(vByteRead, 8))
                );
              ReadByte (WaveInFile, vByteRead, vRemainingDataCkLength);
              vDR(-0 downto -7) := aAudioDataHByte(
                aSignedByte(to_unsigned(vByteRead, 8))
                );
            end if ReadSample;
            -- This is the point there the next valid pair of samples is
            -- available. Our position in simulation is immediately after a rising edge
            -- of iClk.
            -- Activate the digital outputs for one clk cycle.
            oValL <= cActivated;
            oDL   <= vDL;
            -- Val stays activated during one iClk cycle.
            wait until iClk = '1' and iClk'last_value = '0';
            oValL <= cInactivated;
            -- Wait for the right side of iLrc
            wait until (iLrc = '1' and iLrc'last_value = '0');
            oValR <= cActivated;
            oDR   <= vDR;
            -- Val stays activated during one iClk cycle.
            wait until iClk = '1' and iClk'last_value = '0';
            oValR <= cInactivated;
            -- Wait for the left side of iLrc
            wait until (iLrc = '0' and iLrc'last_value = '1');
          end loop OverAllSamples;
          report "Mp: Read all samples from data chunk of .wav file.";

          -- Reading subchunk:
        when others =>
          report "Mp: Encounterd and ignored unknown chunk type: " &
            vChunkId & " chunk." & "Chunk will be ignored!";
          ReadIntelDword(WaveInFile, vIgnoreCkLength, vRemainingRiffCkLength);
          ReadGarbage : for CkPointer in 1 to vIgnoreCkLength loop
            ReadByte (WaveInFile, vByteRead, vRemainingRiffCkLength);
          end loop ReadGarbage;

      end case;
    end loop AllOfRiffCk;
    oWaveAtEnd <= true;

    report "Mp: Sending silence from now on."
      severity note;
    oDL <= cSilence;
    oDR <= cSilence;
    loop
      -- This is the point there the next valid pair of samples is
      -- available. Our position in simulation is immediately after a rising edge
      -- of iClk.
      -- Activate the digital outputs for one clk cycle.
      oValL <= cActivated;
      -- Val stays activated during one iClk cycle.
      wait until iClk = '1' and iClk'last_value = '0';
      oValL <= cInactivated;
      -- Wait for the right side of iLrc
      wait until (iLrc = '1' and iLrc'last_value = '0');
      oValR <= cActivated;
      -- Val stays activated during one iClk cycle.
      wait until iClk = '1' and iClk'last_value = '0';
      oValR <= cInactivated;
      -- Wait for the left side of iLrc
      wait until (iLrc = '0' and iLrc'last_value = '1');
    end loop;

    wait;
  end process ReadItIn;
  
end architecture Bhv;

