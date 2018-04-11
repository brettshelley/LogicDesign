library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add_n_sub_8bit is
	port (A, B : in std_logic_vector (7 downto 0);
		ADDn_SUB : in std_logic;
		Sum_Diff : out std_logic_vector (7 downto 0);
		Cout_Bout : out std_logic;
		Vout : out std_logic);
end entity;

architecture add_n_sub_8bit_arch of add_n_sub_8bit is

	signal result : signed (8 downto 0); 
	
	begin

	ADD : process (A, B, ADDn_SUB)
		begin
			if (ADDn_SUB = '0') then
				result <= signed('0' & A) + signed('0' & B);
			elsif (ADDn_SUB = '1') then
				result <= signed('0' & A) - signed('0' & B);
			end if;
	end process;

	overflow : process (A, B, ADDn_SUB, result)
		begin
			if (ADDn_SUB = '0') then
				if (A(7) = '0' and B(7) = '0' and result(7) = '1') then
					Vout <= '1';
				elsif (A(7) = '1' and B(7) = '1' and result(7) = '0') then
					Vout <= '1';
				else
					Vout <= '0';
				end if;
			elsif (ADDn_SUB = '1') then
				if (A(7) = '1' and B(7) = '0' and result(7) = '0') then
					Vout <= '1';
				elsif (A(7) = '0' and B(7) = '1' and result(7) = '1') then
					Vout <= '1';
				else
					Vout <= '0';
				end if;
			end if;
	end process;

	Sum_Diff <= std_logic_vector(result (7 downto 0));
	Cout_Bout <= std_logic(result (8));		

end architecture;		
			