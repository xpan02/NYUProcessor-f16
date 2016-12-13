----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:53 10/22/2016 
-- Design Name: 
-- Module Name:    InstructionMemory - Behavioral 
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

entity InstructionMemory is
port(
     
     address: in std_logic_vector(31 downto 0);
	  Instruction: out std_logic_vector(31 downto 0));
	  
end InstructionMemory;

architecture Behavioral of InstructionMemory is
type ramtype3 is array(0 to 256)of std_logic_vector(7 downto 0);
signal imem: ramtype3;

signal Instruction1 :std_logic_vector(7 downto 0);
signal Instruction2: std_logic_vector(7 downto 0);
signal Instruction3: std_logic_vector(7 downto 0);
signal Instruction4: std_logic_vector(7 downto 0);

begin
	 Instruction1<=imem(conv_integer(address));
	 Instruction2<=imem(conv_integer(address)+1);
	 Instruction3<=imem(conv_integer(address)+2);
	 Instruction4<=imem(conv_integer(address)+3);
    Instruction<= Instruction1&Instruction2&Instruction3&Instruction4;
	 


end Behavioral;

