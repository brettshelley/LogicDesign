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
		GPIO_1 : out std_logic_vector (7 downto 0));				
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
	
	signal Clock_div : std_logic;
	signal CNT0 : unsigned (3 downto 0);
	signal CNT1 : unsigned (3 downto 0);
	signal CNT2 : unsigned (3 downto 0);
	signal CNT3 : unsigned (3 downto 0);
	signal CNT4 : unsigned (3 downto 0);
	signal CNT5 : unsigned (3 downto 0);
	
	begin     

		Div : clock_div_prec port map (Clock_In => Clock_50, Reset => Reset, Sel => SW (1 downto 0), Clock_Out => Clock_div);
		
		BCD0 : process (Clock_div, Reset)
			begin
				if (Reset = '0') then
					CNT0 <= "0000";
				elsif (rising_edge(Clock_div)) then
					if (CNT0 = "1001") then
						CNT0 <= "0000";
					else
						CNT0 <= CNT0 + 1;
					end if;
				end if;
		end process;
		
		BCD1 : process (Clock_div, Reset)
			begin
				if (Reset = '0') then
					CNT1 <= "0000";
				elsif (rising_edge(Clock_div)) then
					if (CNT0 = "1001") then
						if (CNT1 = "1001") then
							CNT1 <= "0000";
						else
							CNT1 <= CNT1 + 1;
						end if;
					end if;
				end if;
		end process;
		
		BCD2 : process (Clock_div, Reset)
			begin
				if (Reset = '0') then
					CNT2 <= "0000";
				elsif (rising_edge(Clock_div)) then
					if (CNT0 = "1001" and CNT1 = "1001") then
						if (CNT2 = "1001") then
							CNT2 <= "0000";
						else
							CNT2 <= CNT2 + 1;
						end if;
					end if;
				end if;
		end process;
		
		BCD3 : process (Clock_div, Reset)
			begin
				if (Reset = '0') then
					CNT3 <= "0000";
				elsif (rising_edge(Clock_div)) then
					if (CNT0 = "1001" and CNT1 = "1001" and CNT2 = "1001") then
						if (CNT3 = "1001") then
							CNT3 <= "0000";
						else
							CNT3 <= CNT3 + 1;
						end if;
					end if;
				end if;
		end process;
		
		BCD4 : process (Clock_div, Reset)
			begin
				if (Reset = '0') then
					CNT4 <= "0000";
				elsif (rising_edge(Clock_div)) then
					if (CNT0 = "1001" and CNT1 = "1001" and CNT2 = "1001" and CNT3 = "1001") then
						if (CNT4 = "1001") then
							CNT4 <= "0000";
						else
							CNT4 <= CNT4 + 1;
						end if;
					end if;
				end if;
		end process;
		
		BCD5 : process (Clock_div, Reset)
			begin
				if (Reset = '0') then
					CNT5 <= "0000";
				elsif (rising_edge(Clock_div)) then
					if (CNT0 = "1001" and CNT1 = "1001" and CNT2 = "1001" and CNT3 = "1001" and CNT4 = "1001") then
						if (CNT5 = "1001") then
							CNT5 <= "0000";
						else
							CNT5 <= CNT5 + 1;
						end if;
					end if;
				end if;
		end process;
		
		C0 : char_decoder port map (BIN_IN => std_logic_vector(CNT0), HEX_OUT => HEX0);
		C1 : char_decoder port map (BIN_IN => std_logic_vector(CNT1), HEX_OUT => HEX1);
		C2 : char_decoder port map (BIN_IN => std_logic_vector(CNT2), HEX_OUT => HEX2);
		C3 : char_decoder port map (BIN_IN => std_logic_vector(CNT3), HEX_OUT => HEX3);
		C4 : char_decoder port map (BIN_IN => std_logic_vector(CNT4), HEX_OUT => HEX4);
		C5 : char_decoder port map (BIN_IN => std_logic_vector(CNT5), HEX_OUT => HEX5);	
		
		LEDR (0) <= Clock_div; 
		
		GPIO_1 (0) <= Clock_div;

end architecture;