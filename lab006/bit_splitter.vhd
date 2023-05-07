-- This code converts a three-bit input signal into three one-bit output signals, allowing each bit to be processed or used individually in subsequent circuits.

library ieee;
use ieee.std_logic_1164.all;

entity bit_splitter is
    port (
        input : in std_logic_vector(2 downto 0);
        output_bit2 : out std_logic;
        output_bit1 : out std_logic;
        output_bit0 : out std_logic
    );
end entity bit_splitter;

architecture arc_bit_splitter of bit_splitter is
begin
    output_bit2 <= input(2);
    output_bit1 <= input(1);
    output_bit0 <= input(0);
end architecture arc_bit_splitter;
