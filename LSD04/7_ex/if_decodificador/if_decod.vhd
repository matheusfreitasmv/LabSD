--exercício 7 pg. 69
--implementar um decodificador 3x8 usando process statement 

library ieee;
use ieee.std_logic_1164.all;

--entidade decodificador 3x8
entity decod3_8 is
    port(inputs : in std_logic_vector(2 downto 0); 
        outputs : out std_logic_vector(7 downto 0) );
end decod3_8;


architecture decod3_8_if of decod3_8 is
begin
    decod_process : process(inputs) is
    begin
        if    (inputs = "000") then outputs <= "00000001";
        elsif (inputs = "001") then outputs <= "00000010";
        elsif (inputs = "010") then outputs <= "00000100";
        elsif (inputs = "011") then outputs <= "00001000";
        elsif (inputs = "100") then outputs <= "00010000";
        elsif (inputs = "101") then outputs <= "00100000";
        elsif (inputs = "110") then outputs <= "01000000";
        elsif (inputs = "111") then outputs <= "10000000";
        else outputs <= "00000000";
        end if;
    end process decod_process;
end decod3_8_if;