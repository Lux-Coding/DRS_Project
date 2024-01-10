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
  constant cClkFrequency         : natural := 48E6;
  constant cStrobeFrequency      : natural := 750E3;
  constant cMclkFrequency        : natural := 12E6;
  constant cChoosenParamSet      : aParamSetName := MicroSlaveSampleRate44k1;
  signal Clk48MHz                : std_ulogic;
  signal StrobeI2C               : std_ulogic;
  signal Start                   : std_ulogic;
  signal Configured              : std_ulogic;
  signal AckError                : std_ulogic;
  signal PllLocked               : std_ulogic;
  signal Mclk                    : std_ulogic;
  signal Bclk                    : std_ulogic;
  signal ADClrc                  : std_ulogic;
  signal ValL                    : std_ulogic;
  signal ValR                    : std_ulogic;
  signal D                       : aAudioData(0 downto -(gAudioBitWidth-1));

begin

  -- 48MHz clock generation
  PLL : entity work.PLL50to48
    port map (
      iClk50MHz     => iClk,
      inResetAsync  => inResetAsync,
      oClk48Mhz     => Clk48MHz,
      oLocked       => PllLocked);

  -- codec configuration Start generation
  GenerateConfigStart : process (Clk48MHz, inResetAsync) is
  begin
    if (inResetAsync = cResetActive) then
      Start <= cInactivated;
    elsif rising_edge(Clk48MHz) then  -- rising clock edge
      if PllLocked = cActivated and Configured = cInactivated then
        Start <= cActivated;
      else
        Start <= cInactivated;
      end if;
    end if;
  end process GenerateConfigStart;

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

  -- strobe generator for I2C
  GenStrobeI2C : entity work.StrobeGen
    generic map (
      gClkFrequency    => cClkFrequency,
      gStrobeFrequency => cStrobeFrequency)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      oStrobe      => StrobeI2C);

  -- digital audio interface clock generation
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

  -- convert I2s serial data to parallel
  I2sToPar : entity work.I2sToPar
    generic map(
      gAudioBitWidth  => gAudioBitWidth
    )
    port map(
      iClk            => Clk48MHz,
      inResetAsync    => inResetAsync,
      iBclk           => Bclk,
      iLrc            => ADClrc,
      iSd             => iADCdat,
      oD              => D,
      oValL           => ValL,
      oValR           => ValR
    );

  -- convert parallel data to I2s serial
  ParToI2s : entity work.ParToI2s
    generic map(
      gAudioBitWidth  => gAudioBitWidth
    )
    port map (
      iClk            => Clk48MHz,
      inResetAsync    => inResetAsync,
      iDL             => D,
      iDR             => D,
      iValL           => ValL,
      iValR           => ValR,
      iBclk           => Bclk,
      oLRC            => oDAClrc,
      oSd             => oDACdat
    );

  -- outputs
  oMclk <= Mclk;
  oBclk <= Bclk;
  oADClrc <= ADClrc;
  
  oLed <= (0 => Start,
           1 => Configured,
           2 => AckError,
           3 => PllLocked,
           others => cInactivated);
  
end architecture Rtl;
