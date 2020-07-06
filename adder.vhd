library IEEE; use IEEE.STD_LOGIC_1164.all; 
	use ieee.std_logic_arith.all;

entity adder is -- adder
  port(a, b: in  STD_LOGIC_VECTOR(31 downto 0);
       y:    out STD_LOGIC_VECTOR(31 downto 0));
end;

architecture behave of adder is
signal z :unsigned  (31 downto 0);
begin
	Z<=unsigned(a) + unsigned(b);
	y<=std_logic_vector(z); 
end;

