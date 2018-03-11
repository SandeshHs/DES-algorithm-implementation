LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_left_right_64bit_swap IS
END tb_left_right_64bit_swap;
 
ARCHITECTURE behavior OF tb_left_right_64bit_swap IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT left_right_64bit_swap
    PORT(
         input_left : IN  std_logic_vector(0 to 31);
         input_right : IN  std_logic_vector(0 to 31);
         output_left : OUT  std_logic_vector(0 to 31);
         output_right : OUT  std_logic_vector(0 to 31)
        );
    END COMPONENT;
    

   --Inputs
   signal input_left : std_logic_vector(0 to 31) := (others => '0');
   signal input_right : std_logic_vector(0 to 31) := (others => '0');

 	--Outputs
   signal output_left : std_logic_vector(0 to 31);
   signal output_right : std_logic_vector(0 to 31);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: left_right_64bit_swap PORT MAP (
          input_left => input_left,
          input_right => input_right,
          output_left => output_left,
          output_right => output_right
        );

   -- Clock process definitions
   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      input_left<="11111111111111111111111111111111";
		input_right<="00000000000000000000000000000000";

      -- insert stimulus here 

      wait;
   end process;

END;
