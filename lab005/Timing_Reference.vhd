-- This VHDL code implements a time reference clock signal generator that can be configured to generate different frequency signals based on 
-- the 'freq_sel' input. 
-- 'freq_sel' generates 1kHz if 0 and 80kHz if 1.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
 
entity Timing_Reference is
port ( 
    clk: in std_logic; -- Pin connected to P11 (N14)
    freq_sel: in std_logic; -- Pin connected to a switch to select the frequency (0 for 1kHz, 1 for 80kHz)
    clk_xHz: out std_logic -- Can check it using PIN A8 - LEDR0
);
end Timing_Reference;
 
architecture freq_div of Timing_Reference is
    signal count: integer:=1;
    signal tmp : std_logic := '0';
    constant freq_1kHz: integer := 1000; -- frequency of 1kHz
    constant freq_80kHz: integer := 80000; -- frequency of 80kHz
    constant clk_freq: integer := 50000000; -- frequency of the input clock signal
    signal freq_divider: integer := freq_1kHz; -- default frequency is 1kHz
begin
    process(clk)
    begin
        if(clk'event and clk='1') then
            count <= count + 1;
            if (count = clk_freq / freq_divider / 2) then
                tmp <= not tmp;
                count <= 1;
            end if;
        end if;
    end process;
    
    process(freq_sel)
    begin
        if (freq_sel = '0') then
            freq_divider <= freq_1kHz;
        else
            freq_divider <= freq_80kHz;
        end if;
    end process;
    
    clk_xHz <= tmp;
    
end freq_div;
