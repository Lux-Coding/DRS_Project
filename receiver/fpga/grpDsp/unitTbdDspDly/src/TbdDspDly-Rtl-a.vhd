--------------------------------------------------------------------------------
-- Title       : Testbed for z^{-1} delay on Altera DE1-SoC
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TbdDspDly-Rtl-a.vhd 711 2017-11-03 18:22:43Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of TbdDspDly is

  constant cClkFrequency      : natural := gClkFrequency;
  constant cStrobeFrequency   : natural := 750E3;
  constant cMclkFrequency     : natural := 12E6;
  constant cChoosenParamSet   : aParamSetName := MicroSlaveSampleRate44k1;

  signal Clk48MHz   : std_ulogic;
  signal StrobeI2C  : std_ulogic;
  signal Start      : std_ulogic;
  signal Configured : std_ulogic;
  signal AckError   : std_ulogic;
  signal Mclk       : std_ulogic;
  signal Bclk       : std_ulogic;
  signal ADClrc     : std_ulogic;
  signal WaitCtr    : unsigned(1 downto 0);
  signal ValDryL, ValDryR : std_ulogic;
  signal Ddry             : aAudioData(0 downto -(gAudioBitWidth-1));
  signal ValWetByRegL, ValWetByRamL,
         ValWetL, ValWetR : std_ulogic;
  signal DwetByRegL, DwetByRamL,
         DwetL, DwetR : aAudioData(0 downto -(gAudioBitWidth-1));

begin

  PLL_50MHz_48MHz : entity work.PLL50to48
    port map (
      inResetAsync => inResetAsync,
      iClk50MHz    => iClk,
      oClk48MHz    => Clk48MHz,
      oLocked      => open);


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

  GenStrobeI2C : entity work.StrobeGen
    generic map (
      gClkFrequency    => cClkFrequency,
      gStrobeFrequency => cStrobeFrequency)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      oStrobe      => StrobeI2C);

  GenClks : entity work.ClkMaster
    generic map (
      gClkFrequency  => cClkFrequency,
      gMclkFrequency => cMclkFrequency,
      gSampleRate    => gSampleRate)
    port map (
      iClk         => Clk48MHz,
      inResetAsync => inResetAsync,
      oMclk        => Mclk,
      oBclk        => Bclk,
      oADClrc      => ADClrc);


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


  UseRegVersion : if gDelayRegL > 0 generate
  begin
    
    RegDly : entity work.DspDly(RtlReg)
      generic map (
        gAudioBitWidth => gAudioBitWidth,
        gDelay         => gDelayRegL)
      port map (
        iClk         => Clk48MHz,
        inResetAsync => inResetAsync,
        iDdry        => Ddry,
        iValDry      => ValDryL,
        oDwet        => DwetByRegL);
  
    ValWetByRegL <= ValDryL;
    
  end generate UseRegVersion;

  SkipRegVersion : if gDelayRegL = 0 generate
  begin
    DwetByRegL <= Ddry;
    ValWetByRegL <= ValDryL;
  end generate SkipRegVersion;

  UseRamVersion : if gDelayRamL > 0 generate
  begin

    RamDly: entity work.DspDly(RtlRam)
      generic map (
        gAudioBitWidth => gAudioBitWidth,
        gDelay         => gDelayRamL
      )
      port map (
        iClk         => Clk48MHz,
        inResetAsync => inResetAsync,
        iDdry        => DwetByRegL,
        iValDry      => ValWetByRegL,
        oDwet        => DwetByRamL
      );

      ValWetByRamL <= ValWetByRegL;

  end generate UseRamVersion;

  SkipRamVersion : if gDelayRamL = 0 generate
  begin
    DwetByRamL <= DWetByRegL;
    ValWetByRamL <= ValWetByRegL;
  end generate SkipRamVersion;
  
  DwetL   <= DwetByRamL;
  ValWetL <= ValWetByRamL;

  DwetR   <= Ddry;
  ValWetR <= ValDryR;

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

  -- Send the results out
  oADClrc <= ADClrc;
  oMclk   <= Mclk;
  oBclk   <= Bclk;

  oLed <= (0 => Start,
           1 => Configured,
           2 => AckError,
           others => cInactivated);
           
end architecture Rtl;
