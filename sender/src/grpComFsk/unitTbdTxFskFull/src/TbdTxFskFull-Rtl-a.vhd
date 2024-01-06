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

architecture Rtl of TbdTxFskFull is

  constant cI2cStrobeFrequency : natural := 750E3;
  constant cMclkFrequency      : natural := 12E6;
  constant cCodecParamSet      : aParamSetName := MicroSlaveSampleRate44k1;

  signal Clk48MHz    : std_ulogic;
  signal PllLocked   : std_ulogic;
  signal nResetAsync : std_ulogic;
  
  signal StrobeI2C        : std_ulogic;
  signal Start            : std_ulogic;
  signal StartSending     : std_ulogic;
  signal Configured       : std_ulogic;
  signal WaitCtr          : unsigned(1 downto 0);
  signal Mclk             : std_ulogic;
  signal Bclk             : std_ulogic;
  signal ADClrc           : std_ulogic;
  signal ValDryL, ValDryR : std_ulogic;
  signal micro_strobe     : std_ulogic;
  signal Ddry             : aAudioData(0 downto -(gAudioBitWidth-1));
  signal ValWetL, ValWetR : std_ulogic;
  signal DwetL, DwetR     : aAudioData(0 downto -(gAudioBitWidth-1));

  signal TxChannelInput  : unsigned(3 downto 0);
  signal TxChannelSync   : std_ulogic;
  signal TxChannelSelect : natural range 0 to 1;
  
  signal TxDataInput  : std_ulogic;
  signal TxDataSync   : std_ulogic;
  
  signal MirrorHpsLed : std_ulogic;

  signal PhaseStrobe          : std_ulogic;
  signal oldADClrc            : std_ulogic;

