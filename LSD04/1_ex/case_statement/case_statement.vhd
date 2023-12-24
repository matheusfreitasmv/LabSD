--questão 1 letra (a), pg.68
--implementação usando case 
--F(A, B) = (not A)B + A + A(not B)

library IEEE;
use IEEE.std_logic_1164.all;

--entity
entity in_out is
    port (
        a,b : in std_logic;
        f_out : out std_logic
        );
end in_out;

--architecture
architecture case_statement of in_out is
    signal ab :std_logic_vector(0 to 1);
begin
    ab <= a & b; 
    proc_case: process(ab) is
    begin
        case (ab) is
            when ("01") =>
                f_out <= '1';
            when ( "10") =>
                f_out <= '1';
            when ("11") =>
                f_out <= '1';
            when others =>
                f_out <= '0';
        end case;
    end process proc_case;
end case_statement;