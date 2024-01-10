--------------------------------------------------------------------------------
-- Title       : FIR filter
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: DspFir-RtlRam-a.vhd 716 2017-11-12 16:57:46Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture RtlRam of DspFir is

  constant cNumCoef         : positive := gB'length;
  constant cAddressWidth    : positive := LogDualis(cNumCoef);

  type aRamMemory is array (0 to cNumCoef-1) of aAudioData(0 downto -(gAudioBitWidth-1));
  type aRomMemory is array (0 to cNumCoef-1) of aAudioData(0 downto -(gCoefWidth-1)); 
  subtype aAddress is unsigned(cAddressWidth-1 downto 0);

  -- Initialisation function for coef ROM
  function InitRom
    return aRomMemory is
    variable vRom   : aRomMemory := (others => (others => '0'));
    variable vCoef  : aAudioData(0 downto -(gCoefWidth));
  begin
    for vAddress in 0 to cNumCoef-1 loop
      vCoef := to_sfixed(gB(vAddress), vCoef, fixed_saturate, fixed_truncate); -- truncation with 1 Bit more, because only "normal" truncation possible
      vRom(vAddress) := ResizeTruncAbsVal(vCoef, vRom(vAddress)); -- absolute truncation
    end loop;
    return vRom;
  end InitRom;
  
  -- Data
  signal SampleMemory       : aRamMemory := (others => (others => cInactivated));
  signal CoefMemory         : aRomMemory := InitRom;
  signal ReadSample         : aAudioData(0 downto -(gAudioBitWidth-1));
  signal DdryDelayed        : aAudioData(0 downto -(gAudioBitWidth-1));
  signal Sample             : aAudioData(0 downto -(gAudioBitWidth-1));
  signal Coef               : aAudioData(0 downto -(gAudioBitWidth-1));
  signal MultResult         : aAudioData(0 downto -(gAudioBitWidth-1));
  signal MultResultDelayed  : aAudioData(0 downto -(gAudioBitWidth-1));
  signal SumInput           : aAudioData(0 downto -(gAudioBitWidth-1));
  signal Sum                : aAudioData(0 downto -(gAudioBitWidth-1));
  signal NextSum            : aAudioData(0 downto -(gAudioBitWidth-1));

  -----------------------------------------------------------------------------
  -- Control FSMD definitions
  -----------------------------------------------------------------------------

  type aAddressState is (Idle, Read);
  type aSumState is (Idle, SumEnable, SumSelect, SumWait1, SumWait2, SumValid);

  type aRegSet is record
    AddressState      : aAddressState;
    SumState          : aSumState;
    WriteAddress      : aAddress;
    ReadAddressSample : aAddress;
    ReadAddressCoef   : aAddress;
    SelSumUp          : std_ulogic;
    EnableSumUp       : std_ulogic;
    ValWet            : std_ulogic;
    FirstSample       : std_ulogic;
  end record aRegSet;

  constant cRinitVal: aRegSet := (
    AddressState      => Idle,
    SumState          => Idle,
    WriteAddress      => to_unsigned(cNumCoef-1, cAddressWidth),
    ReadAddressSample => to_unsigned(0, cAddressWidth),
    ReadAddressCoef   => to_unsigned(0, cAddressWidth),
    SelSumUp          => cInactivated,
    EnableSumUp       => cInactivated,
    ValWet            => cInactivated,
    FirstSample       => cActivated
  );

  signal R, NextR : aRegSet;
  signal WriteEnable : std_ulogic := cInactivated;

