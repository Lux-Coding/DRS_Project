--------------------------------------------------------------------------------
-- Title       : Parameter definitions for FSK modem
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: DefinitionsFsk-p.vhd 733 2017-12-04 02:28:35Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2015-2017
--------------------------------------------------------------------------------
-- Description : Channel frequency definitions and filter coefficients for FSK
--               modem
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Global.all;

package DefinitionsFsk is

  type aTxFrequencySet is record
    Frequency0 : real;
    Frequency1 : real;
  end record;
  
  type aPhaseIncrementSet is record
    PhaseIncrement0 : natural;
    PhaseIncrement1 : natural;
  end record;
  
  type aSetOfTxChannels is array (natural range <>) of aTxFrequencySet;
  type aSetOfPhaseIncrements is array (natural range <>) of aPhaseIncrementSet;
  
  constant cFskFilterCoefWidth : natural := 16;
  constant cFskBandpassOrder   : natural := 0;  -- !!! CHANGE THIS !!!
  constant cFskLowpassOrder    : natural := 0;  -- !!! CHANGE THIS !!!
  
  type aRxBandpassSet is record
    Bandpass0 : aSetOfFactors(0 to cFskBandpassOrder);
    Bandpass1 : aSetOfFactors(0 to cFskBandpassOrder);
  end record;

  type aSetOfRxBandpasses is array (natural range <>) of aRxBandpassSet;
  

end package DefinitionsFsk;


package body DefinitionsFsk is

  
end package body;
