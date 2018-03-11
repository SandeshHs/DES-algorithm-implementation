library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity four_combined is
port(	input: in std_logic_vector(0 to 31);
	key: in std_logic_vector(0 to 47);
	output: out std_logic_vector(0 to 31));
end four_combined;


architecture behavior of four_combined is

	component expanding_prog
	port(	input: in std_logic_vector(0 to 31);
		output: out std_logic_vector(0 to 47));
	end component;

	component xor_48bit
	port(	input: in std_logic_vector(0 to 47);
		key: in std_logic_vector(0 to 47);
		output: out std_logic_vector(0 to 47));
	end component;

	component s_box_1_8
	port(	input: in std_logic_vector(0 to 47);
		output: out std_logic_vector(0 to 31));
	end component;

	component permutation_prog
	port(	input: in std_logic_vector(0 to 31);
		output: out std_logic_vector(0 to 31));
	end component;

	signal after_expansion: std_logic_vector(0 to 47);
	signal after_xor: std_logic_vector(0 to 47);
	signal after_sbox: std_logic_vector(0 to 31);
	
begin

		c1: expanding_prog port map(
		input=>input,
		output=>after_expansion);

	
	c2: xor_48bit port map(
		input=>after_expansion,
		key=>key,
		output=>after_xor);

	
	c3: s_box_1_8 port map(
		input=>after_xor,
		output=>after_sbox);

	
	c4: permutation_prog port map(
		input=>after_sbox,
		output=>output);

end;

