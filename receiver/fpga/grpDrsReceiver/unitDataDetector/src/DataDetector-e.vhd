library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Global.all;
use work.DefinitionsCodec.all;
use work.ParamCodec.all;
use work.DefinitionsFsk.all;
use work.InterfaceFunctions.all;

entity DataDetector is
    generic (
        gClkFrequency       : integer := cDefaultClkFrequency;
        gDistanceOne_us     : integer := 900;
        gDistanceTwo_us     : integer := 99900;
        gDistanceThree_us   : integer := 499900;
        gDistanceFour_us    : integer := 999900;
        gBaudRate           : integer := 9600;
        gDetectData         : std_ulogic_vector(7 downto 0) := x"A";
        gDetectCycleLength  : integer := 4
    );
    port (
        iClk            :  in std_ulogic;
        inResetAsync    :  in std_ulogic;
        -- input data
        iData           :  in std_ulogic;
        iDistanceSelect :  in std_logic_vector(1 downto 0);
        -- data byte detected
        oByteDetected   : out std_ulogic
    );
end entity DataDetector;
