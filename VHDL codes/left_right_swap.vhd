library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity left_right_64bit_swap is
port(	input_left: in std_logic_vector(0 to 31);
	input_right: in std_logic_vector(0 to 31);
	output_left: out std_logic_vector(0 to 31);
	output_right: out std_logic_vector(0 to 31));
end left_right_64bit_swap;


architecture behavior of left_right_64bit_swap is

begin
	
	output_left(0 to 31)<=input_right(0 to 31);
	output_right(0 to 31)<=input_left(0 to 31);

end behavior;