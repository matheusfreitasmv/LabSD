library ieee;
use ieee.std_logic_1164.all;

entity tb_ex_1 is
end tb_ex_1;

architecture teste of tb_ex_1 is
    component my_example is
        port (a,b : in std_logic;
            f_out : out std_logic);
    end component;

signal a, b, f_out: std_logic;
begin
    instancia_funcao : my_example port map(a => a, b => b, f_out => f_out);
    a <= '0', '0' after 10 ns, '1' after 30 ns, '0' after 40 ns;
    b <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
end teste;
