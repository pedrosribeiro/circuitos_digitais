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
    type State_type is (S0, S1, S2, S3, S4, S5, S6, S7);
    signal state : State_type;
begin
    process (clk, rst)
    begin
        if rst = '1' then
            state <= S0;
            seq_found <= '0';
        elsif rising_edge(clk) then
            seq_found <= '0';
            case state is
                when S0 =>
                    if SW0 = '1' then state <= S1; else state <= S0; end if;
                when S1 =>
                    if SW1 = '1' then state <= S2; else state <= S0; end if;
                when S2 =>
                    if SW2 = '1' then state <= S3; else state <= S0; end if;
                when S3 =>
                    if SW3 = '0' then state <= S4; else state <= S0; end if;
                when S4 =>
                    if SW4 = '1' then state <= S5; else state <= S0; end if;
                when S5 =>
                    if SW5 = '1' then state <= S6; else state <= S0; end if;
                when S6 =>
                    if SW6 = '0' then state <= S7; seq_found <= '1'; else state <= S0; end if;
					 when S7 =>
                    state <= S0;
            end case;
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
			when s7 =>
				machine_state <= "111";
		end case;
	 end process;

end arc_sequence_detector;