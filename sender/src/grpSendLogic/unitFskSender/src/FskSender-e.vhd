library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.Global.all;


entity FskSender is  

generic (   
            gClkFrequency       : natural := 48E6;
            gDistanceOne_ms     : natural := 1_00;
            gDistanceTwo_ms     : natural := 10_00;
            gDistanceThree_ms   : natural := 500_00;
            gDistanceFour_ms    : natural := 1000_00;
            gBaudRate           : natural := 9600;
            gDataByte           : std_ulogic_vector(7 downto 0) := x"55"

);

port(
    iClk            :  in std_ulogic;
    inResetAsync    :  in std_ulogic;
    iDistanceSelect :  in std_ulogic_vector(1 downto 0);
    iEnable         :  in std_ulogic;
    oData           :  out std_ulogic;
    oSendInProgress :  out std_ulogic
);

end entity;