library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
	port (Clock_50 : in std_logic;
		Reset : in std_logic;
		SW : in  std_logic_vector (3 downto 0);         
		LEDR : out std_logic_vector (9 downto 0);     
		HEX0 : out std_logic_vector (6 downto 0);
		HEX1 : out std_logic_vector (6 downto 0);		
		HEX2 : out std_logic_vector (6 downto 0);		
		HEX3 : out std_logic_vector (6 downto 0);		
		HEX4 : out std_logic_vector (6 downto 0);		
		HEX5 : out std_logic_vector (6 downto 0);
		GPIO_1 : out std_logic_vector (14 downto 0));				
end entity; 

architecture top_arch of top is
	
	component char_decoder    
		port (BIN_IN   : in  std_logic_vector (3 downto 0);          
			HEX_OUT  : out std_logic_vector (6 downto 0)); 
	end component;
	
	component clock_div_prec is
		port (Clock_In : in std_logic;
			Reset : in std_logic;
			Sel : in std_logic_vector (1 downto 0);
			Clock_Out : out std_logic);
	end component;
	
	component rom_64x8_sync is
		port (clock : in std_logic;
			address : in std_logic_vector (5 downto 0);
			data_out : out std_logic_vector (7 downto 0));
	end component;
	
	signal Clock_div : std_logic;
	signal address : Integer;
	signal ROM_data_out : std_logic_vector (7 downto 0);
	
	begin     

		Div : clock_div_prec port map (Clock_In => Clock_50, Reset => Reset, Sel => SW (1 downto 0), Clock_Out => Clock_div);
		
		counter : process (Clock_div, Reset)
			begin
				if (Reset = '0') then
					address <= 0;
				elsif (rising_edge(Clock_div)) then
					if (address = 63) then
						address <= 0;
					else
						address <= address + 1;
					end if;
				end if;
		end process;
		
		ROM : rom_64x8_sync port map (clock => Clock_div, address => std_logic_vector(to_unsigned(address, 6)), data_out => ROM_data_out);
		
		HEX2 <= "1111111";
		HEX3 <= "1111111";
		
		C0 : char_decoder port map (BIN_IN => ROM_data_out (3 downto 0), HEX_OUT => HEX0);
		C1 : char_decoder port map (BIN_IN => ROM_data_out (7 downto 4), HEX_OUT => HEX1);
		C4 : char_decoder port map (BIN_IN => std_logic_vector(to_unsigned(address, 6) (3 downto 0)), HEX_OUT => HEX4);
		C5 : char_decoder port map (BIN_IN => "00" & std_logic_vector(to_unsigned(address, 6) (5 downto 4)), HEX_OUT => HEX5);	 
		
		GPIO_1 (7 downto 0) <= ROM_data_out;
		GPIO_1 (13 downto 8) <= std_logic_vector(to_unsigned(address, 6));
		GPIO_1 (14) <= Clock_div;

end architecture;