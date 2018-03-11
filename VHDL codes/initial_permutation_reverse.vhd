library ieee;

use ieee.std_logic_1164.all;

entity init_permutation_reverse is 
port(	left_half_permutation: in std_logic_vector(0 to 31);
	right_half_permutation: in std_logic_vector(0 to 31);
	output: out  std_logic_vector(0 to 63));
end init_permutation_reverse;

architecture behavior of init_permutation_reverse is

	type init_per_rev_array is array(0 to 63) of integer range 0 to 63;

	constant ip: init_per_rev_array :=
		((39,7,47,15,55,23,63,31,
		 38,6,46,14,54,22,62,30,
		 37,5,45,13,53,21,61,29,
		 36,4,44,12,52,20,60,28,
		 35,3,43,11,51,19,59,27,
		 34,2,42,10,50,18,58,26,
		 33,1,41,9,49,17,57,25,
		 32,0,40,8,48,16,56,24));
	
	signal l_r_merge : std_logic_vector(0 to 63);

	begin
	
	l_r_merge<=left_half_permutation & right_half_permutation;
	
	process(l_r_merge) is

		begin

			for i in 0 to 63 loop
				
				output(i) <= l_r_merge(ip(i));
				
			end loop;
			
	end process;
end behavior;
