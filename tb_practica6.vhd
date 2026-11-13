library ieee;
use ieee.std_logic_1164.all;

entity tb_practica6 is
end tb_practica6;

architecture test of tb_practica6 is
    -- Señales internas para el testbench
    signal tb_a : std_logic_vector(1 downto 0) := "00";
    signal tb_e : std_logic := '0';
    signal tb_b : std_logic_vector(3 downto 0);
begin
    -- Instancia del decodificador
    uut: entity work.practica6(dec)
    port map (
        a => tb_a,
        e => tb_e,
        b => tb_b
    );

    -- Generación de estímulos
    estimulos: process
    begin
        -- Caso 1: Decodificador deshabilitado (e = '0')
        -- La salida debe mantenerse en "0000" sin importar el valor de 'a'
        tb_e <= '0';
        tb_a <= "00";
        wait for 10 ns;
        tb_a <= "11";
        wait for 10 ns;

        -- Caso 2: Decodificador habilitado (e = '1')
        -- Se prueban las 4 combinaciones posibles de 'a'
        tb_e <= '1';
        tb_a <= "00"; wait for 10 ns; -- Esperado: b = "0001"
        tb_a <= "01"; wait for 10 ns; -- Esperado: b = "0010"
        tb_a <= "10"; wait for 10 ns; -- Esperado: b = "0100"
        tb_a <= "11"; wait for 10 ns; -- Esperado: b = "1000"

        wait; -- Detener simulación
    end process;
end test;