begin

  PLL_50MHz_48MHz : entity work.PLL50to48
    port map (
      inResetAsync => nResetAsync,
      iClk50MHz    => iClk,
      oClk48MHz    => Clk48MHz,
      oLocked      => PllLocked
    );

   -- Start will be activated some strobes after reset is released. And
  -- will be deactivated as soon as the codec is configured.
  CountDownOnce : process (Clk48MHz, nResetAsync) is
    begin
      if (nResetAsync = cResetActive) then
        WaitCtr <= (others => '1');
        Start   <= cInactivated;
        StartSending <= cInactivated;
      elsif rising_edge(Clk48MHz) then  -- rising clock edge
        if (Configured = cInactivated) then
          if (StrobeI2C = cActivated) then
            if (WaitCtr = 0) then
              Start   <= cActivated;
            else
              WaitCtr <= WaitCtr - 1;
              Start <= cInactivated;
            end if;
          end if;
        else
          Start <= cInactivated;
          StartSending <= cActivated;
        end if;
      end if;
    end process CountDownOnce;

  -- Audio codec configuration programmer
  ConfigureCodec : entity work.ConfigureCodecViaI2c
    generic map (
      gChoosenParamSet => cCodecParamSet)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => nResetAsync,
      iStrobeI2C   => StrobeI2C,
      iStart       => Start,
      oConfigured  => Configured,
      oI2cSclk     => oI2cSclk,
      ioI2cSdin    => ioI2cSdin
    );


  -- Strobe for configuration speed control
  GenStrobeI2C : entity work.StrobeGen
    generic map (
      gClkFrequency    => gClkFrequency,
      gStrobeFrequency => cI2cStrobeFrequency)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => nResetAsync,
      oStrobe      => StrobeI2C);


    -- Strobe for configuration speed control
  GenStrobeSendSignal : entity work.StrobeGen
    generic map (
      gClkFrequency    => gClkFrequency,
      gStrobeFrequency => 1000_000)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => nResetAsync,
      oStrobe      => micro_strobe);

  -- Audio codec clock generation
  GenClks : entity work.ClkMaster
    generic map (
      gClkFrequency  => gClkFrequency,
      gMclkFrequency => cMclkFrequency,
      gSampleRate    => gSampleRate)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => nResetAsync,
      oMclk        => Mclk,
      oBclk        => Bclk,
      oADClrc      => ADClrc
    );

  oADClrc <= ADClrc;
  oMclk   <= Mclk;
  oBclk   <= Bclk;

  -- Audio codec ADC data input processor
  TheI2sToPar : entity work.I2sToPar
    generic map (
      gAudioBitWidth => gAudioBitWidth)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => nResetAsync,
      iBclk        => Bclk,
      iLrc         => ADClrc,
      iSd          => iADCdat,
      oD           => Ddry,
      oValL        => ValDryL,
      oValR        => ValDryR
    );

  -- Sync the channel selector
  TheChannelSelSync : entity work.Sync
    port map(
      iClk            => Clk48MHz,
      inResetAsync    => nResetAsync,
      iAsync          => TxChannelInput(0),
      oSync           => TxChannelSync
    );

  TxChannelSelect <= 1 when TxChannelSync = cActivated else 0;

  -- sync the switch which creates the tx data
  TheTxDataSync : entity work.Sync
    port map(
      iClk            => Clk48MHz,
      inResetAsync    => nResetAsync,
      iAsync          => TxDataInput,
      oSync           => TxDataSync
  );

  RegAdclrc : process(Clk48MHz,nResetAsync) is

    begin
  
        if (nResetAsync = not('1')) then
  
          oldADClrc <= '0';
  
        elsif (rising_edge(Clk48MHz)) then
  
          oldADClrc <= ADClrc;
  
        end if;
  
    end process;
    
  PhaseStrobe <= '1' when (ADClrc = '1') and (oldADClrc = '0') else '0';
  
  -- FSK unit with DDS inside
  TheTxFsk : entity work.TxFsk
    generic map(
    gChannels  => gChannels
    )
    -- (
    --     0 => (Frequency0 => 8099.6054687500,   -- Hz
    --           Frequency1 => 12924.9023437500),  -- Hz
    --     1 => (Frequency0 => 7237.9453125,   -- Hz
    --           Frequency1 => 12063.2421875))  -- Hz 
    -- )
    port map (
      inResetAsync    => nResetAsync,
      iClk            => Clk48MHz,
      iChannelSelect  => TxChannelSelect,
      iD              => TxDataSync,
      iSampleStrobe   => PhaseStrobe,
      oVal            => ValWetL,
      oD              => DwetL
    );


  -- HPS_Inst : entity work.HPSComputer1
  --   port map (
  --     -- CLOCK
  --     CLOCK_50         => iClk,
      
  --     -- RESET (for FPGA, generated by HPS)
  --     FPGA_RESET_N     => nResetAsync,

  --     -- UART (HPS LOAN I/O -> FPGA)
  --     FPGA_UART_TX     => cActivated,
  --     FPGA_UART_RX     => TxDataInput,
      
  --     -- HPS GPIO DEBUG
  --     MIRROR_HPS_LED   => MirrorHpsLed,
      
  --     -- DDR3 SDRAM
  --     HPS_DDR3_ADDR    => HPS_DDR3_ADDR,
  --     HPS_DDR3_BA      => HPS_DDR3_BA,
  --     HPS_DDR3_CK_P    => HPS_DDR3_CK_P,
  --     HPS_DDR3_CK_N    => HPS_DDR3_CK_N,
  --     HPS_DDR3_CKE     => HPS_DDR3_CKE,
  --     HPS_DDR3_CS_N    => HPS_DDR3_CS_N,
  --     HPS_DDR3_RAS_N   => HPS_DDR3_RAS_N,
  --     HPS_DDR3_CAS_N   => HPS_DDR3_CAS_N,
  --     HPS_DDR3_WE_N    => HPS_DDR3_WE_N,
  --     HPS_DDR3_RESET_N => HPS_DDR3_RESET_N,
  --     HPS_DDR3_DQ      => HPS_DDR3_DQ,
  --     HPS_DDR3_DQS_P   => HPS_DDR3_DQS_P,
  --     HPS_DDR3_DQS_N   => HPS_DDR3_DQS_N,
  --     HPS_DDR3_ODT     => HPS_DDR3_ODT,
  --     HPS_DDR3_DM      => HPS_DDR3_DM,
  --     HPS_DDR3_RZQ     => HPS_DDR3_RZQ,
      
  --     -- ETHERNET
  --     HPS_ENET_GTX_CLK => HPS_ENET_GTX_CLK,
  --     HPS_ENET_MDC     => HPS_ENET_MDC,
  --     HPS_ENET_MDIO    => HPS_ENET_MDIO,
  --     HPS_ENET_RX_CLK  => HPS_ENET_RX_CLK,
  --     HPS_ENET_RX_DATA => HPS_ENET_RX_DATA,
  --     HPS_ENET_RX_DV   => HPS_ENET_RX_DV,
  --     HPS_ENET_TX_DATA => HPS_ENET_TX_DATA,
  --     HPS_ENET_TX_EN   => HPS_ENET_TX_EN,
  --     HPS_ENET_INT_N   => HPS_ENET_INT_N,
      
  --     -- QSPI FLASH
  --     HPS_FLASH_DATA   => HPS_FLASH_DATA,
  --     HPS_FLASH_DCLK   => HPS_FLASH_DCLK,
  --     HPS_FLASH_NCSO   => HPS_FLASH_NCSO,
      
  --     -- I2C
  --     HPS_I2C_CONTROL  => HPS_I2C_CONTROL,
  --     HPS_I2C1_SCLK    => HPS_I2C1_SCLK,
  --     HPS_I2C1_SDAT    => HPS_I2C1_SDAT,
  --     HPS_I2C2_SCLK    => HPS_I2C2_SCLK,
  --     HPS_I2C2_SDAT    => HPS_I2C2_SDAT,
      
  --     -- SD CARD
  --     HPS_SD_CMD       => HPS_SD_CMD,
  --     HPS_SD_CLK       => HPS_SD_CLK,
  --     HPS_SD_DATA      => HPS_SD_DATA,
      
  --     -- USB
  --     HPS_USB_CLKOUT   => HPS_USB_CLKOUT,
  --     HPS_USB_DATA     => HPS_USB_DATA,
  --     HPS_USB_DIR      => HPS_USB_DIR,
  --     HPS_USB_NXT      => HPS_USB_NXT,
  --     HPS_USB_STP      => HPS_USB_STP,
  --     HPS_CONV_USB_N   => HPS_CONV_USB_N,
      
  --     -- SPI
  --     HPS_SPIM_CLK     => HPS_SPIM_CLK,
  --     HPS_SPIM_MISO    => HPS_SPIM_MISO,
  --     HPS_SPIM_MOSI    => HPS_SPIM_MOSI,
  --     HPS_SPIM_SS      => HPS_SPIM_SS,

  --     -- UART
  --     HPS_UART_TX      => HPS_UART_TX,
  --     HPS_UART_RX      => HPS_UART_RX,
      
  --     -- GPIO
  --     HPS_KEY          => HPS_KEY,
  --     HPS_LED          => HPS_LED,
  --     HPS_LTC_GPIO     => HPS_LTC_GPIO,
  --     HPS_GSENSOR_INT  => HPS_GSENSOR_INT,

  --     -- MODEM CHANNEL SELECTION
  --     MODEM_TX_CHANNEL => TxChannelInput,
  --     MODEM_TX_7SEG    => oSEG0,
  --     MODEM_RX_CHANNEL => open,
  --     MODEM_RX_7SEG    => oSEG1,

  --     -- 7-SEGMENT DISPLAY (7-Segment Hex Digit Controller)
  --     SEVEN_SEGMENT_0  => oSEG4,
  --     SEVEN_SEGMENT_1  => oSEG5
  --   );

  DwetR   <= DwetL;
  ValWetR <= ValWetL;


  -- Audio codec DAC data output processor
  TheParToI2s : entity work.ParToI2s
    generic map (
      gAudioBitWidth => gAudioBitWidth)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => nResetAsync,
      iDL          => DwetL,
      iDR          => DwetR,
      iValL        => ValWetL,
      iValR        => ValWetR,
      iBclk        => Bclk,
      oLrc         => oDAClrc,
      oSd          => oDACdat);

  oSEG2 <= "0011001" when TxChannelSync = '1' else "0000000";
  oSEG3 <= "0011001" when TxChannelSync = '1' else "0000000";

  oLed  <= (0 => PllLocked,
            1 => Start,
            2 => Configured,
            5 => TxDataSync,
            6 => TxDataSync,
            7 => TxChannelSync,
            9 => MirrorHpsLed,
            others => cInactivated);

end architecture Rtl;
