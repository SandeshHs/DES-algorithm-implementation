LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_key_permutation_2 IS
END tb_key_permutation_2;
 
ARCHITECTURE behavior OF tb_key_permutation_2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT key_permutation_2
    PORT(
         left_half : IN  std_logic_vector(0 to 27);
         right_half : IN  std_logic_vector(0 to 27);
         permuted_key : OUT  std_logic_vector(0 to 47)
        );
    END COMPONENT;
    

   --Inputs
   signal left_half : std_logic_vector(0 to 27) := (others => '0');
   signal right_half : std_logic_vector(0 to 27) := (others => '0');

 	--Outputs
   signal permuted_key : std_logic_vector(0 to 47);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: key_permutation_2 PORT MAP (
          left_half => left_half,
          right_half => right_half,
          permuted_key => permuted_key
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      left_half  <="1111111111111111111111111111";
		right_half <="0000000000000000000000000000";

      -- insert stimulus here 

      wait;
   end process;

END;
