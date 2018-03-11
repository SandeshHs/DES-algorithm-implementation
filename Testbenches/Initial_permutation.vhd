LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_init_permuting IS
END tb_init_permuting;
 
ARCHITECTURE behavior OF tb_init_permuting IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT init_permuting
    PORT(
         input : IN  std_logic_vector(0 to 63);
         right_half_permutation : OUT  std_logic_vector(0 to 31);
         left_half_permutation : OUT  std_logic_vector(0 to 31)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(0 to 63) := (others => '0');

 	--Outputs
   signal right_half_permutation : std_logic_vector(0 to 31);
   signal left_half_permutation : std_logic_vector(0 to 31);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: init_permuting PORT MAP (
          input => input,
          right_half_permutation => right_half_permutation,
          left_half_permutation => left_half_permutation
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     input<="0101011011101000000111101010110011001100010111111111010010110001";

      -- insert stimulus here 

      wait;
   end process;

END;
