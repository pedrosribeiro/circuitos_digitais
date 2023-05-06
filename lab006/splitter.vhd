library ieee;
use ieee.std_logic_1164.all;

entity splitter is
    port (
        input : in std_logic_vector(2 downto 0);
        output2 : out std_logic;
        output1 : out std_logic;
        output0 : out std_logic
    );
end entity splitter;

architecture arc_splitter of splitter is
begin
    output2 <= input(2);
    output1 <= input(1);
    output0 <= input(0);
end architecture arc_splitter;
