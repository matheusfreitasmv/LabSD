library ieee;
use ieee.std_logic_1164.all;

entity tb_3_ex is
end tb_3_ex;

architecture teste of tb_3_ex is
    component ex_3a is
        port (a,b,c : in std_logic;
            f : out std_logic);
    end component;

signal a, b, c, f: std_logic;
begin
    instancia_funcao : ex_3a port map(a => a, b => b, c => c, f => f);
    a <= '0', '1' after 20 ns, '1' after 40 ns, '0' after 60 ns;
    b <= '0', '0' after 30 ns, '1' after 50 ns, '1' after 70 ns;
    c <= '0', '1' after 30 ns, '1' after 50 ns, '0' after 70 ns;
end teste;
