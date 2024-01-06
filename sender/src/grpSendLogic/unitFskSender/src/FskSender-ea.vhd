library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.Global.all;


entity FskSender is  

generic (   
            gClkFrequency       : natural := 48E6;
            gDistanceOne_ms     : natural := 1;
            gDistanceTwo_ms     : natural := 10;
            gDistanceThree_ms   : natural := 500;
            gDistanceFour_ms    : natural := 1000;
            gBaudRate           : natural := 9600;
            gDataByte           : std_ulogic_vector(7 downto 0) := x"A"

);

port(
    iClk            :  in std_ulogic;
    inResetAsync    :  in std_ulogic;
    iDistanceSelect :  in std_logic_vector(1 downto 0);
    oData           :  out std_ulogic;
    oSendInProgress :  out std_ulogic
);

end entity;


architecture rtl of FskSender is 
    signal BaudStrobe : std_ulogic;
    signal MSStrobe   : std_ulogic;


    type aState is (WaitForSend, WaitForFirstBaud,Send);
    type aRegSet is record
        state       : aState;
        WaitCounter : unsigned(LogDualis(gDistanceFour_ms) downto 0);
        SendCounter : unsigned(LogDualis(gDataByte'length) - 1 downto 0 ); 
        Data        : std_ulogic;
        SendActive  : std_ulogic;
    end record; 

    constant cInitRegVal : aRegSet := (
        state => WaitForSend,
        WaitCounter => (others => '0'),
        SendCounter => (others => '0'),
        Data => '0',
        SendActive => '0'
    );

    signal Reg, nxtReg : aRegSet;

begin


the_comp : process(Reg, iDistanceSelect, BaudStrobe, MSStrobe) is 

    variable vDelay : natural;
begin 


    case (iDistanceSelect) is 

        when "00" => 
            vDelay := gDistanceOne_ms;
        when "01" => 
            vDelay := gDistanceTwo_ms;
        when "10" => 
            vDelay := gDistanceThree_ms;
        when others => 
            vDelay := gDistanceFour_ms;
    end case;





    case (Reg.state) is 

        when WaitForSend => 

            if(MSStrobe = '1') then 
                nxtReg.WaitCounter <= Reg.WaitCounter + 1;
            end if;

            if (to_integer(Reg.WaitCounter) >= vDelay ) then 
                nxtReg.state <= WaitForFirstBaud;
            end if;

        when WaitForFirstBaud => 

            if(BaudStrobe = '1') then 
                nxtReg.state <= Send;
                nxtReg.SendActive <= '1';
                nxtReg.Data <= gDataByte(0);
            end if;

        when Send => 
            
            if(BaudStrobe = '1') then 
                if(to_integer(Reg.SendCounter) = gDataByte'length) then 
                    nxtReg.SendActive <= '0';
                    nxtReg.SendCounter <= (others => '0');
                    nxtReg.state <= WaitForSend;
                    nxtReg.WaitCounter <= (others => '0');
                    nxtReg.Data <= '0';
                else 
                    nxtReg.Data <= gDataByte(to_integer(Reg.SendCounter));
                end if;
            end if;

        when others => 
            null;
    end case;



end process;



the_registers: process(iClk, inResetAsync) is 
begin

    if(inResetAsync = not('1')) then 
        Reg <= cInitRegVal;
    elsif (rising_edge(iClk)) then 
        nxtReg <= Reg;
    end if;

end process the_registers;

baudrate_generator: entity work.StrobeGen
generic map (
  gClkFrequency    => gClkFrequency,
  gStrobeFrequency => gBaudRate
)
port map (
  iClk         => iClk,
  inResetAsync => inResetAsync,
  oStrobe      => BaudStrobe
);

msstrobe_generator: entity work.StrobeGen
generic map (
  gClkFrequency    => gClkFrequency,
  gStrobeFrequency => 1000
)
port map (
  iClk         => iClk,
  inResetAsync => inResetAsync,
  oStrobe      => MSStrobe
);



end architecture rtl;