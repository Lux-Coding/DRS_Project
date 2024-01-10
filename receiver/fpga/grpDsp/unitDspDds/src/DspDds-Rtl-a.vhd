--------------------------------------------------------------------------------
-- Title       : DDS sine wave generator
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: DspDds-RtlSimple-a.vhd 716 2017-11-12 16:57:46Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Advanced Implementation storing only a fourth of the sinewave
--------------------------------------------------------------------------------

architecture Rtl of DspDds is

    -- Number of Registers in the LFSR
    constant cNumRegsLFSR : natural := 30;

    -- Select if phasedithering is enabled
    constant cEnablePhaseDithering : boolean := true;

    subtype aROM_reg is aAudioData(0 downto -(gWaveTableBitWidth-1));

    -- rom is 1/4 the size
    type aROM is array (0 to (gWaveTable'length/4)-1) of aROM_reg;


    function INIT_ROM_CONTENT return aROM is

        variable tempRom : aROM;
        variable tempConverter : aAudioData(0 downto -(gWaveTableBitWidth + 1));
        variable tempShifter : aAudioData(0 downto -(gWaveTableBitWidth));
    begin
        for I in aROM'range loop
            -- convert the gWavetableEntry to a us_fixed number with one more bit than the target number
            -- this ensures that ResizeTruncAbsVal can work correctly
            tempConverter := to_sfixed(gWaveTable(I), 0 , -(gWaveTableBitWidth + 1), fixed_saturate, fixed_truncate, 0);
            tempShifter := ResizeTruncAbsVal(tempConverter,tempShifter);

            -- only safe the values after the comma (values are allways postive)
            tempShifter := tempShifter(tempShifter'high - 1 downto tempShifter'low) & "0";
            tempRom(I) :=  tempShifter(tempRom(I)'range);
        end loop;
        return tempRom;
    end function;

    -- rom to read from
    constant SineTable : aROM := INIT_ROM_CONTENT;

    -- phase address counter
    signal PhaseAddr, NxtPhaseAddr : unsigned(gPhaseResolution-1 downto 0);

    -- signals for truncation
    signal D_long : aAudioData(0 downto -(gWaveTableBitWidth));
    signal D : aAudioData(0 downto -(gAudioBitWidth - 1));

    -- signals for the LSFR
    signal RegsLFSR, NextRegsLFSR : std_ulogic_vector(cNumRegsLFSR-1 downto 0);

    -- random number created by the lfs
    signal RandomValue : aAudioData(0 downto -(gWaveTableBitWidth-1));
  
begin

ROM_READ: process (iClk) is
    variable Address  : natural;
    variable TemporaryResult : aAudioData(D_long'high downto D_long'low + 1);
    variable TemporaryWithSignage : aAudioData(D_long'range);
 begin
    if (iClk'event and iClk = '1') then

        if (iSampleStrobe = '1') then
                -- calculate the right adress
                case (PhaseAddr(PhaseAddr'high-1)) is
                    -- second an fourth quadrant
                    when '1' => Address := (SineTable'length-1) - to_integer(PhaseAddr(PhaseAddr'left - 2 downto (PhaseAddr'left-(LogDualis(gWaveTable'length)-1))));
                    -- first and third quadrant
                    when others => Address := to_integer(PhaseAddr(PhaseAddr'left - 2 downto (PhaseAddr'left-(LogDualis(gWaveTable'length)-1))));
                end case;

            -- read the rom
            TemporaryResult := SineTable(Address);

            -- add a signage to the just read value
            TemporaryWithSignage := "0" & TemporaryResult;

            -- correct the values (positive/negative)
            case(PhaseAddr(PhaseAddr'high)) is
                -- third and fourth quadrant are negative
                when '1' => D_long <=  ResizeTruncAbsVal(TemporaryWithSignage * (-1),D_long);
                -- first and second quadrant can be taken as is
                when others => D_long <= TemporaryWithSignage;
            end case;

        end if;
    end if;
 end process;




PhaseCounterDithering: if cEnablePhaseDithering = true generate
    PhaseCounterDitheringProc : process(PhaseAddr,iPhaseIncrement,RandomValue) is
        variable TempVal : aAudioData(PhaseAddr'range);
    begin

        TempVal := (others => '0');
        TempVal(gPhaseResolution-LogDualis(gWaveTable'length) downto gPhaseResolution - LogDualis(gWaveTable'length) -gNrOfPhaseDitherBits) := RandomValue(RandomValue'left downto RandomValue'left-gNrOfPhaseDitherBits);
        NxtPhaseAddr <= (PhaseAddr + to_unsigned(iPhaseIncrement,PhaseAddr'length - 1)) + to_integer(TempVal);
    end process;
    
end generate;

NoPhaseCounterDithering: if cEnablePhaseDithering = false generate
    -- increment the phasecounter
    NxtPhaseAddr <= (PhaseAddr + to_unsigned(iPhaseIncrement,PhaseAddr'length - 1));
end generate;

-- register the phasecounter
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

-- connect to output ports
oD <= ResizeTruncAbsVal(D_long,D);
oVal <= iSampleStrobe;



-- random number generator (MLLFSR)

RandomNumGen: if cEnablePhaseDithering = true generate

    NextRegsLFSR <= RegsLFSR(cNumRegsLFSR - 2 downto 0) & (RegsLFSR(cNumRegsLFSR-1) xor RegsLFSR(5) xor RegsLFSR(3) xor RegsLFSR(0));

    TheLSFR: process(iClk, inResetAsync) is 
        variable Index : natural;
    begin

        if(inResetAsync = not('1')) then 
            RegsLFSR <= (others => '1');
            RandomValue <= (others => '0');
        elsif (rising_edge(iClk)) then
        
            Index := 0;

            if (iSampleStrobe = '1') then 
                RegsLFSR <= NextRegsLFSR;

                for I in RandomValue'range loop
                    RandomValue(I) <= NextRegsLFSR(Index);
                    Index := Index + 1;
                end loop;

            end if;

        end if;
    end process;

end generate;

end Rtl;
