library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity round_prog is
port(	left_half: in std_logic_vector(0 to 31);
	right_half: in std_logic_vector(0 to 31);
	subkey: in std_logic_vector(0 to 47);
	left_output: out std_logic_vector(0 to 31);
	right_output: out std_logic_vector(0 to 31));
end round_prog;


architecture behavior of round_prog is

	component four_combined
	port(	input: in std_logic_vector(0 to 31);
		key: in std_logic_vector(0 to 47);
		output: out std_logic_vector(0 to 31));
	end component;

	component xor_32bit 
	port(	input: in std_logic_vector(0 to 31);
		key: in std_logic_vector(0 to 31);
		output: out std_logic_vector(0 to 31));
	end component;

	signal after_four_combination: std_logic_vector(0 to 31);


begin

	s1: four_combined port map(
		input=>right_half,
		key=>subkey,
		output=>after_four_combination);

	s2: xor_32bit port map(
		input=>after_four_combination,
		key=>left_half,
		output=>right_output);

	left_output<=right_half;

end;
