----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:21:10 10/19/2016 
-- Design Name: 
-- Module Name:    DataMemory - Behavioral 
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
--memory size 1000, in reality, the memory size should be 2^32, but for this lab, for the space resaon, we keep it as this large number, but the memory is still 32-bit addressable
entity DataMemory is
port(
     clk: in std_logic;
     address: in std_logic_vector(31 downto 0);
     wrtdata: in std_logic_vector(31 downto 0);
	  rdmemen: in std_logic;
	  wrtmemen: in std_logic;
	  rddata: out std_logic_vector(31 downto 0));
	  
 
end DataMemory;


architecture Behavioral of DataMemory is
type ramtype2 is array(0 to 256)of std_logic_vector(7 downto 0);
signal datamem: ramtype2;
signal rddata1: std_logic_vector(7 downto 0);
signal rddata2: std_logic_vector(7 downto 0);
signal rddata3: std_logic_vector(7 downto 0);
signal rddata4: std_logic_vector(7 downto 0);
signal wrtdata1: std_logic_vector(7 downto 0);
signal wrtdata2: std_logic_vector(7 downto 0);
signal wrtdata3: std_logic_vector(7 downto 0);
signal wrtdata4: std_logic_vector(7 downto 0);
begin
  wrtdata1<=wrtdata(31 downto 24);
  wrtdata2<=wrtdata(23 downto 16);
  wrtdata3<=wrtdata(15 downto 8);
  wrtdata4<=wrtdata(7 downto 0);
  rddata<= rddata1&rddata2&rddata3&rddata4;
 process(rdmemen,address,datamem)
   begin 
    if(rdmemen='1')then 
	 rddata1<=datamem(conv_integer(address));
	 rddata2<=datamem(conv_integer(address)+1);
	 rddata3<=datamem(conv_integer(address)+2);
	 rddata4<=datamem(conv_integer(address)+3);
	 
	 end if ;
	end process;
  process(clk)begin
    if(clk'event and clk='1') then
	  if(wrtmemen='1') then 
	  datamem(conv_integer(address))<=wrtdata1;
	  datamem(conv_integer(address)+1)<=wrtdata2;
	  datamem(conv_integer(address)+2)<=wrtdata3;
	  datamem(conv_integer(address)+3)<=wrtdata4;
	  end if;
	  end if;
	 end process;


end Behavioral;

