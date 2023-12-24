library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity semaforoFSM is
    Port ( clk50MHz   : in  STD_LOGIC;       -- Clock de entrada
           reset : in  STD_LOGIC;       -- Sinal de RESET síncrono
           green : out STD_LOGIC;       -- LED para o sinal verde
           yellow : out STD_LOGIC;      -- LED para o sinal amarelo
           red : out STD_LOGIC;   -- LED para o sinal vermelho
           Hex : out STD_LOGIC_VECTOR (6 downto 0)
         );
end semaforoFSM;

architecture Behavioral of SemaforoFSM is
    -- Definição dos estados da FSM
    type StateType is (RED_STATE, GREEN_STATE, YELLOW_STATE);
    signal current_state, next_state : StateType;

    -- Constantes para o tempo dos estados
    constant GREEN_TIME  : integer := 9;   
    constant YELLOW_TIME : integer := 4;   
    constant RED_TIME    : integer := 7; 

    -- Contadores para controlar o tempo em cada estado
    signal green_counter, yellow_counter, red_counter, sinal : integer := 0;

    begin
        process(clk50MHz, reset)
          --  variable cnt : integer range 0 to 2**26-1;
            begin
                if(rising_edge(clk50MHz)) then
                    case current_state is 
                        when GREEN_STATE =>
                            if green_counter < GREEN_TIME - 1 then
                                green_counter <= green_counter + 1;
                            else
                                green_counter <= 0;
                                current_state <= YELLOW_STATE;
                            end if;
                            sinal <= green_counter;

                        when YELLOW_STATE =>
                            if yellow_counter < YELLOW_TIME - 1 then
                                yellow_counter <= yellow_counter + 1;
                            else
                                yellow_counter <= 0;
                                current_state <= RED_STATE;
                            end if;        
                            sinal <= yellow_counter;

                        when RED_STATE =>
                            if red_counter < RED_TIME - 1 then
                                red_counter <= red_counter + 1;
                            else
                                red_counter <= 0;
                                current_state <= GREEN_STATE;
                            end if;
                            sinal <= red_counter;

                        when others =>
                            current_state <= RED_STATE;
                            sinal <= red_counter; 
                    end case;
                    
                elsif reset = '1' then
                    -- RESET síncrono
                    current_state <= RED_STATE; 
                    sinal <= red_counter;
                end if;
        end process;
    
    process(sinal)
    begin
    case sinal is
        when 0 =>
        Hex <= "1000000"; -- 0
        when 1 =>
            Hex <= "1111001"; -- 1
        when 2 =>
            Hex <= "0100100"; -- 2
        when 3 =>
            Hex <= "0110000"; -- 3
        when 4 =>
            Hex <= "0011001"; -- 4
        when 5 =>
            Hex <= "0010010"; -- 5
        when 6 =>
            Hex <= "0000010"; -- 6
        when 7 =>
            Hex <= "1111000"; -- 7
        when 8 =>
            Hex <= "0000000"; -- 8
        when 9 =>
            Hex <= "0011000"; -- 9
        when others =>
            Hex <= "1111111"; -- caso padrão (se entrada inválida)
    end case;
end process;

         -- Controle dos LEDs com base no estado atual
    process (current_state)
    begin
        case current_state is
            when GREEN_STATE =>
                green <= '1';
                yellow <= '0';
                red <= '0';

            when YELLOW_STATE =>
                green <= '0';
                yellow <= '1';
                red <= '0';

            when RED_STATE =>
                green <= '0';
                yellow <= '0';
                red <= '1';

            when others =>
                -- Caso de erro, todos os LEDs desligados
                green <= '0';
                yellow <= '0';
                red <= '0';
        end case;
    end process;

end Behavioral;