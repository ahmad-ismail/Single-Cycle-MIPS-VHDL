-- >>> Subset of single-cycle MIPS architecture in VHDL 1993 based on Harris's implementation 
--     in Digital Design & Computer Architecture (MIPS Version)
-- >>> Instructions perform algorithm to find GCD (92,16)
-- >>> To be programmed on Altera DE0 Nano Board using Quartus Prime 17.0
-- >>> The LEDs show eight least significant bits of register $0
--     until fixed on the final answer '4' for a while then reexecutes 



library IEEE; 
use IEEE.STD_LOGIC_1164.all; use IEEE.std_logic_arith.all;

entity testbench is
port(clk, reset:  in  STD_LOGIC;
	final : out STD_LOGIC_VECTOR(31 downto 0));
end;

architecture test of testbench is
  component mips 
    port(clk, reset:        in  STD_LOGIC;
         pc:                out STD_LOGIC_VECTOR(31 downto 0);
         instr:             in  STD_LOGIC_VECTOR(31 downto 0);
         memwrite:          out STD_LOGIC;
         aluout, writedata: out STD_LOGIC_VECTOR(31 downto 0);
         readdata:          in  STD_LOGIC_VECTOR(31 downto 0);
	 final :            out STD_LOGIC_VECTOR(31 downto 0));
  end component;
  component imem
    port(a:  in  STD_LOGIC_VECTOR(5 downto 0);
         rd: out STD_LOGIC_VECTOR(31 downto 0));
  end component;
  component dmem
    port(clk, we:  in STD_LOGIC;
         a, wd:    in STD_LOGIC_VECTOR(31 downto 0);
         rd:       out STD_LOGIC_VECTOR(31 downto 0));
  end component;
  signal pc, instr, 
         readdata: STD_LOGIC_VECTOR(31 downto 0);

   --instantiate processor and memories
  signal writedata, dataadr:    STD_LOGIC_VECTOR(31 downto 0);
  signal memwrite: STD_LOGIC;
  signal slow_clock: STD_LOGIC_VECTOR(23 downto 0);
  signal not_reset :STD_LOGIC;
  begin
  not_reset<=not reset;--execution starts without pressing the pushbutton
-- generate slow clock to observe the LEDs
process(clk) begin 
  if(not_reset='1') then
    slow_clock<=x"000000";
   else
	if rising_edge(clk) then
     slow_clock<=unsigned(slow_clock)+1;      
            if (slow_clock = x"ffffff") then
              slow_clock<=x"000000";
            end if;
   end if;
end if;	
  end process;
  mips1: mips port map(slow_clock(23), not_reset, pc, instr, memwrite, dataadr,writedata, readdata, final);
  imem1: imem port map(pc(7 downto 2), instr);
  dmem1: dmem port map(slow_clock(23), memwrite, dataadr, writedata, readdata);

  end;
