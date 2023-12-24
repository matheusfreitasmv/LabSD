-----------------------------------------------------------
-- Model of a simple testbench to simulate a D Flip-Flop --
-----------------------------------------------------------
-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
-- top-level entity
entity tb_mean_4_clocks is
end tb_mean_4_clocks;

-- architecture
architecture tb_architecture of tb_mean_4_clocks is
    -- component declaration
    component mean_4_clocks is
        generic (
            W       :       integer := 32
        );
        port (
            CLK     : in    std_logic;
            RESET   : in    std_logic;
            INPUT   : in    std_logic_vector(W - 1 downto 0);
            OUTPUT  : out   std_logic_vector(W - 1 downto 0)
        );
end component;

constant PERIODO : time := 10 ns;
signal ENT_CLK : std_logic := '0'; -- deve ser inicializado
signal ENT_CLK_ENABLE: std_logic := '1'; -- Sinal de Enable do clock só para efeito de controle do fim da simulação
signal ENT_R : std_logic;
signal ENT_INPUT : std_logic_vector(32 - 1 downto 0);
signal SAI_Q : std_logic_vector(32 - 1 downto 0);

begin
    -- geração do clock com periodo PERIODO
    ENT_CLK <= ENT_CLK_ENABLE and not ENT_CLK after PERIODO/2;
    ENT_CLK_ENABLE <= '1', '0' after 20*PERIODO; -- a simulação termina após transcorrer 20 períodos de clock.

    -- instanciação do DUT, que nesse exemplo é um ffd
    DUT : mean_4_clocks port map(
                        CLK => ENT_CLK,
                        RESET => ENT_R,
                        INPUT => ENT_INPUT,
                        OUTPUT => SAI_Q);

    -- a partir daqui declaro os estímulos de entrada, ou a injecao de sinais
    -- um process para o reset
    reset: process
    begin
        ENT_R <= '1';
        wait for 2*PERIODO; -- um reset de duração de 2 períodos de clock
        ENT_R <= '0';
        wait;
    end process reset;

    -- um outro process para os estímulos da entrada D
    stimulus: process
    begin
        ENT_INPUT <= "00000000000000000000000000000000";
        wait for 4*PERIODO;
        ENT_INPUT <= "00000000000000000000000000000001";
        wait for 6*PERIODO;
        ENT_INPUT <= "00000000000000000000000000000100";
        wait for 3*PERIODO;
        ENT_INPUT <= "00000000000000000000000000100000";
        wait;
    end process stimulus;
end tb_architecture;