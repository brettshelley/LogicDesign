library IEEE;
use IEEE.std_logic_1164.all;

entity SystemL is
	port (ABCD  : in  std_logic_vector(3 downto 0);
     	      F     : out std_logic);
end entity;

architecture SystemL_arch of SystemL is
	begin
		proc1 : process (ABCD)		
			begin
				case (ABCD) is
					when "0001" => F <= '0';
					when "1001" => F <= '0';
					when "1011" => F <= '0';
					when "1101" => F <= '0';
					when others => F <= '1';
				end case;
		end process;

end architecture;
