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
        gDistanceOne_ms     : integer := 100;
        gDistanceTwo_ms     : integer := 500;
        gDistanceThree_ms   : integer := 1000;
        gDistanceFour_ms    : integer := 5000;
        gBaudRate           : integer := 281;
        gDetectData         : std_ulogic_vector(7 downto 0) := x"55";
        gDetectCycleLength  : integer := 4
    );
    port (
        iClk            :  in std_ulogic;
        inResetAsync    :  in std_ulogic;
        -- input data
        iData           :  in std_ulogic;
        iDistanceSelect :  in std_ulogic_vector(1 downto 0);
        -- data byte detected
        oByteDetected   : out std_ulogic;
        oSegDistance    : out std_logic_vector(6 downto 0);
        oSeg0    : out std_logic_vector(6 downto 0);
        oSeg1    : out std_logic_vector(6 downto 0)
    );
end entity DataDetector;
