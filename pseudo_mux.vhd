-- pseudo_mux - A Finite State Machine that mimics the behavior of mux
-- Copyright (C) 2018  Digital Systems Group - UFMG
-- 
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, see <https://www.gnu.org/licenses/>.
--

library ieee;
use ieee.std_logic_1164.all;

entity pseudo_mux is
    port (
        CLOCK   : in    std_logic; -- clock input
        S       : in    std_logic; -- control input
		  RESET   : in 	std_logic; -- start input
        A,B,C,D : in    std_logic; -- data inputs
        Q       : out   std_logic  -- data output
    );
end pseudo_mux;

architecture arch of pseudo_mux is
	type estados is (st1, st2, st3, st4);
	signal estado : estados;
begin
	process (CLOCK, RESET) is	
	begin
		if (RESET = '1') then
			estado <= st1;		
		elsif (rising_edge(CLOCK)) then
				case estado is
				
					when st1 =>
					if (S = '1') then
						estado <= st2;
					else
						estado <= st1;
					end if;
					
					when st2 =>
					if (S = '1') then
						estado <= st3;
					else
						estado <= st2;
					end if;
					
					when st3 =>
					if (S = '1') then
						estado <= st4;
					else
						estado <= st3;
					end if;
					
					when st4 =>
					if (S = '1') then
						estado <= st1;
					else
						estado <= st4;
					end if;
				end case;
			end if;
	end process;
	
	process (estado, A,B,C,D) is
		begin
			case estado is
				when st1 =>
					Q<=A;
				when st2 =>
					Q<=B;
				when st3 =>
					Q<=C;
				when st4 =>
					Q<=D;
			end case;
			
	end process;
end arch;
