library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TCSM_2024 is
    Port (
        rst_gral : in std_logic;
        clk_in : in std_logic;
        data_out : out std_logic_vector(6 downto 0);
        enable_out : out std_logic_vector(3 downto 0)
    );
end TCSM_2024;

architecture bhv of TCSM_2024 is

component siete_seg_esp
  port(
    data_in_cont : in std_logic_vector(1 downto 0);
    data_in_clk : in std_logic;
    data_out : out std_logic_vector(6 downto 0)
  );
end component;

component contador
port( 
  clk_in_c : in std_logic;
  rst_in_c : in std_logic;
  data_out_c : out std_logic_vector(1 downto 0)
);
end component;

component div_frec_1M
    port ( 
          clk_div : in std_logic;
          rst_div : in std_logic;
          out_div : out std_logic
    );
end component;

component div_frec_100
    port ( 
      clk_div : in std_logic;
      rst_div : in std_logic;
      out_div : out std_logic
    );
end component;

component reg_desp
    port(
      clk_in : in std_logic;
      rst : in std_logic;
      data_out : out std_logic_vector(3 downto 0)
    );
end component;

signal clk_signal: std_logic; --Desde clk_in a clk del divisor de 1M (B1)
signal rst_signal: std_logic; --Desde rst_gral al mundo
signal clk_div100hz: std_logic;--Desde out de diviso de 1M (B1) a clk del divisor de 100 (B2)
signal clk_div1hz: std_logic;
signal cont_cod7seg: std_logic_vector(1 downto 0);
signal enable_signal: std_logic_vector(3 downto 0);
signal data_out_signal: std_logic_vector(6 downto 0);

begin
	b_1: div_frec_1M
    	port map(
        clk_div => clk_signal,
        rst_div => rst_signal,
        out_div => clk_div100hz
        );
	b_2: div_frec_100
    	port map(
        clk_div => clk_div100hz,
        rst_div => rst_signal,
        out_div => clk_div1hz
        );
	b_3: contador
  		port map(
    	clk_in_c => clk_div100hz,
    	rst_in_c => rst_signal,
    	data_out_c =>  cont_cod7seg
    	);
	b_4: reg_desp
        port map (
            clk_in => clk_div100hz,
            rst => rst_signal,
            data_out => enable_signal
        );
    b_5: siete_seg_esp
        port map(
            data_in_cont => cont_cod7seg,
            data_in_clk => clk_div1hz,
            data_out => data_out_signal
        );
        
    clk_signal <= clk_in;
	rst_signal <= rst_gral;
    enable_out <= enable_signal;
    data_out <= data_out_signal;

end architecture;
