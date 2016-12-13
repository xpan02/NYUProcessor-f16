----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:02:02 11/25/2016 
-- Design Name: 
-- Module Name:    Instruction_Fetch - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALl;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Instruction_Fetch is
port( branch_in :in std_logic_vector(31 downto 0);
      jump_bool: in std_logic;
		branch_bool: in std_logic;
		clk:in std_logic;
		reset : in  STD_LOGIC;
      instr : out  STD_LOGIC_VECTOR (31 downto 0));
end Instruction_Fetch;

architecture Behavioral of Instruction_Fetch is
component Program_Counter 
			Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
			  end component;
	
component InstructionMemory 
       port(
     address: in std_logic_vector(31 downto 0);
	  Instruction: out std_logic_vector(31 downto 0));  
end component;
	
component Adder
			Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  output : OUT STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUX
			Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Shift_Left
			Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);           
			  output : out STD_LOGIC_VECTOR(31 downto 0));
end component;

constant PC_INCREMENT : std_logic_vector(31 downto 0):= X"00000004"; 
signal next_pc : std_logic_vector(31 downto 0);
signal pc_output : STD_LOGIC_VECTOR (31 downto 0);
signal pc_adder_output : std_logic_vector(31 downto 0);
signal InstrMemOut : std_logic_vector(31 downto 0);
signal branch_shift_output : std_logic_vector(31 downto 0);
signal branch_adder_output : std_logic_vector(31 downto 0);
signal jumpimm: std_logic_vector(31 downto 0);
signal jump_shift_output : std_logic_vector(31 downto 0);
signal jump_addr : std_logic_vector(31 downto 0);
signal branchMUX_output : std_logic_vector(31 downto 0);
begin
 jumpimm<="000000" & InstrMemOut(25 downto 0);
 PC:Program_Counter PORT MAP(next_pc, reset, clk, pc_output);
 InstrMem : InstructionMemory PORT MAP( pc_output, InstrMemOut );
 instr <= InstrMemOut;
 PC_Adder : Adder PORT MAP( pc_output, PC_INCREMENT, pc_adder_output );
 branchimm: Shift_Left PORT MAP( branch_in, branch_shift_output );
 Branch_Adder : Adder PORT MAP( branch_shift_output, pc_adder_output, branch_adder_output );
 Shift_Jump : Shift_Left PORT MAP( jumpimm, jump_shift_output );
 jump_addr <= pc_adder_output(31 downto 28) & jump_shift_output(27 downto 0);
 BranchMUX : MUX PORT MAP( pc_adder_output, branch_adder_output, branch_bool, branchMUX_output);
 JumpMUX : MUX PORT MAP ( branchMUX_output, jump_addr, jump_bool, next_pc);


end Behavioral;

