LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_round_prog IS
END tb_round_prog;
 
ARCHITECTURE behavior OF tb_round_prog IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT round_prog
    PORT(
         left_half : IN  std_logic_vector(0 to 31);
         right_half : IN  std_logic_vector(0 to 31);
         subkey : IN  std_logic_vector(0 to 47);
         left_output : OUT  std_logic_vector(0 to 31);
         right_output : OUT  std_logic_vector(0 to 31)
        );
    END COMPONENT;
    

   --Inputs
   signal left_half : std_logic_vector(0 to 31) := (others => '0');
   signal right_half : std_logic_vector(0 to 31) := (others => '0');
   signal subkey : std_logic_vector(0 to 47) := (others => '0');

 	--Outputs
   signal left_output : std_logic_vector(0 to 31);
   signal right_output : std_logic_vector(0 to 31);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: round_prog PORT MAP (
          left_half => left_half,
          right_half => right_half,
          subkey => subkey,
          left_output => left_output,
          right_output => right_output
        );

   -- Clock process definitions
  
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      

      -- insert stimulus here 
		left_half<="00000000000000000000000000001111";
		right_half<="11110000000000000000000000000000";
		subkey<="000000000000000000000001111000000000000000000000";
      wait;
   end process;

END;
