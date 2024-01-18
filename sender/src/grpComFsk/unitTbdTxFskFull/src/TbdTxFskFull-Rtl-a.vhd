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
  constant cCodecParamSet      : aParamSetName := MicroSlaveSampleRate96k;
  constant cSampleRate         : natural := 96000;

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
  signal ValWetL, ValWetR : std_ulogic;
  signal DwetL, DwetR     : aAudioData(0 downto -(gAudioBitWidth-1));
  signal DwetGate         : aAudioData(0 downto -(gAudioBitWidth-1));

  signal TxChannelInput  : unsigned(3 downto 0);
  signal TxChannelSync   : std_ulogic;
  signal TxChannelSelect : natural range 0 to 1;
  
  signal TxDataInput  : std_ulogic;
  signal TxDataSync   : std_ulogic;

  signal SenderData : std_ulogic;
  signal SendingInProgress : std_ulogic;
  signal ValWetGate : std_ulogic;

  signal PhaseStrobe          : std_ulogic;
  signal oldADClrc            : std_ulogic;

begin


  nResetAsync <= inButton(1);

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

    fsksender_inst: entity work.FskSender
    generic map (
      gClkFrequency     => 48E6,
      gDistanceOne_ms   => 100,
      gDistanceTwo_ms   => 500,
      gDistanceThree_ms => 1000,
      gDistanceFour_ms  => 5000,
      gBaudRate         => 281,
      gDataByte         => x"55"
    )
    port map (
      iClk            => Clk48MHz,
      inResetAsync    => inResetAsync,
      iDistanceSelect => iSwitch(2 downto 1),
      iEnable         => StartSending,
      oData           => SenderData,
      oSendInProgress => SendingInProgress
    );

    TxDataInput <= SenderData;

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
      ioI2cSdin    => ioI2cSdin,
      oAckError => open
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


  -- Audio codec clock generation
  GenClks : entity work.ClkMaster
    generic map (
      gClkFrequency  => gClkFrequency,
      gMclkFrequency => cMclkFrequency,
      gSampleRate    => cSampleRate)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => nResetAsync,
      oMclk        => Mclk,
      oBclk        => Bclk,
      oADClrc      => ADClrc
    );

    GPIO_0(0) <= Mclk;
    GPIO_0(1) <= Bclk;
    GPIO_0(2) <= ADClrc;
    GPIO_0(3) <= PhaseStrobe;
    GPIO_0(35 downto 4) <= (others => '0');

  oADClrc <= ADClrc;
  oMclk   <= Mclk;
  oBclk   <= Bclk;

  -- Sync the channel selector
  TheChannelSelSync : entity work.Sync
    port map(
      iClk            => Clk48MHz,
      inResetAsync    => nResetAsync,
      iAsync          => iSwitch(9),
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
    gChannels  => gChannels,
    gSampleRate => cSampleRate
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
      oVal            => ValWetGate,
      oD              => DwetGate
    );


  the_gate : process(Clk48MHz) is 
  begin 

    if(nResetAsync = not'1') then 
      DwetL    <= (others => '0');
      DwetR    <= (others => '0');
      ValWetL <= '0';
      ValWetR <= '0';
    elsif (rising_edge(Clk48MHz)) then 

      if(iSwitch(0) = '1') then 
        DwetL <= DwetGate;
        DwetR <= DwetGate;
      else 
        DwetL <= (others => '0');
        DwetR <= (others => '0');
      end if;

      ValWetL <= ValWetGate;
      ValWetR <= ValWetGate;
    end if;

  end process; 

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
  oSEG0 <= (others => '0');
  oSEG1 <= (others => '0');
  oSEG4 <= (others => '0');
  oSEG5 <= (others => '0');

  oLed  <= (0 => PllLocked,
            1 => Start,
            2 => Configured,
            5 => TxDataSync,
            6 => TxDataSync,
            7 => TxChannelSync,
            9 => '0',
            others => cInactivated);

end architecture Rtl;
