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

entity s_box_six is
port(	input: in std_logic_vector(0 to 5);
	output: out std_logic_vector(0 to 3));
end s_box_six;


architecture behavior of s_box_six is

	type ssixbox is array(0 to 3, 0 to 15) of integer range 0 to 15;
	constant box: ssixbox:= 
		((12,1,10,15,9,2,6,8,0,13,3,4,14,7,5,11),
		(10,15,4,2,7,12,9,5,6,1,13,14,0,11,3,8),
		(9,14,15,5,2,8,12,3,7,0,4,10,1,13,11,6),
		(4,3,2,12,9,5,15,10,11,14,1,7,6,0,8,13));

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

