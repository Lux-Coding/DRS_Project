--------------------------------------------------------------------------------
-- Title       : Testbed for parallel digital audio streaming protocol test
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdI2sParI2s-Rtl-a.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of TbdI2sParI2s is

    constant cMclkFrequency              : natural := 12E6;
    constant cInResetDuration            : time    := 140 ns;
    constant cChoosenParamSet : aParamSetName := MicroSlaveSampleRate44k1;
    constant cStrobeFrequency : natural := 750E3;

    -- component ports
    signal Clk48MHz    : std_ulogic;
    signal Bclk        : std_ulogic;
    signal Mclk        : std_ulogic;
    signal ValidL      : std_ulogic;
    signal ValidR      : std_ulogic;
    signal ParData     : aAudioData(0 downto -(gAudioBitWidth-1));
    signal StrobeI2C   : std_ulogic;
    signal Start       : std_ulogic;
    signal Configured  : std_ulogic;
    signal AckError    : std_ulogic;
    signal Locked      : std_ulogic;
    signal ADClrc      : std_logic;
    signal WaitCtr     : unsigned(1 downto 0);

begin

    ------------------- Create Clocks ------------------

    TheClkMaster : entity work.ClkMaster
    generic map (
        gClkFrequency  => gClkFrequency,
        gMclkFrequency => cMclkFrequency,
        gSampleRate    => gSampleRate)
    port map (
        iClk         => Clk48MHz,
        inResetAsync => inResetAsync,
        oMclk        => Mclk,
        oBclk        => Bclk,
        oADClrc      => AdcLrc);


    ------------------ Parallel to I2S -----------------

    TheParToI2S : entity work.ParToI2s
    generic map (
        gAudioBitWidth => gAudioBitWidth)
    port map (
        iClk            => Clk48MHz,
        inResetAsync    => inResetAsync,
        iDL             => ParData,
        iDR             => ParData,
        iValL           => ValidL,
        iValR           => ValidR,
        iBclk           => Bclk,
        oLrc            => oDAClrc,
        oSd             => oDACdat);



    ------------------ I2S to Parallel -----------------

    TheI2SToPar : entity work.I2StoPar
    generic map (
        gAudioBitWidth => gAudioBitWidth)
    port map (
        iClk            => Clk48MHz,
        inResetAsync    => inResetAsync,
        iBclk           => Bclk,
        iLrc            => AdcLrc,
        iSd             => iAdcDat,
        oD              => ParData,
        oValL           => ValidL,
        oValR           => ValidR);


--------------- PLL Clock Generation ----------------

  -- added PLL for generating 48MHz Clock for Testbed
  PLL50to48MHz : entity work.PLL50to48
    port map (
      iClk50Mhz     => iClk,
      inResetAsync  => inResetAsync,
      oClk48MHz     => Clk48MHz,
      oLocked       => Locked
    );

------------------ Configure the Codec --------------

    -- entity instantiation
    ConfigureCodec : entity work.ConfigureCodecViaI2c
    generic map (
        gChoosenParamSet => cChoosenParamSet)
    port map (
        iClk         => Clk48MHz,
        inResetAsync => inResetAsync,
        iStrobeI2C   => StrobeI2C,
        iStart       => Start,
        oConfigured  => Configured,
        oAckError    => AckError,
        oI2cSclk     => oI2cSclk,
        ioI2cSdin    => ioI2cSdin);

    -- strobe generation
    GenStrobeI2C : entity work.StrobeGen
    generic map (
        gClkFrequency    => gClkFrequency,
        gStrobeFrequency => cStrobeFrequency)
    port map (
        iClk         => Clk48MHz,
        inResetAsync => inResetAsync,
        oStrobe      => StrobeI2C);


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

--------------- connection to outside --------------

oMclk <= Mclk;
oBclk <= Bclk;
oADClrc <= ADClrc;

oLed <= (   0 => Start,
            1 => Configured,
            2 => AckError,
            3 => Locked, -- added LED indicator if PLL is locked
            others => cInactivated);
  
end architecture Rtl;
