--Code your design here
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador is
port ( 
  		rst_in_c : in std_logic;
        clk_in_c : in std_logic;
  		data_out_c : out std_logic_vector(1 downto 0)
);

  end entity contador;
  
  -- <> nombre de variable (obligatorio)
  -- [] opcional
  
  architecture beh of contador is
  
  signal data_out_c_aux : unsigned (1 downto 0);
  
  begin
    process(clk_in_c,rst_in_c)
    begin
      if rst_in_c = '1' then
        data_out_c_aux <= "00";
      elsif rising_edge(clk_in_c) then
      	if data_out_c_aux = "11" then
          data_out_c_aux <= "00";
      	else 
          data_out_c_aux <= data_out_c_aux + 1;
    	end if;
      end if;
    end process;
  data_out_c <= std_logic_vector(data_out_c_aux);
  end architecture;
