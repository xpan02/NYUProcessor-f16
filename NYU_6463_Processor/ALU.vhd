----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:40:19 10/16/2016 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
  port( DATA1: in std_logic_vector(31 downto 0);
        DATA2: in std_logic_vector(31 downto 0);
		  sign_extended_operand: in std_logic_vector(15 downto 0);
		  ALUsrc: in STD_logic;
		  ALUOP: in std_logic_vector(2 downto 0);
		  zero: out std_logic;
		  lessthan: out std_logic;
	     ALU_result :out std_logic_vector(31 downto 0));
		 
end ALU;
        
architecture Behavioral of ALU is
 signal A_input : std_logic_vector(31 downto 0);
 signal B_input:  std_logic_vector(31 downto 0);
 SIGNAL ALU_output : STD_LOGIC_VECTOR (31 DOWNTO 0);	
 signAL sign_extended: std_logic_vector(31 downto 0);
 signal left_rotate_A : std_logic_vector (31 downto 0);
 signal left_rotate_b: std_logic_vector (31 downto 0);
 signal left_rotate_o: std_logic_vector (31 downto 0);

 signal right_rotate_A : std_logic_vector (31 downto 0);
 signal right_rotate_b: std_logic_vector (31 downto 0);
 signal right_rotate_o: std_logic_vector (31 downto 0);

component leftrotate 
port (a : in  STD_LOGIC_VECTOR (31 downto 0);  
      b : in  STD_LOGIC_VECTOR (31 downto 0);     
      o: out std_logic_vector(31 downto 0) );
      end component; 
component rightrotate 
port (a : in  STD_LOGIC_VECTOR (31 downto 0);  
      b : in  STD_LOGIC_VECTOR (31 downto 0);     
      o: out std_logic_vector(31 downto 0) );
      end component; 
 
begin
 sign_extended<=std_logic_vector(resize(signed(sign_extended_operand), sign_extended'length));
 A_input<=DATA1; 
 b_input<=data2 when ALUSrc='0' else
          sign_extended;
 Zero <= '1' when (ALU_output = X"00000000") else 
         '0';
 lessthan<='1' when(Alu_output(31)='1') else
           '0';
 ALU_result <=ALU_output;
 left_rotate_A<=DATA1;
 left_rotate_B<=SIGN_extended;
  right_rotate_A<=DATA1;
 right_rotate_B<=SIGN_extended;
 
 L_rotate: leftrotate port map ( a => left_rotate_A,   b =>  left_rotate_b , o=>left_rotate_o);
 r_rotate: leftrotate port map ( a => right_rotate_A,   b => right_rotate_b , o=>right_rotate_o);

			 
	process(ALUop, A_input, B_input,left_rotate_o,right_rotate_o)
	begin
		case ALUop is
			when "000" => ALU_output <= A_input + B_input;
			when "001" => ALU_output <= A_input - B_input;
			when "010" => ALU_output <= A_input or B_input;
			when "100" => ALU_output <= A_input nor B_input;
			when "101" => ALU_output<= left_rotate_o;
			when "110" => ALU_output<= right_rotate_o;			
			when others => ALU_output <= X"00000000";
		end case;
	end process;		 


end Behavioral;

