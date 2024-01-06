--------------------------------------------------------------------------------
-- Title       : DDS sine wave generator
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: DspDds-RtlSimple-a.vhd 716 2017-11-12 16:57:46Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Basic implementation storing a full (redundant) sine wave
--               lookup table in ROM
--------------------------------------------------------------------------------

architecture RtlSimple of DspDds is

    subtype aROM_reg is aAudioData(0 downto -(gWaveTableBitWidth-1));
    type aROM is array (0 to gWaveTable'length-1) of aROM_reg;


    function INIT_ROM_CONTENT return aROM is
    
        variable tempRom : aROM;
        variable tempVal : aAudioData(0 downto -gWaveTableBitWidth);
    begin

        for I in aROM'range loop

            -- convert the gWavetableEntry to a us_fixed number with one more bit than the target number
            -- this ensures that ResizeTruncAbsVal can work correctly
            tempVal := to_sfixed(gWaveTable(I), 0 , -(gWaveTableBitWidth), fixed_saturate, fixed_truncate, 0);
            tempRom(I) := ResizeTruncAbsVal(tempVal,tempRom(i));
        end loop;
        return tempRom;
    end function;

    constant SineTable : aROM := INIT_ROM_CONTENT;

    signal PhaseAddr, NxtPhaseAddr : unsigned(gPhaseResolution-1 downto 0);

    signal D_long : aAudioData(0 downto -(gWaveTableBitWidth - 1));
    signal D : aAudioData(0 downto -(gAudioBitWidth - 1));
  
begin

ROM_READ: process (iClk) is
    variable Address  : natural;
 begin
    if (iClk'event and iClk = '1') then
        if (iSampleStrobe = '1') then
            Address := to_integer(PhaseAddr(PhaseAddr'left downto (PhaseAddr'left-(LogDualis(gWaveTable'length)-1))));
            D_long <= SineTable(Address);
        end if;
    end if;
 end process;



NxtPhaseAddr <= (PhaseAddr + to_unsigned(iPhaseIncrement,PhaseAddr'length - 1));



RegisterProcess: process (iClk, inResetAsync) is
begin 
    if (inResetAsync = not('1')) then
        PhaseAddr <= (others => '0');
    elsif (rising_edge(iClk)) then

        if (iSampleStrobe = '1') then 
            PhaseAddr <= NxtPhaseAddr;
        end if;
    end if;
end process;

oD <= ResizeTruncAbsVal(D_long,D);

oVal <= iSampleStrobe;

end RtlSimple;
