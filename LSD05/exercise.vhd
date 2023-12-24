--f(x)= r*x*not(x), sendo r=2, para qualquer valor de x e assuma no máximo 4 bits de representação.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--entidade
entity exercise is
    port (x : in std_logic_vector (3 downto 0);
          saida : out std_logic_vector(7 downto 0)
    );
end entity;

--arquitetura
architecture data_flow of exercise is

begin
    
    saida <= std_logic_vector(unsigned(x) * not(unsigned(x)) sll 1 );
    
end data_flow;