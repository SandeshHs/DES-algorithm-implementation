library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity key_permutation_2 is
port(	left_half: in std_logic_vector(0 to 27);
	right_half: in std_logic_vector(0 to 27);
	permuted_key: out std_logic_vector(0 to 47));
end key_permutation_2;


architecture behavior of key_permutation_2 is

	type key2 is array(0 to 47) of integer range 0 to 56;

	constant sub_key: key2 :=
		(13,16,10,23,0,4,
		 2,27,14,5,20,9,
		 22,18,11,3,25,7,
		 15,6,26,19,12,1,
		 40,51,30,36,46,54,
		 29,39,50,44,32,47,
		 43,48,38,55,33,52,
		 45,41,49,35,28,31);
	
	signal l_r_merge : std_logic_vector(0 to 55);

	begin
	
	l_r_merge<=left_half & right_half;
	
	process(l_r_merge) is

		begin

			for i in 0 to 47 loop
				
				permuted_key(i) <= l_r_merge(sub_key(i));
				
			end loop;
			
	end process;
end behavior;