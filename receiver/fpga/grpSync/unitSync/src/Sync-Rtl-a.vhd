--------------------------------------------------------------------------------
-- Title       : Synchronize asynchronous signals
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: Sync-Rtl-a.vhd 746 2017-12-04 12:01:02Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2006-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of Sync is

  signal Metastable : std_ulogic_vector(gDepth-1 downto 0);
  
begin  -- Rtl

  Synchronize : process (iClk, inResetAsync)
  begin
    if (inResetAsync = cResetActive) then
      Metastable <= (others => gInitialState);
    elsif rising_edge(iClk) then  -- rising clock edge
      Metastable(0) <= iAsync;
      Metastable(Metastable'high downto 1) <= Metastable(Metastable'high-1 downto 0);
    end if;
  end process Synchronize;
  
  oSync <= Metastable(Metastable'high);
  
end Rtl;
