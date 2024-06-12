library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TCSM_2024_tb is
end TCSM_2024_tb;

architecture bhv of TCSM_2024_tb is
component TCSM_2024
    port(
        rst_gral : in std_logic;
        clk_in : in std_logic;
        data_out : out std_logic_vector(6 downto 0);
        enable_out : out std_logic_vector(3 downto 0)
    );
end component;

signal rst_gral_signal_tb : std_logic := '0';
signal clk_in_signal_tb : std_logic := '0';
signal data_out_signal_tb : std_logic_vector(6 downto 0);
signal enable_out_signal_tb : std_logic_vector(3 downto 0);
	
begin
    B1: TCSM_2024
        port map (
          rst_gral => rst_gral_signal_tb,
          clk_in => clk_in_signal_tb,
          data_out => data_out_signal_tb,
          enable_out => enable_out_signal_tb 
        );
    clk_in_signal_tb <= not clk_in_signal_tb after 100ns;
    process
    begin
    	wait for 550 ns;
        rst_gral_signal_tb <= '1';
        wait for 550 ns;
        rst_gral_signal_tb <= '0';
        wait;
    end process;
    
end architecture;
