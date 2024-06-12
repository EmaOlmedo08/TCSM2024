library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--Utilizado para activar los enable de los 7seg

entity reg_desp is
	port(
        clk_in : in std_logic;
		rst : in std_logic;
		data_out : out std_logic_vector(3 downto 0)
	);
end entity reg_desp;

architecture bhv of reg_desp is
signal aux : std_logic_vector(3 downto 0);
begin
 process(clk_in, rst)
	begin
		if rst = '1' then
			aux <= "0001";
		elsif rising_edge (clk_in) then
			aux <= aux(2 downto 0) & aux(3);
		end if;
	end process; 
 
data_out <= aux;
end bhv; 
