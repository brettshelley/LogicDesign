library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity twos_comp_decoder is      
	port (twos_comp_in   : in  std_logic_vector (3 downto 0);            
		Mag_out  : out std_logic_vector (6 downto 0);
		Sign_out  : out std_logic_vector (6 downto 0));   
end entity;

architecture twos_comp_decoder_arch of twos_comp_decoder is
	begin        
		
		logic : process (twos_comp_in)
			begin
				case (twos_comp_in) is
					when "0000" => Mag_out <= "1000000"; Sign_out <= "1111111";
					when "0001" => Mag_out <= "1111001"; Sign_out <= "1111111";
					when "0010" => Mag_out <= "0100100"; Sign_out <= "1111111";
					when "0011" => Mag_out <= "0110000"; Sign_out <= "1111111";
					when "0100" => Mag_out <= "0011001"; Sign_out <= "1111111";
					when "0101" => Mag_out <= "0010010"; Sign_out <= "1111111";
					when "0110" => Mag_out <= "0000010"; Sign_out <= "1111111";
					when "0111" => Mag_out <= "1111000"; Sign_out <= "1111111";
					when "1000" => Mag_out <= "0000000"; Sign_out <= "0111111";
					when "1001" => Mag_out <= "1111000"; Sign_out <= "0111111";
					when "1010" => Mag_out <= "0000010"; Sign_out <= "0111111";
					when "1011" => Mag_out <= "0010010"; Sign_out <= "0111111";
					when "1100" => Mag_out <= "0011001"; Sign_out <= "0111111";
					when "1101" => Mag_out <= "0110000"; Sign_out <= "0111111";
					when "1110" => Mag_out <= "0100100"; Sign_out <= "0111111";
					when "1111" => Mag_out <= "1111001"; Sign_out <= "0111111";
					when others => Mag_out <= "1111111";
				end case;
		end process;
			

end architecture;