library IEEE;
use IEEE.std_logic_1164.all;

entity fsm2_behavioral is
	port (Clock, Reset : in  std_logic;
		Din          : in  std_logic;
        	Dout         : out std_logic);
end entity;

architecture fsm2_behavioral_arch of fsm2_behavioral is

	type State_Type is (S0, S1, S2, S3);
	signal current_state, next_state : State_Type;

	begin

		State_Memory : process (Clock, Reset)
			begin
				if (Reset = '0') then
					current_state <= S0;
				elsif (Clock'event and Clock = '1') then
					current_state <= next_state;
				end if;
		end process;

		Next_State_Logic : process (current_state, Din)
			begin
				case (current_state) is
					when S0 => if (Din = '1') then
							next_state <= S1;
						   else
							next_state <= S0;
						   end if;
					when S1 => if (Din = '1') then
							next_state <= S3;
						   else
							next_state <= S2;
						   end if;
					when S2 => if (Din = '1') then
							next_state <= S3;
						   else
							next_state <= S0;
						   end if;
					when S3 => if (Din = '1') then
							next_state <= S0;
						   else
							next_state <= S3;
						   end if;
					when others => next_state <= S0;
				end case;
		end process;

		Output_Logic : process (current_state, Din)
			begin
				case (current_state) is
					when S1 => Dout <= not Din;
					when others =>	Dout <= Din;
				end case;
		end process;		


end architecture;
