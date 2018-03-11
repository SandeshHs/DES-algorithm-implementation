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


entity s_box_eight is
port(	input: in std_logic_vector(0 to 5);
	output: out std_logic_vector(0 to 3));
end s_box_eight;


architecture behavior of s_box_eight is

	type seightbox is array(0 to 3, 0 to 15) of integer range 0 to 15;
	constant box: seightbox:= 
		((13,2,8,4,6,15,11,1,10,9,3,14,5,0,12,7),
		(1,15,13,8,10,3,7,4,12,5,6,11,0,14,9,2),
		(7,11,4,1,9,12,14,2,0,6,10,13,15,3,5,8),
		(2,1,14,7,4,10,8,13,15,12,9,0,3,5,6,11));

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

