library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clk_gen is

	port
	(
		clock_50Mhz			 : in	std_logic;
		slowclock			 : out	std_logic;
		fastclock 			 : out std_logic
	);
	
end clk_gen;

architecture generator of clk_gen is

	signal	count_10hz      : std_logic_vector(22 downto 0); 
	signal	clock_10hz_int  : std_logic; 
	signal	count_fast      : std_logic_vector(22 downto 0); 
	signal	clock_fast_int  : std_logic; 
	
begin
	process 
	begin

		wait until clock_50Mhz'EVENT and clock_50Mhz = '1';
		slowclock <= clock_10hz_int;
			if count_10hz < 2500000 then
				count_10hz <= count_10hz + 1;
			else
				count_10hz <= "00000000000000000000000";
				clock_10hz_int <= not(clock_10hz_int);
			end if;

	end process;	
	
	process
	begin

		wait until clock_50Mhz'EVENT and clock_50Mhz = '1';
		fastclock <= clock_fast_int;
			if count_fast < 1250000 then
				count_fast <= count_fast + 1;
			else
				count_fast <= "00000000000000000000000";
				clock_fast_int <= not(clock_fast_int);
			end if;

	end process;

end ;

