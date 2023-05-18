Library IEEE; 
use IEEE.std_logic_1164.all;

entity seq_detector is 
	port(
	 bit_in: in std_logic;
	 clk: in std_logic;
    rst: in std_logic;
    machine_state: out std_logic_vector(3 downto 0);
	 found: out std_logic
  );
end seq_detector;

architecture arc_seq_detector of seq_detector is
	signal state: integer range 0 to 7;
	signal seq_found: std_logic := '0';
	
	constant SEQUENCE: std_logic_vector(6 downto 0) := "0110111"; -- sequence to be detected
	
begin 
	process(clk, rst)
	begin 
		if rst = '1' then 
			state <= 0;
			seq_found <= '0';
			found <= '0';
			machine_state <= "0000";
		elsif rising_edge(clk) then
			case state is
				when 0 =>
					if bit_in = SEQUENCE(0) then
						state <= 1;
						machine_state <= "0001";
					else 
						state <= 0;
						machine_state <= "0000";
					end if;
				when 1 =>
					if bit_in = SEQUENCE(1) then
						state <= 2;
						machine_state <= "0010";
					else
						state <= 0;
						machine_state <= "0000";
					end if;
				when 2 =>
					if bit_in = SEQUENCE(2) then
						state <= 3;
						machine_state <= "0011";
					else
						state <= 0;
						machine_state <= "0000";
					end if;
				when 3 =>
					if bit_in = SEQUENCE(3) then
						state <= 4;
						machine_state <= "0100";
					else 
						state <= 3;
						machine_state <= "0011";
					end if;
				when 4 =>
					if bit_in = SEQUENCE(4) then
						state <= 5;
						machine_state <= "0101";
					else 
						state <= 0;
						machine_state <= "0000";
					end if;
				when 5 =>
					if bit_in = SEQUENCE(5) then
						state <= 6;
						machine_state <= "0110";
					else
						state <= 0;
						machine_state <= "0000";
					end if;
				when 6 => -- last state/sequence found
					if bit_in = SEQUENCE(6) then
						seq_found <= '1';
						found <= '1';
						state <= 7;
						machine_state <= "0111";
					else 
						state <= 0;
						machine_state <= "0000";
					end if;
				when 7 =>
					if bit_in = '0' then
						state <= 0;
						machine_state <= "0000";
					else
						state <= 1;
						machine_state <= "0001";
					end if;
			end case; 
		end if;
	end process;
	
	
end arc_seq_detector;