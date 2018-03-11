library ieee;

use ieee.std_logic_1164.all;

entity init_permuting  is 
port(	input: in std_logic_vector(0 to 63);
	right_half_permutation: out std_logic_vector(0 to 31);
	left_half_permutation: out std_logic_vector(0 to 31));
end init_permuting ;


architecture behavior of init_permuting  is

type init_per_array is array(0 to 63) of integer range 0 to 63;

	constant ip: init_per_array :=
		(57,49,41,33,25,17,9,1,
		 59,51,43,35,27,19,11,3,
		 61,53,45,37,29,21,13,5,
		 63,55,47,39,31,23,15,7,
		 56,48,40,32,24,16,8,0,
		 58,50,42,34,26,18,10,2,
		 60,52,44,36,28,20,12,4,
		 62,54,46,38,30,22,14,6);


	begin

	process(input) is

		variable permuted_array : std_logic_vector(0 to 63);

		begin

			for i in 0 to 63 loop
				permuted_array(i) := input(ip(i));

			end loop;
			
			left_half_permutation <= permuted_array(0 to 31);
			right_half_permutation <= permuted_array(32 to 63);
						
	end process;
end behavior;
