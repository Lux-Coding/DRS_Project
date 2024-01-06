--------------------------------------------------------------------------------
-- Title       : Global project definitions
-- Project     : FPGA Based Digital Signal Processing
--               FH O� Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: Global-p.vhd 664 2017-09-26 19:39:57Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- fixed_pkg resides in the library ieee since VHDL-2008 (QuestaSim backports
-- this to VHDL-93 too). However, Quartus (as of version 13.0sp1) still does
-- not have native support for ieee.fixed_pkg. Therefore, we provide the
-- VHDL-93 compatibility versions as part of this excercise. These must be
-- compiled into the are located in the library ieee_proposed. Include them in
-- your Config.tcl and don't forget to set the ExtraLibraries and TargetLibrary
-- parameters to compile them into the right library (ieee_proposed) with fhlow.
library ieee_proposed;
use ieee_proposed.fixed_float_types.all;
use ieee_proposed.fixed_pkg.all;
-- In future (when both QuestaSim and Quartus support the VHDL-2008
-- ieee.fixed_pkg) simply use:
--use ieee.fixed_float_types.all;
--use ieee.fixed_pkg.all;

package Global is

  -----------------------------------------------------------------------------
  -- Definitions that are not project specific.
  -----------------------------------------------------------------------------
  -- Avoid the traps of inverted logic and make the code more text like by
  -- reducing numbers.
  constant cActivated   : std_ulogic := '1';
  constant cInactivated : std_ulogic := '0';

  -- Now the same for inverted logic.
  constant cnActivated   : std_ulogic := '0';
  constant cnInactivated : std_ulogic := '1';

  -----------------------------------------------------------------------------
  -- Project specific definitions that will typically exist for every project.
  -----------------------------------------------------------------------------
  -- Reset polarity
  constant cResetActive : std_ulogic := cnActivated;

  subtype fract_real is real range
    -1.0 to 0.99999999999999999999999999999999999999999999999999999999999999999;
  
  -- The data type used for audio signals in the digital domain.
  -- Traditionally a fractional data type was used together with a set of
  -- functions provided by the package Fractional (described in
  -- Pfaff, Pauli and Reich�r,
  -- DSP in dedicated hardware: raising value abstraction for fixed
  -- point implementation, ISSE-Conference, 2004)
  -- Since 2008: Converted to package fixed_pkg as provided by David Bishop via
  -- IEEE.
  subtype aAudioData is u_sfixed;

  -- A set of factors, e.g. the set of filter coefficients for a cascade.
  type aSetOfFactors is array (natural range <>) of fract_real;

  -- Which polarity of the Lrc signal determines the left channel?
  -- I2S standard uses '0' for the left channel.
  constant cLrcValMeaningLeft : std_ulogic := '0';

  -- Default settings
  constant cDefaultAudioBitWidth : natural := 16;
  constant cDefaultSampleRate    : natural := 44117;
  constant cDefaultClkFrequency  : natural := 48E6;
  ------------------------------------------------------------------------------
  -- Function Definitions
  ------------------------------------------------------------------------------
  -- function log2 returns the logarithm of base 2 as an integer
  function LogDualis(cNumber     : natural) return natural;

  function VectorToString (vec : std_ulogic_vector) return string;

  function ResizeTruncAbsVal (arg : u_sfixed; -- input 
                              size_res : u_sfixed) -- for size only
                              return u_sfixed;

end Global;



package body Global is


  -- Function LogDualis returns the logarithm of base 2 as an integer.
  -- Although the implementation of this function was not done with synthesis
  -- efficiency in mind, the function has to be synthesizable, because it is
  -- often used in static calculations.
  function LogDualis(cNumber : natural) return natural is
    -- Initialize explicitly (will have warnings for uninitialized variables 
    -- from Quartus synthesis otherwise).
    variable vClimbUp : natural := 1;
    variable vResult  : natural := 0;
  begin
    while vClimbUp < cNumber loop
      vClimbUp := vClimbUp * 2;
      vResult  := vResult+1;
    end loop;
    return vResult;
  end LogDualis;


  function VectorToString (vec : std_ulogic_vector) return string is
    variable result : string (1 to vec'length) := (others => NUL);
    variable offset : integer := 1;
  begin
    for i in vec'range loop
      result(offset) := std_ulogic'image(vec(i))(2);
      offset := offset + 1;
    end loop;
    return result;
  end function;


  function ResizeTruncAbsVal (arg : u_sfixed; size_res : u_sfixed) return u_sfixed is
  variable TempVal : u_sfixed(arg'left + 1 downto arg'right - 1);
  constant RoundNum : u_sfixed(arg'left downto arg'right - 1) := ((arg'right - 1) => '1', others => '0');
  begin 

    -- to truncate to zero the value 2^-B must be added to negative numbers
    -- to avoid overflow problems the tempval needs to have one more bit 
    -- before the floating point 
    if (arg(arg'left) = '1' and size_res'right > arg'right) then
      TempVal := arg + RoundNum;
    else
      TempVal := ((arg(arg'left)) & arg & '0');
    end if;

    return resize(TempVal,size_res,fixed_saturate,fixed_truncate);
  
  end function;
end Global;

