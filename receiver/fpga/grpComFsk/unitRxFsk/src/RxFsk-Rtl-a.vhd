--------------------------------------------------------------------------------
-- Title       : FSK receiver
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: RxFsk-Rtl-a.vhd 733 2017-12-04 02:28:35Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of RxFsk is

  type aBandpassResults is array(gChannelBandpasses'range) of aAudioData(0 downto -(cDefaultAudioBitWidth-1));

  signal BandpassResults0 : aBandpassResults;
  signal BandpassResults1 : aBandpassResults;
  signal ValBandpassResults : std_ulogic_vector(gChannelBandpasses'range);

  signal BandpassResult0 : aAudioData(0 downto -(cDefaultAudioBitWidth-1));
  signal BandpassResult1 : aAudioData(0 downto -(cDefaultAudioBitWidth-1));
  signal ValBandpassResult : std_ulogic;

  signal Absolute0 : aAudioData(0 downto -(cDefaultAudioBitWidth-1));
  signal Absolute1 : aAudioData(0 downto -(cDefaultAudioBitWidth-1));

  signal Substracted : aAudioData(0 downto -(cDefaultAudioBitWidth-1));

  signal LowpassResult : aAudioData(0 downto -(cDefaultAudioBitWidth-1));
  signal ValLowpassResult : std_ulogic;
  
begin

  -- Bandpass filters
  Bandpasses: for vChannel in gChannelBandpasses'range generate

    Bandpass0: entity work.DspFir
    generic map (
      gAudioBitWidth  => gAudioBitWidth,
      gCoefWidth      => gCoefWidth,
      gB              => gChannelBandpasses(vChannel).Bandpass0
    )
    port map (
      iClk         => iClk,
      inResetAsync => inResetAsync,
      iDdry        => iD,
      iValDry      => iVal,
      oDwet        => BandpassResults0(vChannel),
      oValWet      => ValBandpassResults(vChannel)
    );

    Bandpass1: entity work.DspFir
    generic map (
      gAudioBitWidth  => gAudioBitWidth,
      gCoefWidth      => gCoefWidth,
      gB              => gChannelBandpasses(vChannel).Bandpass1
    )
    port map (
      iClk         => iClk,
      inResetAsync => inResetAsync,
      iDdry        => iD,
      iValDry      => iVal,
      oDwet        => BandpassResults1(vChannel)
      -- oValWet from Bandpass0 - they are the same
    );

  end generate;

  -- Take any of the valid signals - all are the same
  ValBandpassResult <= ValBandpassResults(gChannelBandpasses'high);

  -- Channel selection
  ChannelSelect0: BandpassResult0 <= BandpassResults0(iChannelSelect);
  ChannelSelect1: BandpassResult1 <= BandpassResults1(iChannelSelect);

  -- Absolute calculation
  Absolute0 <= ResizeTruncAbsVal(abs(BandpassResult0), Absolute0);
  Absolute1 <= ResizeTruncAbsVal(abs(BandpassResult1), Absolute1);

  -- Subtraction
  Substracted <= ResizeTruncAbsVal(Absolute1 - Absolute0, Substracted);

  -- Lowpass filter
  Lowpass: entity work.DspFir
    generic map (
      gAudioBitWidth  => gAudioBitWidth,
      gCoefWidth      => gCoefWidth,
      gB              => gLowpass
    )
    port map (
      iClk         => iClk,
      inResetAsync => inResetAsync,
      iDdry        => Substracted,
      iValDry      => ValBandpassResult,     -- muss noch verzögert werden, falls Pipeline-stufen.
      oDwet        => LowpassResult,
      oValWet      => ValLowpassResult
    );

  -- Serial data bits output
  Output: process(iClk, inResetAsync)
  begin
    if inResetAsync = cnActivated then
      oD <= cInactivated;
    elsif rising_edge(iClk) then
      if ValLowpassResult = cActivated then
        if LowpassResult >= to_sfixed(0, LowpassResult) then
          oD <= cActivated;
        else
          oD <= cInactivated;
        end if;
      end if;
    end if;
  end process Output;
  
end architecture Rtl;
