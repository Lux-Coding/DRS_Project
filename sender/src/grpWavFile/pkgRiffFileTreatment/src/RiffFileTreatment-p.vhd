--------------------------------------------------------------------------------
-- Title       : Procedures for reading and writing of RIFF files
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: RiffFileTreatment-p.vhd 704 2017-10-27 19:25:59Z mroland $
-- Authors     : Markus Pfaff, Linz/Austria, Copyright (c) 2003-2005
--               Michael Roland, Hagenberg/Austria, Copyright (c) 2011-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Global.all;

package RiffFileTreatment is

  -- A Binary file can be treated as a file consisting of characters. This is of
  -- course not guaranteed in VHDL, but no simlator is known where it doesn't work.
  type aBinaryFile is file of character;

  -- The following type declarations mirror Microsoft definitions in the
  -- multimedia programming part of the SDK of win32.
  -- The character a is added at the beginning due to HSSE style guide
  -- recommendations.
  subtype aByte is integer range 0 to 2**8-1;
  subtype aWord is integer range 0 to 2**16-1;
  -- dword has only 31 bits here because VHDL uses 32 bits for signed
  -- integer. Normally 32 bits unsigned are used.
  subtype aDword is integer range 0 to integer'high;
  subtype aInt is integer range -(2**15) to 2**15-1;
  subtype aLong is integer;

  -- Four Character Code is a string of 4 characters (maybe padded left
  -- with spaces at the right end).
  subtype a4Cc is string(1 to 4);

  ------------------------------------------------------------------------------
  -- Procedures for reading atomic data types of a RIFF file
  ------------------------------------------------------------------------------
  
  procedure ReadChar (file RiffFile                 :       aBinaryFile;
                      variable vCharRead            : out   character;
                      variable vRemainingFileLength : inout aDword);

  procedure ReadByte (file RiffFile                 :       aBinaryFile;
                      variable vByteRead            : out   aByte;
                      variable vRemainingFileLength : inout aDword);

  procedure ReadIntelWord (file RiffFile                 :       aBinaryFile;
                           variable vIntelWordRead       : out   aWord;
                           variable vRemainingFileLength : inout aDword);

  procedure ReadIntelDword (file RiffFile                 :       aBinaryFile;
                            variable vIntelDwordRead      : out   aDword;
                            variable vRemainingFileLength : inout aDword);

  procedure Read4Cc (file RiffFile                 :       aBinaryFile;
                     variable vFourCcRead          : out   a4Cc;
                     variable vRemainingFileLength : inout aDword);

  ------------------------------------------------------------------------------
  -- Procedures for writing atomic data types of a RIFF file
  ------------------------------------------------------------------------------
  
  procedure WriteChar (file RiffFile               :       aBinaryFile;
                       constant cCharToWrite       : in    character;
                       variable vFileLengthWritten : inout aDword);

  procedure WriteByte (file RiffFile               :       aBinaryFile;
                       constant cByteToWrite       : in    aByte;
                       variable vFileLengthWritten : inout aDword);

  procedure WriteIntelWord (file RiffFile               :       aBinaryFile;
                            constant cIntelWordToWrite  : in    aWord;
                            variable vFileLengthWritten : inout aDword);

  procedure WriteIntelWord (file RiffFile               :       aBinaryFile;
                            constant cIntelWordToWrite  : in    signed(15 downto 0);
                            variable vFileLengthWritten : inout aDword);

  procedure WriteIntelDword (file RiffFile               :       aBinaryFile;
                             constant cIntelDwordToWrite : in    aDword;
                             variable vFileLengthWritten : inout aDword);

  procedure WriteFourCc (file RiffFile               :       aBinaryFile;
                         constant cFourCcToWrite     : in    a4Cc;
                         variable vFileLengthWritten : inout aDword);

end RiffFileTreatment;


