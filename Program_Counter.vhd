----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:30:13 11/24/2016 
-- Design Name: 
-- Module Name:    Program_Counter - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_Counter is
Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
       reset : in  STD_LOGIC;
       clk : in  STD_LOGIC;
       output : out  STD_LOGIC_VECTOR (31 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

begin
process(reset,clk)
begin
if(reset='1')then
 output<=(others=>'0');
   elsif(clk'EVENT AND clk='1')then
  output<=input;
 end if; 
  
end process;


end Behavioral;

