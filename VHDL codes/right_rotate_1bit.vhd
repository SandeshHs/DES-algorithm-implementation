library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity right_rot_one_bit is
port(	input: in std_logic_vector(0 to 27);
	output: out std_logic_vector(0 to 27));
end right_rot_one_bit;


architecture behavior of right_rot_one_bit is

begin
process (input) is

	begin
	
		for i in 1 to 27 loop
		
		output(i)<=input(i-1);
		
		end loop;
		
		output(0)<=input(27);
				
		end process;	

end behavior;