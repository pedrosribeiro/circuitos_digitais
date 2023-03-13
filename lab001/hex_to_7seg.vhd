-- this file handles the representation of hexadecimal numbers on a 7-segment display
-- each of the 7 segments turn on according to the input in order to represent it on the display
-- I3 is the most significant bit

Library IEEE;
use ieee.std_logic_1164.all;

entity hex_to_7seg is
	port(
		I3, I2, I1, I0: in std_logic;
		seg0, seg1, seg2, seg3, seg4, seg5, seg6: out std_logic
	);
end hex_to_7seg;

architecture arc_hex_to_7seg of hex_to_7seg is
begin
seg0 <= (not I3 and not I2 and not I1 and I0)or(not I3 and I2 and not I1 and not I0)or(I3 and I2 and not I1 and I0)or(I3 and not I2 and I1 and I0);
seg1 <= (not I3 and I2 and not I1 and I0)or(I3 and I2 and not I0)or(I3 and I1 and I0)or(I2 and I1 and not I0);
seg2 <= (not I3 and not I2 and I1 and not I0)or(I3 and I2 and not I0)or(I3 and I2 and I1);
seg3 <= (not I3 and not I2 and not I1 and I0)or(not I3 and I2 and not I1 and not I0)or(I3 and not I2 and I1 and not I0)or(I2 and I1 and I0);
seg4 <= (not I3 and I2 and not I1)or(not I2 and not I1 and I0)or(not I3 and I0);
seg5 <= (I3 and I2 and not I1 and I0)or(not I3 and not I2 and I0)or(not I3 and I1 and I0)or(not I3 and not I2 and I1);
seg6 <= (I3 and I2 and not I1 and not I0)or(not I3 and I2 and I1 and I0)or(not I3 and not I2 and not I1);
end arc_hex_to_7seg;