-- This VHDL code implements an ascending 4-bit counter that counts from 0 to 3 and automatically resets.
-- The output "COUNT_OUT" represents the current value of the counter.

Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity up_counter_4 is
	port(
		CLK, RST: in std_logic;
		COUNT_OUT: out std_logic_vector(1 downto 0) -- 2 bits (00 to 11)
	);
end up_counter_4;

architecture arc_up_counter_4 of up_counter_4 is
	signal count: std_logic_vector(2 downto 0) := "000";
begin
	COUNT_OUT(1) <= count(1);
	COUNT_OUT(0) <= count(0);
	process(CLK, RST)
		begin
			if (RST = '1' or count = "100") then -- reset when RST or reachs the end 4
				count <= "000";
			elsif rising_edge(CLK) then -- count
				count <= count + 1;
			end if;
	end process;
end arc_up_counter_4;