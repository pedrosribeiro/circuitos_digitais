Library IEEE;
use ieee.std_logic_1164.all;

entity D_0to9_inputs is
	port(
		X3, X2, X1, X0: in std_logic;
		D3, D2, D1, D0: out std_logic
	);
end D_0to9_inputs;

architecture arc_D_0to9_inputs of D_0to9_inputs is
begin
	D3 <= (X2 AND X1 AND X0) OR (X3 AND NOT X0);
	D2 <= (NOT X2 AND X1 AND X0) OR (X2 AND NOT X1) OR (X2 AND NOT X0);
	D1 <= (NOT X3 AND NOT X1 AND X0) OR (X1 AND NOT X0);
	D0 <= (NOT X3 AND NOT X0) OR (NOT X1 AND NOT X0);
end arc_D_0to9_inputs;