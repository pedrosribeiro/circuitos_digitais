-- this file handles the 2's complement of a 4-bit number when CONTROL bit has value 1 (representing the subtraction operation)
-- the output is the same as the input when the CONTROL bit is 0 (representing the sum operation that does not need 2's complement)
-- the A-B subtraction can be performed doing the 2's complement of B (2sB) plus the binary 1 (Ci output is sent to be summed with 2sB in the summing block)

Library IEEE;
use ieee.std_logic_1164.all;

entity twos_complement is
	port(
		B0, B1, B2, B3, CONTROL: in std_logic;
		S0, S1, S2, S3, Ci: out std_logic
	);
end twos_complement;

architecture arc_twos_complement of twos_complement is
begin
	S0 <= B0 XOR CONTROL;
	S1 <= B1 XOR CONTROL;
	S2 <= B2 XOR CONTROL;
	S3 <= B3 XOR CONTROL;
	Ci <= CONTROL;
end arc_twos_complement;