-- the code below implements a conditional statement that selects between two bits (Q and I) based on the value of 
-- a control signal (CTRL), and assigns the selected input signal to the corresponding output signal (S).

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bit_selector is
    port(
      I, CTRL, Q: in std_logic;
		S: out std_logic
    );
end bit_selector;

architecture arc_bit_selector of bit_selector is
begin
    S <= Q when (CTRL = '0') else I;
end arc_bit_selector;