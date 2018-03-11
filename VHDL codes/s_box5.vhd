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

entity s_box_five is
port(	input: in std_logic_vector(0 to 5);
	output: out std_logic_vector(0 to 3));
end s_box_five;


architecture behavior of s_box_five is

	type sfivebox is array(0 to 3, 0 to 15) of integer range 0 to 15;
	constant box: sfivebox:= 
		((2,12,4,1,7,10,11,6,8,5,3,15,13,0,14,9),
		(14,11,2,12,4,7,13,1,5,0,15,10,3,9,8,6),
		(4,2,1,11,10,13,7,8,15,9,12,5,6,3,0,14),
		(11,8,12,7,1,14,2,13,6,15,0,9,10,4,5,3));

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

