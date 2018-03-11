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

entity s_one_box  is
port(	input: in std_logic_vector(0 to 5);
	output: out std_logic_vector(0 to 3));
end s_one_box ;


architecture behavior of s_one_box  is

	type sonebox is array(0 to 3, 0 to 15) of integer range 0 to 15;
	constant box: sonebox := 
		((14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7),
		(0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8),
		(4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0),
		(15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13));

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
