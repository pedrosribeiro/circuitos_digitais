-- This VHDL code implements a sequence detector using a state machine to check for a match between an input bit sequence and 
-- a predefined target sequence (0110111).

Library IEEE; 
use IEEE.std_logic_1164.all;

entity seq_detector is 
	port (
	 INPUT: in std_logic;
	 CLK: in std_logic;
    RST: in std_logic;
    STATE_OUT: out std_logic_vector(3 downto 0);
	 DETECTED: out std_logic
  );
end seq_detector;

architecture arc_seq_detector of seq_detector is
	signal state: integer range 0 to 7;
	signal seq_detected: std_logic := '0';
	
	constant SEQUENCE: std_logic_vector(6 downto 0) := "0110111"; -- MSB ... LSB
	
begin 
	process(CLK, RST)
	begin 
		if RST = '1' then 
			state <= 0;
			seq_detected <= '0';
			STATE_OUT <= "0000";
			DETECTED <= '0';
		elsif rising_edge(CLK) then
			case state is
				when 0 =>
					if INPUT = SEQUENCE(0) then
						state <= 1;
						STATE_OUT <= "0001";
					else 
						state <= 0;
						STATE_OUT <= "0000";
					end if;
				when 1 =>
					if INPUT = SEQUENCE(1) then
						state <= 2;
						STATE_OUT <= "0010";
					else
						state <= 1;
						STATE_OUT <= "0001";
					end if;
				when 2 =>
					if INPUT = SEQUENCE(2) then
						state <= 3;
						STATE_OUT <= "0011";
					else
						state <= 1;
						STATE_OUT <= "0001";
					end if;
				when 3 =>
					if INPUT = SEQUENCE(3) then
						state <= 4;
						STATE_OUT <= "0100";
					else 
						state <= 0;
						STATE_OUT <= "0000";
					end if;
				when 4 =>
					if INPUT = SEQUENCE(4) then
						state <= 5;
						STATE_OUT <= "0101";
					else 
						state <= 1;
						STATE_OUT <= "0001";
					end if;
				when 5 =>
					if INPUT = SEQUENCE(5) then
						state <= 6;
						STATE_OUT <= "0110";
					else
						state <= 1;
						STATE_OUT <= "0001";
					end if;
				when 6 =>
					if INPUT = SEQUENCE(6) then -- sequence detected
						state <= 7;
						STATE_OUT <= "0111";
						seq_detected <= '1';
						DETECTED <= '1';
					else 
						state <= 4;
						STATE_OUT <= "0100";
					end if;
				when 7 =>
					if INPUT = '1' then
						state <= 0;
						STATE_OUT <= "0000";
					else
						state <= 1;
						STATE_OUT <= "0001";
					end if;
			end case;
		end if;
	end process;
end arc_seq_detector;