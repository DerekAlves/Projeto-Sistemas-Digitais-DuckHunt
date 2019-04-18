LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;


entity sevenseg is
	port(
	signal win : in std_logic;
	signal sevenseg_0 : out std_logic_vector(6 downto 0);
	signal sevenseg_1 : out std_logic_vector(6 downto 0);
	signal sevenseg_2 : out std_logic_vector(6 downto 0);
	signal sevenseg_3 : out std_logic_vector(6 downto 0);
	signal sevenseg_4 : out std_logic_vector(6 downto 0);
	signal sevenseg_5 : out std_logic_vector(6 downto 0);
	signal sevenseg_6 : out std_logic_vector(6 downto 0);
	signal sevenseg_7 : out std_logic_vector(6 downto 0)
	);
end sevenseg;

architecture segments of sevenseg is
begin
	process(win)
	begin
		if(win = '1') then
			sevenseg_0 <= "0010010";
			sevenseg_1 <= "1001000";
			sevenseg_2 <= "0000110";
			sevenseg_3 <= "0000000";
			sevenseg_4 <= "0001000";
			sevenseg_5 <= "1001110";
			sevenseg_6 <= "0001000";
			sevenseg_7 <= "0001100";
		else
			sevenseg_0 <= "1111111";
			sevenseg_1 <= "1111111";
			sevenseg_2 <= "1111111";
			sevenseg_3 <= "1111111";
			sevenseg_4 <= "1111111";
			sevenseg_5 <= "1111111";
			sevenseg_6 <= "1111111";
			sevenseg_7 <= "1111111";
		end if;
	end process;
end segments;