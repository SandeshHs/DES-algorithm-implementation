LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_left_two IS
END tb_left_two;
 
ARCHITECTURE behavior OF tb_left_two IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT left_rot_two_bit
    PORT(
         input : IN  std_logic_vector(0 to 27);
         output : OUT  std_logic_vector(0 to 27)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(0 to 27) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(0 to 27);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: left_rot_two_bit PORT MAP (
          input => input,
          output => output
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      input<="1000111111111001111111111111";

      -- insert stimulus here 

      wait;
   end process;

END;
