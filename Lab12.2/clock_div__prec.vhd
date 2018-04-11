library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity clock_div_prec is
	port (Clock_In : in std_logic;
		Reset : in std_logic;
		Sel : in std_logic_vector (1 downto 0);
		Clock_Out : out std_logic);
end entity;

architecture clock_div_prec_arch of clock_div_prec is
	
	signal CNT : Integer; 
	signal Clock_div : std_logic;
	
	begin       
	
	mult : process (Sel)
		begin
			if (Sel = "00") then
				CNT <= 25000;
			elsif (Sel = "01") then
				CNT <= 250000;
			elsif (Sel = "10") then
				CNT <= 2500000;
			elsif (Sel = "11") then
				CNT <= 25000000;
			end if;
	end process;
	
	count : process (Clock_In, Reset)
		
		variable count : Integer;
	
		begin
			if (Reset = '0') then
				count := 0;
				Clock_div <= '0';
			elsif (rising_edge(Clock_In)) then
				if (count < CNT) then
					count := count + 1;
				else
					count := 0;
					Clock_div <= not Clock_div;
				end if;
			end if;
	end process;
	
	Clock_Out <= Clock_div;
	
end architecture;
