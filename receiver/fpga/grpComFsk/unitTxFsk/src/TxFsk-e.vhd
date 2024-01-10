--------------------------------------------------------------------------------
-- Title       : FSK transmitter
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: TxFsk-e.vhd 733 2017-12-04 02:28:35Z mroland $
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
use ieee_proposed.fixed_pkg.all;
-- In future (when both QuestaSim and Quartus support the VHDL-2008
-- ieee.fixed_pkg) simply use:
--use ieee.fixed_float_types.all;
--use ieee.fixed_pkg.all;

use work.Global.all;
use work.DefinitionsFsk.all;

entity TxFsk is
  
  generic (
    gClkFrequency     : natural := cDefaultClkFrequency;
    gAudioBitWidth    : natural := cDefaultAudioBitWidth;
    gSampleRate       : natural := cDefaultSampleRate;
    gChannels         : aSetOfTxChannels := (
        0 => (Frequency0 =>  800.0,   -- Hz
              Frequency1 => 1300.0),  -- Hz
        1 => (Frequency0 => 2800.0,   -- Hz
              Frequency1 => 3300.0))  -- Hz
  );

  port (
    inResetAsync : in std_ulogic;
    iClk         : in std_ulogic;

    -- Channel selection signal
    iChannelSelect : in natural range gChannels'range;
    
    -- Input data signal (must of course be synchronous!)
    iD : in std_ulogic;

    -- Sample sync signal for the DAC
    iSampleStrobe : in std_ulogic;

    -- Parallel digital audio data protocol
    oVal : out std_ulogic;
    oD   : out aAudioData(0 downto -(gAudioBitWidth-1))
  );

end entity TxFsk;
