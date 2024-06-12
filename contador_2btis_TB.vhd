-- Code your testbench here
-- or browse Examples
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity contador_tb is
end contador_tb;

architecture beh of contador_tb is

component contador
port( 
  clk_in_c : in std_logic;
  rst_in_c : in std_logic;
  data_out_c : out std_logic_vector(1 downto 0)
);
end component;

signal  clk_in_c_tb : std_logic := '0';
signal  rst_in_c_tb : std_logic;
signal  data_out_c_tb : std_logic_vector(1 downto 0);

begin

c_1: contador
  port map(
    clk_in_c => clk_in_c_tb,
    rst_in_c => rst_in_c_tb,
    data_out_c =>  data_out_c_tb
    );
    
clk_in_c_tb <= not clk_in_c_tb after 10 ns;
rst_in_c_tb <= '0', '1' after 30 ns, '0' after 50 ns,'1' after 90 ns,'0' after 100 ns;
    
end beh;
