--------------------------------------------------------------------------------
-- Title       : Generator for clock signals of the I2S digital audio interface
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: ClkMaster-Rtl-a.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Generates the symmetrical clock signals Bclk and Mclk and the
--               ADClrc signal based on the input clock.
--------------------------------------------------------------------------------

architecture Rtl of ClkMaster is

  -- factor by which the incoming clock signal is to be divided
  constant cDivideBy : natural := gClkFrequency / gMclkFrequency;

  -- number of input clock cycles 
  constant cClkCycPerHalfDivdClkPeriod : natural := cDivideBy / 2;

  -- length of the clock counter register
  constant cClkCounterBinDigitCount : natural := LogDualis(cClkCycPerHalfDivdClkPeriod);

  -- number of bits transmitted by a stereo channel clock period
  constant cBitsPerStereosample : natural := gMclkFrequency / gSampleRate;

  -- number of bits transmitted by a stereo channel
  constant cBitsPerChannel : natural := cBitsPerStereosample / 2;

  -- length of the bit counter register
  constant cBitsPerChannelCount : natural := LogDualis(cBitsPerChannel);

  -- register used for counting the iClk cycles.
  signal ClkCounter : unsigned(cClkCounterBinDigitCount-1 downto 0);

  -- register which is used to count the number of transmitted bits
  signal BitCounter : unsigned(cBitsPerChannelCount - 1 downto 0);

  -- used to generate the Bclk & Mclk clock signals
  signal BMclk : std_ulogic;

  -- used to generate the ADClrc signal
  signal ADClrc : std_ulogic;

begin

  -- This process generates Bclk, Mclk and ADClrc based on the input clock signal
  GenClks : process (iClk, inResetAsync) is
  begin
    -- Asynchronous reset
    if (inResetAsync = cResetActive) then
      ClkCounter  <= to_unsigned(0, ClkCounter'length);
      BitCounter  <= to_unsigned(0, BitCounter'length);
      BMclk       <= '0';
      ADClrc      <= '0';

    -- Rising clk edge
    elsif rising_edge(iClk) then
      -- check if enougth input clock periods have passed to toggle BMclk
      if (ClkCounter = cClkCycPerHalfDivdClkPeriod-1) then
        -- reset the input clock counter
        ClkCounter  <= (others => '0');
        -- toggle the BMclk signal
        BMclk       <= not BMclk;

        -- ckeck if the BMclk signal is active (high phase)
        if (BMclk = '1') then
          -- check if enougth BMclk periods have passed to toggle ADClrc
          if (BitCounter = cBitsPerChannel - 1) then
            -- reset the BitCounter
            BitCounter  <= (others => '0');
            -- toggle the ADClrc signal
            ADClrc      <= not ADClrc;
          else
            -- increment the BitCounter
            BitCounter  <= BitCounter + 1;
          end if;
        end if;
      else
        -- increment the ClkCounter
        ClkCounter  <= ClkCounter + 1;
      end if;
    end if;
  end process GenClks;

  -- output the generated clocks
  oMclk   <= BMclk;
  oBclk   <= BMclk;
  oADClrc <= ADClrc;

end Rtl;

