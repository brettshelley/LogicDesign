library IEEE;
use IEEE.std_logic_1164.all;

entity Dflipflop is
	port (Clock, Reset, D	:	in std_logic;
		Q, Qn	:	out std_logic);
end entity;

architecture Dflipflop_arch of Dflipflop is
	
		begin
		
			D_FLIP_FLOP	:	process (Clock, Reset)
				begin
					if (Reset = '0') then
						Q <= '0';
						Qn <= '1';
					elsif (Clock'event and Clock = '1') then
						Q <= D;
						Qn <= not D;
					end if;
				end process;
				
end architecture;