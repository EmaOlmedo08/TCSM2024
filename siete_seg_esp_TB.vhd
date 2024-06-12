library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_siete_seg_esp is
end entity tb_siete_seg_esp;

architecture tb_arch of tb_siete_seg_esp is

    component siete_seg_esp
        port(
            data_in_cont : in std_logic_vector(1 downto 0);
            data_in_clk : in std_logic;
            data_out : out std_logic_vector(6 downto 0)
        );
    end component;

    -- Señales a utilizar
    signal data_in_cont_tb : std_logic_vector(1 downto 0) := "00";
    signal data_in_clk_tb : std_logic := '0';
    signal data_out_tb : std_logic_vector(6 downto 0);

begin
    dut: siete_seg_esp
        port map(
            data_in_cont => data_in_cont_tb,
            data_in_clk => data_in_clk_tb,
            data_out => data_out_tb
        );

    prueba: process
    begin
        -- Test caso 1
        data_in_cont_tb <= "00";
        data_in_clk_tb <= '0';
        wait for 10 ns;
        
        -- Test caso 2
        data_in_cont_tb <= "01";
        data_in_clk_tb <= '0';
        wait for 10 ns;

        -- Test caso 3
        data_in_cont_tb <= "10";
        data_in_clk_tb <= '0';
        wait for 10 ns;

        -- Test caso 4
        data_in_cont_tb <= "11";
        data_in_clk_tb <= '0';
        wait for 10 ns;

        -- Test caso 5
        data_in_cont_tb <= "00";
        data_in_clk_tb <= '1';
        wait for 10 ns;

        -- Test caso 6
        data_in_cont_tb <= "01";
        data_in_clk_tb <= '1';
        wait for 10 ns;
        

        -- Test ca 7
        data_in_cont_tb <= "10";
        data_in_clk_tb <= '1';
        wait for 10 ns;

        -- Test caso 8
        data_in_cont_tb <= "11";
        data_in_clk_tb <= '1';
        wait for 10 ns;
        
        -- Test caso 4
        data_in_cont_tb <= "11";
        data_in_clk_tb <= '0';
        wait for 10 ns;
        -- Test caso 1
        data_in_cont_tb <= "00";
        data_in_clk_tb <= '0';
        wait for 10 ns;
        
        -- Test caso 2
        data_in_cont_tb <= "01";
        data_in_clk_tb <= '0';
        wait for 10 ns;

        -- Test caso 3
        data_in_cont_tb <= "10";
        data_in_clk_tb <= '0';
        wait for 10 ns;

        -- Test caso 5
        data_in_cont_tb <= "00";
        data_in_clk_tb <= '1';
        wait for 10 ns;

        -- Test caso 6
        data_in_cont_tb <= "01";
        data_in_clk_tb <= '1';
        wait for 10 ns;

        -- Test ca 7
        data_in_cont_tb <= "10";
        data_in_clk_tb <= '1';
        wait for 10 ns;

        -- Test caso 8
        data_in_cont_tb <= "11";
        data_in_clk_tb <= '1';
        wait for 10 ns;
        wait;
    end process;

end architecture tb_arch;


