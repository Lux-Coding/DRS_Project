--------------------------------------------------------------------------------
-- Title       : 7-Segment Hex Digit Controller
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: HexDigitController.vhd 755 2017-12-10 22:43:13Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2017
--------------------------------------------------------------------------------
-- Description : A simple 7-segment controller that outputs a hexadecimal digit
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity HexDigitController is
  generic (
    INITIAL_OFF   : boolean := true;
    INITIAL_VALUE : natural := 0
  );
  port (
    clk            : in  std_logic                     := '0';             --   clock.clk
    reset_n        : in  std_logic                     := '0';             --   reset.reset_n
    seven_seg      : out std_logic_vector(6 downto 0);                     -- conduit.output
    s1_address     : in  std_logic_vector(0 downto 0)  := (others => '0'); --      s1.address
    s1_read        : in  std_logic                     := '0';             --        .read
    s1_readdata    : out std_logic_vector(31 downto 0);                    --        .readdata
    s1_write       : in  std_logic                     := '0';             --        .write
    s1_writedata   : in  std_logic_vector(31 downto 0) := (others => '0')  --        .writedata
  );
end entity HexDigitController;

architecture rtl of HexDigitController is
  
  subtype aAddress is natural range 0 to (2**s1_address'length - 1);
  constant cAddrRegHexValue  : aAddress := 0;
  constant cAddrRegHexStatus : aAddress := 1;
  
  type aHexDigits is array (natural range <>) of std_logic_vector(6 downto 0);
  constant cHexDigits : aHexDigits := (
          --   +--0--+
          --   |     |
          --   5     1
          --   |     |
          --   +--6--+
          --   |     |
          --   4     2
          --   |     |
          --   +--3--+
          0 => "1000000",  -- 0
          1 => "1111001",  -- 1
          2 => "0100100",  -- 2
          3 => "0110000",  -- 3
          4 => "0011001",  -- 4
          5 => "0010010",  -- 5
          6 => "0000010",  -- 6
          7 => "1111000",  -- 7
          8 => "0000000",  -- 8
          9 => "0011000",  -- 9
         10 => "0001000",  -- A
         11 => "0000011",  -- b
         12 => "1000110",  -- C
         13 => "0100001",  -- d
         14 => "0000110",  -- E
         15 => "0001110"); -- F
  constant cHexOff : std_logic_vector(6 downto 0) := "1111111";
  
  signal HexDigitOff   : std_ulogic;
  signal HexDigitValue : unsigned(3 downto 0);
  
begin
  
  AvalonMMInterface : process(clk)
    variable vAddress : aAddress;
  begin
    if rising_edge(clk) then
      if reset_n = '0' then
        -- synchronous reset
        s1_readdata   <= (others => '0');
        if INITIAL_OFF then
          HexDigitOff <= '1';
        else
          HexDigitOff <= '0';
        end if;
        HexDigitValue <= to_unsigned(INITIAL_VALUE, HexDigitValue'length);
        
      else
        -- transform address bits to integer value
        vAddress := to_integer(unsigned(s1_address));
        
        if s1_write = '1' then
          -- register write
          case vAddress is
            when cAddrRegHexValue =>
              -- HEX digit as hexadecimal value
              HexDigitValue <= unsigned(s1_writedata(HexDigitValue'range));
            
            when cAddrRegHexStatus =>
              -- HEX digit status register
              HexDigitOff <= s1_writedata(0);  -- off flag
            
            when others =>
              null;
          end case;
        end if;
        
        if s1_read = '1' then
          -- register read
          s1_readdata <= (others => '0');
          
          case vAddress is
            when cAddrRegHexValue =>
              -- HEX digit as hexadecimal value
              s1_readdata(HexDigitValue'range) <= std_logic_vector(HexDigitValue);
            
            when cAddrRegHexStatus =>
              -- HEX digit status register
              s1_readdata(0) <= HexDigitOff;  -- off flag
            
            when others =>
              null;
          end case;
        end if;
      end if;
    end if;
  end process;
  
  seven_seg <= cHexOff when HexDigitOff = '1' else
               cHexDigits(to_integer(HexDigitValue));
  
end architecture rtl; -- of HexDigitController
