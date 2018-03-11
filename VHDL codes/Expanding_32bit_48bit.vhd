library ieee;
use ieee.std_logic_1164.all;
entity expanding_prog is
	port(	input: in std_logic_vector(0 to 31);
		output: out std_logic_vector(0 to 47));
end expanding_prog;

architecture behavior of expanding_prog is

	type exp_array is array(0 to 47) of integer range 0 to 31;
	
	constant ip_exp:exp_array :=
		(31,0,1,2,3,4,
		 3,4,5,6,7,8,
		 7,8,9,10,11,12,
		 11,12,13,14,15,16,
		 15,16,17,18,19,20,
		 19,20,21,22,23,24,
		 23,24,25,26,27,28,
		 27,28,29,30,31,0);
	
	begin 
	
	process(input) is
	
		begin
			
			for i in 0 to 47 loop
			
				output(i)<=input(ip_exp(i));
			
			end loop;
			
	end process;

end behavior;
