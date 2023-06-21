-- This VHDL code implements an ascending 16-bit counter that counts from 0 to 15 and automatically resets.
-- The output "COUNT_OUT" represents the current value of the counter.

Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity up_counter_16 is
	port(
		CLK, RST: in std_logic;
		COUNT_OUT: out std_logic_vector(3 downto 0) -- 4 bits (0000 to 1111)
	);
end up_counter_16;

architecture arc_up_counter_16 of up_counter_16 is
	signal count: std_logic_vector(4 downto 0) := "00000";
begin
	COUNT_OUT(3) <= count(3);
	COUNT_OUT(2) <= count(2);
	COUNT_OUT(1) <= count(1);
	COUNT_OUT(0) <= count(0);
	process(CLK, RST)
		begin
			if (RST = '1' or count = "10000") then -- reset when RST or reachs the end 16
				count <= "00000";
			elsif rising_edge(CLK) then -- count
				count <= count + 1;
			end if;
	end process;
end arc_up_counter_16;