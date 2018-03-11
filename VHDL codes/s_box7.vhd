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

entity s_box_seven is
port(	input: in std_logic_vector(0 to 5);
	output: out std_logic_vector(0 to 3));
end s_box_seven;


architecture behavior of s_box_seven is

	type ssevenbox is array(0 to 3, 0 to 15) of integer range 0 to 15;
	constant box: ssevenbox:= 
		((4,11,2,14,15,0,8,13,3,12,9,7,5,10,6,1),
		(13,0,11,7,4,9,1,10,14,3,5,12,2,15,8,6),
		(1,4,11,13,12,3,7,14,10,15,6,8,0,5,9,2),
		(6,11,13,8,1,4,10,7,9,5,0,15,14,2,3,12));

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


