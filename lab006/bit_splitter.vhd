-- This code converts a four-bit input signal into four one-bit output signals, allowing each bit to be processed or used individually in subsequent circuits.

library ieee;
use ieee.std_logic_1164.all;

entity bit_splitter is
    port (
        input : in std_logic_vector(3 downto 0);
		  output_bit3 : out std_logic;
        output_bit2 : out std_logic;
        output_bit1 : out std_logic;
        output_bit0 : out std_logic
    );
end entity bit_splitter;

architecture arc_bit_splitter of bit_splitter is
begin
	 output_bit3 <= input(3);
    output_bit2 <= input(2);
    output_bit1 <= input(1);
    output_bit0 <= input(0);
end architecture arc_bit_splitter;