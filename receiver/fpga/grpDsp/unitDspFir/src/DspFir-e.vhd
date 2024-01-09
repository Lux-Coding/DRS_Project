--------------------------------------------------------------------------------
-- Title       : FIR filter
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: DspFir-e.vhd 716 2017-11-12 16:57:46Z mroland $
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

use work.global.all;

entity DspFir is
  
  generic (
    gAudioBitWidth : natural       := cDefaultAudioBitWidth;
    gCoefWidth     : natural       := 16;

    -- The values used as filter coefficients. The number those
    -- coefficients determines the number of taps the filter has.
    gB             : aSetOfFactors := (-0.000152587890625,  0.00018310546875 ,  0.000152587890625,  0.000152587890625,  0.00018310546875 ,  0.000152587890625,  0.0001220703125  ,  0.00006103515625 ,  0.0              , -0.000091552734375, -0.000213623046875, -0.00030517578125 , -0.0003662109375  , -0.0003662109375  , -0.000335693359375, -0.000274658203125, -0.0001220703125  ,  0.00006103515625 ,  0.000244140625   ,  0.000457763671875,  0.0006103515625  ,  0.000732421875   ,  0.000732421875   ,  0.000640869140625,  0.000457763671875,  0.00018310546875 , -0.000152587890625, -0.000518798828125, -0.0008544921875  , -0.001129150390625, -0.001251220703125, -0.001251220703125, -0.00103759765625 , -0.000701904296875, -0.000213623046875,  0.0003662109375  ,  0.000946044921875,  0.00146484375    ,  0.001861572265625,  0.00201416015625 ,  0.001922607421875,  0.001556396484375,  0.000946044921875,  0.000152587890625, -0.000732421875   , -0.0015869140625  , -0.0023193359375  , -0.0028076171875  , -0.002960205078125, -0.002716064453125, -0.002105712890625, -0.00115966796875 ,  0.0              ,  0.001251220703125,  0.00244140625    ,  0.00341796875    ,  0.00396728515625 ,  0.00408935546875 ,  0.003631591796875,  0.002685546875   ,  0.0013427734375  , -0.00030517578125 , -0.001983642578125, -0.0035400390625  , -0.00469970703125 , -0.005340576171875, -0.00531005859375 , -0.00457763671875 , -0.00323486328125 , -0.001373291015625,  0.000762939453125,  0.0029296875     ,  0.004791259765625,  0.00616455078125 ,  0.00677490234375 ,  0.006561279296875,  0.0054931640625  ,  0.003631591796875,  0.001251220703125, -0.001434326171875, -0.0040283203125  , -0.0062255859375  , -0.0076904296875  , -0.00823974609375 , -0.00775146484375 , -0.006256103515625, -0.003875732421875, -0.000946044921875,  0.00225830078125 ,  0.0052490234375  ,  0.007659912109375,  0.009185791015625,  0.00958251953125 ,  0.008758544921875,  0.006805419921875,  0.00390625       ,  0.00042724609375 , -0.003204345703125, -0.006500244140625, -0.009063720703125, -0.010528564453125, -0.010711669921875, -0.009490966796875, -0.007080078125   , -0.003692626953125,  0.000244140625   ,  0.004180908203125,  0.0076904296875  ,  0.010284423828125,  0.0115966796875  ,  0.011474609375   ,  0.0098876953125  ,  0.00701904296875 ,  0.00323486328125 , -0.001007080078125, -0.005157470703125, -0.00872802734375 , -0.011199951171875, -0.01226806640625 , -0.011810302734375, -0.009857177734375, -0.00665283203125 , -0.002593994140625,  0.0018310546875  ,  0.006011962890625,  0.00946044921875 ,  0.01171875       ,  0.01251220703125 ,  0.01171875       ,  0.00946044921875 ,  0.006011962890625,  0.0018310546875  , -0.002593994140625, -0.00665283203125 , -0.009857177734375, -0.011810302734375, -0.01226806640625 , -0.011199951171875, -0.00872802734375 , -0.005157470703125, -0.001007080078125,  0.00323486328125 ,  0.00701904296875 ,  0.0098876953125  ,  0.011474609375   ,  0.0115966796875  ,  0.010284423828125,  0.0076904296875  ,  0.004180908203125,  0.000244140625   , -0.003692626953125, -0.007080078125   , -0.009490966796875, -0.010711669921875, -0.010528564453125, -0.009063720703125, -0.006500244140625, -0.003204345703125,  0.00042724609375 ,  0.00390625       ,  0.006805419921875,  0.008758544921875,  0.00958251953125 ,  0.009185791015625,  0.007659912109375,  0.0052490234375  ,  0.00225830078125 , -0.000946044921875, -0.003875732421875, -0.006256103515625, -0.00775146484375 , -0.00823974609375 , -0.0076904296875  , -0.0062255859375  , -0.0040283203125  , -0.001434326171875,  0.001251220703125,  0.003631591796875,  0.0054931640625  ,  0.006561279296875,  0.00677490234375 ,  0.00616455078125 ,  0.004791259765625,  0.0029296875     ,  0.000762939453125, -0.001373291015625, -0.00323486328125 , -0.00457763671875 , -0.00531005859375 , -0.005340576171875, -0.00469970703125 , -0.0035400390625  , -0.001983642578125, -0.00030517578125 ,  0.0013427734375  ,  0.002685546875   ,  0.003631591796875,  0.00408935546875 ,  0.00396728515625 ,  0.00341796875    ,  0.00244140625    ,  0.001251220703125,  0.0              , -0.00115966796875 , -0.002105712890625, -0.002716064453125, -0.002960205078125, -0.0028076171875  , -0.0023193359375  , -0.0015869140625  , -0.000732421875   ,  0.000152587890625,  0.000946044921875,  0.001556396484375,  0.001922607421875,  0.00201416015625 ,  0.001861572265625,  0.00146484375    ,  0.000946044921875,  0.0003662109375  , -0.000213623046875, -0.000701904296875, -0.00103759765625 , -0.001251220703125, -0.001251220703125, -0.001129150390625, -0.0008544921875  , -0.000518798828125, -0.000152587890625,  0.00018310546875 ,  0.000457763671875,  0.000640869140625,  0.000732421875   ,  0.000732421875   ,  0.0006103515625  ,  0.000457763671875,  0.000244140625   ,  0.00006103515625 , -0.0001220703125  , -0.000274658203125, -0.000335693359375, -0.0003662109375  , -0.0003662109375  , -0.00030517578125 , -0.000213623046875, -0.000091552734375,  0.0              ,  0.00006103515625 ,  0.0001220703125  ,  0.000152587890625,  0.00018310546875 ,  0.000152587890625,  0.000152587890625,  0.00018310546875 , -0.000152587890625));

  port (
    -- Sequential logic inside this unit
    iClk         : in std_ulogic;
    inResetAsync : in std_ulogic;

    -- Input audio channels
    iDdry   : in aAudioData(0 downto -(gAudioBitWidth-1));
    iValDry : in std_ulogic;

    -- Output audio channel
    oDwet   : out aAudioData(0 downto -(gAudioBitWidth-1));
    oValWet : out std_ulogic);

end entity DspFir;
