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
-- See report work cited 
--Raivis. "Single Cycle MIPS CPU in VHDL - Morf - Coding and Engineering." Morf - Coding and Engineering. N.p., n.d. Web. 13 Dec. 2016.
entity Instruction_Fetch is
port( 
      skey: in std_logic_vector(127 downto 0);
	   din: in std_logic_vector(63 downto 0);
      branch_imm :in std_logic_vector(31 downto 0);
      jump_bool: in std_logic;
		branch_bool: in std_logic;     -- constuct the entity port Branch_imm jump_bool branch_bool is inspired by Raivis idea
		halt_bool: in std_logic;
		clk:in std_logic;
		reset : in  STD_LOGIC;
		valid:in std_logic;
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
	  skey: in std_logic_vector(127 downto 0);
	  din: in std_logic_vector(63 downto 0);
     address: in std_logic_vector(31 downto 0);
	  Instruction: out std_logic_vector(31 downto 0));  
end component;
	
component Adder
			Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  output : OUT STD_LOGIC_VECTOR (31 downto 0));
end component;

component MUX
			Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);     -- idea of using mux to neat the code is brought from Raivis
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;



constant  pc_increment : std_logic_vector(31 downto 0):= X"00000001"; 
signal next_pc : std_logic_vector(31 downto 0);
signal pc_out : STD_LOGIC_VECTOR (31 downto 0);
signal pc_adder_out : std_logic_vector(31 downto 0);
signal Instruction : std_logic_vector(31 downto 0);

signal branch_adder_out : std_logic_vector(31 downto 0);


signal jump_addr : std_logic_vector(31 downto 0);
signal branchMUX_out : std_logic_vector(31 downto 0);
signal jumpMUX_out: std_logic_vector(31 downto 0);
signal haltMUX_out:std_logic_vector(31 downto 0);
begin
 
 PC:Program_Counter PORT MAP(next_pc, reset, clk, pc_out);
 InstrMem : InstructionMemory PORT MAP( skey,din,pc_out, Instruction );
 
 PC_Adder : Adder PORT MAP( pc_out,pc_increment , pc_adder_out );

 Branch_Adder : Adder PORT MAP( branch_imm, pc_adder_out, branch_adder_out );

 jump_addr <= pc_adder_out(31 downto 26) & Instruction(25 downto 0);
 BranchMUX : MUX PORT MAP( pc_adder_out, branch_adder_out, branch_bool, branchMUX_out);
 JumpMUX : MUX PORT MAP ( branchMUX_out, jump_addr, jump_bool,  jumpMUX_out);
 HaltMUX: MUX port MAP (jumpMUX_out, pc_out, halt_bool, haltMUX_out);
 nextpcMUX: MUX PORT MAP( pc_out ,haltMUX_out,valid,next_pc);
 instr <= Instruction;
end Behavioral;

