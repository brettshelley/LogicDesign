library IEEE;
use IEEE.std_logic_1164.all;

entity SystemJ_TB is
end entity;

architecture SystemJ_TB_arch of SystemJ_TB is
  
 component SystemJ is
   port (ABCD  : in  std_logic_vector(3 downto 0);
         F     : out std_logic);
 end component;
 
 signal ABCD_TB : std_logic_vector(3 downto 0);
 signal F_TB    : std_logic;
 
 begin
    
    DUT : SystemJ port map (ABCD_TB, F_TB);
    
    STIM : process
      begin
        ABCD_TB <= "0000"; wait for 10 ns;
	assert (F_TB='1') report "Passed input 0000" severity NOTE;
	assert (F_TB='0') report "Failed input 0000" severity NOTE;

        ABCD_TB <= "0001"; wait for 10 ns;
	assert (F_TB='1') report "Passed input 0001" severity NOTE;
	assert (F_TB='0') report "Failed input 0001" severity NOTE;

        ABCD_TB <= "0010"; wait for 10 ns;
	assert (F_TB='1') report "Passed input 0010" severity NOTE;
	assert (F_TB='0') report "Failed input 0010" severity NOTE;

        ABCD_TB <= "0011"; wait for 10 ns;
	assert (F_TB='1') report "Passed input 0011" severity NOTE;
	assert (F_TB='0') report "Failed input 0011" severity NOTE;
  
        ABCD_TB <= "0100"; wait for 10 ns;
	assert (F_TB='0') report "Passed input 0100" severity NOTE;
	assert (F_TB='1') report "Failed input 0100" severity NOTE;
  
        ABCD_TB <= "0101"; wait for 10 ns;
	assert (F_TB='0') report "Passed input 0101" severity NOTE;
	assert (F_TB='1') report "Failed input 0101" severity NOTE;
  
        ABCD_TB <= "0110"; wait for 10 ns;
	assert (F_TB='1') report "Passed input 0110" severity NOTE;
	assert (F_TB='0') report "Failed input 0110" severity NOTE;
  
        ABCD_TB <= "0111"; wait for 10 ns;
	assert (F_TB='0') report "Passed input 0111" severity NOTE;
	assert (F_TB='1') report "Failed input 0111" severity NOTE;
  
        ABCD_TB <= "1000"; wait for 10 ns;
	assert (F_TB='1') report "Passed input 1000" severity NOTE;
	assert (F_TB='0') report "Failed input 1000" severity NOTE;
  
        ABCD_TB <= "1001"; wait for 10 ns;
	assert (F_TB='1') report "Passed input 1001" severity NOTE;
	assert (F_TB='0') report "Failed input 1001" severity NOTE;
  
        ABCD_TB <= "1010"; wait for 10 ns;
	assert (F_TB='1') report "Passed input 1010" severity NOTE;
	assert (F_TB='0') report "Failed input 1010" severity NOTE;
  
        ABCD_TB <= "1011"; wait for 10 ns;
	assert (F_TB='1') report "Passed input 1011" severity NOTE;
	assert (F_TB='0') report "Failed input 1011" severity NOTE;
  
        ABCD_TB <= "1100"; wait for 10 ns;
	assert (F_TB='0') report "Passed input 1100" severity NOTE;
	assert (F_TB='1') report "Failed input 1100" severity NOTE;
  
        ABCD_TB <= "1101"; wait for 10 ns;
	assert (F_TB='0') report "Passed input 1101" severity NOTE;
	assert (F_TB='1') report "Failed input 1101" severity NOTE;
  
        ABCD_TB <= "1110"; wait for 10 ns;
	assert (F_TB='1') report "Passed input 1110" severity NOTE;
	assert (F_TB='0') report "Failed input 1110" severity NOTE;
  
        ABCD_TB <= "1111"; wait for 10 ns;
	assert (F_TB='0') report "Passed input 1111" severity NOTE;
	assert (F_TB='1') report "Failed input 1111" severity NOTE;
       
    end process;
  
end architecture;
