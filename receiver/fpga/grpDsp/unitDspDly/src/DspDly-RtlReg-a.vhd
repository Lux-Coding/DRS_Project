--------------------------------------------------------------------------------
-- Title       : z^{-1} delay
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: DspDly-RtlReg-a.vhd 711 2017-11-03 18:22:43Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Implementation infering registers
--------------------------------------------------------------------------------

architecture RtlReg of DspDly is

  -- subtype a_audio_buffer_t is std_ulogic_vector(gAudioBitWidth - 1 downto 0);

  type a_audio_buffer_t is array (gDelay - 1 downto 0) of aAudioData(0 downto -(gAudioBitWidth - 1));

  signal audio_buffer: a_audio_buffer_t;

begin

  AudioShifter: process (iClk, inResetAsync) is
  begin
    if inResetAsync = cnActivated then
      -- reset the audio buffer
      audio_buffer <= (others => (others => '0'));
    elsif rising_edge(iClk) and iValDry = cActivated then
      audio_buffer(0) <= iDdry;

      for I in 1 to audio_buffer'high loop
        audio_buffer(I) <= audio_buffer(I - 1);
      end loop;
      
    end if;
  end process;

  oDwet <= audio_buffer(audio_buffer'high);

end RtlReg;
