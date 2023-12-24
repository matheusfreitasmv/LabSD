-- Testbench da ULA

library ieee;
use ieee.std_logic_1164.all;

entity tb_funcao is
end tb_funcao;

architecture teste of tb_funcao is
  component ULA is
    port(A, B : in std_logic_vector(7 downto 0);
         ULA_SEL : in std_logic_vector(2 downto 0);
         ULA_OUT : out std_logic_vector(7 downto 0));
  end component;

  signal a, b : std_logic_vector(7 downto 0);
  signal ula_sel : std_logic_vector(2 downto 0);
  signal ula_out : std_logic_vector(7 downto 0);
  
  begin
    instancia : ULA port map(A => a, B => b, ULA_SEL => ula_sel, ULA_OUT => ula_out);
    a <= "00000000", "11111111" after 35 ns;
    b <= "11111111", "00000000" after 35 ns;
    ula_sel <= "000", "001" after 10 ns, "010" after 20 ns, "011" after 30 ns,    
           "100" after 40 ns, "101" after 50 ns, "110" after 60 ns, "111" after 70 ns;
end teste;
