LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_right_one IS
END tb_right_one;
 
ARCHITECTURE behavior OF tb_right_one IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT right_rot_one_bit
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
 
   --onstant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: right_rot_one_bit PORT MAP (
          input => input,
          output => output
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      input<="0000111111111111111111111111";
      -- insert stimulus here 

      wait;
   end process;

END;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_right_one IS
END tb_right_one;
 
ARCHITECTURE behavior OF tb_right_one IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT right_rot_one_bit
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
 
   --onstant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: right_rot_one_bit PORT MAP (
          input => input,
          output => output
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      input<="0000111111111111111111111111";
      -- insert stimulus here 

      wait;
   end process;

END;
