library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_pseudo_mux is 
end tb_pseudo_mux;

architecture testbench of tb_pseudo_mux is
		component pseudo_mux is
			 port (
        CLOCK   : in    std_logic; -- clock input
        S       : in    std_logic; -- control input
		  RESET   : in    std_logic; -- start input
        A,B,C,D : in    std_logic; -- data inputs
        Q       : out   std_logic  -- data output
			);
		end component;
constant period : time := 10 ns;
constant half_period : time := period/2;
signal clock : std_logic := '0';
signal s, a, b, c, d, q, reset: std_logic := '0';

begin
instance_pseudo_mux : pseudo_mux port map (CLOCK => clock, S=>s, A=>a, B=>b, C=>c, D=>d,Q=>q, RESET=>reset);
clock <= not clock after half_period;
reset <= '1', '0' after 2 ns;
a <= '1';
b <= '0';
c <= '1';
d <= '0';
s <= '0', '1' after 4 ns, '0' after 14 ns, '1' after 24 ns , '0' after 28 ns, '1' after 34 ns, '0' after 38 ns, '1' after 44 ns;

end testbench;