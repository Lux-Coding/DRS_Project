--------------------------------------------------------------------------------
-- Title       : Converts parallel digital audio streaming protocol to I2S
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: ParToI2s-Rtl-a.vhd 693 2017-10-16 10:25:52Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Rtl of ParToI2s is

  constant cSilence : signed(gAudioBitWidth-1 downto 0) :=
    (others => '0');

  signal BclkDlyd     : std_ulogic;
  signal BclkFallEdge : std_ulogic;

  signal LastValidDL : signed(gAudioBitWidth-1 downto 0);
  signal LastValidDR : signed(gAudioBitWidth-1 downto 0);

  -----------------------------------------------------------------------------
  -- State Definitions
  -----------------------------------------------------------------------------
  type aState is (
    WaitingValL,
    SyncingToBclk,
    FirstBitEmptyL,
    SendingL,
    FirstBitEmptyR,
    SendingR);

  signal State, NextState     : aState;
  signal BclkCtr, NextBclkCtr : unsigned(LogDualis(gAudioBitWidth)-1 downto 0);

begin

  -- Wait for the validity of the audio data and store the data when it's valid.
  StoreAudioD : process (iClk, inResetAsync) is
    subtype aDlSigned is signed(iDL'length-1 downto 0);
    subtype aDrSigned is signed(iDR'length-1 downto 0);
  begin
    if (inResetAsync = cResetActive) then
      LastValidDL <= cSilence;
      LastValidDR <= cSilence;
    elsif rising_edge(iClk) then
      if iValL = cActivated then
        LastValidDL <= aDlSigned(iDL);
      end if;
      if iValR = cActivated then
        LastValidDR <= aDrSigned(iDR);
      end if;
    end if;
  end process StoreAudioD;

  -- Convert a rising edge into a strobe.
  Delay1Clk : process (iClk, inResetAsync) is
  begin
    if (inResetAsync = cResetActive) then
      BclkDlyd <= cInactivated;
    elsif rising_edge(iClk) then
      BclkDlyd <= iBclk;
    end if;
  end process Delay1Clk;

  BclkFallEdge <= cActivated when (iBclk = '0' and BclkDlyd = '1') else
                  cInactivated;


  ------------------
  -- State Registers
  ------------------
  StateRegisters : process(iClk, inResetAsync)
  begin
    if (inResetAsync = cResetActive) then
      State   <= WaitingValL;
      BclkCtr <= to_unsigned(0, BclkCtr'length);
    elsif rising_edge(iClk) then
      State   <= NextState;
      BclkCtr <= NextBclkCtr;
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Next State and Output Logic: Combinatorial
  -----------------------------------------------------------------------------
  NextStateAndOutputLogic : process (
    iValL,
    BclkFallEdge,
    LastValidDL,
    LastValidDR,
    State,
    BclkCtr)

  begin

    ---------------------------------------------------------------------------
    -- Set Next State Defaults
    ---------------------------------------------------------------------------
    NextState   <= State;
    NextBclkCtr <= BclkCtr;

    ---------------------------------------------------------------------------
    -- Set Output Defaults
    ---------------------------------------------------------------------------
    oLrc <= not cLrcValMeaningLeft;
    oSd  <= '0';

    ---------------------------------------------------------------------------
    -- Consider Actual States and Inputs
    ---------------------------------------------------------------------------
    case State is

      when WaitingValL =>
        -- First wait for the validity of the left sample. The left sample acts
        -- as master for the timing of this unit.
        if iValL = cActivated then
          NextState <= SyncingToBclk;
        end if;

      when SyncingToBclk =>
        -- Wait for the first falling edge on Bclk to come along.
        if BclkFallEdge = cActivated then
          NextState <= FirstBitEmptyL;
        end if;

      when FirstBitEmptyL =>
        -- Let one bit go by before beginning to send.
        if BclkFallEdge = cActivated then
          NextState   <= SendingL;
          NextBclkCtr <= to_unsigned(gAudioBitWidth-1, NextBclkCtr'length);
        end if;
        oLrc <= cLrcValMeaningLeft;

      when SendingL =>
        -- Sending all data bits for the left channel.
        if BclkFallEdge = cActivated then
          if BclkCtr = 0 then
            NextState <= FirstBitEmptyR;
          else
            NextBclkCtr <= BclkCtr-1;
          end if;
        end if;
        oSd  <= LastValidDL(to_integer(BclkCtr));
        oLrc <= cLrcValMeaningLeft;

      when FirstBitEmptyR =>
        -- Let one bit go by before beginning to send.
        if BclkFallEdge = cActivated then
          NextState   <= SendingR;
          NextBclkCtr <= to_unsigned(gAudioBitWidth-1, NextBclkCtr'length);
        end if;

      when SendingR =>
        -- Sending all data bits for the left channel.
        if BclkFallEdge = cActivated then
          if BclkCtr = 0 then
            NextState <= WaitingValL;
          else
            NextBclkCtr <= BclkCtr-1;
          end if;
        end if;
        oSd <= LastValidDR(to_integer(BclkCtr));

    end case;

  end process NextStateAndOutputLogic;

end Rtl;

