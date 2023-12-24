--questão 1 letra (a), pg.68
--implementação usando if 
--F(A, B) = (not A)B + A + A(not B)

library IEEE;
use IEEE.std_logic_1164.all;

--entity
entity my_example is
    port (
        a,b : in std_logic;
        f_out : out std_logic
        );
end my_example;

--architecture
architecture if_statement of my_example is
begin
    proc_if: process(a, b) is
    begin
        if (a='0' and b='1') then
            f_out <= '1';
        elsif ( a='1') then
            f_out <= '1';
        elsif (a='1' and b='0') then
            f_out <= '1';
        else
            f_out <= '0';
        end if;
    end process proc_if;
end if_statement;

