library IEEE;
use IEEE.std_logic_1164.all;

entity Walking1_FSM is
	port (Clock, Reset : in std_logic;
		Dir : in std_logic;
		Walking1 : out std_logic_vector (9 downto 0));
end entity;

architecture Walking1_FSM_arch of Walking1_FSM is
	
	type State_Type is (L0, L1, L2, L3, L4, L5, L6, L7, L8, L9);
	--constant L0 : State_Type := "0000000001";
	--constant L1 : State_Type := "0000000010";
	--constant L2 : State_Type := "0000000100";
	--constant L3 : State_Type := "0000001000";
	--constant L4 : State_Type := "0000010000";
	--constant L5 : State_Type := "0000100000";
	--constant L6 : State_Type := "0001000000";
	--constant L7 : State_Type := "0010000000";
	--constant L8 : State_Type := "0100000000";
	--constant L9 : State_Type := "1000000000";
	signal current_state, next_state : State_Type;
	
	begin
	
		State_Memory : process (Clock, Reset)
			begin
				if (Reset = '0') then
					current_state <= L0;
				elsif (Clock'event and Clock = '1') then 
					current_state <= next_state;
				end if;
			end process;
		
		Next_State_Logic : process (current_state, Dir)
			begin
				case (current_state) is
					when L0 => if (Dir = '1') then
										next_state <= L1;
									else
										next_state <= L9;
									end if;
					when L1 => if (Dir = '1') then
										next_state <= L2;
									else
										next_state <= L0;
									end if;
					when L2 => if (Dir = '1') then
										next_state <= L3;
									else
										next_state <= L1;
									end if;
					when L3 => if (Dir = '1') then
										next_state <= L4;
									else
										next_state <= L2;
									end if;
					when L4 => if (Dir = '1') then
										next_state <= L5;
									else
										next_state <= L3;
									end if;
					when L5 => if (Dir = '1') then
										next_state <= L6;
									else
										next_state <= L4;
									end if;
					when L6 => if (Dir = '1') then
										next_state <= L7;
									else
										next_state <= L5;
									end if;
					when L7 => if (Dir = '1') then
										next_state <= L8;
									else
										next_state <= L6;
									end if;		
					when L8 => if (Dir = '1') then
										next_state <= L9;
									else
										next_state <= L7;
									end if;
					when L9 => if (Dir = '1') then
										next_state <= L0;
									else
										next_state <= L8;
									end if;
					when others => next_state <= L0;				
				end case;
		end process;
	
		Output_Logic : process (current_state)
			begin
				case (current_state) is
					when L0 => Walking1 <= "0000000001";
					when L1 => Walking1 <= "0000000010";
					when L2 => Walking1 <= "0000000100";
					when L3 => Walking1 <= "0000001000";
					when L4 => Walking1 <= "0000010000";
					when L5 => Walking1 <= "0000100000";
					when L6 => Walking1 <= "0001000000";
					when L7 => Walking1 <= "0010000000";	
					when L8 => Walking1 <= "0100000000";
					when L9 => Walking1 <= "1000000000";
					when others => Walking1 <= "0000000000";
				end case;
		end process;
	
end architecture;
		