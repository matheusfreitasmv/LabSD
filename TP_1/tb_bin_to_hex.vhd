library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_bin_to_hex is
end tb_bin_to_hex;

architecture Behavioral of tb_bin_to_hex is
    component bin_to_hex is
        port (
            Bin : in  STD_LOGIC_VECTOR (3 downto 0);
            Hex : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

    signal Bin : STD_LOGIC_VECTOR (3 downto 0);
    signal Hex : STD_LOGIC_VECTOR (6 downto 0);

begin

    dut: bin_to_hex port map (Bin => Bin, Hex => Hex);

    stimulus: process
    begin
        Bin <= "0000";
        wait for 10 ns;
        
        Bin <= "0001";
        wait for 10 ns;
        
        Bin <= "0010";
        wait for 10 ns;
        
        Bin <= "0011";
        wait for 10 ns;
        
        Bin <= "0100";
        wait for 10 ns;
        
        Bin <= "0101";
        wait for 10 ns;
        
        Bin <= "0110";
        wait for 10 ns;
        
        Bin <= "0111";
        wait for 10 ns;
        
        Bin <= "1000";
        wait for 10 ns;
        
        Bin <= "1001";
        wait for 10 ns;
        
        Bin <= "1010";
        wait for 10 ns;
        
        Bin <= "1011";
        wait for 10 ns;
        
        Bin <= "1100";
        wait for 10 ns;
        
        Bin <= "1101";
        wait for 10 ns;
        
        Bin <= "1110";
        wait for 10 ns;
        
        Bin <= "1111";
        wait for 10 ns;
        
        wait;
    end process;

end Behavioral;


