--testbanch decodificador 3x8

library ieee;
use ieee.std_logic_1164.all;

entity tb_if_decod is
end tb_if_decod;

architecture tb_decod3_8 of tb_if_decod is
    component decod3_8 is
        port(inputs : in std_logic_vector(2 downto 0); 
            outputs : out std_logic_vector(7 downto 0) );
    end component;

signal inputs: std_logic_vector(2 downto 0);
signal outputs: std_logic_vector(7 downto 0);

begin
    instancia: decod3_8 port map(inputs => inputs, outputs => outputs);
    inputs <= "000", "001" after 10 ns, "010" after 20 ns, "011" after 30 ns,
    "100" after 40 ns, "101" after 50 ns, "110" after 60 ns, "111" after 70 ns;

end tb_decod3_8;