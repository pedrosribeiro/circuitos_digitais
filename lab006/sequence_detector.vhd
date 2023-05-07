-- This VHDL code defines a sequence detector that takes inputs from seven switches (SW6 to SW0) and a reset signal (rst) 
-- and generates two output signals: a three-bit vector (machine_state) and a logic signal (seq_found). 
-- The detector checks if the input signal sequence matches a specific pattern, and if it does, the seq_found signal is set to '1'. 
-- The current state is stored in the state signal, which is updated on each rising edge of the clock signal (clk) based on the input values of the switches.
-- The "state" process converts the current state into a three-bit vector (machine_state) to be sent as output. 
-- When the reset signal is set to '1', the sequence detector returns to the initial state (S0) and the sequence found is reset to '0'.

library ieee;
use ieee.std_logic_1164.all;

entity sequence_detector is
    port (
        clk : in std_logic;
        SW6, SW5, SW4, SW3, SW2, SW1, SW0 : in std_logic;
        rst : in std_logic;
		  machine_state : out std_logic_vector(2 downto 0);
        seq_found : out std_logic
    );
end sequence_detector;

architecture arc_sequence_detector of sequence_detector is
    type State_type is (S0, S1, S2, S3, S4, S5, S6);
    signal state : State_type;
begin
    process (clk, rst)
    begin
        if rst = '1' then
            state <= S0;
            seq_found <= '0';
        elsif rising_edge(clk) then
            seq_found <= '0';
            if SW0 = '1' then
					state <= S0;
					if SW1 = '1' then
						state <= S1;
						if SW2 = '1' then
							state <= S2;
							if SW3 = '0' then
								state <= S3;
								if SW4 = '1' then
									state <= S4;
									if SW5 = '1' then
										state <= S5;
										if SW6 = '0' then
											state <= S6;
											seq_found <= '1';
										end if;
									end if;
								end if;
							end if;
						end if;
					end if;
				end if;
        end if;
    end process;
	 
	 process(state)
	 begin
		case state is
			when s0 =>
				machine_state <= "000";
			when s1 =>
				machine_state <= "001";
			when s2 =>
				machine_state <= "010";
			when s3 =>
				machine_state <= "011";
			when s4 =>
				machine_state <= "100";
			when s5 =>
				machine_state <= "101";
			when s6 =>
				machine_state <= "110";
		end case;
	 end process;

end arc_sequence_detector;