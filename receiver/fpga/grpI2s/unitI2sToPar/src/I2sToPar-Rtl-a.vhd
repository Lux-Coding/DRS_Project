--------------------------------------------------------------------------------
-- Title       : Converts I2S to parallel digital audio streaming protocol
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: I2sToPar-Rtl-a.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of I2sToPar is

  signal BclkDlyd     : std_ulogic;
  signal BclkRiseEdge : std_ulogic;

  signal LrcDlyd : std_ulogic;
  signal LrcEdge : std_ulogic;

  -- Parallelized data word. One extra bit above the MSB for the empty bit in
  -- I2s protocol leads to a more regular design without extra handling of this
  -- bit.
  signal D, NextD : signed (gAudioBitWidth-1+1 downto 0);

  subtype aAudioDataFixedWidth is aAudioData(0 downto -(gAudioBitWidth-1));
  
  -----------------------------------------------------------------------------
  -- State Definitions
  -----------------------------------------------------------------------------
  type aState is (
    Waiting,
    ReceivingSerData);

  signal State, NextState : aState;
  signal ValL, NextValL   : std_ulogic;
  signal ValR, NextValR   : std_ulogic;
  -- Index into the data word and fsmD register at the same time.
  signal AudioBitCtr,
    NextAudioBitCtr : unsigned(LogDualis(gAudioBitWidth+1)-1 downto 0);

begin

  -- Convert edges into strobes.
  Delay1Clk : process (iClk, inResetAsync) is
  begin
    if (inResetAsync = cResetActive) then
      BclkDlyd <= cInactivated;
      LrcDlyd  <= cInactivated;
    elsif rising_edge(iClk) then
      LrcDlyd  <= iLrc;
      BclkDlyd <= iBclk;
    end if;
  end process Delay1Clk;

  LrcEdge <= cActivated when (iLrc /= LrcDlyd) else
             cInactivated;

  BclkRiseEdge <= cActivated when (iBclk = '1' and BclkDlyd = '0') else
                  cInactivated;

  ------------------
  -- Data Registers
  ------------------
  DataRegisters : process(iClk, inResetAsync)
  begin
    if (inResetAsync = cResetActive) then
      D <= (others => '-');
    elsif rising_edge(iClk) then
      D <= NextD;
    end if;
  end process;

  ------------------
  -- State Registers
  ------------------
  StateRegisters : process(iClk, inResetAsync)
  begin
    if (inResetAsync = cResetActive) then
      State       <= Waiting;
      ValL        <= cInactivated;
      ValR        <= cInactivated;
      AudioBitCtr <= to_unsigned(0, AudioBitCtr'length);
    elsif rising_edge(iClk) then
      State       <= NextState;
      ValL        <= NextValL;
      ValR        <= NextValR;
      AudioBitCtr <= NextAudioBitCtr;
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Next State and Output Logic: Combinatorial
  -----------------------------------------------------------------------------
  NextStateAndOutputLogic : process (
    iLrc,
    iSd,
    LrcEdge,
    BclkRiseEdge,
    D,
    State,
    ValL,
    ValR,
    AudioBitCtr)

  begin

    ---------------------------------------------------------------------------
    -- Set Next State Defaults
    ---------------------------------------------------------------------------
    NextState       <= State;
    NextAudioBitCtr <= AudioBitCtr;
    NextValL        <= cInactivated;
    NextValR        <= cInactivated;

    ---------------------------------------------------------------------------
    -- Set Next Data Defaults
    ---------------------------------------------------------------------------
    NextD <= D;

    ---------------------------------------------------------------------------
    -- Set Output Defaults
    ---------------------------------------------------------------------------

    ---------------------------------------------------------------------------
    -- Consider Actual States and Inputs
    ---------------------------------------------------------------------------
    case State is

      when Waiting =>
        if LrcEdge = cActivated then
          NextState <= ReceivingSerData;
        end if;
        NextAudioBitCtr <= to_unsigned(gAudioBitWidth, AudioBitCtr'length);

      when ReceivingSerData =>
        if BclkRiseEdge = cActivated then
          NextD(to_integer(AudioBitCtr)) <= iSd;
          NextAudioBitCtr                <= AudioBitCtr-1;
          if AudioBitCtr = 0 then
            if iLrc = cLrcValMeaningLeft then
              NextValL <= cActivated;
            else
              NextValR <= cActivated;
            end if;
            NextState <= Waiting;
          end if;
        end if;
    end case;

  end process NextStateAndOutputLogic;

  oValL <= ValL;
  oValR <= ValR;
  oD    <= aAudioDataFixedWidth(D(gAudioBitWidth-1 downto 0));

end Rtl;

