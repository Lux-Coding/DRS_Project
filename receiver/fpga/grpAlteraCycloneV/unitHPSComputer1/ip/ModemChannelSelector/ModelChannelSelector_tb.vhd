library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.all;

entity ModemChannelSelector_tb is
end entity ModemChannelSelector_tb;

architecture bhv of ModemChannelSelector_tb is

  constant cChannelWidth : positive := 4;
  
  signal clk          : std_logic := '0';
  signal reset_n      : std_logic := '1';
  signal channel      : std_logic_vector(cChannelWidth-1 downto 0);
  signal s1_address   : std_logic_vector(0 downto 0);
  signal s1_read      : std_logic := '0';
  signal s1_readdata  : std_logic_vector(31 downto 0);
  signal s1_write     : std_logic := '0';
  signal s1_writedata : std_logic_vector(31 downto 0);

  subtype aAddress is natural range 0 to (2**s1_address'length - 1);

  constant cMagicValue      : std_logic_vector(s1_readdata'range) := X"5CD01234";
  constant cAddrChannel     : aAddress := 0;
  constant cAddrMagicValue  : aAddress := 1;

begin

  clk <= not clk after 20 ns;
  
  Stimuli : process
    variable vChannel : natural := 0;
  begin
    vChannel := 0;
    reset_n <= '0';
    
    for j in 1 to 5 loop
      wait until rising_edge(clk);
    end loop;
    reset_n <= '1';
    
    for idx in 0 to 2**cChannelWidth-2 loop
    
      for j in 1 to 20 loop
        wait until rising_edge(clk);
      end loop;

      assert channel = std_logic_vector(to_unsigned(vChannel, cChannelWidth))
        report "Signal channel wrong value"
        severity error; 
      
      s1_address   <= std_logic_vector(to_unsigned(cAddrMagicValue, s1_address'length));
      s1_read      <= '1';
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      assert s1_readdata = cMagicValue
        report "Read wrong magic value"
        severity error;
      s1_read      <= '0';
      s1_address   <= (others => '-');

      wait until rising_edge(clk);

      assert channel = std_logic_vector(to_unsigned(vChannel, cChannelWidth))
        report "Signal channel wrong value"
        severity error;

      s1_address   <= std_logic_vector(to_unsigned(cAddrChannel, s1_address'length));
      s1_read      <= '1';
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      assert s1_readdata = std_logic_vector(to_unsigned(vChannel, s1_readdata'length))
        report "Read wrong channel"
        severity error;
      s1_read      <= '0';
      s1_address   <= (others => '-');
      
      wait until rising_edge(clk);

      assert channel = std_logic_vector(to_unsigned(vChannel, cChannelWidth))
        report "Signal channel wrong value"
        severity error;

      vChannel := idx;

      s1_address   <= std_logic_vector(to_unsigned(cAddrChannel, s1_address'length));
      s1_writedata <= std_logic_vector(to_unsigned(vChannel, s1_writedata'length));
      s1_write     <= '1';
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      s1_write     <= '0';
      s1_address   <= (others => '-');
      s1_writedata <= (others => '-');

      assert channel = std_logic_vector(to_unsigned(vChannel, cChannelWidth))
        report "Signal channel wrong value"
        severity error;

      wait until rising_edge(clk);

      s1_address   <= std_logic_vector(to_unsigned(cAddrMagicValue, s1_address'length));
      s1_read      <= '1';
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      assert s1_readdata = cMagicValue
        report "Read wrong magic value"
        severity error;
      s1_read      <= '0';
      s1_address   <= (others => '-');

      wait until rising_edge(clk);

      assert channel = std_logic_vector(to_unsigned(vChannel, cChannelWidth))
        report "Signal channel wrong value"
        severity error;

      s1_address   <= std_logic_vector(to_unsigned(cAddrChannel, s1_address'length));
      s1_read      <= '1';
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      assert s1_readdata = std_logic_vector(to_unsigned(vChannel, s1_readdata'length))
        report "Read wrong channel"
        severity error;
      s1_read      <= '0';
      s1_address   <= (others => '-');

      wait until rising_edge(clk);

      assert channel = std_logic_vector(to_unsigned(vChannel, cChannelWidth))
        report "Signal channel wrong value"
        severity error;

      vChannel := idx+1;

      s1_address   <= std_logic_vector(to_unsigned(cAddrChannel, s1_address'length));
      s1_writedata <= std_logic_vector(to_unsigned(vChannel, s1_writedata'length));
      s1_write     <= '1';
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      s1_write     <= '0';
      s1_address   <= (others => '-');
      s1_writedata <= (others => '-');

      assert channel = std_logic_vector(to_unsigned(vChannel, cChannelWidth))
        report "Signal channel wrong value"
        severity error;

      wait until rising_edge(clk);

      s1_address   <= std_logic_vector(to_unsigned(cAddrMagicValue, s1_address'length));
      s1_read      <= '1';
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      assert s1_readdata = cMagicValue
        report "Read wrong magic value"
        severity error;
      s1_read      <= '0';
      s1_address   <= (others => '-');

      wait until rising_edge(clk);

      assert channel = std_logic_vector(to_unsigned(vChannel, cChannelWidth))
        report "Signal channel wrong value"
        severity error;

      s1_address   <= std_logic_vector(to_unsigned(cAddrChannel, s1_address'length));
      s1_read      <= '1';
      wait until rising_edge(clk);
      wait until rising_edge(clk);
      assert s1_readdata = std_logic_vector(to_unsigned(vChannel, s1_readdata'length))
        report "Read wrong channel"
        severity error;
      s1_read      <= '0';
      s1_address   <= (others => '-');
    end loop;
    
    wait;
  end process;
  
  dut : entity ModemChannelSelector
    generic map (
      CHANNEL_WIDTH => cChannelWidth
    )
    port map (
      clk          => clk,
      reset_n      => reset_n,
      channel      => channel,
      s1_address   => s1_address,
      s1_read      => s1_read,
      s1_readdata  => s1_readdata,
      s1_write     => s1_write,
      s1_writedata => s1_writedata);
  
end architecture bhv; -- of ModemChannelSelector_tb