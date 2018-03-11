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

entity s_box_four is
port(	input: in std_logic_vector(0 to 5);
	output: out std_logic_vector(0 to 3));
end s_box_four;


architecture behavior of s_box_four is

	type sfourbox is array(0 to 3, 0 to 15) of integer range 0 to 15;
	constant box: sfourbox:= 
		((7,13,14,3,0,6,9,10,1,2,8,5,11,12,4,15),
		(13,8,11,5,6,15,0,3,4,7,2,12,1,10,14,9),
		(10,6,9,0,12,11,7,13,15,1,3,14,5,2,8,4),
		(3,15,0,6,10,1,13,8,9,4,5,11,12,7,2,14));

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


