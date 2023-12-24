--exercicio 6 página 87

-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity t_flip_flop is
    port ( T,S,CLK,R : in std_logic;
            Q, NOT_Q : out std_logic);
end t_flip_flop;

-- architecture
architecture my_t_flip_flop of t_flip_flop is
    signal t_tmp : std_logic; -- intermediate signal declaration
begin
    tff: process (S,CLK)
    begin
        if (R = '0') then
            t_tmp <= '0';
        elsif (rising_edge(CLK)) then
            t_tmp <= T XOR t_tmp; -- temp output assignment
        end if;
    end process tff;
    
    Q <= t_tmp;
    NOT_Q <= NOT t_tmp;

end my_t_flip_flop;