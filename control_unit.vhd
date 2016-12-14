--------------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:41:42 10/11/2016 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_unit is
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
end control_unit;


architecture Behavioral of control_unit is
SIGNAL R_type, ADDI,SUBI,ANDI,ORI,SHL,SHR,LW,SW,BLT,BEQ,BNE,jmp,hlt: std_logic;
signal a: std_logic_vector(2 downto 0);
 



begin
       a<= func(2 downto 0);
       R_type<='1'when opcode="000000" else '0';
		 ADDI<='1'  when opcode="000001" else '0';
		 SUBI<='1'  when opcode="000010" else '0';
		 ANDI<='1'  when opcode="000011" else '0';
		 ORI<='1'   when opcode="000100" else '0';
		 SHL<='1'   when opcode="000101" else '0';
		 SHR<='1'   when opcode="000110" else '0';
		 LW <='1'   when opcode="000111" else '0';
		 SW<= '1'   when opcode="001000" else '0';
		 BLT<='1'   When opcode="001001" else '0';
		 BEQ<='1'   when opcode="001010" else '0';
		 BNE<='1'   when opcode="001011" else '0';
		 jmp<='1'   when opcode="001100" else '0';
		 hlt<='1'  when opcode="111111" else '0';
       
		 RegDst<=R_type;
		 ALUSrc<= ADDI OR SUBI or ANDI or ORI or  LW or SW or SHL or SHR ;
		 PCSrc<=	BLT OR BEQ OR BNE	; 
		 MemToReg<= LW;
		 MemRead <= LW;
       MemWrite <= SW;
		 RegWrite <= R_type Or LW Or ADDI or SUBI or ANDI or ORI or SHL or SHR;
	     
		 shiftl<=SHL;
		 shiftr<=SHR;
		 jump  <= jmp;
       Branch <= BEQ;
		 branchLT<=BLT;
       BranchNE <= BNE;
		 halt<=hlt;
process(opcode,a) 
begin 		 
  if(opcode="000000") then 
      if(a="000")then
          ALUop<="000";--add
			elsif(a="001")then
	        ALUop<="001";--sub
		      elsif(a="010")then 
				ALUop<="010";--and
		       elsif(a="011")then
				  ALUop<="011";--or
		        elsif(a="100")then
				   ALUop<="100";--nor
					else 
					 ALUop<="111";
		    end if ;
  else 
      if(opcode="000001" or opcode="000111" or opcode="001000")then 
		     ALUop<="000"; --add
		   elsif(opcode="000010" or opcode="001001" or opcode="001010" or opcode="001011")then
				ALUop<= "001" ;--sub
				elsif(opcode="000011")then
	           ALUop<="010";--and
            elsif(opcode="000100")then
			         ALUop<="011";--or
			     elsif(opcode<= "000101")then
			          ALUop<="101";--shl
			         elsif(opcode<="000110")then
			           ALUop<="110";--shr
						  else 
						  ALUop<="111";
	end if;	     
	end if;
	end process;
		  
		 
		 

end Behavioral;
