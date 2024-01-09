--------------------------------------------------------------------------------
-- Title       : Frequency divider
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: FreqDivider-Rtl-a.vhd 664 2017-09-26 19:39:57Z mroland $
-- Authors     : Markus Pfaff, Hagenberg/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Generates a symmetrical clock signal from the iClk. The
--               divider is given by the generic gDivideBy.
--               Division by 1 is not possible. The minimum divider is 4. The
--               divider must be an even number.
--------------------------------------------------------------------------------

architecture Rtl of FreqDivider is

  constant cClkCycPerHalfDivdClkPeriod : natural := gDivideBy/2;

  constant cClkCounterBinDigitCount : natural :=
    LogDualis(cClkCycPerHalfDivdClkPeriod);

  -- The register whe use for counting the iClk cycles.
  signal ClkCounter : unsigned(cClkCounterBinDigitCount-1 downto 0);

  signal DivdClk : std_ulogic;

begin  -- architecture Rtl

  -- Count the number of Clk cycles from strobe pulse to strobe pulse.
  GenDivdClk : process (iClk, inResetAsync) is
  begin  -- process GenStrobe

    -- Asynchronous reset
    if (inResetAsync = cResetActive) then

      -- We begin counting at 0.
      ClkCounter <= to_unsigned(0, ClkCounter'length);
      -- oDivdClk shall be sourced directly by a register output to ease time budgeting
      -- when several units are connected with each other.
      DivdClk    <= '0';

      -- Rising clk edge
    elsif rising_edge(iClk) then

      -- We count from 0 to cClkCycPerStrobeCyc-1.
      if ClkCounter = cClkCycPerHalfDivdClkPeriod-1 then
        ClkCounter <= (others => '0');
        DivdClk    <= not(DivdClk);
      else
        ClkCounter <= ClkCounter+1;
      end if;

    end if;
  end process GenDivdClk;

  oDivdClk <= DivdClk;

end architecture Rtl;
