LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_initial_permutation_reverse IS
END tb_initial_permutation_reverse;
 
ARCHITECTURE behavior OF tb_initial_permutation_reverse IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT init_permutation_reverse
    PORT(
         left_half_permutation : IN  std_logic_vector(0 to 31);
         right_half_permutation : IN  std_logic_vector(0 to 31);
         output : OUT  std_logic_vector(0 to 63)
        );
    END COMPONENT;
    

   --Inputs
   signal left_half_permutation : std_logic_vector(0 to 31) := (others => '0');
   signal right_half_permutation : std_logic_vector(0 to 31) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(0 to 63);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: init_permutation_reverse PORT MAP (
          left_half_permutation => left_half_permutation,
          right_half_permutation => right_half_permutation,
          output => output
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      left_half_permutation<="00001010010000101101100110010011";
		right_half_permutation<="01000011010110100011001011110100";

      -- insert stimulus here 

      wait;
   end process;

END;
