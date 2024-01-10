--------------------------------------------------------------------------------
-- Title       : Synchronize two audio channels
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: DspSyncChannels-Rtl-a.vhd 704 2017-10-27 19:25:59Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of DspSyncChannels is

  constant cSilence : aAudioData(0 downto -(gAudioBitWidth-1)) :=
    (others => '0');

  signal LastDdryR : aAudioData(0 downto -(gAudioBitWidth-1));

begin

  oValWetL <= iValDryL;
  oDwetL   <= iDdryL;

  -- Wait for the validity of the right audio data and store the data when it's
  -- valid.
  StoreAudioDR : process (iClk, inResetAsync) is
  begin
    if (inResetAsync = cResetActive) then
      LastDdryR <= cSilence;
    elsif rising_edge(iClk) then
      if iValDryR = cActivated then
        LastDdryR <= iDdryR;
      end if;
    end if;
  end process StoreAudioDR;

  -- Data for the right channel has to be valid at the same time as the data for
  -- the left channel.
  oValWetR <= iValDryL;

  -- The data for the right channel was hold when it was valid. We must not
  -- loose any time here: data available at the input has to be routed directly
  -- to the output when it is valid.
  oDwetR <= iDdryR when iValDryR = cActivated else
            LastDdryR;

end RTL;
