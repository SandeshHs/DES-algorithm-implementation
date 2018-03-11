LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_permutation_prog IS
END tb_permutation_prog;
 
ARCHITECTURE behavior OF tb_permutation_prog IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT permutation_prog
    PORT(
         input : IN  std_logic_vector(0 to 31);
         output : OUT  std_logic_vector(0 to 31)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(0 to 31) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(0 to 31);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: permutation_prog PORT MAP (
          input => input,
          output => output
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      
      -- insert stimulus here 
		input<="00101001111011001001001100100000";
      wait;
   end process;

END;
