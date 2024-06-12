library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Code your design here
entity div_frec_100 is
port(
    rst_div : in std_logic;
    clk_div : in std_logic;
    out_div : out std_logic
);
end entity div_frec_100;

architecture beh of div_frec is

signal contador_6bits : unsigned (6 downto 0) := (others => '0'); -- Inicialización de la señal contador_facha
signal out_div_aux : std_logic;
begin
  process(rst_div,clk_div)
  begin
    if rst_div = '1' then
      out_div_aux <= '0';
      contador_6bits <= (others => '0');
    elsif rising_edge (clk_div) then
      contador_6bits <= contador_6bits + 1;
      if contador_6bits = "1100100" then
        out_div_aux <= not out_div_aux;
        contador_6bits <= (others => '0');
      end if;
    end if;
  end process;
  
  out_div <= out_div_aux; -- Asignación de la salida fuera del proceso
end architecture beh;
