-- This VHDL code implements a timer set to 30 seconds and a point counter. The player inputs an answer, and if correct, earns a point. 
-- If the timer reaches zero or the player earns 10 points, the game ends. 
-- The code tracks the points, checks for correct answers, updates the timer, and determines game over conditions.

Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity score_and_timer is
    generic (
        POINTS_TO_WIN : natural := 10; -- maximum of 10 points
        TIME_LIMIT    : natural := 30000 -- 30 seconds (for 1kHz clock)
    );
    port (
        reset     : in  std_logic;
        clk       : in  std_logic;
        answer    : in  std_logic; -- correct or incorrect answer
        gameOver  : out std_logic;
        points    : out std_logic_vector(3 downto 0);
        timerDone : out std_logic;
		  leds      : out std_logic_vector(9 downto 0) -- 10 LEDs
    );
end entity score_and_timer;

architecture arc_score_and_timer of score_and_timer is
    signal counter        : natural range 0 to POINTS_TO_WIN;
    signal timer          : natural range 0 to TIME_LIMIT;
    signal prev_clk_state : std_logic;

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then -- reset counter and timer
                counter <= 0;
                timer <= 0;
                prev_clk_state <= '0';
					 timerDone <= '0';
					 leds <= (others => '0');
            else
                prev_clk_state <= clk;
                if prev_clk_state = '0' and clk = '1' then -- detect positive edge of clock and increments the counter
                    if answer = '1' then
                        counter <= counter + 1; -- counter is incremented
								leds(counter) <= '1';
								timer <= TIME_LIMIT; -- timer is to its maximum value
						  else -- decrements the timer
								if timer > 0 then
									timer <= timer - 1;
								end if;
                    end if;

                    if timer = 0 then -- check if the player is out of time
                        timerDone <= '1';
                    else
                        timerDone <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;

    process(counter) -- check if the player won
    begin
        if counter >= POINTS_TO_WIN then
            gameOver <= '1';
        else
            gameOver <= '0';
        end if;
    end process;

    points <= std_logic_vector(to_unsigned(counter, points'length)); -- send scoreboard to the output using a 4-bit format
end architecture arc_score_and_timer;
