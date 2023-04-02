-- the code below implements a conditional statement that selects between two sets of input signals (D3, D2, D1, D0 and S3, S2, S1, S0) based on the value of 
-- a control signal (CONTROL), and assigns the selected input signals to the corresponding output signals (Q3, Q2, Q1, Q0).

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vector_selector is
    port(
      D3, D2, D1, D0, S3, S2, S1, S0, CONTROL: in std_logic;
		Q3, Q2, Q1, Q0: out std_logic
    );
end vector_selector;

architecture arc_vector_selector of vector_selector is
begin
    Q3 <= D3 when (CONTROL = '0') else S3;
	 Q2 <= D2 when (CONTROL = '0') else S2;
	 Q1 <= D1 when (CONTROL = '0') else S1;
	 Q0 <= D0 when (CONTROL = '0') else S0;
end arc_vector_selector;