--exercicio 3(a), página 132

library ieee;
use ieee.std_logic_1164.all;

--entidade
entity ex_3a is
   port (a, b, c : in std_logic;
         f  : out std_logic);
end ex_3a;

--arquitetura
architecture architectue_estrutural of ex_3a is

   component big_and is
       port (a, b: in std_logic;
           f  : out std_logic);
   end component;
   
   component big_or is
       port (a, b: in std_logic;
           f  : out std_logic);
   end component;

   signal and_1_out, and_2_out: std_logic;

begin
   and_1: big_and port map (a => a,
                            b => "not" (b),
                            f => and_1_out);
   
   and_2: big_and port map (a => "not" (a),
                            b => "not" (c),
                            f => and_2_out);                             
                               
   or_1: big_or port map (a => and_1_out,
                          b => and_2_out,
                          f => f); 

end architectue_estrutural;