--------------------------------------------------------------------------------
-- Title       : Write parallel digital audio data stream into a .wav file
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: ParToWav-Bhv-a.vhd 704 2017-10-27 19:25:59Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Not intended for synthesis!
--               After the input wave is at its end the unit will write
--               additional samples into the WavOutFile. This is only done with
--               valid samples (i.e. the valid line has to be activated to flag
--               the sample valid).
-------------------------------------------------------------------------------

architecture Bhv of ParToWav is

  constant cSilence : aAudioData(0 downto -(gAudioBitWidth-1)) :=
    (0 downto -(gAudioBitWidth-1) => '0');

  -- We don't need to read these values via generics, because they can be
  -- computed from the format date we already have.
  constant cBlockAlign     : aWord  := (gWavFileBitWidth/8)*gChannels;
  constant cAvgBytesPerSec : aDword := gSampleRate*cBlockAlign;

  signal StopRecording : boolean := false;

  file RawWavFile : aBinaryFile;
  file WavOutFile : aBinaryFile;

  signal DR : aAudioData(0 downto -(gAudioBitWidth-1)) := cSilence;
  
  subtype aAudioDataBasedOnSigned is signed(gAudioBitWidth-1 downto 0);
  
begin

  FlagEnd : process is
  begin
    -- Wait until the wave input is at it's end...
    wait until iWaveAtEnd;
    -- ... and then wait for some extra time.
    wait for gRecordingDurationAftWaveEnd;
    StopRecording <= true;
    wait;
  end process FlagEnd;

  StoreDR : process is
  begin
    wait until iValR = cActivated and iClk = '1' and iClk'last_value = '0';
    DR <= iDR;
  end process StoreDR;

  WriteWavFile : process is

    variable vRawWavFileState, vWavOutFileState : file_open_status;
    variable vRawWavFileLength                  : aDword := 0;
    variable vRiffLength                        : aDword := 0;
    variable vTransmitChar                      : character;
    
  begin

    ----------------------------------------------------------------------------
    -- Write the raw file
    ----------------------------------------------------------------------------
    file_open (vWavOutFileState, RawWavFile, gRawWavFileName, write_mode);
    FeedTmpWithSamples : loop
      -- Keep reading samples as long as we are not at the end.
      exit when StopRecording;
      -- The validity of the left sample is used to synchronize the writing of
      -- both samples (left and right) into the .raw-file.
      wait until iValL = cActivated and iClk'event and iClk = '1';
      -- The left sample has just been updated. The value of the last right sample
      -- that came in is stored in DR...
      -- ...write them to the temporary file
      WriteIntelWord (
        RawWavFile,
        aAudioDataBasedOnSigned(
          iDL(0 downto -(gWavFileBitWidth-1))
          ),
        vRawWavFileLength
        );
      WriteIntelWord (
        RawWavFile,
        aAudioDataBasedOnSigned(
          DR(0 downto -(gWavFileBitWidth-1))
          ),
        vRawWavFileLength
        );
    end loop FeedTmpWithSamples;
    -- It's time to say goodbye.
    file_close (RawWavFile);
    report "Pff: Output file closed now.";

    ----------------------------------------------------------------------------
    -- Write the header of the .wav file
    ----------------------------------------------------------------------------
    -- transform the temporary file into a file of correct .wav format
    file_open (vRawWavFileState, RawWavFile, gRawWavFileName, read_mode);
    file_open (vWavOutFileState, WavOutFile, gWavFileName, write_mode);
    report "Pff: Writing .wav file " & gWavFileName & LF &
      "Please wait...";
    vRiffLength := 0; WriteFourCc (WavOutFile, "RIFF", vRiffLength);
    -- Length of the data chunk: RawWavFileLength
    -- Length of the fmt chunk: 16
    -- Structure of .wav file:
    -- "RIFF", LengthRiffCk, "WAVE", "fmt ", LengthFmtCk, 16 bytes, "data", LengthDataCk
    -- (4)   , (4)         , 4     , 4     , 4          , 16      , 4     , 4, RawWavFileLength
    WriteIntelDword (WavOutFile, (4+4+4+16+4+4+vRawWavFileLength), vRiffLength);
    WriteFourCc (WavOutFile, "WAVE", vRiffLength);
    WriteFourCc (WavOutFile, "fmt ", vRiffLength);
    WriteIntelDword (WavOutFile, 16, vRiffLength);
    WriteIntelWord (WavOutFile, gFormatTag, vRiffLength);
    WriteIntelWord (WavOutFile, gChannels, vRiffLength);
    WriteIntelDword (WavOutFile, gSampleRate, vRiffLength);
    WriteIntelDword (WavOutFile, cAvgBytesPerSec, vRiffLength);
    WriteIntelWord (WavOutFile, cBlockAlign, vRiffLength);
    WriteIntelWord (WavOutFile, gWavFileBitWidth, vRiffLength);
    WriteFourCc (WavOutFile, "data", vRiffLength);
    WriteIntelDword (WavOutFile, vRawWavFileLength, vRiffLength);
    assert vRiffLength = 44
      report "Pff: Length of data for RIFF file doesn't meet expected value, " & LF &
      "but is " & aDword'image(vRiffLength)
      severity failure;

    ----------------------------------------------------------------------------
    -- Add the wave data to the .wav file header
    ----------------------------------------------------------------------------
    TransmitWaveData : while not(endfile(RawWavFile)) loop
      Read (RawWavFile, vTransmitChar);
      Write (WavOutFile, vTransmitChar);
    end loop TransmitWaveData;
    file_close (WavOutFile);
    file_close (RawWavFile);
    assert false
      report "Pff: Written .wav file. Suspend Par2Wav model forever."
      severity failure;
    wait;
  end process WriteWavFile;
  
end Bhv;

