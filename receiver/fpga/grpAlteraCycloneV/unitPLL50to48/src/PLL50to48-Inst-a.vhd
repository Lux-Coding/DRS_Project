--------------------------------------------------------------------------------
-- Title       : PLL instantiation helper
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: PLL50to48-Inst-a.vhd 664 2017-09-26 19:39:57Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2012-2016
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Inst of PLL50to48 is

  constant cIsSimulation : boolean := false
    --pragma synthesis_off
                                      or true
    --pragma synthesis_on
    ;

  component AlteraPLL50to48

    port (
      refclk   : in  std_logic := '0';
      rst      : in  std_logic := cInactivated;
      outclk_0 : out std_logic;
      locked   : out std_logic);

  end component;

  -- component ports
  signal ResetAsync : std_ulogic;

begin  -- architecture Inst

  GeneratePLLForSyn : if not cIsSimulation generate

    ResetAsync <= not inResetAsync;

    AlteraPLL50to48_rtl : component AlteraPLL50to48
      port map (
        refclk   => iClk50MHz,
        rst      => ResetAsync,
        outclk_0 => oClk48MHz,
        locked   => oLocked);

  end generate;

  SkipPLLForSim : if cIsSimulation generate

    oClk48MHz <= iClk50MHz;
    oLocked   <= cActivated;

  end generate;

end architecture Inst;
