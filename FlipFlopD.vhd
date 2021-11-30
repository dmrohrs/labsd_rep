LIBRARY IEEE;
use ieee.std_logic_1164.all;

entity FlipFlopD is
	port( clock: in std_logic;
		  D: in std_logic;
	      Q: out std_logic
	    );
end FlipFlopD;

architecture RTL of FlipFlopD is
begin
--	process(clock)
--	begin
--		if (clock='1' and clock'event) then
--			Q <= D;
--		end if;
--	end process;
q <= D when (clock='1' and clock'event) else
	 Q;

end RTL;