library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bin_to_hex is
    Port (
        Bin : in  STD_LOGIC_VECTOR (3 downto 0);
        Hex : out STD_LOGIC_VECTOR (6 downto 0)
    );
end bin_to_hex;

architecture Behavioral of bin_to_hex is
begin
    process(Bin)
    begin
        case Bin is
            when "0000" =>
            Hex <= "1000000"; -- 0
            when "0001" =>
                Hex <= "1111001"; -- 1
            when "0010" =>
                Hex <= "0100100"; -- 2
            when "0011" =>
                Hex <= "0110000"; -- 3
            when "0100" =>
                Hex <= "0011001"; -- 4
            when "0101" =>
                Hex <= "0010010"; -- 5
            when "0110" =>
                Hex <= "0000010"; -- 6
            when "0111" =>
                Hex <= "1111000"; -- 7
            when "1000" =>
                Hex <= "0000000"; -- 8
            when "1001" =>
                Hex <= "0011000"; -- 9
            when "1010" =>
                Hex <= "0001000"; -- A
            when "1011" =>
                Hex <= "0000011"; -- B
            when "1100" =>
                Hex <= "1000110"; -- C
            when "1101" =>
                Hex <= "0100001"; -- D
            when "1110" =>
                Hex <= "0000110"; -- E
            when "1111" =>
                Hex <= "0001110"; -- F
            when others =>
                Hex <= "1111111"; -- caso padrão (se entrada inválida)
        end case;
    end process;
end Behavioral;