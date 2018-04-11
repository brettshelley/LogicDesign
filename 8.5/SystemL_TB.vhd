library IEEE;
library STD;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity SystemL_TB is
end entity;

architecture SystemL_TB_arch of SystemL_TB is
  
 	component SystemL is
		port (ABCD  : in  std_logic_vector(3 downto 0);
		F     : out std_logic);
	end component;
 
	signal ABCD_TB : std_logic_vector(3 downto 0);
	signal F_TB    : std_logic;
 
	begin
   
		DUT : SystemL port map (ABCD_TB, F_TB);
		
		STIM : process
	
			file Fin : TEXT open READ_MODE is "input_vectors.txt";
	
			variable read_line : line;
			variable read_vector : std_logic_vector(3 downto 0);
			variable write_line : line;

			begin
				
				while (not endfile(Fin)) loop
				
					readline(Fin, read_line);
					read(read_line, read_vector);
					ABCD_TB <= read_vector; wait for 100 ns;

					write(write_line, string'("Input vector ABCD_TB="));
					write(write_line, ABCD_TB);
					write(write_line, string'("   Output F_TB="));
					write(write_line, F_TB);
					writeline(OUTPUT, write_line);

				end loop;

		end process;	

end architecture;
