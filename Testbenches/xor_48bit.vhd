LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_xor_48bit IS
END tb_xor_48bit;
 
ARCHITECTURE behavior OF tb_xor_48bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT xor_48bit
    PORT(
         input : IN  std_logic_vector(0 to 47);
         key : IN  std_logic_vector(0 to 47);
         output : OUT  std_logic_vector(0 to 47)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(0 to 47) := (others => '0');
   signal key : std_logic_vector(0 to 47) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(0 to 47);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: xor_48bit PORT MAP (
          input => input,
          key => key,
          output => output
        );

      -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      

      -- insert stimulus here 
		input<="011000000000000000000000000000000000000000000001";
		key<="101000000000000000000000000000000000000000000000";
		wait for 10 ns;
		
      wait;
   end process;

END;
