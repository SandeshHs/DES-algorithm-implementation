LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_expamsion IS
END tb_expamsion;
 
ARCHITECTURE behavior OF tb_expamsion IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT expanding_prog
    PORT(
         input : IN  std_logic_vector(0 to 31);
         output : OUT  std_logic_vector(0 to 47)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(0 to 31) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(0 to 47);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: expanding_prog PORT MAP (
          input => input,
          output => output
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     input<="11110000101010101111000010101010";
      -- insert stimulus here 

      wait;
   end process;

END;
