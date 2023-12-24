library ieee;
use ieee.std_logic_1164.all;

entity big_or is
    port (a, b : in std_logic;
          f : out std_logic);
end big_or;

architecture or_architecture of big_or is
begin
    f <= a or b;
    
end or_architecture;