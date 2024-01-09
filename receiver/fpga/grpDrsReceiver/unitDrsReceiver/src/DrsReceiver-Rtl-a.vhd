architecture Rtl of DrsReceiver is

    constant cI2cStrobeFrequency : natural := 750E3;
    constant cMclkFrequency      : natural := 12E6;
    constant cCodecParamSet      : aParamSetName := MicroSlaveSampleRate44k1;

    signal Clk48MHz    : std_ulogic;
    signal PllLocked   : std_ulogic;

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

    signal RxChannelSync   : std_ulogic;
    signal RxChannelSelect : natural range 0 to 11;

    signal RxDataOutput     : std_ulogic;
    signal RxDataOutputSync : std_ulogic;
    
    signal RxChannelLedOutput: std_ulogic;

begin

    PLL_50MHz_48MHz : entity work.PLL50to48
    port map (
        inResetAsync => inResetAsync,
        iClk50MHz    => iClk,
        oClk48MHz    => Clk48MHz,
        oLocked      => PllLocked);

    -- Start will be activated some strobes after reset is released. And
    -- will be deactivated as soon as the codec is configured.
    CountDownOnce : process (Clk48MHz, inResetAsync) is
    begin
    if (inResetAsync = cResetActive) then
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
        inResetAsync => inResetAsync,
        iStrobeI2C   => StrobeI2C,
        iStart       => Start,
        oConfigured  => Configured,
        oI2cSclk     => oI2cSclk,
        ioI2cSdin    => ioI2cSdin,
        oAckError => open);

    -- Strobe for configuration speed control
    GenStrobeI2C : entity work.StrobeGen
    generic map (
        gClkFrequency    => gClkFrequency,
        gStrobeFrequency => cI2cStrobeFrequency)
    port map (
        iClk         => Clk48MHz,
        inResetAsync => inResetAsync,
        oStrobe      => StrobeI2C);

    -- Audio codec clock generation
    GenClks : entity work.ClkMaster
    generic map (
        gClkFrequency  => gClkFrequency,
        gMclkFrequency => cMclkFrequency,
        gSampleRate    => gSampleRate)
    port map (
        iClk         => Clk48MHz,
        inResetAsync => inResetAsync,
        oMclk        => Mclk,
        oBclk        => Bclk,
        oADClrc      => ADClrc);

    oADClrc <= ADClrc;
    oMclk   <= Mclk;
    oBclk   <= Bclk;

    SyncSwitchInput: entity work.Sync
    generic map (
        gInitialState => '0',
        gDepth        => 2
    )
    port map (
        iClk         => iClk,
        inResetAsync => inResetAsync,
        iAsync       => iChannelSelect,
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
        inResetAsync => inResetAsync,
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
        inResetAsync   => inResetAsync,
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
        inResetAsync => inResetAsync,
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
        inResetAsync => inResetAsync,
        iDL          => DwetL,
        iDR          => DwetR,
        iValL        => ValWetL,
        iValR        => ValWetR,
        iBclk        => Bclk,
        oLrc         => oDAClrc,
        oSd          => oDACdat);

    datadetector_inst: entity work.DataDetector
    generic map (
      gClkFrequency      => gClkFrequency,
      gBaudRate          => gBaudRate,
      gDetectData        => gDetectData
    )
    port map (
      iClk            => iClk,
      inResetAsync    => inResetAsync,
      iData           => RxDataOutputSync,
      iDistanceSelect => iDistanceSelect,
      oByteDetected   => oByteDetected
    );

    oSeg <= not ToSevSeg(to_unsigned(RxChannelSelect, 4)); -- show selected channel on hex segment display

    oLed  <= (0 => PllLocked,
            1 => Start,
            2 => Configured,
            3 => RxChannelSync, -- synced switch input
            4 => RxChannelLedOutput, -- 1 when Channel 4, 0 when Channel 7
            5 => RxDataOutputSync, -- received data output
            others => cInactivated);

end architecture Rtl;
