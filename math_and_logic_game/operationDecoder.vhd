-- This VHDL code implements a block that converts 2-bit input values into symbols to be displayed on a seven-segment display.

Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity operationDecoder is
    port (
        input : in std_logic_vector(1 downto 0);
        output : out std_logic_vector(6 downto 0)
    );
end entity operationDecoder;

architecture arc_operationDecoder of operationDecoder is
begin
    process(input)
    begin
        case input is
            when "00" =>
                output <= "0100100"; -- shows "S" in the display (sum)
            when "01" =>
                output <= "1000010"; -- shows "d" in the display (difference)
            when "10" =>
                output <= "0001000"; -- shows "A" in the display (AND)
            when "11" =>
                output <= "1100010"; -- shows "o" in the display (OR)
            when others =>
                output <= "0000000"; -- shows "0" in the display (undefined)
        end case;
    end process;
end architecture arc_operationDecoder;
