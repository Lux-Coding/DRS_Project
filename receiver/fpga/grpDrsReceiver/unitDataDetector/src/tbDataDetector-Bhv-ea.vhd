library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tbDataDetector is
end entity tbDataDetector;

architecture Bhv of tbDataDetector is

    constant cClkFrequency : integer := 50E6;
    constant cBaudRate : integer := 300;
    constant cCyclesPerBit : integer := cClkFrequency / cBaudRate;
    constant cDetectData : std_ulogic_vector(7 downto 0) := x"55";

    signal Clk : std_ulogic := '0';
    signal nReset : std_ulogic := '0';
    signal DataIn : std_ulogic := '0';
    signal DistanceSelect : std_ulogic_vector(1 downto 0) := "01"; -- distance two

    signal ByteDetected : std_ulogic;
    signal ByteDetectedAck : std_ulogic;

begin

    clkGen: Clk <= not Clk after 10 ns;

    datadetector_inst: entity work.DataDetector
    generic map (
        gClkFrequency      => cClkFrequency,
        gDistanceOne_ms    => 10,
        gDistanceTwo_ms    => 50,
        gDistanceThree_ms  => 100,
        gDistanceFour_ms   => 500,
        gBaudRate          => cBaudRate,
        gDetectData        => cDetectData,
        gDetectCycleLength => 100
    )
    port map (
      iClk            => Clk,
      inResetAsync    => nReset,
      iData           => DataIn,
      oByteDetected   => ByteDetected,
      iSetDetectedKey => '0',
      iByteDetectedAck => ByteDetectedAck, 
      oSegDistance    => open
    );

    stimul: process is
    begin

        wait for 20 ns;
        nReset <= '1';

        for i in 0 to 5 loop
            wait until rising_edge(Clk);
        end loop;

        for i in 0 to cDetectData'length - 1 loop
            wait for cCyclesPerBit / 2 * 20 ns;

            DataIn <= cDetectData(i);

            wait for cCyclesPerBit / 2 * 20 ns;
        end loop;

        -- wait for 50 cycles for middle of detect length
        wait for 50 * 20 ns;
        assert(ByteDetected = '1');

        -- wait half bit
        wait for cCyclesPerBit / 2 * 20 ns;
        ByteDetectedAck <= '1';
        wait until falling_edge(ByteDetected);
        ByteDetectedAck <= '0';

        report("got here");

        -- next byte while ignoring input
        for i in 0 to cDetectData'length - 1 loop
            wait for cCyclesPerBit / 2 * 20 ns;

            DataIn <= cDetectData(i);

            wait for cCyclesPerBit / 2 * 20 ns;
        end loop;

        -- wait for 50 cycles for middle of detect length
        wait for 50 * 20 ns;
        assert(ByteDetected = '0');

        -- wait half bit
        wait for cCyclesPerBit / 2 * 20 ns;

        -- wait for another 20 ms
        wait for 20 * 1000 * 1000 ns;

        -- next byte while input is not ignored any more
        for i in 0 to cDetectData'length - 1 loop
            wait for cCyclesPerBit / 2 * 20 ns;

            DataIn <= cDetectData(i);

            wait for cCyclesPerBit / 2 * 20 ns;
        end loop;

        -- wait for 50 cycles for middle of detect length
        wait for 50 * 20 ns;
        ByteDetectedAck <= '1';
        wait until falling_edge(ByteDetected);
        ByteDetectedAck <= '0';

        assert(false) severity failure;

        wait;
    end process stimul;

end architecture Bhv;
