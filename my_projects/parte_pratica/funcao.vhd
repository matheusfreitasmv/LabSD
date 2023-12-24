-- ULA

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA is
  port(A, B : in std_logic_vector(7 downto 0);
		   ULA_SEL : in std_logic_vector(2 downto 0);
       ULA_OUT : out std_logic_vector(7 downto 0));
end ULA;

architecture funcao of ULA is
  begin
    my_proc : process(A, B, ULA_SEL)
    begin
      case(ULA_SEL) is
        when "001" => ULA_OUT <= std_logic_vector(signed(A) + signed(B)); -- Soma com sinal
        when "010" => ULA_OUT <= std_logic_vector(unsigned(A) + unsigned(B)); -- Soma sem sinal
        when "011" => ULA_OUT <= std_logic_vector(unsigned(A) - unsigned(B)); -- Subtração
        when "100" => ULA_OUT <= A or B;  -- OR lógico
        when "101" => ULA_OUT <= A and B; -- AND lógico
        when "110" => ULA_OUT <= A xor B; -- XOR lógico
        when others => ULA_OUT <= "00000000";
      end case;
    end process my_proc;
end funcao;
