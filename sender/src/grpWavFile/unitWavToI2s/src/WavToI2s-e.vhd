--------------------------------------------------------------------------------
-- Title       : Read .wav files and stream into I2S protocol
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: WavToI2s-e.vhd 704 2017-10-27 19:25:59Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Not intended for synthesis!
--               
--               Input format (.wav file)
--               The model will read a .wav file and give out data in 16 bit
--               stereo. Only RIFF, WAVE, fmt and data chunks may be read. All
--               other chunks will be ignored.
--               If the data in the .wav file is mono the same data will be
--               output on the left and right channel. If the data in the .wav
--               file is 8 bit wide it will be expanded to 16 bit by padding with
--               8 trailing '0's. Any other sample width than 8 or 16 bit cannot
--               be understood by this model and will lead to an error.
--               The model informs its environment about the data format which is
--               output via special ports. Output is allways in a 16 bit stereo
--               format so the ports wChannels and wBitsPerSample will allways
--               carry the values 2 and 16 respectively.
--               
--               Reset Phase
--               The model is described in an abstract fashion (ready to start
--               from the beginning) and doesn't implement special behavior for
--               the reset phase.
--               
--               Abbriviations:
--               - ck - chunk
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Global.all;
use work.RiffFileTreatment.all;

entity WavToI2s is

  generic (
    gWaveFileName  : string  := "../../../../sounds/Wobble10Hz22050Hz100ms.wav";
    -- 0 has the special meaning of: "Use the sample rate found in
    -- the file header."
    gSampleRate    : integer := cDefaultSampleRate;
    gAudioBitWidth : natural := cDefaultAudioBitWidth);

  port (
    -- Keep the Audio Output Interface synchronous
    iClk : in std_ulogic;

    -- I2s and sample synchronization
    iLrc  : in  std_ulogic;
    iBclk : in  std_ulogic;
    oSd   : out std_ulogic;

    -- Parameters for flagging of .wav file status
    oWaveAtEnd : out boolean := false);

end WavToI2s;

