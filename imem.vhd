library IEEE; 
use IEEE.STD_LOGIC_1164.all; use STD.TEXTIO.all;
use IEEE.NUMERIC_STD.all;  

entity imem is -- instruction memory
  port(a:  in  STD_LOGIC_VECTOR(5 downto 0);
       rd: out STD_LOGIC_VECTOR(31 downto 0));
end;

architecture behave of imem is
begin
  process(a) is
 
    type ramtype is array (63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
    variable mem: ramtype;
 begin
  mem(0):= x"2010005c";
  mem(1):= x"20110010";
  mem(2):= x"12110006";
  mem(3):= x"0211902a";
  mem(4):= x"12400002";
  mem(5):= x"02308822";
  mem(6):= x"08100002";
  mem(7):= x"02118022";
  mem(8):= x"08100002";--instructions to calculate gcd(92, 16)

  rd <= mem(to_integer(unsigned(a)));
    
  end process;
end;
