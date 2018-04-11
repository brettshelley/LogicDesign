library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Counter_16bit_UpDown is
     port (Clock, Reset : in  std_logic;
           Up           : in  std_logic;
           Count_Out    : out std_logic_vector(15 downto 0));
end entity;

architecture Counter_16bit_UpDown_arch of Counter_16bit_UpDown is
	
	signal cnt_int : integer;

	begin
		
		counter : process(Clock, Reset)
			begin
				if (Reset = '0') then
					cnt_int <= 0;
				elsif (rising_edge(Clock)) then
					if (Up = '1') then
						if (cnt_int = 65535) then
							cnt_int <= 0;
						else
							cnt_int <= cnt_int +1;
						end if;
					else
						if (cnt_int = 0) then
							cnt_int <= 65535;
						else
							cnt_int <= cnt_int -1;
						end if;
					end if;
				end if;					
		end process;	

	Count_Out <= std_logic_vector(to_unsigned(cnt_int, 16));

end architecture;