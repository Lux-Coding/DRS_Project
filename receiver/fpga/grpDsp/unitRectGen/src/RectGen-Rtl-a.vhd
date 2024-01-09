--------------------------------------------------------------------------------
-- Title       : Rectangular wave form generator
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: RectGen-Rtl-a.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of RectGen is

  constant cDivideBy : natural := gClkFrequency/gGenFrequency;

  signal RectLogicWave : std_ulogic;
  signal DlydLrc       : std_ulogic;
  signal LrcRiseEdge   : std_ulogic;

begin  -- architecture Rtl

  DivideClk : entity work.FreqDivider
    generic map (
      gDivideBy => cDivideBy)
    port map (
      iClk         => iClk,
      inResetAsync => inResetAsync,
      oDivdClk     => RectLogicWave);

  -- Convert the logical values of the rectangle wave into a waveform that
  -- toggles between the minimum and maximum values of the 2's complement form
  -- in which the audio values are encoded.
  oD <= aAudioData(to_signed(2**(gAudioBitWidth-1)-1, oD'length)) when RectLogicWave = '0' else
        aAudioData(to_signed(-(2**(gAudioBitWidth-1)), oD'length));

  -- Convert a rising edge into a strobe.
  Delay1Clk : process (iClk, inResetAsync) is
  begin
    if (inResetAsync = cResetActive) then
      DlydLrc <= cInactivated;
    elsif rising_edge(iClk) then
      DlydLrc <= iLrc;
    end if;
  end process Delay1Clk;

  LrcRiseEdge <= cActivated when (iLrc = '1' and DlydLrc = '0') else
                 cInactivated;

  -- Outputs should be registered to ease time budgeting in hierarchical design.
  OutputFfs : process (iClk, inResetAsync) is
  begin
    if (inResetAsync = cResetActive) then
      oVal <= cInactivated;
    elsif rising_edge(iClk) then
      oVal <= LrcRiseEdge;
    end if;
  end process OutputFfs;

end architecture Rtl;
