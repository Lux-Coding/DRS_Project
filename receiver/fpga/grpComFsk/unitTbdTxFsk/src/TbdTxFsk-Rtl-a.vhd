--------------------------------------------------------------------------------
-- Title       : Testbed for FSK transmitter on Altera DE1-SoC
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdTxFsk-Rtl-a.vhd 733 2017-12-04 02:28:35Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Bit stream input from UART loaned from HPS
--------------------------------------------------------------------------------

architecture Rtl of TbdTxFsk is

  constant cI2cStrobeFrequency : natural := 750E3;
  constant cMclkFrequency      : natural := 12E6;
  constant cCodecParamSet      : aParamSetName := MicroSlaveSampleRate44k1;

  signal Clk48MHz    : std_ulogic;
  signal PllLocked   : std_ulogic;
  signal nResetAsync : std_ulogic;
  
  signal StrobeI2C        : std_ulogic;
  signal Start            : std_ulogic;
  signal Configured       : std_ulogic;
  signal WaitCtr          : unsigned(1 downto 0);
  signal Mclk             : std_ulogic;
  signal Bclk             : std_ulogic;
  signal ADClrc           : std_ulogic;
  signal ValDryL, ValDryR : std_ulogic;
  signal Ddry             : aAudioData(0 downto -(gAudioBitWidth-1));
  signal ValWetL, ValWetR : std_ulogic;
  signal DwetL, DwetR     : aAudioData(0 downto -(gAudioBitWidth-1));

  signal TxChannelInput  : std_ulogic;
  signal TxChannelSync   : std_ulogic;
  signal TxChannelSelect : natural range 0 to 1;
  
  signal TxDataInput  : std_ulogic;
  signal TxDataSync   : std_ulogic;
  
  signal MirrorHpsLed : std_ulogic;
  
begin

  HPS_Inst : entity work.HPSComputerMin
    port map (
      -- CLOCK
      CLOCK_50         => iClk,
      
      -- RESET (for FPGA, generated by HPS)
      FPGA_RESET_N     => nResetAsync,
      
      ...);



end architecture Rtl;
