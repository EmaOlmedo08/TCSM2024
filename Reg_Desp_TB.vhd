library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_reg_desp is
end entity tb_reg_desp;

architecture testbench of tb_reg_desp is
    signal clk_in : std_logic := '0';
    signal rst : std_logic := '0';
    signal data_out : std_logic_vector(3 downto 0);

    -- Instancia del componente a probar
    component reg_desp
        port(
            clk_in : in std_logic;
            rst : in std_logic;
            data_out : out std_logic_vector(3 downto 0)
        );
    end component;

begin
    DUT: reg_desp
        port map (
            clk_in => clk_in,
            rst => rst,
            data_out => data_out
        );

    -- Proceso para generar el reloj
    clk_process : process
    begin
        while true loop
            clk_in <= '0';
            wait for 10 ns;
            clk_in <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Proceso de estímulos
    stim_proc: process
    begin
        -- Reinicio
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        wait for 100 ns;
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        -- Dejar correr el reloj un tiempo para observar el desplazamiento
        wait for 200 ns;

        -- Finalizar la simulación
        wait;
    end process;
end architecture;
