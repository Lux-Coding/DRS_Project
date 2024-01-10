--------------------------------------------------------------------------------
-- Title       : Testbed for rectangular wave generator on Altera DE1-SoC
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdRectGen-Rtl-a.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of TbdRectGen is

  constant cI2cStrobeFrequency    : natural := 750E3;

  signal Clk48M       : std_ulogic;
  signal PllLocked    : std_ulogic := cInactivated;
  signal StartConfig  : std_ulogic := cInactivated;
  signal Bclk         : std_ulogic;
  signal ADClrc       : std_ulogic;
  signal DataL        : aAudioData(0 downto -(gAudioBitWidth - 1));
  signal DataR        : aAudioData(0 downto -(gAudioBitWidth - 1));
  signal ValidL       : std_ulogic;
  signal ValidR       : std_ulogic;
  signal Configured   : std_ulogic := cInactivated;
  signal AckError     : std_ulogic := cInactivated;
  signal StrobeI2C    : std_ulogic;

begin

  -- 48MHz clock generation
  ThePll50to48 : entity work.PLL50to48
    port map (
      iClk50Mhz    => iClk,
      inResetAsync => inResetAsync,
      oClk48MHz    => Clk48M,
      oLocked      => PllLocked
  );

  -- codec configuration Start generation
  GenerateConfigStart : process (Clk48M, inResetAsync) is
  begin
    if (inResetAsync = cResetActive) then
      StartConfig <= cInactivated;
    elsif rising_edge(Clk48M) then  -- rising clock edge
      if PllLocked = cActivated and Configured = cInactivated then
        StartConfig <= cActivated;
      else
        StartConfig <= cInactivated;
      end if;
    end if;
  end process GenerateConfigStart;

  -- digital audio interface clock generation
  TheClkMaster: entity work.ClkMaster
    generic map (
      gClkFrequency  => gClkFrequency,
      gSampleRate    => gSampleRate
    )
    port map (
      iClk         => Clk48M,
      inResetAsync => inResetAsync,
      oMclk        => oMclk,
      oBclk        => Bclk,
      oADClrc      => ADClrc
    );

  -- rectangle generator for left channel (100Hz)
  RectGenL: entity work.RectGen
    generic map (
      gClkFrequency  => gClkFrequency,
      gGenFrequency  => gGenFrequencyL,
      gAudioBitWidth => gAudioBitWidth
    )
    port map (
      iClk         => Clk48M,
      inResetAsync => inResetAsync,
      iLrc         => ADClrc,
      oVal         => ValidL,
      oD           => DataL
    );

  -- rectangle generator for right channel (440Hz)
  RectGenR: entity work.RectGen
    generic map (
      gClkFrequency  => gClkFrequency,
      gGenFrequency  => gGenFrequencyR,
      gAudioBitWidth => gAudioBitWidth
    )
    port map (
      iClk         => Clk48M,
      inResetAsync => inResetAsync,
      iLrc         => ADClrc,
      oVal         => ValidR,
      oD           => DataR
    );

  -- convert parallel data to I2s serial
  TheParToI2s: entity work.ParToI2s
    generic map (
      gAudioBitWidth => gAudioBitWidth
    )
    port map (
      iClk         => Clk48M,
      inResetAsync => inResetAsync,
      iDL          => DataL,
      iDR          => DataR,
      iValL        => ValidL,
      iValR        => ValidR,
      iBclk        => Bclk,
      oLrc         => oDAClrc,
      oSd          => oDACdat
    );

  -- audio codec configuration
  ConfigureCodec: entity work.ConfigureCodecViaI2c
    generic map (
      gChoosenParamSet => DacOnlySlaveSampleRate44k1
    )
    port map (
      iClk         => Clk48M,
      inResetAsync => inResetAsync,
      iStrobeI2C   => StrobeI2C,
      iStart       => StartConfig,
      oConfigured  => Configured,
      oAckError    => AckError,
      oI2cSclk     => oI2cSclk,
      ioI2cSdin    => ioI2cSdin
    );

  -- strobe generator for I2C
  GenStrobeI2C : entity work.StrobeGen
    generic map (
      gClkFrequency    => gClkFrequency,
      gStrobeFrequency => cI2cStrobeFrequency)
    port map (
      iClk         => Clk48M,
      inResetAsync => inResetAsync,
      oStrobe      => StrobeI2C);

  -- outputs
  oBclk <= Bclk;
  oADClrc <= ADClrc;

  oLed <= (0 => PllLocked,
           1 => Configured,
           2 => AckError,
           others => cInactivated);
           
end architecture Rtl;
