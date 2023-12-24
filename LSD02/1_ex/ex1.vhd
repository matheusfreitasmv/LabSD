--Questão 1 letra a

library ieee;
use ieee.std_logic_1164.all;

entity ex_1 is
    port(
        a: in   std_logic;
        b: in   std_logic;
        f: out  std_logic
    );
end entity;

architecture arch_1 of ex_1 is
begin
    f <= ((not a) and b) or (a) or (a and (not b)); 
end architecture;