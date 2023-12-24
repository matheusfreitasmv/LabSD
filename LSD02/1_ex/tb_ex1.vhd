library ieee;
use ieee.std_logic_1164.all;

entity tb_ex1 is
end tb_ex1;

architecture test of tb_ex1 is
    component ex_1 is
        port(
            a: in   std_logic;
            b: in   std_logic;
            f: out  std_logic
        );
    end component;
    signal a, b, f: std_logic;

begin
    instancia : ex_1 port map(
        a => a,
        b => b,
        f => f
    );

stimulus_process: process
begin
    a <= '0' ; b <= '0'; wait for 100 ns;
    a <= '0' ; b <= '1'; wait for 100 ns;
    a <= '1' ; b <= '0'; wait for 100 ns;
    a <= '1' ; b <= '1'; wait for 100 ns;
end process;

end test;