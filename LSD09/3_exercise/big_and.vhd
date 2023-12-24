library ieee;
use ieee.std_logic_1164.all;

entity big_and is
    port (a, b : in std_logic;
          f : out std_logic);
end big_and;

architecture and_architecture of big_and is
begin
    f <= a and b;
    
end and_architecture;
