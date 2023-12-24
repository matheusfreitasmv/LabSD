library ieee;
use ieee.std_logic_1164.all;

entity tb_case is
end tb_case;

architecture teste of tb_case is
    component in_out is
        port (a,b : in std_logic;
            f_out : out std_logic);
    end component;

signal a, b, f_out: std_logic;
begin
    instancia_funcao : in_out port map(a => a, b => b, f_out => f_out);
    a <= '0', '1' after 20 ns, '1' after 40 ns, '0' after 60 ns;
    b <= '0', '0' after 30 ns, '1' after 50 ns, '1' after 70 ns;
end teste;
