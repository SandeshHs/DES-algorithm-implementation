LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_s_one_box IS
END tb_s_one_box;
 
ARCHITECTURE behavior OF tb_s_one_box IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT s_one_box
    PORT(
         input : IN  std_logic_vector(0 to 5);
         output : OUT  std_logic_vector(0 to 3)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(0 to 5) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(0 to 3);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: s_one_box PORT MAP (
          input => input,
          output => output
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
            -- insert stimulus here 
		input<="010110";

      wait;
   end process;

END;
