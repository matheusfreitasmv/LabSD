-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;

-- entity
entity ckt1 is
    Port ( EN1, EN2 : in std_logic;
            CLK : in std_logic;
            Z : out std_logic);
end ckt1;
-- architecture
architecture arch of ckt1 is

component T_FF
    port ( T,CLK : in std_logic;
    Q : out std_logic);
end component;

signal t_in, t1_s, t2_s : std_logic;

begin
    t1 : T_FF port map (T => t_in,
                        CLK => CLK,
                        Q => t1_s );
    t2 : T_FF port map (T => t1_s,
                        CLK => CLK,
                        Q => t2_s );
    Z <= t2_s OR t1_s;
    t_in <= EN1 AND EN2;
end arch;
