LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_four_combined IS
END tb_four_combined;
 
ARCHITECTURE behavior OF tb_four_combined IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT four_combined
    PORT(
         input : IN  std_logic_vector(0 to 31);
         key : IN  std_logic_vector(0 to 47);
         output : OUT  std_logic_vector(0 to 31)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(0 to 31) := (others => '0');
   signal key : std_logic_vector(0 to 47) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(0 to 31);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: four_combined PORT MAP (
          input => input,
          key => key,
          output => output
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      input<="00000100000100000100000000100000";
		key<="000010000000000000001111100000000000000000000000";
      -- insert stimulus here 

      wait;
   end process;

END;
