Library IEEE;
use ieee.std_logic_1164.all;

entity D_0to5_inputs is
	port(
		X2, X1, X0: in std_logic;
		D2, D1, D0: out std_logic
	);
end D_0to5_inputs;

architecture arc_D_0to5_inputs of D_0to5_inputs is
begin
	D2 <= (X1 AND X0) OR (X2 AND NOT X0);
	D1 <= (NOT X2 AND NOT X1 AND X0) OR (X1 AND NOT X0);
	D0 <= (NOT X0);
end arc_D_0to5_inputs;