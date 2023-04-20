library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_inputs is
    port(
      X3, X2, X1, X0: in std_logic;
		J3, K3, J2, K2, J1, K1, J0, K0: out std_logic
    );
end jk_inputs;

architecture arc_jk_inputs of jk_inputs is
begin
    J3 <= (not X2 and not X1 and X0) or (X2 and X1 and X0);
	 K3 <= (X2 and X1);
	 J2 <= (not X3 and not X1 and not X0) or (X1 and X0) or (X3 and X1);
	 K2 <= (not X3 and X0) or (X3 and X1);
	 J1 <= (X2 and X0) or (X3);
	 K1 <= (not X2 and not X0) or (not X3 and X2 and X0) or (X3 and not X2) or (X3 and not X0);
	 J0 <= (not X3 and X2) or (X2 and X1);
	 K0 <= (not X3 and X1) or (X2 and X1);
end arc_jk_inputs;