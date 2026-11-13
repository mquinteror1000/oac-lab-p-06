-- modelo de un decodificador de 2 a 4
library ieee;
use ieee.std_logic_1164.all; -- Corregido: Se agregó punto y coma

entity practica6 is
	port(
		a: in std_logic_vector ( 1 downto 0 );
		e: in std_logic;
		b: out std_logic_vector ( 3 downto 0 )
	);
end practica6;

architecture dec of practica6 is
begin
	process( a,e )
		begin
			if ( e = '0' ) then
				b <= "0000"; -- Corregido: variable b, comillas dobles y 4 bits
			else
				case a is -- Corregido: se eliminaron los dos puntos
				when "00" => 
					b <= "0001"; -- Corregido: variable b en lugar de o
				when "01" =>
					b <= "0010";
				when "10" => 
					b <= "0100";
				when "11" =>
					b <= "1000";
				when others => 
					b <= "0000";
			end case;
		end if;
	end process;
end dec;