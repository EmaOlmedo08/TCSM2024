library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Code your design here
entity div_frec_1M is
port(
    rst_div : in std_logic;
    clk_div : in std_logic;
    out_div : out std_logic
);
end entity div_frec_1M;

architecture beh of div_frec_1M is

signal contador_20bits : unsigned (19 downto 0) := (others => '0'); -- Inicialización de la señal contador_facha
signal out_div_aux : std_logic;
begin
  process(rst_div,clk_div)
  begin
    if rst_div = '1' then
      out_div_aux <= '0';
      contador_20bits <= (others => '0');
    elsif rising_edge (clk_div) then
      contador_20bits <= contador_20bits + 1;
      if contador_20bits = "11110100001001000000" then
        out_div_aux <= not out_div_aux;
        contador_20bits <= (others => '0');
      end if;
    end if;
  end process;
  
  out_div <= out_div_aux; -- Asignación de la salida fuera del proceso
end architecture beh;
