--------------------------------------------------------------------------------
-- Title       : Generator for clock signals of the I2S digital audio interface
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: ClkMaster-Rtl-a.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of ClkMaster is

  constant cMclkDivider : natural := gClkFrequency/gMclkFrequency;
  constant cMclkCyclesPerHalfPeriod : natural := cMclkDivider/2;
  constant cMclkCounterBinDigitCount : natural := LogDualis(cMclkCyclesPerHalfPeriod);

  signal MclkCounter : unsigned(cMclkCounterBinDigitCount-1 downto 0);
  signal Mclk : std_ulogic;

  constant cADCDivider : natural := gMclkFrequency/gSampleRate;
  constant cADCCyclesPerHalfPeriod : natural := cADCDivider/2;
  constant cADCCounterBinDigitCount : natural := LogDualis(cADCCyclesPerHalfPeriod);

  signal ADCCounter : unsigned(cADCCounterBinDigitCount-1 downto 0);
  signal ADClrc : std_ulogic;

begin

  -- generate Mclk signal
  GenMclk : process (iClk, inResetAsync) is
    begin
  
      -- Asynchronous reset
      if (inResetAsync = cResetActive) then
  
        -- We begin counting at 0.
        MclkCounter <= to_unsigned(0, MclkCounter'length);
        Mclk <= '0';
  
        -- Rising clk edge
      elsif rising_edge(iClk) then
  
        -- We count from 0 to cClkCycPerStrobeCyc-1.
        if MclkCounter = cMclkCyclesPerHalfPeriod-1 then
          MclkCounter <= (others => '0');
          Mclk        <= not(Mclk);
        else
          MclkCounter <= MclkCounter+1;
        end if;
  
      end if;
    end process GenMclk;

  -- generate ADClrc signal
  GenADClrc : process (Mclk, inResetAsync) is
    begin
      -- Asynchronous reset
      if (inResetAsync = cResetActive) then
  
        -- We begin counting at 0.
        ADCCounter <= to_unsigned(0, ADCCounter'length);
        ADClrc <= '0';
  
        -- Rising clk edge
      elsif falling_edge(Mclk) then
        
        if ADCCounter = cADCCyclesPerHalfPeriod-1 then
          ADCCounter  <= (others => '0');
          ADClrc      <= not(ADClrc);
        else
          ADCCounter  <= ADCCounter+1;
        end if;
      
      end if;
    end process GenADClrc;
  
  oMclk <= Mclk;
  oBclk <= Mclk;

  oADClrc <= ADClrc;

end Rtl;

