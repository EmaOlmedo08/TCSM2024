library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity div_frec_tb is
end div_frec_tb;

architecture beh of div_frec_tb is

  component div_frec_1M
    Port ( 
          clk_div : in std_logic;
          rst_div : in std_logic;
          out_div : out std_logic
    );
  end component;

  signal clk_div_tb : std_logic;
  signal rst_div_tb : std_logic;
  signal out_div_tb : std_logic;

begin

  b1 : div_frec
    port map (
        clk_div => clk_div_tb,
        rst_div => rst_div_tb,
        out_div => out_div_tb
    );
    
    
  clock_process: process
  begin 
    clk_div_tb <= '0';
    wait for 5 ns; -- Cambiado de 1 ms a 5 ns para simular más rápido
    clk_div_tb <= '1';
    wait for 5 ns; -- Cambiado de 1 ms a 5 ns para simular más rápido
  end process;
    
  reset_process: process
  begin 
    rst_div_tb <= '1';
    wait for 50 ns; -- Cambiado de 5 ms a 50 ns para simular más rápido
    rst_div_tb <= '0';
    wait;
  end process;

    
end beh;
