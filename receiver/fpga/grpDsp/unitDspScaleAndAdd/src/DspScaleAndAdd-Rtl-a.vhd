--------------------------------------------------------------------------------
-- Title       : Scale and add amplitudes
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: DspScaleAndAdd-Rtl-a.vhd 704 2017-10-27 19:25:59Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : oDwet(t) := iDdry1(t) * gScaleFactor(1)
--                         + iDdry2(t) * gScaleFactor(2)
--------------------------------------------------------------------------------

architecture Rtl of DspScaleAndAdd is

  -- Zwischenergebnisse
  signal MultD1 : aAudioData(1 downto -2*(gAudioBitWidth-1));
  signal MultD2 : aAudioData(1 downto -2*(gAudioBitWidth-1));
  signal ScaledD1 : aAudioData(0 downto -(gAudioBitWidth-1));
  signal ScaledD2 : aAudioData(0 downto -(gAudioBitWidth-1));

  -- Results
  signal Dwet     : aAudioData(0 downto -(gAudioBitWidth-1));
  signal Valid    : std_ulogic;

begin

  MultD1 <= iDdry1 * gScaleFactor(1);
  MultD2 <= iDdry2 * gScaleFactor(2);
  ScaledD1 <= ResizeTruncAbsVal(MultD1, ScaledD1);
  ScaledD2 <= ResizeTruncAbsVal(MultD2, ScaledD2);

  Dwet <= ResizeTruncAbsVal(ScaledD1 + ScaledD2, ScaledD1);
  Valid <= iValDry;

  DontRegisterOutputs : if not gRegisteredOutputs generate
  begin
    oDwet <= Dwet;
    oValWet <= Valid;
  end generate DontRegisterOutputs;

  RegisterOutputs : if gRegisteredOutputs generate
  begin
    Registers: process(inResetAsync, iClk)
    begin
      if inResetAsync = cnActivated then
        oDwet <= (others => cInactivated);
        oValWet <= cInactivated;        
      elsif rising_edge(iClk) then
        oDwet <= Dwet;
        oValWet <= Valid;        
      end if;
    end process Registers;
  end generate RegisterOutputs;

end Rtl;
