library ieee;

use ieee.std_logic_1164.all;

entity permutation_key_one is
port(	key: in std_logic_vector(0 to 63);
	left_key_permutation: out std_logic_vector(0 to 27);
	right_key_permutation: out std_logic_vector(0 to 27));
end permutation_key_one;

architecture behavior of permutation_key_one is

type key_array is array(0 to 55) of integer range 0 to 63;

	constant key1: key_array :=
		(56,48,40,32,24,16,8,
		 0,57,49,41,33,25,17,
		 9,1,58,50,42,34,26,
		 18,10,2,59,51,43,35,
		 62,54,46,38,30,22,14,
		 6,61,53,45,37,29,21,
		 13,5,60,52,44,36,28,
		 20,12,4,27,19,11,3);


	begin

	process(key) is

		variable permuted_key : std_logic_vector(0 to 55);

		begin

			for i in 0 to 55 loop
				permuted_key(i) := key(key1(i));

			end loop;
			
			left_key_permutation <= permuted_key(0 to 27);
			right_key_permutation <= permuted_key(28 to 55);
						
	end process;
end behavior;