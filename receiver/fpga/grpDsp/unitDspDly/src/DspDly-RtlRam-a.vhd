--------------------------------------------------------------------------------
-- Title       : z^{-1} delay
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: DspDly-RtlRam-a.vhd 711 2017-11-03 18:22:43Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : Implementation infering RAM blocks
--------------------------------------------------------------------------------

architecture RtlRam of DspDly is

  type aMemory is array (0 to gDelay-1) of aAudioData(0 downto -(gAudioBitWidth-1));

  constant cBitWidth            : natural := LogDualis(gDelay+1);
  constant cZero                : unsigned(cBitWidth-1 downto 0) := to_unsigned(0, cBitWidth);
  signal Memory                 : aMemory := (others => (others => '0'));
  signal WriteEnable            : std_ulogic := cInactivated;
  signal Address                : unsigned(cBitWidth-1 downto 0) := cZero;

begin

  WriteEnable <= iValDry;

  ------------------------------------------------------------------------------
  -- Read and write RAM
  ------------------------------------------------------------------------------

  ReadWrite: process(iClk)
  begin
    if rising_edge(iClk) then
      if WriteEnable = cActivated then
        Memory(to_integer(Address)) <= iDdry;
      end if;
      
      oDwet <= Memory(to_integer(Address));
    end if;
  end process ReadWrite;

  ------------------------------------------------------------------------------
  -- Address pointer logic
  ------------------------------------------------------------------------------

  Addressing: process(iClk, inResetAsync)
    variable vAddress : unsigned(cBitWidth-1 downto 0);
  begin
    vAddress := (others => '0');

    if inResetAsync = cnActivated then
      Address <= cZero;
    elsif rising_edge(iClk) then
      if WriteEnable = cActivated then
        vAddress := Address + 1;

        if to_integer(vAddress) = gDelay then
          vAddress := cZero;
        end if;

        Address <= vAddress;
      end if;
    end if;
  end process Addressing;

end RtlRam;
