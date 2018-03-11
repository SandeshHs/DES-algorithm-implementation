library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity subkey_generation is
generic(
	shifting_parameter: in std_logic_vector(0 to 1);
	left_or_right: in std_logic_vector(0 to 0));
port(	left_key_in: in std_logic_vector(0 to 27);
	right_key_in: in std_logic_vector(0 to 27);

	subkey: out std_logic_vector(0 to 47);
	left_key_out: out std_logic_vector(0 to 27);
	right_key_out: out std_logic_vector(0 to 27));
end subkey_generation;


architecture behavior of subkey_generation is

	component left_rot_one_bit
	port(	input: in std_logic_vector(0 to 27);
		output: out std_logic_vector(0 to 27));
	end component;

	component left_rot_two_bit
	port(	input: in std_logic_vector(0 to 27);
		output: out std_logic_vector(0 to 27));
	end component;

	component right_rot_one_bit
	port(	input: in std_logic_vector(0 to 27);
		output: out std_logic_vector(0 to 27));
	end component;

	component right_rot_two_bit
	port(	input: in std_logic_vector(0 to 27);
		output: out std_logic_vector(0 to 27));
	end component;

	component key_permutation_2 is
	port(	left_half: in std_logic_vector(0 to 27);
		right_half: in std_logic_vector(0 to 27);
		permuted_key: out std_logic_vector(0 to 47));
	end component;

	signal left_half_shifted: std_logic_vector(0 to 27);
	signal right_half_shifted: std_logic_vector(0 to 27);
	signal a: std_logic_vector(0 to 1);

begin

	shift_by_one: if (shifting_parameter = "01") generate

		left_shifting: if (left_or_right = "0") generate
			s11: left_rot_one_bit port map(
				input=> left_key_in,
				output=> left_half_shifted);

			s12: left_rot_one_bit port map(
				input=> right_key_in,
				output=> right_half_shifted);
		end generate left_shifting;

		right_shifting: if (left_or_right = "1") generate
			s13: right_rot_one_bit port map(
				input=> left_key_in,
				output=> left_half_shifted);

			s14: right_rot_one_bit port map(
				input=> right_key_in,
				output=> right_half_shifted);
		end generate right_shifting;

	end generate shift_by_one;



	shift_by_2: if (shifting_parameter = "10") generate

		left_shifting: if (left_or_right = "0") generate
			s21: left_rot_two_bit port map(
				input=> left_key_in,
				output=> left_half_shifted);

			s22: left_rot_two_bit port map(
				input=> right_key_in,
				output=> right_half_shifted);
		end generate left_shifting;

		right_shifting: if (left_or_right = "1") generate
			s23: right_rot_two_bit port map(
				input=> left_key_in,
				output=> left_half_shifted);

			s24: right_rot_two_bit port map(
				input=> right_key_in,
				output=> right_half_shifted);
		end generate right_shifting;

	end generate shift_by_2;



	error_case: if (shifting_parameter = "00" or shifting_parameter = "11") generate
		assert false report "Error selecting left shift in subkey";
	end generate error_case;



	s3: key_permutation_2 port map(
		left_half=> left_half_shifted,
		right_half=> right_half_shifted,
		permuted_key=> subkey);

	left_key_out<= left_half_shifted;
	right_key_out<= right_half_shifted;

end;
