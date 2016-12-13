----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:08 10/19/2016 
-- Design Name: 
-- Module Name:    RegisterFile - Behavioral 
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

entity RegisterFile is
port (clk: in std_logic;
      wrten: in std_logic;
      rdreg1: in std_logic_vector(4 downto 0);
		rdreg2: in std_logic_vector(4 downto 0);
		wrtreg: in std_logic_vector(4 downto 0);
		wrtdata: in std_logic_vector(31 downto 0);
		rddata1,rddata2: out std_logic_vector(31 downto 0));
      
end RegisterFile;

architecture Behavioral of RegisterFile is
 type ramtype1 is array(0 to 31) of std_logic_vector(31 downto 0);
 signal regmem: ramtype1;

begin
  process (rdreg1,rdreg2,regmem)
  begin
	 if(conv_integer(rdreg1)=0)then 
	   rddata1<=(others=>'0');--reg[0]is always 0
	 else rddata1<=regmem(conv_integer(rdreg1));
	 end if ;
	 if(conv_integer(rdreg2)=0)then 
	    rddata2<=(others=>'0');--reg[0]is always 0
	 else rddata2<=regmem(conv_integer(rdreg2));
	 end if ;
	 end process; 
	process(clk) begin
	  if(clk'EVENT AND clk='1')then
	    if(wrten='1')then 
		 regmem(conv_integer(wrtreg))<= wrtdata;
		 end if;
		end if;
	end process;
	


end Behavioral;

