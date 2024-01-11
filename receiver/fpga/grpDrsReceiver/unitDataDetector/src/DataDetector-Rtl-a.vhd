architecture Rtl of DataDetector is

    constant cCyclesPerBit : integer := gClkFrequency / gBaudRate;

    type aState is (WaitForRisingEdge, WaitUntilFirstSample, Sampling, OutputDetected, IgnoreIncoming);

    type aRegs is record
        State        : aState;
        CycleCount   : unsigned(LogDualis(cCyclesPerBit + 1) downto 0);
        BitCount     : unsigned(LogDualis(gDetectData'length + 1) downto 0);
        Bits         : std_ulogic_vector(gDetectData'range);
        ByteDetected : std_ulogic;
        SegDistance  : std_logic_vector(6 downto 0);
        DetectedCounter : unsigned(7 downto 0);
    end record;

    constant cInitRegs : aRegs := (
        State => WaitForRisingEdge,
        CycleCount => (others => '0'),
        BitCount => (others => '0'),
        Bits => (others => '0'),
        ByteDetected => '0',
        SegDistance => (others => '0'),
        DetectedCounter => (others => '0')
    );

    signal R, NextR : aRegs;
    signal MsStrobe : std_ulogic := '0';
    signal SecondsStrobe : std_ulogic := '0';

begin

    comb: process(R, iData, iDistanceSelect, MsStrobe, iSetDetectedKey, SecondsStrobe) is
    variable vDelay : integer;
    begin
        NextR <= R;

        case iDistanceSelect is
            when "00" => 
                vDelay := gDistanceOne_ms;
                NextR.SegDistance <= not std_logic_vector(ToSevSeg(to_unsigned(1, 4)));
            when "01" => 
                vDelay := gDistanceTwo_ms;
                NextR.SegDistance <= not std_logic_vector(ToSevSeg(to_unsigned(2, 4)));
            when "10" => 
                vDelay := gDistanceThree_ms;
                NextR.SegDistance <= not std_logic_vector(ToSevSeg(to_unsigned(3, 4)));
            when others => 
                vDelay := gDistanceFour_ms;
                NextR.SegDistance <= not std_logic_vector(ToSevSeg(to_unsigned(4, 4)));
        end case;

        if SecondsStrobe = '1' and iSetDetectedKey = '1' then
            NextR.CycleCount <= (others => '0');
            NextR.ByteDetected <= '1';
            NextR.State <= OutputDetected;
            NextR.DetectedCounter <= R.DetectedCounter + 1;
        else
            case R.State is
                when WaitForRisingEdge =>
                    if iData = '1' then                    
                        NextR.State <= WaitUntilFirstSample;
                        NextR.CycleCount <= (others => '0');
                    end if;
                when WaitUntilFirstSample =>
                    if to_integer(R.CycleCount) < cCyclesPerBit / 2 then
                        NextR.CycleCount <= R.CycleCount + 1;
                    else
                        NextR.State <= Sampling;
                        NextR.CycleCount <= (others => '0');
                        NextR.BitCount <= (others => '0');
                    end if;
                when Sampling =>
                    NextR.CycleCount <= R.CycleCount + 1;
                    -- immediately sample first bit
                    if to_integer(R.BitCount) = 0 or to_integer(R.CycleCount) = cCyclesPerBit then
                        NextR.CycleCount <= (others => '0');
                        NextR.Bits(to_integer(R.BitCount)) <= iData;
                        NextR.BitCount <= R.BitCount + 1;                    
                    end if;
                    if to_integer(R.BitCount) = gDetectData'length then
                        NextR.CycleCount <= (others => '0');
                        NextR.State <= IgnoreIncoming;
                        if iData & R.Bits(6 downto 0) = gDetectData then
                            NextR.State <= OutputDetected;
                            NextR.DetectedCounter <= R.DetectedCounter + 1;
                        end if;
                    end if;
                when OutputDetected =>
                    NextR.ByteDetected <= '1';
                    NextR.CycleCount <= R.CycleCount + 1;
                    if to_integer(R.CycleCount) = gDetectCycleLength then
                        NextR.ByteDetected <= '0';
                        NextR.State <= IgnoreIncoming;
                        NextR.CycleCount <= (others => '0');
                    end if;
                when IgnoreIncoming =>
                    if MsStrobe = '1' then 
                        NextR.CycleCount <= R.CycleCount + 1;
                    end if;
                    if to_integer(R.CycleCount) = vDelay then
                        NextR.State <= WaitForRisingEdge;
                    end if;
                when others =>
                    null;        
            end case;        
        end if;
    end process;

    registering : process (iClk, inResetAsync)
    begin
        if (inResetAsync = not('1')) then
            R <= cInitRegs;
        elsif rising_edge(iClk) then
            R <= NextR;
        end if;
    end process;

    ms_strobe_generator: entity work.StrobeGen
    generic map (
        gClkFrequency    => gClkFrequency,
        gStrobeFrequency => 1000
    )
    port map (
        iClk         => iClk,
        inResetAsync => inResetAsync,
        oStrobe      => MsStrobe
    );

    s_strobe_generator: entity work.StrobeGen
    generic map (
        gClkFrequency    => gClkFrequency,
        gStrobeFrequency => 1
    )
    port map (
        iClk         => iClk,
        inResetAsync => inResetAsync,
        oStrobe      => SecondsStrobe
    );

    oByteDetected <= R.ByteDetected;
    oSegDistance <= R.SegDistance;
    
    oSeg0 <= not std_logic_vector(ToSevSeg(unsigned(R.Bits(3 downto 0))));
    oSeg1 <= not std_logic_vector(ToSevSeg(unsigned(R.Bits(7 downto 4))));
    
    oSeg2 <= not std_logic_vector(ToSevSeg(unsigned(R.DetectedCounter(3 downto 0))));
    oSeg3 <= not std_logic_vector(ToSevSeg(unsigned(R.DetectedCounter(7 downto 4))));

end architecture Rtl;
