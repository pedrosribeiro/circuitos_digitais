Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity up_counter_256 is
	port(
		CLK, RST: in std_logic;
		COUNT_OUT: out std_logic_vector(7 downto 0) -- 8 bits
	);
end up_counter_256;

architecture arc_up_counter_256 of up_counter_256 is
	signal count: std_logic_vector(8 downto 0) := "000000000";
begin
	COUNT_OUT(7) <= count(7);
	COUNT_OUT(6) <= count(6);
	COUNT_OUT(5) <= count(5);
	COUNT_OUT(4) <= count(4);
	COUNT_OUT(3) <= count(3);
	COUNT_OUT(2) <= count(2);
	COUNT_OUT(1) <= count(1);
	COUNT_OUT(0) <= count(0);
	process(CLK, RST)
		begin
			if (RST = '1' or count = "100000000") then -- reset when RST or reachs the end 256
				count <= "000000000";
			elsif rising_edge(CLK) then -- count
				count <= count + 1;
			end if;
	end process;
end arc_up_counter_256;