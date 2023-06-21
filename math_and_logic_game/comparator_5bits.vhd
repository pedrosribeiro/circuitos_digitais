-- This VHDL code implements a comparator block that compares a 5-bit vector with five individual inputs. 
-- It checks if the inputs match the vector and returns a logic '1' if they are equal, and a logic '0' otherwise.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity comparator_5bits is
    port (
        input_vector : in  std_logic_vector(4 downto 0); -- operation result
        I4      		: in  std_logic;
        I3      		: in  std_logic;
        I2     		: in  std_logic;
        I1      		: in  std_logic;
        I0      		: in  std_logic;
        match			: out std_logic -- flag
    );
end entity comparator_5bits;

architecture arc_comparator_5bits of comparator_5bits is
begin
    process (input_vector, I4, I3, I2, I1, I0)
    begin
        if (input_vector = I4 & I3 & I2 & I1 & I0) then
            match <= '1'; -- inputs match
        else
            match <= '0'; -- inputs don't match
        end if;
    end process;
end architecture arc_comparator_5bits;
