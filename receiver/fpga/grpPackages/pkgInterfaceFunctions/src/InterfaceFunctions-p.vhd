-------------------------------------------------------------------------------
-- Title      : InterfaceFunctions Package
-- Project    : SpecArithUnit
-------------------------------------------------------------------------------
-- Author     : Michael Hinterberger
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package InterfaceFunctions is
  ------------------------------------------------------------------------------
  -- Function Definitions
  ------------------------------------------------------------------------------
  -- function ToSevSeg transforms the unsigned hex value for the seven segment
  function ToSevSeg(cValue : unsigned(0 to 3)) return std_ulogic_vector;

end InterfaceFunctions;

package body InterfaceFunctions is

  function ToSevSeg(cValue : unsigned(0 to 3)) return std_ulogic_vector is
  begin
    case cValue(0 to 3) is
      when "0000" => return "0111111";
      when "0001" => return "0000110";
      when "0010" => return "1011011";
      when "0011" => return "1001111";
      when "0100" => return "1100110";
      when "0101" => return "1101101";
      when "0110" => return "1111101";
      when "0111" => return "0000111";
      when "1000" => return "1111111";
      when "1001" => return "1101111";
      when "1010" => return "1110111";
      when "1011" => return "1111100";
      when "1100" => return "0111001";
      when "1101" => return "1011110";
      when "1110" => return "1111001";
      when "1111" => return "1110001";
      when others => return "XXXXXXX";
    end case;
  end ToSevSeg;

end InterfaceFunctions;
