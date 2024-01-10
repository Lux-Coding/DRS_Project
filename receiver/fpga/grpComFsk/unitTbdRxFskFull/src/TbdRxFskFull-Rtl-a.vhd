architecture Rtl of TbdRxFskFull is

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

  signal MODEM_RX_CHANNEL : unsigned(3 downto 0);
  signal RxChannelInput  : std_ulogic;
  signal RxChannelSync   : std_ulogic;
  signal RxChannelSelect : natural range 0 to 11;
  
  signal RxDataOutput     : std_ulogic;
  signal RxDataOutputSync : std_ulogic;
  
  signal MirrorHpsLed : std_ulogic;

  signal RxChannelLedOutput: std_ulogic;
  
begin

  TheHPSComputer1: entity work.HPSComputer1
    port map (
      CLOCK_50         => iClk,
      FPGA_RESET_N     => nResetAsync,
      FPGA_UART_TX     => RxDataOutputSync,
      FPGA_UART_RX     => open,
      MODEM_TX_CHANNEL => open,
      MODEM_TX_7SEG    => oSEG3,
      MODEM_RX_CHANNEL => MODEM_RX_CHANNEL,
      MODEM_RX_7SEG    => oSEG2,
      SEVEN_SEGMENT_0  => oSEG0,
      SEVEN_SEGMENT_1  => oSEG1,
      MIRROR_HPS_LED   => MirrorHpsLed,
      HPS_DDR3_ADDR    => HPS_DDR3_ADDR,
      HPS_DDR3_BA      => HPS_DDR3_BA,
      HPS_DDR3_CK_P    => HPS_DDR3_CK_P,
      HPS_DDR3_CK_N    => HPS_DDR3_CK_N,
      HPS_DDR3_CKE     => HPS_DDR3_CKE,
      HPS_DDR3_CS_N    => HPS_DDR3_CS_N,
      HPS_DDR3_RAS_N   => HPS_DDR3_RAS_N,
      HPS_DDR3_CAS_N   => HPS_DDR3_CAS_N,
      HPS_DDR3_WE_N    => HPS_DDR3_WE_N,
      HPS_DDR3_RESET_N => HPS_DDR3_RESET_N,
      HPS_DDR3_DQ      => HPS_DDR3_DQ,
      HPS_DDR3_DQS_P   => HPS_DDR3_DQS_P,
      HPS_DDR3_DQS_N   => HPS_DDR3_DQS_N,
      HPS_DDR3_ODT     => HPS_DDR3_ODT,
      HPS_DDR3_DM      => HPS_DDR3_DM,
      HPS_DDR3_RZQ     => HPS_DDR3_RZQ,
      HPS_ENET_GTX_CLK => HPS_ENET_GTX_CLK,
      HPS_ENET_MDC     => HPS_ENET_MDC,
      HPS_ENET_MDIO    => HPS_ENET_MDIO,
      HPS_ENET_RX_CLK  => HPS_ENET_RX_CLK,
      HPS_ENET_RX_DATA => HPS_ENET_RX_DATA,
      HPS_ENET_RX_DV   => HPS_ENET_RX_DV,
      HPS_ENET_TX_DATA => HPS_ENET_TX_DATA,
      HPS_ENET_TX_EN   => HPS_ENET_TX_EN,
      HPS_ENET_INT_N   => HPS_ENET_INT_N,
      HPS_FLASH_DATA   => HPS_FLASH_DATA,
      HPS_FLASH_DCLK   => HPS_FLASH_DCLK,
      HPS_FLASH_NCSO   => HPS_FLASH_NCSO,
      HPS_I2C_CONTROL  => HPS_I2C_CONTROL,
      HPS_I2C1_SCLK    => HPS_I2C1_SCLK,
      HPS_I2C1_SDAT    => HPS_I2C1_SDAT,
      HPS_I2C2_SCLK    => HPS_I2C2_SCLK,
      HPS_I2C2_SDAT    => HPS_I2C2_SDAT,
      HPS_SD_CMD       => HPS_SD_CMD,
      HPS_SD_CLK       => HPS_SD_CLK,
      HPS_SD_DATA      => HPS_SD_DATA,
      HPS_USB_CLKOUT   => HPS_USB_CLKOUT,
      HPS_USB_DATA     => HPS_USB_DATA,
      HPS_USB_DIR      => HPS_USB_DIR,
      HPS_USB_NXT      => HPS_USB_NXT,
      HPS_USB_STP      => HPS_USB_STP,
      HPS_CONV_USB_N   => HPS_CONV_USB_N,
      HPS_SPIM_CLK     => HPS_SPIM_CLK,
      HPS_SPIM_MISO    => HPS_SPIM_MISO,
      HPS_SPIM_MOSI    => HPS_SPIM_MOSI,
      HPS_SPIM_SS      => HPS_SPIM_SS,
      HPS_UART_TX      => HPS_UART_TX,
      HPS_UART_RX      => HPS_UART_RX,
      HPS_KEY          => HPS_KEY,
      HPS_LED          => HPS_LED,
      HPS_LTC_GPIO     => HPS_LTC_GPIO,
      HPS_GSENSOR_INT  => HPS_GSENSOR_INT
    );

  PLL_50MHz_48MHz : entity work.PLL50to48
    port map (
      inResetAsync => nResetAsync,
      iClk50MHz    => iClk,
      oClk48MHz    => Clk48MHz,
      oLocked      => PllLocked);

  -- Start will be activated some strobes after reset is released. And
  -- will be deactivated as soon as the codec is configured.
  CountDownOnce : process (Clk48MHz, nResetAsync) is
  begin
    if (nResetAsync = cResetActive) then
      WaitCtr <= (others => '1');
      Start   <= cInactivated;
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
      ioI2cSdin    => ioI2cSdin);

  -- Strobe for configuration speed control
  GenStrobeI2C : entity work.StrobeGen
    generic map (
      gClkFrequency    => gClkFrequency,
      gStrobeFrequency => cI2cStrobeFrequency)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => nResetAsync,
      oStrobe      => StrobeI2C);

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
      oADClrc      => ADClrc);

  oADClrc <= ADClrc;
  oMclk   <= Mclk;
  oBclk   <= Bclk;

  RxChannelInput <= MODEM_RX_CHANNEL(0);

  SyncSwitchInput: entity work.Sync
    generic map (
      gInitialState => '0',
      gDepth        => 2
    )
    port map (
      iClk         => iClk,
      inResetAsync => nResetAsync,
      iAsync       => RxChannelInput,
      oSync        => RxChannelSync
    );

  RxChannelSelect <= 4 when RxChannelSync = cInactivated else 7;
  RxChannelLedOutput <= cActivated when RxChannelSelect = 4 else cInactivated;
  
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
      oValR        => ValDryR);

  TheRxFsk: entity work.RxFsk
    generic map (
      gClkFrequency      => gClkFrequency,
      gAudioBitWidth     => gAudioBitWidth,
      gSampleRate        => gSampleRate,
      gCoefWidth         => gCoefWidth,
      gChannelBandpasses => gChannelBandpasses,
      gLowpass           => gLowpass
    )
    port map (
      inResetAsync   => nResetAsync,
      iClk           => Clk48MHz,
      iChannelSelect => RxChannelSelect,
      iVal           => ValDryL,
      iD             => Ddry,
      oD             => RxDataOutput
    );

  SyncRxDataOutput: entity work.Sync
    generic map (
      gInitialState => '0',
      gDepth        => 2
    )
    port map (
      iClk         => iClk,
      inResetAsync => nResetAsync,
      iAsync       => RxDataOutput,
      oSync        => RxDataOutputSync
    );

  DwetL   <= Ddry;
  ValWetL <= ValDryL;
  DwetR   <= Ddry;
  ValWetR <= ValDryL;

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

  --oSEG5 <= "1000000";
  oSEG4 <= "1000000";
  --oSEG3 <= "1000000";
  --oSEG2 <= "1000000";
  -- oSEG1 <= "1000000";
  oSEG5 <= not ToSevSeg(to_unsigned(RxChannelSelect, 4)); -- show selected channel on hex segment display
  
  oLed  <= (0 => PllLocked,
            1 => Start,
            2 => Configured,
            3 => RxChannelSync, -- synced switch input
            4 => RxChannelLedOutput, -- 1 when Channel 4, 0 when Channel 7
            5 => RxDataOutputSync, -- received data output
            6 => MirrorHpsLed,
            others => cInactivated);


end architecture Rtl;
