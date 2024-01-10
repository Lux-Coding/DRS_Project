--------------------------------------------------------------------------------
-- Title       : Read .wav files and stream into I2S protocol
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: WavToI2s-Bhv-a.vhd 704 2017-10-27 19:25:59Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Not intended for synthesis!
-------------------------------------------------------------------------------

architecture Bhv of WavToI2s is

  -- Audio Output Interface
  signal DL, DR     : aAudioData(0 downto -(gAudioBitWidth-1));
  signal ValL, ValR : std_ulogic;

  -- Audio data storage
  signal LastDL, LastDR : aAudioData(0 downto -(gAudioBitWidth-1));

begin

  WavToPar : entity work.WavToPar
    generic map (
      gWaveFileName  => gWaveFileName,
      gSampleRate    => gSampleRate,
      gAudioBitWidth => gAudioBitWidth)
    port map (
      iClk       => iClk,
      oDL        => DL,
      oDR        => DR,
      oValL      => ValL,
      oValR      => ValR,
      iLrc       => iLrc,
      oWaveAtEnd => oWaveAtEnd);

  LastDL <= DL when ValL = cActivated and iClk'event and iClk = '1';
  LastDR <= DR when ValR = cActivated and iClk'event and iClk = '1';

  GenI2SData : process is
  begin
    -- forever
    loop
      oSd <= '-';
      -- signal synchronize to the word clock.
      wait until iLrc = cLrcValMeaningLeft and iLrc'event;
      -- Wait for rising edge of Bclk
      wait until iBclk = '1' and iBclk'event;
      -- Empty bit in I2s format
      for I2sBitNr in 0 downto -(gAudioBitWidth-1) loop
        -- wait for falling edge of Bclk
        wait until iBclk = '0' and iBclk'event;
        -- update serial data output for I2S
        oSd <= DL(I2sBitNr);
      end loop;
      wait until iBclk = '0' and iBclk'event;
      oSd <= '-';
      -- wait till the right channel has to be sent
      wait until iLrc = not cLrcValMeaningLeft and iLrc'event;
      -- Wait for rising edge of Bclk
      wait until iBclk = '1' and iBclk'event;
      -- Empty bit in I2s format
      for I2sBitNr in 0 downto -(gAudioBitWidth-1) loop
        -- wait for falling edge of Bclk
        wait until iBclk = '0' and iBclk'event;
        -- update serial data output for I2S
        oSd <= DR(I2sBitNr);
      end loop;
      wait until iBclk = '0' and iBclk'event;
    end loop;
  end process;

end architecture Bhv;

