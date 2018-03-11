library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity s_box_two is
port(	input: in std_logic_vector(0 to 5);
	output: out std_logic_vector(0 to 3));
end s_box_two;


architecture behavior of s_box_two is

	type stwobox is array(0 to 3, 0 to 15) of integer range 0 to 15;
	constant box: stwobox:= 
		((15,1,8,14,6,11,3,4,9,7,2,13,12,0,5,10),
		(3,13,4,7,15,2,8,14,12,0,1,10,6,9,11,5),
		(0,14,7,11,10,4,13,1,5,8,12,6,9,3,2,15),
		(13,8,10,1,3,15,4,2,11,6,7,12,0,5,14,9));

	begin
	
	process(input) is

		variable column: integer range 0 to 15;		
		variable row: integer range 0 to 3;
		variable outer_bits: std_logic_vector(0 to 1);

		variable output_decimal: integer range 0 to 15;

		begin

			column:=to_integer(unsigned(input(1 to 4)));
			outer_bits:=input(0)&input(5);
			row:=to_integer(unsigned(outer_bits));
			output_decimal:=box(row,column);

			output<=std_logic_vector(to_unsigned(output_decimal,output'length));

	end process;
end behavior;
