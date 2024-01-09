library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ReceiverInterface is
    generic (
        gClkFrequency       : integer := 50E6
    );
    port (
        csi_clk          : in std_ulogic;
        rsi_reset_n      : in std_ulogic;
        -- avalon interface
        avs_s0_address   : in std_logic_vector(1 downto 0);
        avs_s0_write     : in std_logic;
        avs_s0_writedata : in std_logic_vector(31 downto 0);
        avs_s0_read      : in std_logic;
        avs_s0_readdata  : out std_logic_vector(31 downto 0) := (others => '0');
        -- data byte detected
        iByteDetected   :  in std_ulogic;
        -- byte detected and timestamp captured
        oByteDetected_int : out std_ulogic
    );
end entity ReceiverInterface;
