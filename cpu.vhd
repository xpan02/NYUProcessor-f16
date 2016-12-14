----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:57:18 11/25/2016 
-- Design Name: 
-- Module Name:    cpu - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
--See report work cited 
--Raivis. "Single Cycle MIPS CPU in VHDL - Morf - Coding and Engineering." Morf - Coding and Engineering. N.p., n.d. Web. 13 Dec. 2016.

entity cpu is
Port ( clk : in  STD_LOGIC;
       reset : in  STD_LOGIC;
		 sel: in std_logic;
		 skey: in std_logic_vector(127 downto 0);
		 din: in std_logic_vector(63 downto 0);
		 valid: in std_logic;
		 dout: out std_logic_vector(63 downto 0);
		 data_vld: out std_logic;
		 instruction : out std_logic_vector(31 downto 0));
		 
end cpu;

architecture BehavioraL of cpu is
component Control_Unit is
    Port (  
          opcode: in  STD_LOGIC_vector(5 downto 0);
			  func : in  std_logic_vector(5 downto 0);
			  ALUop: out std_logic_vector(2 downto 0);
			  RegDst : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
			  PCSrc: out  STD_logic;
           MemToReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
			  shiftl: out std_logic;
			  shiftr: out std_logic;
			  Jump : out STD_LOGIC;
			  BranchNE : out std_logic;
           Branch : out  STD_LOGIC;
			  Branchlt: out  STD_logic;
			  halt: out std_logic
			 );
end component;

component ALU is
  port( DATA1: in std_logic_vector(31 downto 0);
        DATA2: in std_logic_vector(31 downto 0);
		  sign_extended_operand: in std_logic_vector(15 downto 0);
		  ALUsrc: in STD_logic;
		  ALUOP: in std_logic_vector(2 downto 0);
		  zero:out std_logic;
		  lessthan:out std_logic;
	     ALU_result :out std_logic_vector(31 downto 0));
end component;	 

component RegisterFile is
port (clk: in std_logic;
      reset:in std_logic;
      wrten: in std_logic;
      rdreg1: in std_logic_vector(4 downto 0);
		rdreg2: in std_logic_vector(4 downto 0);
		wrtreg: in std_logic_vector(4 downto 0);
		wrtdata: in std_logic_vector(31 downto 0);
		rddata1,rddata2: out std_logic_vector(31 downto 0);
		encA:out std_logic_vector(31 downto 0);
		encB:out std_logic_vector(31 downto 0);
		decA:out std_logic_vector(31 downto 0);
		decB:out std_logic_vector(31 downto 0));
end component;

component DataMemory is
port(
     clk: in std_logic;
	  reset:in std_logic;
     address: in std_logic_vector(31 downto 0);
     wrtdata: in std_logic_vector(31 downto 0);
	  rdmemen: in std_logic;
	  wrtmemen: in std_logic;
	  rddata: out std_logic_vector(31 downto 0));
end component;

component Instruction_Fetch is
port( 
      skey: in std_logic_vector(127 downto 0);
	   din: in std_logic_vector(63 downto 0);
      branch_imm :in std_logic_vector(31 downto 0);
      jump_bool: in std_logic;
		branch_bool: in std_logic;
		halt_bool:in std_logic;
		clk:in std_logic;
		reset : in  STD_LOGIC;
		valid: in std_logic;
      instr : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


--DMEM SINGALS 
signal DmemOut: std_logic_vector(31 downto 0);
--ALU signals
signal RegData1 : std_logic_vector(31 downto 0);
signal RegData2 : std_logic_vector(31 downto 0);
signal Sign_extended_operand: std_logic_vector(15 downto 0);
signal Sign_Extended : std_logic_vector(31 downto 0);
signal Zero : std_logic;
signal lessthan :std_logic;
signal ALU_Result : std_logic_vector(31 downto 0);
--Control Unit signals
signal ALUOp : std_logic_vector(2 downto 0);
signal RegDst : std_logic;
signal ALUSrc : std_logic;
signal PCsrc:std_logic;
signal MemToReg : std_logic;
signal RegWrite : std_logic;
signal MemRead : std_logic;
signal MemWrite : std_logic;
signal shiftl:std_logic;
signal shiftr:std_logic;
signal branchNE : std_logic;
signal branch : std_logic;
signal branchlt:std_logic;
signal halt:std_logic;
--Register File signals
signal WriteData : std_logic_vector(31 downto 0);
signal WriteAddr : std_logic_vector(4 downto 0);
signal encA: std_logic_vector(31 downto 0);
signal encB: std_logic_vector(31 downto 0);
signal decA: std_logic_vector(31 downto 0);
signal decB: std_logic_vector(31 downto 0);
--Instruction fetch signal
signal jump_bool : std_logic;
signal branch_bool : std_logic;
signal halt_bool: std_logic;
signal instr : std_logic_vector (31 downto 0);


begin                          --viewed Raivis mapping and come up with my own 
sign_extended_operand<=instr(15 downto 0);
sign_extended<=std_logic_vector(resize(signed(sign_extended_operand), sign_extended'length));
DMem: Datamemory port map(clk,reset,ALU_Result,RegData2,MemRead,MemWrite,DmemOut);
WriteData<=DmemOut when MemToReg='1' else 
          Alu_Result;
InstrFetch : Instruction_Fetch PORT MAP ( skey, din,Sign_Extended, jump_bool, branch_bool,halt_bool, clk, reset, valid,instr);
CtrlUn : Control_Unit PORT MAP(instr(31 downto 26),instr(5 downto 0),ALUOp, RegDst, ALUSrc,PCSrc, MemToReg, RegWrite, MemRead, MemWrite,shiftl,shiftr,jump_bool,branchNE,Branch,branchlt,halt_bool);
ALUMAIN : ALU port map(RegData1, RegData2,sign_extended_operand,ALUSrc, ALUOP,zero,lessthan,ALU_Result);
branch_bool<=(branch and zero) or (branchNE and not zero)or(branchlt and lessthan) ;
RegFile : RegisterFile PORT MAP(clk,reset,RegWrite,instr(25 downto 21),instr(20 downto 16), WriteAddr,WriteData,RegData1,RegData2,encA,encB,decA,decB);
WriteAddr <= instr(20 downto 16) when RegDst = '0' else
					 instr(15 downto 11);
instruction <= instr;
data_vld<='1' when instr="11111100000000000000000000000000" else
          '0';
dout<=encA&encB when sel='0'else
      decA&decB;


end Behavioral;

