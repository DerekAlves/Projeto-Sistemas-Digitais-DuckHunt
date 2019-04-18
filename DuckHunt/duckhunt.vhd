library ieee;
use ieee.std_logic_1164.all;
use  ieee.numeric_std.all;

entity duck_hunt is

	port
	(
		signal slide_sws 		: in std_logic_vector(15 downto 0);
		signal leds 			: out std_logic_vector(15 downto 0);
		signal reset 			: in std_logic;
		signal slow_clock		: in std_logic;
		signal fast_clock		: in std_logic;
		signal hard				: in std_logic;
		signal win_condition	: out std_logic
	);
	
end duck_hunt;

architecture game of duck_hunt is

	signal bits 				: std_logic_vector(15 downto 0) := x"8000";--?
	signal old_slide_sws 	: std_logic_vector(15 downto 0) := x"0000";--?
	signal clock 				: std_logic; -- fast or slow
	signal wc_int			 	: std_logic := '0'; -- win_condition int

begin

	leds <= bits;
	win_condition <= wc_int;
	
	process(hard)
		begin
		if(hard = '1') then
			clock <= fast_clock; -- fast(hard)
		else
			clock <= slow_clock; -- slow(easy)
		end if;
	end process;

	process(clock, reset)
		begin
		if(rising_edge(clock) and reset = '0') then
				bits <= std_logic_vector(rotate_right(signed(bits),1));
				wc_int <= '0';
			if(((old_slide_sws xor slide_sws ) /= x"0000")) then
				bits <= bits xor slide_sws;
				old_slide_sws <= slide_sws;
			elsif((old_slide_sws xor slide_sws) = x"0000") then
				old_slide_sws <= slide_sws;
			end if;
			
			if((bits = x"0000")) then-- and ((switches_old xor switches) /= x"0000") and switches = x"0000") then 
				wc_int <= '1';
			end if;
			
		elsif(rising_edge(clock) and reset = '1') then
			bits <= x"8000";
			old_slide_sws <= slide_sws;
			wc_int <= '0';
		end if;
		
	end process;
end game;