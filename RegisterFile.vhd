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
		decB:out std_logic_vector(31 downto 0)
		);
		
      
end RegisterFile;

architecture Behavioral of RegisterFile is
 type ramtype1 is array(0 to 31) of std_logic_vector(31 downto 0);
 signal regmem: ramtype1:=
 ("00000000000000000000000000000000",--0
  "00000000000000000000000000000000",--1
  "00000000000000000000000000000000",--2
  "00000000000000000000000000000000",--3
  "00000000000000000000000000000000",--4
  "00000000000000000000000000000000",--5
  "00000000000000000000000000000000",--6
  "00000000000000000000000000000000",--7
  "00000000000000000000000000000000",--8
  "00000000000000000000000000000000",--9
  "00000000000000000000000000000000",--10
  "00000000000000000000000000000000",--11
  "00000000000000000000000000000000",--12
  "00000000000000000000000000000000",--13
  "00000000000000000000000000000000",--14
  "00000000000000000000000000000000",--15
  "00000000000000000000000000000000",--16
  "00000000000000000000000000000000",--17
  "00000000000000000000000000000000",--18
  "00000000000000000000000000000000",--19
  "00000000000000000000000000000000",--20
  "00000000000000000000000000000000",--21
  "00000000000000000000000000000000",--22
  "00000000000000000000000000000000",--23
  "00000000000000000000000000000000",--24
  "00000000000000000000000000000000",--25
  "00000000000000000000000000000000",--26
  "00000000000000000000000000000000",--27
  "00000000000000000000000000000000",--28
  "00000000000000000000000000000000",--29
  "00000000000000000000000000000000",--30
  "00000000000000000000000000000000" --31
  );
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
	
	process(clk,reset) begin
	 if(reset='1')then 
	 regmem(0)<= "00000000000000000000000000000000";
	 regmem(1)<= "00000000000000000000000000000000";
	 regmem(2)<= "00000000000000000000000000000000";
	 regmem(3)<= "00000000000000000000000000000000";
	 regmem(4)<= "00000000000000000000000000000000";
	 regmem(5)<= "00000000000000000000000000000000";
	 regmem(6)<= "00000000000000000000000000000000";
	 regmem(7)<= "00000000000000000000000000000000";
	 regmem(8)<= "00000000000000000000000000000000";
	 regmem(9)<= "00000000000000000000000000000000";
	 regmem(10)<= "00000000000000000000000000000000";
	 regmem(11)<= "00000000000000000000000000000000";
	 regmem(12)<= "00000000000000000000000000000000";
	 regmem(13)<= "00000000000000000000000000000000";
	 regmem(14)<= "00000000000000000000000000000000";
	 regmem(15)<= "00000000000000000000000000000000";
	 regmem(16)<= "00000000000000000000000000000000";
	 regmem(17)<= "00000000000000000000000000000000";
	 regmem(18)<= "00000000000000000000000000000000";
	 regmem(19)<= "00000000000000000000000000000000";
	 regmem(20)<= "00000000000000000000000000000000";
	 regmem(21)<= "00000000000000000000000000000000";
	 regmem(22)<= "00000000000000000000000000000000";
	 regmem(23)<= "00000000000000000000000000000000";
	 regmem(24)<= "00000000000000000000000000000000";
	 regmem(25)<= "00000000000000000000000000000000";
	 regmem(26)<= "00000000000000000000000000000000";
	 regmem(27)<= "00000000000000000000000000000000";
	 regmem(28)<= "00000000000000000000000000000000";
	 regmem(29)<= "00000000000000000000000000000000";
	 regmem(30)<= "00000000000000000000000000000000";
	 regmem(31)<= "00000000000000000000000000000000";
		
	 
	  elsif(clk'EVENT AND clk='1')then
	    if(wrten='1')then 
		 regmem(conv_integer(wrtreg))<= wrtdata;
		 end if;
		end if;
	end process;
	
	encA<=regmem(17);
	encB<=regmem(18);
	decA<=regmem(24);
	decB<=regmem(25);
	
	


end Behavioral;

