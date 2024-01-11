architecture Rtl of ReceiverInterface is

    constant cTimeStampWidth : integer := 64;
    constant cNanoSecondsInMicro : integer := 1000;

    constant cAvalonAdressTimeStampUpper : integer := 0;
    constant cAvalonAdressTimeStampLower : integer := 1;
    constant cAvalonAdressConfig : integer := 2;

    type aControlRegs is record
        -- timestamp creation 
        time_stamp_set_prev: std_ulogic;
        TimeStampCounter   : unsigned(cTimeStampWidth-1 downto 0);
        TimeStampCapture   : unsigned(cTimeStampWidth-1 downto 0);
        -- interrup handling for driver
        interrupt_state    : std_ulogic;
        interrupt_dbg_tggl : std_ulogic;
        byteDetectAck      : std_ulogic;
    end record;

    constant cInitialControlRegState : aControlRegs := (
        time_stamp_set_prev => '0',
        TimeStampCounter    => (others => '0'),
        TimeStampCapture    => (others => '0'),
        interrupt_state     => '0',
        interrupt_dbg_tggl  => '0',
        byteDetectAck       => '0'
    );

    -- avalon interface registers
    type aAvalonRegSet is record
        time_stamp_reader    : unsigned(cTimeStampWidth-1 downto 0);
        time_stamp_set       : std_ulogic;
        interrupt_reset      : std_ulogic;
    end record;

    constant cInitAvalonRegSet : aAvalonRegSet := (
        time_stamp_reader   => (others => '0'),
        time_stamp_set      => '0',
        interrupt_reset     => '0'
    );

    -- avalon registers
    signal RegsAvalon : aAvalonRegSet := cInitAvalonRegSet;

    -- state machine registers 
    signal NextR, R : aControlRegs;
    
    signal UsStrobe : std_ulogic;

begin

    -------------------------------------------------------------------------------------------------------
    -- FSM
    -------------------------------------------------------------------------------------------------------

    the_fsm: process(R, RegsAvalon, UsStrobe, iByteDetected) is  
    begin
        NextR <= R;

        -- save the old interrupt reset bit to detect edge
        NextR.interrupt_dbg_tggl <= RegsAvalon.interrupt_reset;

        -- reset the interrupt if the reset was written
        if(R.interrupt_dbg_tggl /= RegsAvalon.interrupt_reset) then
            NextR.interrupt_state <= '0';
            NextR.byteDetectAck <= '0';
        end if;

        -- register the time stamp set data for edge detection
        NextR.time_stamp_set_prev <= RegsAvalon.time_stamp_set;

        -- count the time stamp up
        if(UsStrobe = '1') then
            NextR.TimeStampCounter <= R.TimeStampCounter + to_unsigned(cNanoSecondsInMicro, R.TimeStampCounter'length-1);
        end if;

        -- if edge is detected on time_stamp_set -> load written value
        if(RegsAvalon.time_stamp_set /= R.time_stamp_set_prev) then 
            NextR.TimeStampCounter <= RegsAvalon.time_stamp_reader;
        end if;

        if R.interrupt_state = '0' and iByteDetected = '1' then
            NextR.TimeStampCapture <= R.TimeStampCounter;
            NextR.interrupt_state <= '1';
            NextR.byteDetectAck <= '1';
            
        end if;
    end process;

    -------------------------------------------------------------------------------------------------------
    -- registering process
    -------------------------------------------------------------------------------------------------------
    registering : process (csi_clk, rsi_reset_n)
    begin
        if (rsi_reset_n = not('1')) then
            R <= cInitialControlRegState;
        elsif rising_edge(csi_clk) then
            R <= NextR;
        end if;
    end process;

    -------------------------------------------------------------------------------------------------------
    -- microseconds strobe generation for counter 
    -------------------------------------------------------------------------------------------------------

    us_strobe_unit : entity work.StrobeGen(rtl)
        generic map (gClkFrequency => gClkFrequency,
                    gStrobeFrequency => 1_000_000)
        port map(
            iClk => csi_clk,
            inResetAsync => rsi_reset_n,
            oStrobe => UsStrobe
        );

    -------------------------------------------------------------------------------------------------------
    -- avalon interface
    -------------------------------------------------------------------------------------------------------
    avalon_inteface : process (csi_clk)
        variable address : natural;
    begin

        address := to_integer(unsigned(avs_s0_address));

        if rising_edge(csi_clk) then
            
            -- write mode selected
            if avs_s0_write = '1' then
                case address is
                    --0x00
                    when cAvalonAdressTimeStampUpper =>
                        RegsAvalon.time_stamp_reader(63 downto 32) <= unsigned(avs_s0_writedata);
                    --0x04
                    when cAvalonAdressTimeStampLower =>
                        RegsAvalon.time_stamp_reader(31 downto 0) <= unsigned(avs_s0_writedata);
                        RegsAvalon.time_stamp_set <= not(RegsAvalon.time_stamp_set);
                    --0x08
                    when cAvalonAdressConfig =>
                        RegsAvalon.interrupt_reset <= not (RegsAvalon.interrupt_reset);
                    when others =>
                        null;

                end case;
            else
                -- read mode selected              
                if avs_s0_read = '1' then
                    case address is                        
                        --0x00
                        when cAvalonAdressTimeStampUpper =>
                            avs_s0_readdata <= std_logic_vector(R.TimeStampCapture(63 downto 32));
                        --0x04
                        when cAvalonAdressTimeStampLower => 
                             avs_s0_readdata <= std_logic_vector(R.TimeStampCapture(31 downto 0));
                        when others =>
                            null;
                    end case;
                end if;
            end if;
        end if;
    end process;

    oByteDetected_int <= R.interrupt_state;
    oTimestampCounter <= std_ulogic_vector(R.TimeStampCounter);
    oTimestampCapture <= std_ulogic_vector(R.TimeStampCapture);
    oByteDetectedAck <= R.byteDetectAck;
    oByteDetected_int_cond <= R.interrupt_state;

end architecture Rtl;
