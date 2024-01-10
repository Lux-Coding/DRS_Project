library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.Global.all;

entity tbFskSender is
end entity;


architecture Bhv of tbFskSender is
    signal Clk48MHz : std_ulogic := '0';
    signal inResetAsync : std_ulogic := '0';
    signal iSwitch : std_ulogic_vector(2 downto 0) := "000";
    signal StartSending : std_ulogic := '0';
    signal SenderData : std_ulogic := '0';
    signal SendingInProgress : std_ulogic := '0';

begin 


    fsksender_inst: entity work.FskSender
    generic map (
      gClkFrequency     => 50E6,
      gDistanceOne_ms   => 1,
      gDistanceTwo_ms   => 500,
      gDistanceThree_ms => 1000,
      gDistanceFour_ms  => 5000,
      gBaudRate         => 300,
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

    theclk : Clk48MHz <= not(Clk48MHz) after 10 ns;

    stimul : process is 
    begin 

        wait for 500 ns;

        inResetAsync <= '1';
        StartSending <= '1';

        wait;
    end process;


end architecture;

