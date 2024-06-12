library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--Declara la interfaz del bloque (entrada y salidas)
entity siete_seg_esp is
	port(
		data_in_cont : in std_logic_vector(1 downto 0);
        data_in_clk : in std_logic;
		data_out : out std_logic_vector(6 downto 0)
	);
end entity siete_seg_esp;

--Describe la funcionalidad del bloque

architecture beh_siete_seg of siete_seg_esp is
signal data_out_signal : std_logic_vector(6 downto 0);

begin
data_out <= data_out_signal;
	process(data_in_clk, data_in_cont)
	begin
    	if data_in_clk = '0' then
            -- Para los pines del display 7 seg
            -- p  g  f  e  d  c  b  a
            -- 0  0  0  0  0  0  0  0
            case data_in_cont is
                -- Mostrar T
                when "00" =>
                    data_out_signal <= "0000111";
                -- Mostrar C
                when "01" =>
                    data_out_signal <= "0111001";
                -- Mostrar S
                when "10" =>
                    data_out_signal <= "1101101";
                -- Mostrar M
                when "11" =>
                    data_out_signal <= "1010111";
                when others =>
                    null;
			end case;
        elsif data_in_clk = '1' then
        	case data_in_cont is
                -- Mostrar 2
                when "00" =>
                    data_out_signal <= "1011011";
                -- Mostrar 0
                when "01" =>
                    data_out_signal <= "0111111";
                -- Mostrar 2
                when "10" =>
                    data_out_signal <= "1011011";
                -- Mostrar 4
                when "11" =>
                    data_out_signal <= "1100110";
                when others =>
                    null;
			end case;
         end if;
	end process;
end architecture beh_siete_seg;
