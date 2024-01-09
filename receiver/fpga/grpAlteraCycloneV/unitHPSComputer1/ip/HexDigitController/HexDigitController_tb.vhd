--------------------------------------------------------------------------------
-- Title       : 7-Segment Hex Digit Controller
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: HexDigitController_tb.vhd 755 2017-12-10 22:43:13Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.all;

entity HexDigitController_tb is
end entity HexDigitController_tb;

architecture bhv of HexDigitController_tb is
  
  signal clk          : std_logic := '0';
  signal reset_n      : std_logic := '1';
  signal seven_seg    : std_logic_vector(6 downto 0);
  signal s1_address   : std_logic_vector(0 downto 0);
  signal s1_read      : std_logic := '0';
  signal s1_readdata  : std_logic_vector(31 downto 0);
  signal s1_write     : std_logic := '0';
  signal s1_writedata : std_logic_vector(31 downto 0);
  
  subtype aAddress is natural range 0 to (2**s1_address'length - 1);
  
begin

  clk <= not clk after 20 ns;
  
  Stimuli : process
    variable vReadValue : natural := 0;
    variable vReadStatus : std_logic := '0';
  begin
    reset_n <= '0';
    
    for j in 1 to 5 loop
      wait until rising_edge(clk);
    end loop;
    reset_n <= '1';
    
    for idx in 0 to 9 loop
      for j in 1 to 20 loop
        wait until rising_edge(clk);
      end loop;
      
      s1_address   <= std_logic_vector(to_unsigned(1, s1_address'length));
      s1_read      <= '1';
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      vReadStatus  := s1_readdata(0);
      s1_read      <= '0';
      s1_address   <= (others => '-');
      
      s1_address   <= std_logic_vector(to_unsigned(1, s1_address'length));
      s1_writedata <= (0 => not vReadStatus, others => '0');
      s1_write     <= '1';
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      s1_write     <= '0';
      s1_address   <= (others => '-');
      s1_writedata <= (others => '-');
      
      wait until rising_edge(clk);
      
      s1_address   <= std_logic_vector(to_unsigned(0, s1_address'length));
      s1_read      <= '1';
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      vReadValue   := to_integer(unsigned(s1_readdata));
      s1_read      <= '0';
      s1_address   <= (others => '-');
      
      wait until rising_edge(clk);
      
      s1_address   <= std_logic_vector(to_unsigned(0, s1_address'length));
      s1_writedata <= std_logic_vector(to_unsigned(vReadValue + 1, s1_writedata'length));
      s1_write     <= '1';
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      s1_write     <= '0';
      s1_address   <= (others => '-');
      s1_writedata <= (others => '-');
    end loop;
    
    wait;
  end process;
  
  dut : entity HexDigitController
    port map (
      clk          => clk,
      reset_n      => reset_n,
      seven_seg    => seven_seg,
      s1_address   => s1_address,
      s1_read      => s1_read,
      s1_readdata  => s1_readdata,
      s1_write     => s1_write,
      s1_writedata => s1_writedata);
  
end architecture bhv; -- of HexDigitController_tb
