--exercicio 1 pg. 86

library IEEE;
use ieee.std_logic_1164.all;

-- entity
entity d_ff is
    port ( S, R, D : in std_logic;
    CLK : in std_logic;
    Q, NOT_Q : out std_logic);
end d_ff;

-- architecture
architecture my_d_ff of d_ff is
begin
    dff: process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (R = '1') then
                Q <= '0';
                NOT_Q <= '1';
            elsif (S = '1') then
                Q <= '1';
                NOT_Q <= '0';
            else
                Q <= D;
                NOT_Q <= NOT D;
            end if;
        end if;
    end process dff;
end my_d_ff;