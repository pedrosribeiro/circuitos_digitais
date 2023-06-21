-- The provided VHDL code implements an Arithmetic Logic Block that takes two 4-bit numbers (operand_a and operand_b) and a 2-bit operation (operation) 
-- as inputs. It performs the specified operation (addition, subtraction, AND, or OR) on the operands and provides the result.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity arithmetic_logic_block is
    port (
		  operation    : in  std_logic_vector(1 downto 0);
        operand_a    : in  std_logic_vector(3 downto 0);
        operand_b    : in  std_logic_vector(3 downto 0);
		  enable			: in  std_logic;
        result       : out std_logic_vector(4 downto 0) -- 5 bits because of carry out
    );
end entity arithmetic_logic_block;

architecture arc_arithmetic_logic_block of arithmetic_logic_block is
	signal sum: std_logic_vector(3 downto 0);
	signal carry_out: std_logic;
begin
    process (operation, operand_a, operand_b, enable)
    begin
        if enable = '1' then -- only updates the output when enable is high
			case operation is
            when "00" =>  -- addition
					 sum <= operand_a + operand_b;
					 if (operand_a(operand_a'high) = operand_b(operand_b'high) and sum(sum'high) /= operand_a(operand_a'high)) then
						carry_out <= '1';
					 else
						carry_out <= '0';
					 end if;
					 
					 if carry_out = '1' then
						result <= '1' & std_logic_vector(unsigned(operand_a) + unsigned(operand_b));
					 else
						result <= '0' & std_logic_vector(unsigned(operand_a) + unsigned(operand_b));
					 end if;
            
            when "01" =>  -- subtraction
                result <= '0' & std_logic_vector(unsigned(operand_a) - unsigned(operand_b));
            
            when "10" =>  -- AND
                result <= '0' & operand_a and operand_b;
            
            when "11" =>  -- OR
                result <= '0' & operand_a or operand_b;
            
            when others =>
                result <= "00000";  -- default: output 0
			end case;
		  end if;
    end process;
end architecture arc_arithmetic_logic_block;
