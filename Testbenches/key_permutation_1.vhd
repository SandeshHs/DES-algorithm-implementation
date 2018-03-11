LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_permutation_key_one IS
END tb_permutation_key_one;
 
ARCHITECTURE behavior OF tb_permutation_key_one IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT permutation_key_one
    PORT(
         key : IN  std_logic_vector(0 to 63);
         left_key_permutation : OUT  std_logic_vector(0 to 27);
         right_key_permutation : OUT  std_logic_vector(0 to 27)
        );
    END COMPONENT;
    

   --Inputs
   signal key : std_logic_vector(0 to 63) := (others => '0');

 	--Outputs
   signal left_key_permutation : std_logic_vector(0 to 27);
   signal right_key_permutation : std_logic_vector(0 to 27);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: permutation_key_one PORT MAP (
          key => key,
          left_key_permutation => left_key_permutation,
          right_key_permutation => right_key_permutation
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      key<="1101111000010011111110001011100011101000101001001010011000110000";

      -- insert stimulus here 

      wait;
   end process;

END;
