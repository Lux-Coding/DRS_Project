library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-----------------------------------------------------------------------------------------
-- Avalon Registers:
-----------------------------------------------------------------------------------------
--                      [0x00]  time stamp upper (read/write)
--                        Bits 31-0   : time stamp upper 4 bytes
--------------------------------------------------------------
--                      [0x04]  time stamp lower (read/write)
--                        Bits 31-0   : time stamp lower 4 bytes
--------------------------------------------------------------
--                      [0x08]  data interrupt reset (write)
--                        Bits 31-0   : write any bit to reset interrupt
--------------------------------------------------------------

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
        iByteDetected    :  in std_ulogic;
        oByteDetectedAck :  out std_ulogic; 
        -- byte detected and timestamp captured
        oByteDetected_int : out std_ulogic;
        oByteDetected_int_cond : out std_ulogic;
                -- stored timestamp
        oTimestampCounter : out std_ulogic_vector(63 downto 0);
        -- captured timestamp
        oTimestampCapture : out std_ulogic_vector(63 downto 0)
    );
end entity ReceiverInterface;
