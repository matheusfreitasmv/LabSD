--testbanch 

library ieee;
use ieee.std_logic_1164.all;

entity tb_exercise is
end tb_exercise;

architecture tb_architecture of tb_exercise is
    component exercise is
        port (x : in std_logic_vector (3 downto 0);
              saida : out std_logic_vector(7 downto 0)
        );
    end component;

    signal x : std_logic_vector (3 downto 0);
    signal saida : std_logic_vector (7 downto 0);

begin
    tb_instancia: exercise port map (x => x, saida => saida);
    x <= "0000", "0100" after 10 ns, "1111" after 20 ns, "0000" after 30 ns;
    
end tb_architecture;