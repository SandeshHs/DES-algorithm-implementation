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

entity s_box_three is
port(	input: in std_logic_vector(0 to 5);
	output: out std_logic_vector(0 to 3));
end s_box_three;


architecture behavior of s_box_three is

	type sthreebox is array(0 to 3, 0 to 15) of integer range 0 to 15;
	constant box: sthreebox:= 
		((10,0,9,14,6,3,15,5,1,13,12,7,11,4,2,8),
		(13,7,0,9,3,4,6,10,2,8,5,14,12,11,15,1),
		(13,6,4,9,8,15,3,0,11,1,2,12,5,10,14,7),
		(1,10,13,0,6,9,8,7,4,15,14,3,11,5,2,12));

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


