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
	
	component char_decoder    
		port (BIN_IN   : in  std_logic_vector (3 downto 0);          
			HEX_OUT  : out std_logic_vector (6 downto 0)); 
	end component;

	signal Sum : unsigned (4 downto 0);
	
	begin     
	
		Sum <= unsigned('0' & SW (7 downto 4)) + unsigned('0' & SW (3 downto 0));
		
		HEX1 <= "1111111";
		HEX3 <= "1111111";
		
		C0 : char_decoder port map (BIN_IN => SW (3 downto 0), HEX_OUT => HEX0);
		C2 : char_decoder port map (BIN_IN => SW (7 downto 4), HEX_OUT => HEX2);
		C4 : char_decoder port map (BIN_IN => std_logic_vector(Sum (3 downto 0)), HEX_OUT => HEX4);
		C5 : char_decoder port map (BIN_IN => "000" & Sum (4), HEX_OUT => HEX5);	 
		
		LEDR (7 downto 0) <= SW;
		LEDR (8) <= '0';
		LEDR (9) <= Sum (4);

end architecture;