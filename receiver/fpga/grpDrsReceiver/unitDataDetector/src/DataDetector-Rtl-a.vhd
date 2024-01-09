architecture Rtl of DataDetector is

    constant cCyclesPerBit : integer := gClkFrequency / gBaudRate;
    constant cHundresUsCountsOne : integer := gDistanceOne_us / 100;
    constant cHundresUsCountsTwo : integer := gDistanceTwo_us / 100;
    constant cHundresUsCountsThree : integer := gDistanceThree_us / 100;
    constant cHundresUsCountsFour : integer := gDistanceFour_us / 100;

    type aState is (WaitForRisingEdge, WaitUntilFirstSample, Sampling, OutputDetected, IgnoreIncoming);

    type aRegs is record
        State      : aState;
        CycleCount : unsigned(LogDualis(cHundresUsCountsFour + 1) downto 0);
        BitCount   : unsigned(LogDualis(gDetectData'length + 1) downto 0);
        Bits       : std_ulogic_vector(gDetectData'range);
        ByteDetected : std_ulogic;
    end record;

    constant cInitRegs : aRegs := (
        State => WaitForRisingEdge,
        CycleCount => 0,
        BitCount => 0,
        Bits => (others => '0'),
        ByteDetected => '0'
    );

    signal R, NextR : aRegs;
    signal HundredUsStrobe : std_ulogic;

begin

    comb: process(R, iData) is    
    variable vDelay : integer;
    begin
        NextR <= R;

        case iDistanceSelect is
            when "00" => 
                vDelay := cHundresUsCountsOne;
            when "01" => 
                vDelay := cHundresUsCountsTwo;
            when "10" => 
                vDelay := cHundresUsCountsThree;
            when others => 
                vDelay := cHundresUsCountsFour;
        end case;

        case R.State is
            when WaitForRisingEdge =>
                if iData = '1' then                    
                    NextR.State <= WaitUntilFirstSample;
                    NextR.CycleCount <= 0;
                end if;
            when WaitUntilFirstSample =>
                if to_integer(R.CycleCount) < cCyclesPerBit / 2 then
                    NextR.CycleCount <= R.CycleCount + 1;
                else
                    NextR.State <= Sampling;
                    NextR.CycleCount <= 0;
                    NextR.BitCount <= 0;
                end if;
            when Sampling =>
                NextR.CycleCount <= R.CycleCount + 1;
                if to_integer(R.CycleCount) = cCyclesPerBit then
                    NextR.CycleCount <= 0;
                    NextR.Bits(to_integer(R.BitCount)) <= iData;
                    NextR.BitCount <= R.BitCount + 1;                    
                end if;
                if to_integer(R.BitCount) = gDetectData'length - 1 then
                    NextR.CycleCount <= 0;
                    NextR.State <= IgnoreIncoming;
                    if iData & R.Bits(6 downto 0) = gDetectData then
                        NextR.ByteDetected <= '1';
                        NextR.State <= OutputDetected;
                    end if;                        
                end if;
            when OutputDetected =>
                NextR.CycleCount <= R.CycleCount + 1;
                if to_integer(R.CycleCount) = gDetectCycleLength then
                    NextR.ByteDetected <= '0';
                    NextR.State <= IgnoreIncoming;
                    NextR.CycleCount <= 0;
                end if;
            when IgnoreIncoming =>
                if HundredUsStrobe = '1' then 
                    NextR.CycleCount <= R.CycleCount + 1;
                end if;
                if to_integer(R.CycleCount) = vDelay then
                    NextR.State <= WaitForRisingEdge;
                end if;
            when others =>
                null;        
        end case;
    end process;

    registering : process (iClk, inResetAsync)
    begin
        if (inResetAsync = not('1')) then
            R <= cInitRegs;
        elsif rising_edge(iClk) then
            R <= NextR;
        end if;
    end process;

    hundredUs_strobe_generator: entity work.StrobeGen
    generic map (
        gClkFrequency    => gClkFrequency,
        gStrobeFrequency => 10000
    )
    port map (
        iClk         => iClk,
        inResetAsync => inResetAsync,
        oStrobe      => HundredUsStrobe
    );

    oByteDetected <= R.ByteDetected;

end architecture Rtl;
