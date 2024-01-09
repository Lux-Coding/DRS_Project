library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Global.all;
use work.DefinitionsCodec.all;
use work.ParamCodec.all;
use work.DefinitionsFsk.all;
use work.InterfaceFunctions.all;

entity DrsReceiver is
    generic (
        gClkFrequency    : natural := cDefaultClkFrequency;
        gAudioBitWidth   : natural := cDefaultAudioBitWidth;
        gSampleRate      : natural := cDefaultSampleRate;-- Rx parameters
        gCoefWidth       : natural := cFskFilterCoefWidth;
        -- The values used as filter coefficients. The number of those
        -- coefficients determines the number of taps the filter has.
        gChannelBandpasses : aSetOfRxBandpasses := (
            0 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 0/freq. 0
                Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 0/freq. 1
            1 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 1/freq. 0
                Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 1/freq. 1
            2 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 2/freq. 0
                Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 2/freq. 1
            3 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 3/freq. 0
                Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 3/freq. 1
            4 => (Bandpass0 => ( cBandpass0Ch4 ),     -- band pass for Channel 4/freq. 0
                Bandpass1 => ( cBandpass1Ch4 )),    -- band pass for Channel 4/freq. 1
            5 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 5/freq. 0
                Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 5/freq. 1
            6 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 6/freq. 0
                Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 6/freq. 1
            7 => (Bandpass0 => ( cBandpass0Ch7 ),     -- band pass for Channel 7/freq. 0
                Bandpass1 => ( cBandpass1Ch7 )),    -- band pass for Channel 7/freq. 1
            8 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 8/freq. 0
                Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 8/freq. 1
            9 => (Bandpass0 => ( cZeroBandpass ),     -- band pass for Channel 9/freq. 0
                Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 9/freq. 1
            10 => (Bandpass0 => ( cZeroBandpass ),    -- band pass for Channel 10/freq. 0
                Bandpass1 => ( cZeroBandpass )),    -- band pass for Channel 10/freq. 1
            11 => (Bandpass0 => ( cZeroBandpass ),    -- band pass for Channel 11/freq. 0
                Bandpass1 => ( cZeroBandpass )));   -- band pass for Channel 11/freq. 1
        gLowpass         : aSetOfFactors := ( cLowpass ); -- low pass
        gBaudRate        : natural := 9600;
        gDetectData      : std_ulogic_vector(7 downto 0) := x"A"
    );
    port (
        iClk          : in std_ulogic;
        inResetAsync : in std_ulogic;
        -- wait time selection
        iDistanceSelect :  in std_logic_vector(1 downto 0);
        -- data byte detected
        oByteDetected : out std_ulogic;
        -- Audio codec
        oI2cSclk     : out   std_ulogic;
        ioI2cSdin    : inout std_logic;

        oMclk        : out std_ulogic;

        oBclk        : out std_ulogic;
        iADCdat      : in  std_ulogic;
        oDACdat      : out std_ulogic;
        oADClrc      : out std_ulogic;
        oDAClrc      : out std_ulogic;

        iChannelSelect : in std_ulogic; -- 0 => 4, 1 => 7
        
        oSeg         : out std_ulogic_vector(6 downto 0);  -- active low
        oLed         : out std_ulogic_vector(9 downto 0)  -- active high
    );
end entity DrsReceiver;
