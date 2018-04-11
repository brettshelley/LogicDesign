library IEEE;
use IEEE.std_logic_1164.all;

entity alu is
	port (A_in : in std_logic_vector (7 downto 0);
		B_in : in std_logic_vector (7 downto 0);
		Sel : in std_logic_vector (2 downto 0);
		NZVC : out std_logic_vector (3 downto 0);
		Result : out std_logic_vector (7 downto 0));
end entity;

architecture alu_arch of alu is

	begin

end architecture;
