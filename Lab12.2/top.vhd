library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
	port (SW : in  std_logic_vector (7 downto 0);         
		LEDR : out std_logic_vector (9 downto 0);     
		HEX0 : out std_logic_vector (6 downto 0);
		HEX1 : out std_logic_vector (6 downto 0);		
		HEX2 : out std_logic_vector (6 downto 0);		
		HEX3 : out std_logic_vector (6 downto 0);		
		HEX4 : out std_logic_vector (6 downto 0);		
		HEX5 : out std_logic_vector (6 downto 0));				
end entity; 

architecture top_arch of top is
	
	component twos_comp_decoder      
		port (twos_comp_in   : in  std_logic_vector (3 downto 0);            
			Mag_out  : out std_logic_vector (6 downto 0);
			Sign_out  : out std_logic_vector (6 downto 0));   
	end component;


	signal Sum : signed (3 downto 0);
	signal ovr : std_logic;
	
	begin     
	
		Sum <= signed(SW (7 downto 4)) + signed(SW (3 downto 0));
		
		overflow : process (SW, Sum)
			begin
				if (SW(7) = '0' and SW(3) = '0' and Sum(3) = '1') then
					ovr <= '1';
				elsif (SW(7) = '1' and SW(3) = '1' and Sum(3) = '0') then
					ovr <= '1';
				else
					ovr <= '0';
				end if;
		end process;
		
		C01 : twos_comp_decoder port map (twos_comp_in => SW (3 downto 0), Mag_out => HEX0, Sign_out => HEX1);
		C23 : twos_comp_decoder port map (twos_comp_in => SW (7 downto 4), Mag_out => HEX2, sign_out => HEX3);
		C45 : twos_comp_decoder port map (twos_comp_in => std_logic_vector(Sum (3 downto 0)), Mag_out => HEX4, Sign_out => HEX5);
		
		LEDR (7 downto 0) <= SW;
		LEDR (8) <= '0';
		LEDR (9) <= ovr;

end architecture;