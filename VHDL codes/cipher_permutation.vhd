library ieee;

use ieee.std_logic_1164.all;

entity permutation_prog is
port(	input: in std_logic_vector(0 to 31);
	output: out std_logic_vector(0 to 31));
end permutation_prog;


architecture behavior of permutation_prog is

	type ip_array is array(0 to 31) of integer range 0 to 31;
   constant ip: ip_array :=
		(15,6,19,20,
		 28,11,27,16,
		 0,14,22,25,
		 4,17,30,9,
		 1,7,23,13,
		 31,26,2,8,
		 18,12,29,5,
		 21,10,3,24);
	
	begin
	
	process(input) is
	
	begin
	
		for i in 0 to 31 loop
	
			output(i)<=input(ip(i));
		
		end loop;
	
	end process;
	
end behavior;
