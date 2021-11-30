library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_mean_4_clocks is
end tb_mean_4_clocks;

architecture testbench of tb_mean_4_clocks is
	component mean_4_clocks is
		generic (
		  W       :       integer := 32
					);
		 port (
			  CLK     : in    std_logic;
			  RESET   : in    std_logic;
			  INPUT   : in    std_logic_vector(W - 1 downto 0);
			  OUTPUT  : out   std_logic_vector(W - 1 downto 0)
		 );
	end component;
constant period : time := 10ns; 
constant half_period : time :=  period/2;
signal clock : std_logic := '0';
signal reset : std_logic;
signal input : std_logic_vector (32 - 1 downto 0);
signal output : std_logic_vector (32 -1 downto 0);

begin 
instancia_mean_4_clocks : mean_4_clocks port map (CLK=>clock, RESET=>reset, INPUT=>input, OUTPUT=>output);
clock <= not clock after half_period;
input <= std_logic_vector (to_unsigned(20,32)), 
std_logic_vector (to_unsigned(24,32))after 10 ns,
std_logic_vector (to_unsigned(28,32)) after 20 ns, 
std_logic_vector (to_unsigned(32,32)) after 30 ns,
std_logic_vector (to_unsigned(36,32)) after 40 ns,
std_logic_vector (to_unsigned(40,32)) after 50 ns;

reset <= '1', '0' after 1 ns, '1' after 60 ns;


end testbench;