begin

  ------------
  -- FSMD Registers
  ------------
  Registers : process(iClk, inResetAsync)
  begin
    if inResetAsync = cnActivated then
      R <= cRinitVal;
    elsif rising_edge(iClk) then
      R <= NextR;  
    end if;
  end process;

  ------------------------------------------------------------------------------
  -- Control FSMD
  ------------------------------------------------------------------------------
  WriteEnable <= iValDry;

  NextStateAndOutput : process ( R, iValDry )

    variable vNextWriteAddress : aAddress;

  begin

    -- default values
    NextR <= R;

    -- Address control
    case R.AddressState is

      when Idle =>
        NextR.FirstSample <= cActivated;
        if iValDry = cActivated then
          NextR.AddressState <= Read;
          NextR.ReadAddressCoef <= R.ReadAddressCoef + 1;
        end if;

      when Read =>
        NextR.FirstSample <= cInactivated;

        if R.ReadAddressSample = cNumCoef-1 then
          NextR.ReadAddressSample <= to_unsigned(0, cAddressWidth);
        else
          NextR.ReadAddressSample <= R.ReadAddressSample + 1;
        end if;

        if R.ReadAddressCoef = cNumCoef-1 then
          vNextWriteAddress := R.WriteAddress;
          if vNextWriteAddress = 0 then
            vNextWriteAddress := to_unsigned(cNumCoef-1, cAddressWidth);
          else
            vNextWriteAddress := vNextWriteAddress - 1;
          end if;

          NextR.ReadAddressCoef <= to_unsigned(0, cAddressWidth);
          NextR.WriteAddress <= vNextWriteAddress;        
          NextR.AddressState <= Idle;
        else
          NextR.ReadAddressCoef <= R.ReadAddressCoef + 1;
        end if;

    end case;

    -- Sum control
    case R.SumState is
      when Idle =>
        if iValDry = cActivated then
          NextR.SumState <= SumEnable;
          NextR.EnableSumUp <= cActivated;
        end if;

      when SumEnable =>        
        NextR.SumState <= SumSelect;
        NextR.SelSumUp <= cActivated;

      when SumSelect =>
        if R.ReadAddressCoef = cNumCoef-1 then
          NextR.SumState <= SumWait1;
        end if;

      when SumWait1 =>      
        NextR.SumState <= SumWait2;

      when SumWait2 =>
        NextR.EnableSumUp <= cInactivated;
        NextR.SelSumUp <= cInactivated;
        NextR.ValWet <= cActivated;
        NextR.SumState <= SumValid;

      when SumValid =>
        NextR.ValWet <= cInactivated;
        NextR.SumState <= Idle;

    end case;

  end process NextStateAndOutput;

  ------------------------------------------------------------------------------
  -- Sample RAM
  ------------------------------------------------------------------------------

  SampleRam: process(iClk)
  begin
    if rising_edge(iClk) then
      if WriteEnable = cActivated then
        SampleMemory(to_integer(R.WriteAddress)) <= iDdry;
      end if;
      
      ReadSample <= SampleMemory(to_integer(R.ReadAddressSample));
    end if;
  end process SampleRam;

  ------------------------------------------------------------------------------
  -- Coef ROM
  ------------------------------------------------------------------------------

  CoefRom: process (iClk)
  begin
    if rising_edge (iClk) then
      Coef <= CoefMemory(to_integer(R.ReadAddressCoef));
    end if;
  end process;

  ------------------------------------------------------------------------------
  --Register for first sample and Sample Multiplexer
  ------------------------------------------------------------------------------

  DelayDdry: process(inResetAsync, iClk)
  begin
    if inResetAsync = cnActivated then
      DdryDelayed <= (others => cInactivated);
    elsif rising_edge(iClk) then
      DdryDelayed <= iDdry;
    end if;
  end process DelayDdry;

  Sample <= DdryDelayed when R.FirstSample = cActivated else ReadSample;

  ------------------------------------------------------------------------------
  -- Mult and Add
  ------------------------------------------------------------------------------

  -- Multiplication with absolute truncation and saturation
  MultResult <= ResizeTruncAbsVal(Sample * Coef, MultResult);

  -- Multiplication result result
  MultReg: process(inResetAsync, iClk)
  begin
    if inResetAsync = cnActivated then
      MultResultDelayed <= (others => cInactivated);
    elsif rising_edge(iClk) then
      MultResultDelayed <= MultResult;
    end if;
  end process MultReg;

  -- Addition with absolute truncation and saturation
  NextSum <= ResizeTruncAbsVal(Sum + MultResultDelayed, Sum);

  -- Select input for Sum register: next sum or 0
  SelSumInput: SumInput <= NextSum when R.SelSumUp = cActivated else (others => cInactivated);

  -- Sum register
  SumUp: process(inResetAsync, iClk)
  begin
    if inResetAsync = cnActivated then
      Sum <= (others => cInactivated);
    elsif rising_edge(iClk) then
      -- Only sum up if enabled
      if R.EnableSumUp = cActivated then
        Sum <= SumInput;
      end if;
    end if;
  end process SumUp;

  oDWet <= Sum;
  oValWet <= R.ValWet;
  
end architecture;