--------------------------------------------------------------------------------
-- Package Body
--------------------------------------------------------------------------------
package body RiffFileTreatment is

  
  procedure ReadChar (file RiffFile                 :       aBinaryFile;
                      variable vCharRead            : out   character;
                      variable vRemainingFileLength : inout aDword) is
  begin
    vRemainingFileLength := vRemainingFileLength-1;
    if not(endfile(RiffFile)) then
      read (RiffFile, vCharRead);
    else
      report "MP: File ended unexpectedly."
        severity error;
    end if;
  end procedure ReadChar;
  

  procedure ReadByte (file RiffFile                 :       aBinaryFile;
                      variable vByteRead            : out   aByte;
                      variable vRemainingFileLength : inout aDword) is
    variable vCharOfFile : character;
  begin
    ReadChar (RiffFile, vCharOfFile, vRemainingFileLength);
    vByteRead := character'pos(vCharOfFile);
  end procedure ReadByte;


  procedure ReadIntelWord (file RiffFile                 :       aBinaryFile;
                           variable vIntelWordRead       : out   aWord;
                           variable vRemainingFileLength : inout aDword) is
    variable vLsByte, vMsByte : aByte := 0;
  begin
    ReadByte (RiffFile, vLsByte, vRemainingFileLength);
    ReadByte (RiffFile, vMsByte, vRemainingFileLength);
    vIntelWordRead := 2**8 * vMsByte + vLsByte;
  end procedure ReadIntelWord;


  procedure ReadIntelDword (file RiffFile                 :       aBinaryFile;
                            variable vIntelDwordRead      : out   aDword;
                            variable vRemainingFileLength : inout aDword) is
    variable vLsByte, vMsByte, vByte1, vByte2 : aByte := 0;
  begin
    ReadByte (RiffFile, vLsByte, vRemainingFileLength);
    ReadByte (RiffFile, vByte1, vRemainingFileLength);
    ReadByte (RiffFile, vByte2, vRemainingFileLength);
    ReadByte (RiffFile, vMsByte, vRemainingFileLength);
    vIntelDwordRead := 2**24 * vMsByte + 2**16 * vByte2 + 2**8 * vByte1 + vLsByte;
  end procedure ReadIntelDword;


  procedure Read4Cc (file RiffFile                 :       aBinaryFile;
                     variable vFourCcRead          : out   a4Cc;
                     variable vRemainingFileLength : inout aDword) is
  begin
    ReadFour : for vIdx in 1 to 4 loop
      ReadChar (RiffFile, vFourCcRead(vIdx), vRemainingFileLength);
    end loop ReadFour;
  end procedure Read4Cc;


  ------------------------------------------------------------------------------
  -- Procedures for writing atomic data types of a RIFF file
  ------------------------------------------------------------------------------
  procedure WriteChar (file RiffFile               :       aBinaryFile;
                       constant cCharToWrite       : in    character;
                       variable vFileLengthWritten : inout aDword) is
  begin
    write(RiffFile, cCharToWrite);
    vFileLengthWritten := vFileLengthWritten +1;
  end procedure WriteChar;

  procedure WriteByte (file RiffFile               :       aBinaryFile;
                       constant cByteToWrite       : in    aByte;
                       variable vFileLengthWritten : inout aDword) is
    variable vCharToWrite : character;
  begin
    vCharToWrite := character'val(cByteToWrite);
    WriteChar(RiffFile, vCharToWrite, vFileLengthWritten);
  end procedure WriteByte;

  procedure WriteIntelWord (file RiffFile               :       aBinaryFile;
                            constant cIntelWordToWrite  : in    aWord;
                            variable vFileLengthWritten : inout aDword) is
    variable vLsByte, vMsByte : aByte;
  begin
    vLsByte := cIntelWordToWrite rem (2**8);
    vMsByte := cIntelWordToWrite / (2**8);
    WriteByte (RiffFile, vLsByte, vFileLengthWritten);
    WriteByte (RiffFile, vMsByte, vFileLengthWritten);
  end procedure WriteIntelWord;

  procedure WriteIntelWord (file RiffFile               :       aBinaryFile;
                            constant cIntelWordToWrite  : in    signed(15 downto 0);
                            variable vFileLengthWritten : inout aDword) is
    variable vLsByte, vMsByte : aByte;
  begin
    vLsByte := to_integer(unsigned(cIntelWordToWrite(7 downto 0)));
    vMsByte := to_integer(unsigned(cIntelWordToWrite(15 downto 8)));
    WriteByte (RiffFile, vLsByte, vFileLengthWritten);
    WriteByte (RiffFile, vMsByte, vFileLengthWritten);
  end procedure WriteIntelWord;

  procedure WriteIntelDword (file RiffFile               :       aBinaryFile;
                             constant cIntelDwordToWrite : in    aDword;
                             variable vFileLengthWritten : inout aDword) is
    variable vLsByte, vByte1, vByte2, vMsByte : aByte;
    variable vRemainingDword                  : aDword;
  begin
    vRemainingDword := cIntelDwordToWrite;
    vLsByte         := vRemainingDword rem (2**8);
    vRemainingDword := (vRemainingDword - vLsByte) / (2**8);
    vByte1          := vRemainingDword rem (2**8);
    vRemainingDword := (vRemainingDword - vByte1) / (2**8);
    vByte2          := vRemainingDword rem (2**8);
    vRemainingDword := (vRemainingDword - vByte2) / (2**8);
    vMsByte         := vRemainingDword;
    WriteByte (RiffFile, vLsByte, vFileLengthWritten);
    WriteByte (RiffFile, vByte1, vFileLengthWritten);
    WriteByte (RiffFile, vByte2, vFileLengthWritten);
    WriteByte (RiffFile, vMsByte, vFileLengthWritten);
  end procedure WriteIntelDword;

  procedure WriteFourCc (file RiffFile               :       aBinaryFile;
                         constant cFourCcToWrite     : in    a4Cc;
                         variable vFileLengthWritten : inout aDword) is
  begin
    WriteFour : for vIdx in 1 to 4 loop
      WriteChar(RiffFile, cFourCcToWrite(vIdx), vFileLengthWritten);
    end loop WriteFour;
  end procedure WriteFourCc;

end RiffFileTreatment;
