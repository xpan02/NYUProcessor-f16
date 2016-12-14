----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:55:15 12/08/2016 
-- Design Name: 
-- Module Name:    cpufpga - Behavioral 
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

entity cpufpga is
Port ( led : out STD_LOGIC_VECTOR (15 downto 0);
       seg : out STD_LOGIC_VECTOR (6 downto 0);
       dp : out STD_LOGIC;
       an : out STD_LOGIC_VECTOR (7 downto 0);
       clk : in STD_LOGIC;
       sw : in STD_LOGIC_VECTOR (15 downto 0);
       btnC: in STD_LOGIc;
	    btnR : in STD_LOGIC;
		 btnL: in std_logic;
		 btnU: in std_logic;
		 btnD: in std_logic
       );
end cpufpga;

architecture Behavioral of cpufpga is
signal clk_de_counter: std_logic_vector( 19 downto 0);
signal clk_de: std_logic;

signal i:std_logic_vector(6 downto 0);
signal i_add:std_logic;
signal i_min:std_logic;
signal j:std_logic_vector(5 downto 0);
signal j_add:std_logic;
signal j_min:std_logic;

signal rst: std_logic;

signal d_vld:std_logic;
signal enc_dec:std_logic;
signal input1:std_logic_vector(127 downto 0);
signal input2:std_logic_vector(63 downto 0);
signal output:std_logic_vector(63 downto 0);
signal output1:std_logic_vector(63 downto 0);
signal input_output:std_logic_vector(1 downto 0);
signal inputsel:std_logic;
signal displaybit:std_logic_vector(1 downto 0);
signal inputvalid:std_logic;
signal instr:std_logic_vector(31 downto 0);
signal an_sig: STD_LOGIC_VECTOR(7 downto 0);
signal counter: std_logic_vector( 15 downto 0);

signal dig1: STD_LOGIC_VECTOR(7 downto 0);
signal dig2: STD_LOGIC_VECTOR(7 downto 0);
signal dig3: STD_LOGIC_VECTOR(7 downto 0);
signal dig4: STD_LOGIC_VECTOR(7 downto 0);
signal dig5: STD_LOGIC_VECTOR(7 downto 0);
signal dig6: STD_LOGIC_VECTOR(7 downto 0);
signal dig7: STD_LOGIC_VECTOR(7 downto 0);
signal dig8: STD_LOGIC_VECTOR(7 downto 0);
signal dig9: STD_LOGIC_VECTOR(7 downto 0);
signal dig10: STD_LOGIC_VECTOR(7 downto 0);
signal dig11: STD_LOGIC_VECTOR(7 downto 0);
signal dig12: STD_LOGIC_VECTOR(7 downto 0);
signal dig13: STD_LOGIC_VECTOR(7 downto 0);
signal dig14: STD_LOGIC_VECTOR(7 downto 0);
signal dig15: STD_LOGIC_VECTOR(7 downto 0);
signal dig16: STD_LOGIC_VECTOR(7 downto 0);
signal dig17: STD_LOGIC_VECTOR(7 downto 0);
signal dig18: STD_LOGIC_VECTOR(7 downto 0);
signal dig19: STD_LOGIC_VECTOR(7 downto 0);
signal dig20: STD_LOGIC_VECTOR(7 downto 0);
signal dig21: STD_LOGIC_VECTOR(7 downto 0);
signal dig22: STD_LOGIC_VECTOR(7 downto 0);
signal dig23: STD_LOGIC_VECTOR(7 downto 0);
signal dig24: STD_LOGIC_VECTOR(7 downto 0);
signal dig25: STD_LOGIC_VECTOR(7 downto 0);
signal dig26: STD_LOGIC_VECTOR(7 downto 0);
signal dig27: STD_LOGIC_VECTOR(7 downto 0);
signal dig28: STD_LOGIC_VECTOR(7 downto 0);
signal dig29: STD_LOGIC_VECTOR(7 downto 0);
signal dig30: STD_LOGIC_VECTOR(7 downto 0);
signal dig31: STD_LOGIC_VECTOR(7 downto 0);
signal dig32: STD_LOGIC_VECTOR(7 downto 0);

signal di1: STD_LOGIC_VECTOR(7 downto 0);
signal di2: STD_LOGIC_VECTOR(7 downto 0);
signal di3: STD_LOGIC_VECTOR(7 downto 0);
signal di4: STD_LOGIC_VECTOR(7 downto 0);
signal di5: STD_LOGIC_VECTOR(7 downto 0);
signal di6: STD_LOGIC_VECTOR(7 downto 0);
signal di7: STD_LOGIC_VECTOR(7 downto 0);
signal di8: STD_LOGIC_VECTOR(7 downto 0);
signal di9: STD_LOGIC_VECTOR(7 downto 0);
signal di10: STD_LOGIC_VECTOR(7 downto 0);
signal di11: STD_LOGIC_VECTOR(7 downto 0);
signal di12: STD_LOGIC_VECTOR(7 downto 0);
signal di13: STD_LOGIC_VECTOR(7 downto 0);
signal di14: STD_LOGIC_VECTOR(7 downto 0);
signal di15: STD_LOGIC_VECTOR(7 downto 0);
signal di16: STD_LOGIC_VECTOR(7 downto 0);





signal digit1: STD_LOGIC_VECTOR(7 downto 0);
signal digit2: STD_LOGIC_VECTOR(7 downto 0);
signal digit3: STD_LOGIC_VECTOR(7 downto 0);
signal digit4: STD_LOGIC_VECTOR(7 downto 0);
signal digit5: STD_LOGIC_VECTOR(7 downto 0);
signal digit6: STD_LOGIC_VECTOR(7 downto 0);
signal digit7: STD_LOGIC_VECTOR(7 downto 0);
signal digit8: STD_LOGIC_VECTOR(7 downto 0);
signal digit9: STD_LOGIC_VECTOR(7 downto 0);
signal digit10: STD_LOGIC_VECTOR(7 downto 0);
signal digit11: STD_LOGIC_VECTOR(7 downto 0);
signal digit12: STD_LOGIC_VECTOR(7 downto 0);
signal digit13: STD_LOGIC_VECTOR(7 downto 0);
signal digit14: STD_LOGIC_VECTOR(7 downto 0);
signal digit15: STD_LOGIC_VECTOR(7 downto 0);
signal digit16: STD_LOGIC_VECTOR(7 downto 0);

component cpu
port(  clk : in  STD_LOGIC;
       reset : in  STD_LOGIC;
		 sel: in std_logic;
		 skey: in std_logic_vector(127 downto 0);
		 din: in std_logic_vector(63 downto 0);
		 valid:in std_logic;
		 dout: out std_logic_vector(63 downto 0);
		 data_vld:out std_logic;
		 instruction : out std_logic_vector(31 downto 0));
end component;

begin
rst <= btnC;
an<=an_sig;
led<=sw;
enc_dec<=sw(0);
inputsel<=sw(1);--0 enter user key 1 enter din
displaybit<=sw(3 downto 2);
input_output<=sw(5 downto 4);--00 display user key--01 display din else display output
inputvalid<=sw(6);
cpuall:cpu port map(clk=>clk,reset=>rst,sel=>enc_dec,skey=>input1,din=>input2,valid=>inputvalid,dout=>output1,data_vld=>d_vld,instruction=>instr);
clkdebounce: process(clk, rst)
  begin
    if(rst = '1') then
      clk_de <= '0';
      
    elsif (clk = '1' and clk'event) then       
       if (clk_de_counter >="11110100001001000000") then
         clk_de_counter <=(others => '0');
         clk_de<= not clk_de;
       else
          clk_de_counter <=  clk_de_counter + '1';
       end if;   
    end if;
	end process;

process(rst,clk_de)
      begin 
		 if(rst = '1') then
		 i<=(others=>'0');
		 elsif(clk_de'event and clk_de='1') then
		   if(inputsel='0')then
		     i_min<=btnR;
			  i_add<=btnL;
			 if(i_add='1' and btnL='0')then 
			   i<=i +"100";
			elsif(i_min='1' and btnR='0')then
			    i<=i-"100";
		 end if;
		 end if;
		 end if;
		end process;
process(rst,clk_de)
      begin 
		 if(rst = '1') then
		 j<=(others=>'0');
		 elsif(clk_de'event and clk_de='1') then
		   if(inputsel='1')then
		     j_min<=btnR;
			  j_add<=btnL;
			 if(j_add='1' and btnL='0')then 
			   j<=j +"100";
			elsif(j_min='1' and btnR='0')then
			    j<=j-"100";
		 end if;
		 end if;
		 end if;
		end process;
input1_arth: process(rst,clk_de)
       begin 
		  if(rst='1') then
		  input1<=(others=>'0');
		 elsif(clk_de'event and clk_de='1') then
		    if(inputsel='0')then
		     case i(6 downto 0) is
              when "0000000"=> input1(3 downto 0)<=sw(15 downto 12);
              when "0000100"=> input1(7 downto 4)<=sw(15 downto 12);
              when "0001000"=> input1(11 downto 8)<=sw(15 downto 12);
              when "0001100"=> input1(15 downto 12)<=sw(15 downto 12);
              when "0010000"=> input1(19 downto 16)<=sw(15 downto 12);
              when "0010100"=> input1(23 downto 20)<=sw(15 downto 12);
              when "0011000"=> input1(27 downto 24)<=sw(15 downto 12);
              when "0011100"=> input1(31 downto 28)<=sw(15 downto 12);
              when "0100000"=> input1(35 downto 32)<=sw(15 downto 12);
              when "0100100"=> input1(39 downto 36)<=sw(15 downto 12);
              when "0101000"=> input1(43 downto 40)<=sw(15 downto 12);
              when "0101100"=> input1(47 downto 44)<=sw(15 downto 12);
              when "0110000"=> input1(51 downto 48)<=sw(15 downto 12); 
              when "0110100"=> input1(55 downto 52)<=sw(15 downto 12);
              when "0111000"=> input1(59 downto 56)<=sw(15 downto 12);
              when "0111100"=> input1(63 downto 60)<=sw(15 downto 12);
	           when "1000000"=> input1(67 downto 64)<=sw(15 downto 12);
              when "1000100"=> input1(71 downto 68)<=sw(15 downto 12);
              when "1001000"=> input1(75 downto 72)<=sw(15 downto 12);
              when "1001100"=> input1(79 downto 76)<=sw(15 downto 12);
              when "1010000"=> input1(83 downto 80)<=sw(15 downto 12);
              when "1010100"=> input1(87 downto 84)<=sw(15 downto 12);
              when "1011000"=> input1(91 downto 88)<=sw(15 downto 12);
              when "1011100"=> input1(95 downto 92)<=sw(15 downto 12);
              when "1100000"=> input1(99 downto 96)<=sw(15 downto 12);
              when "1100100"=> input1(103 downto 100)<=sw(15 downto 12);
              when "1101000"=> input1(107 downto 104)<=sw(15 downto 12);
              when "1101100"=> input1(111 downto 108)<=sw(15 downto 12);
              when "1110000"=> input1(115 downto 112)<=sw(15 downto 12); 
              when "1110100"=> input1(119 downto 116)<=sw(15 downto 12);
              when "1111000"=> input1(123 downto 120)<=sw(15 downto 12);
              when "1111100"=> input1(127 downto 124)<=sw(15 downto 12);
              when others => input1<=(others=>'0');
             end case;
	           end if;
              end if;
             end process;
				 
		input2_arth: process(rst,clk_de)
        begin 
		  if(rst='1') then
		   input2<=(others=>'0');
		 elsif(clk_de'event and clk_de='1') then
		    if(inputsel='1')then
		     case j(5 downto 0) is
              when "000000"=> input2(3 downto 0)<=sw(15 downto 12);
              when "000100"=> input2(7 downto 4)<=sw(15 downto 12);
              when "001000"=> input2(11 downto 8)<=sw(15 downto 12);
              when "001100"=> input2(15 downto 12)<=sw(15 downto 12);
              when "010000"=> input2(19 downto 16)<=sw(15 downto 12);
              when "010100"=> input2(23 downto 20)<=sw(15 downto 12);
              when "011000"=> input2(27 downto 24)<=sw(15 downto 12);
              when "011100"=> input2(31 downto 28)<=sw(15 downto 12);
              when "100000"=> input2(35 downto 32)<=sw(15 downto 12);
              when "100100"=> input2(39 downto 36)<=sw(15 downto 12);
              when "101000"=> input2(43 downto 40)<=sw(15 downto 12);
              when "101100"=> input2(47 downto 44)<=sw(15 downto 12);
              when "110000"=> input2(51 downto 48)<=sw(15 downto 12); 
              when "110100"=> input2(55 downto 52)<=sw(15 downto 12);
              when "111000"=> input2(59 downto 56)<=sw(15 downto 12);
              when "111100"=> input2(63 downto 60)<=sw(15 downto 12);
              when others => input2<=(others=>'0');
             end case;
              end if;
				  end if;
             end process;
	process(output1,d_vld)
   begin 
	 if(d_vld='1') then
	  output<=output1;
	  end if;
	 end process;
	digMap1: process(input1)
     begin
      case input1(3 downto 0) is
       when "0000" => dig1 <= "10000001"; -- 0 and the dot is off
       when "0001" => dig1 <= "11110011"; -- 1 and the dot is off
       when "0010" => dig1 <= "01001001"; -- 2 and the dot is off
       when "0011" => dig1 <= "01100001"; -- 3 and the dot is off
       when "0100" => dig1 <= "00110011"; -- 4 and the dot is off
       when "0101" => dig1 <= "00100101"; -- 5 and the dot is off
       when "0110" => dig1 <= "00000101"; -- 6 and the dot is off
       when "0111" => dig1 <= "11110001"; -- 7 and the dot is off
       when "1000" => dig1 <= "00000001"; -- 8 and the dot is off
       when "1001" => dig1 <= "00100001"; -- 9 and the dot is off
       when "1010" => dig1 <= "00010000"; -- A and the dot is on
       when "1011" => dig1 <= "00000000"; -- B and the dot is on
       when "1100" => dig1 <= "10001100"; -- C and the dot is on
       when "1101" => dig1 <= "10000000"; -- D and the dot is on
       when "1110" => dig1 <= "00001100"; -- E and the dot is on
       when "1111" => dig1 <= "00011100"; -- F and the dot is on
       when others => dig1 <= "11111111"; -- Dark
      end case;
      end process;
      
digMap2: process(input1)
       begin
        case input1(7 downto 4) is
         when "0000" => dig2 <= "10000001"; -- 0 and the dot is off
         when "0001" => dig2 <= "11110011"; -- 1 and the dot is off
         when "0010" => dig2 <= "01001001"; -- 2 and the dot is off
         when "0011" => dig2 <= "01100001"; -- 3 and the dot is off
         when "0100" => dig2 <= "00110011"; -- 4 and the dot is off
         when "0101" => dig2 <= "00100101"; -- 5 and the dot is off
         when "0110" => dig2 <= "00000101"; -- 6 and the dot is off
         when "0111" => dig2 <= "11110001"; -- 7 and the dot is off
         when "1000" => dig2 <= "00000001"; -- 8 and the dot is off
         when "1001" => dig2 <= "00100001"; -- 9 and the dot is off
         when "1010" => dig2 <= "00010000"; -- A and the dot is on
         when "1011" => dig2 <= "00000000"; -- B and the dot is on
         when "1100" => dig2 <= "10001100"; -- C and the dot is on
         when "1101" => dig2 <= "10000000"; -- D and the dot is on
         when "1110" => dig2 <= "00001100"; -- E and the dot is on
         when "1111" => dig2 <= "00011100"; -- F and the dot is on
         when others => dig2 <= "11111111"; -- Dark
        end case;
        end process;
        
digMap3: process(input1)
           begin
            case input1(11 downto 8) is
             when "0000" => dig3 <= "10000001"; -- 0 and the dot is off
             when "0001" => dig3 <= "11110011"; -- 1 and the dot is off
             when "0010" => dig3 <= "01001001"; -- 2 and the dot is off
             when "0011" => dig3 <= "01100001"; -- 3 and the dot is off
             when "0100" => dig3 <= "00110011"; -- 4 and the dot is off
             when "0101" => dig3 <= "00100101"; -- 5 and the dot is off
             when "0110" => dig3 <= "00000101"; -- 6 and the dot is off
             when "0111" => dig3 <= "11110001"; -- 7 and the dot is off
             when "1000" => dig3 <= "00000001"; -- 8 and the dot is off
             when "1001" => dig3 <= "00100001"; -- 9 and the dot is off
             when "1010" => dig3 <= "00010000"; -- A and the dot is on
             when "1011" => dig3 <= "00000000"; -- B and the dot is on
             when "1100" => dig3 <= "10001100"; -- C and the dot is on
             when "1101" => dig3 <= "10000000"; -- D and the dot is on
             when "1110" => dig3 <= "00001100"; -- E and the dot is on
             when "1111" => dig3 <= "00011100"; -- F and the dot is on
             when others => dig3 <= "11111111"; -- Dark
            end case;
            end process;
           
digMap4: process(input1)
               begin
                case input1(15 downto 12) is
                 when "0000" => dig4 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig4 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig4 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig4 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig4 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig4 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig4 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig4 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig4 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig4 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig4 <= "00010000"; -- A and the dot is on
                 when "1011" => dig4 <= "00000000"; -- B and the dot is on
                 when "1100" => dig4 <= "10001100"; -- C and the dot is on
                 when "1101" => dig4 <= "10000000"; -- D and the dot is on
                 when "1110" => dig4 <= "00001100"; -- E and the dot is on
                 when "1111" => dig4 <= "00011100"; -- F and the dot is on
                 when others => dig4 <= "11111111"; -- Dark
                end case;
                end process;
					 
digMap5: process(input1)
               begin
                case input1(19 downto 16) is
                 when "0000" => dig5 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig5 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig5 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig5 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig5 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig5 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig5 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig5 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig5 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig5 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig5 <= "00010000"; -- A and the dot is on
                 when "1011" => dig5 <= "00000000"; -- B and the dot is on
                 when "1100" => dig5 <= "10001100"; -- C and the dot is on
                 when "1101" => dig5 <= "10000000"; -- D and the dot is on
                 when "1110" => dig5 <= "00001100"; -- E and the dot is on
                 when "1111" => dig5 <= "00011100"; -- F and the dot is on
                 when others => dig5 <= "11111111"; -- Dark
                end case;
                end process;
					 
digMap6: process(input1)
               begin
                case input1(23 downto 20) is
                 when "0000" => dig6 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig6 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig6 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig6 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig6 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig6 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig6 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig6 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig6 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig6 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig6 <= "00010000"; -- A and the dot is on
                 when "1011" => dig6 <= "00000000"; -- B and the dot is on
                 when "1100" => dig6 <= "10001100"; -- C and the dot is on
                 when "1101" => dig6 <= "10000000"; -- D and the dot is on
                 when "1110" => dig6 <= "00001100"; -- E and the dot is on
                 when "1111" => dig6 <= "00011100"; -- F and the dot is on
                 when others => dig6 <= "11111111"; -- Dark
                end case;
                end process;
					 
digMap7: process(input1)
               begin
                case input1(27 downto 24) is
                 when "0000" => dig7 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig7 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig7 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig7 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig7 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig7 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig7 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig7 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig7 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig7 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig7 <= "00010000"; -- A and the dot is on
                 when "1011" => dig7 <= "00000000"; -- B and the dot is on
                 when "1100" => dig7 <= "10001100"; -- C and the dot is on
                 when "1101" => dig7 <= "10000000"; -- D and the dot is on
                 when "1110" => dig7 <= "00001100"; -- E and the dot is on
                 when "1111" => dig7 <= "00011100"; -- F and the dot is on
                 when others => dig7 <= "11111111"; -- Dark
                end case;
                end process;
					 
					 
digMap8: process(input1)
               begin
                case input1(31 downto 28) is
                 when "0000" => dig8 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig8 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig8 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig8 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig8 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig8 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig8 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig8 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig8 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig8 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig8 <= "00010000"; -- A and the dot is on
                 when "1011" => dig8 <= "00000000"; -- B and the dot is on
                 when "1100" => dig8 <= "10001100"; -- C and the dot is on
                 when "1101" => dig8 <= "10000000"; -- D and the dot is on
                 when "1110" => dig8 <= "00001100"; -- E and the dot is on
                 when "1111" => dig8 <= "00011100"; -- F and the dot is on
                 when others => dig8 <= "11111111"; -- Dark
                end case;
                end process;

digMap9: process(input1)
     begin
      case input1(35 downto 32) is
       when "0000" => dig9 <= "10000001"; -- 0 and the dot is off
       when "0001" => dig9 <= "11110011"; -- 1 and the dot is off
       when "0010" => dig9 <= "01001001"; -- 2 and the dot is off
       when "0011" => dig9 <= "01100001"; -- 3 and the dot is off
       when "0100" => dig9 <= "00110011"; -- 4 and the dot is off
       when "0101" => dig9 <= "00100101"; -- 5 and the dot is off
       when "0110" => dig9 <= "00000101"; -- 6 and the dot is off
       when "0111" => dig9 <= "11110001"; -- 7 and the dot is off
       when "1000" => dig9 <= "00000001"; -- 8 and the dot is off
       when "1001" => dig9 <= "00100001"; -- 9 and the dot is off
       when "1010" => dig9 <= "00010000"; -- A and the dot is on
       when "1011" => dig9 <= "00000000"; -- B and the dot is on
       when "1100" => dig9 <= "10001100"; -- C and the dot is on
       when "1101" => dig9 <= "10000000"; -- D and the dot is on
       when "1110" => dig9 <= "00001100"; -- E and the dot is on
       when "1111" => dig9 <= "00011100"; -- F and the dot is on
       when others => dig9 <= "11111111"; -- Dark
      end case;
      end process;
      
digMap10: process(input1)
       begin
        case input1(39 downto 36) is
         when "0000" => dig10 <= "10000001"; -- 0 and the dot is off
         when "0001" => dig10 <= "11110011"; -- 1 and the dot is off
         when "0010" => dig10 <= "01001001"; -- 2 and the dot is off
         when "0011" => dig10 <= "01100001"; -- 3 and the dot is off
         when "0100" => dig10 <= "00110011"; -- 4 and the dot is off
         when "0101" => dig10 <= "00100101"; -- 5 and the dot is off
         when "0110" => dig10 <= "00000101"; -- 6 and the dot is off
         when "0111" => dig10 <= "11110001"; -- 7 and the dot is off
         when "1000" => dig10 <= "00000001"; -- 8 and the dot is off
         when "1001" => dig10 <= "00100001"; -- 9 and the dot is off
         when "1010" => dig10 <= "00010000"; -- A and the dot is on
         when "1011" => dig10 <= "00000000"; -- B and the dot is on
         when "1100" => dig10 <= "10001100"; -- C and the dot is on
         when "1101" => dig10 <= "10000000"; -- D and the dot is on
         when "1110" => dig10 <= "00001100"; -- E and the dot is on
         when "1111" => dig10 <= "00011100"; -- F and the dot is on
         when others => dig10 <= "11111111"; -- Dark
        end case;
        end process;
        
digMap11: process(input1)
           begin
            case input1(43 downto 40) is
             when "0000" => dig11 <= "10000001"; -- 0 and the dot is off
             when "0001" => dig11 <= "11110011"; -- 1 and the dot is off
             when "0010" => dig11 <= "01001001"; -- 2 and the dot is off
             when "0011" => dig11 <= "01100001"; -- 3 and the dot is off
             when "0100" => dig11 <= "00110011"; -- 4 and the dot is off
             when "0101" => dig11 <= "00100101"; -- 5 and the dot is off
             when "0110" => dig11<= "00000101"; -- 6 and the dot is off
             when "0111" => dig11<= "11110001"; -- 7 and the dot is off
             when "1000" => dig11<= "00000001"; -- 8 and the dot is off
             when "1001" => dig11<= "00100001"; -- 9 and the dot is off
             when "1010" => dig11<= "00010000"; -- A and the dot is on
             when "1011" => dig11<= "00000000"; -- B and the dot is on
             when "1100" => dig11<= "10001100"; -- C and the dot is on
             when "1101" => dig11<= "10000000"; -- D and the dot is on
             when "1110" => dig11<= "00001100"; -- E and the dot is on
             when "1111" => dig11<= "00011100"; -- F and the dot is on
             when others => dig11<= "11111111"; -- Dark
            end case;
            end process;
           
digMap12: process(input1)
               begin
                case input1(47 downto 44 ) is
                 when "0000" => dig12 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig12 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig12 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig12 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig12 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig12 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig12 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig12 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig12 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig12 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig12 <= "00010000"; -- A and the dot is on
                 when "1011" => dig12 <= "00000000"; -- B and the dot is on
                 when "1100" => dig12 <= "10001100"; -- C and the dot is on
                 when "1101" => dig12 <= "10000000"; -- D and the dot is on
                 when "1110" => dig12 <= "00001100"; -- E and the dot is on
                 when "1111" => dig12 <= "00011100"; -- F and the dot is on
                 when others => dig12 <= "11111111"; -- Dark
                end case;
                end process;
					 
digMap13: process(input1)
               begin
                case input1(51 downto 48) is
                 when "0000" => dig13 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig13 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig13 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig13 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig13 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig13 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig13 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig13 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig13 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig13 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig13 <= "00010000"; -- A and the dot is on
                 when "1011" => dig13 <= "00000000"; -- B and the dot is on
                 when "1100" => dig13 <= "10001100"; -- C and the dot is on
                 when "1101" => dig13 <= "10000000"; -- D and the dot is on
                 when "1110" => dig13 <= "00001100"; -- E and the dot is on
                 when "1111" => dig13 <= "00011100"; -- F and the dot is on
                 when others => dig13 <= "11111111"; -- Dark
                end case;
                end process;
					 
digMap14: process(input1)
               begin
                case input1(55 downto 52) is
                 when "0000" => dig14 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig14 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig14 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig14 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig14 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig14 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig14 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig14 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig14 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig14 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig14 <= "00010000"; -- A and the dot is on
                 when "1011" => dig14 <= "00000000"; -- B and the dot is on
                 when "1100" => dig14 <= "10001100"; -- C and the dot is on
                 when "1101" => dig14 <= "10000000"; -- D and the dot is on
                 when "1110" => dig14 <= "00001100"; -- E and the dot is on
                 when "1111" => dig14 <= "00011100"; -- F and the dot is on
                 when others => dig14 <= "11111111"; -- Dark
                end case;
                end process;
					 
digMap15: process(input1)
               begin
                case input1(59 downto 56) is
                 when "0000" => dig15 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig15 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig15 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig15 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig15 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig15 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig15 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig15 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig15 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig15 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig15 <= "00010000"; -- A and the dot is on
                 when "1011" => dig15 <= "00000000"; -- B and the dot is on
                 when "1100" => dig15 <= "10001100"; -- C and the dot is on
                 when "1101" => dig15 <= "10000000"; -- D and the dot is on
                 when "1110" => dig15 <= "00001100"; -- E and the dot is on
                 when "1111" => dig15 <= "00011100"; -- F and the dot is on
                 when others => dig15 <= "11111111"; -- Dark
                end case;
                end process;
					 
					 
digMap16: process(input1)
               begin
                case input1(63 downto 60) is
                 when "0000" => dig16 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig16 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig16 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig16 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig16 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig16 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig16 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig16 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig16 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig16 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig16 <= "00010000"; -- A and the dot is on
                 when "1011" => dig16 <= "00000000"; -- B and the dot is on
                 when "1100" => dig16 <= "10001100"; -- C and the dot is on
                 when "1101" => dig16 <= "10000000"; -- D and the dot is on
                 when "1110" => dig16 <= "00001100"; -- E and the dot is on
                 when "1111" => dig16 <= "00011100"; -- F and the dot is on
                 when others => dig16 <= "11111111"; -- Dark
                end case;
                end process;


digMap17: process(input1)
     begin
      case input1(67 downto 64) is
       when "0000" => dig17 <= "10000001"; -- 0 and the dot is off
       when "0001" => dig17 <= "11110011"; -- 1 and the dot is off
       when "0010" => dig17 <= "01001001"; -- 2 and the dot is off
       when "0011" => dig17 <= "01100001"; -- 3 and the dot is off
       when "0100" => dig17 <= "00110011"; -- 4 and the dot is off
       when "0101" => dig17 <= "00100101"; -- 5 and the dot is off
       when "0110" => dig17 <= "00000101"; -- 6 and the dot is off
       when "0111" => dig17 <= "11110001"; -- 7 and the dot is off
       when "1000" => dig17 <= "00000001"; -- 8 and the dot is off
       when "1001" => dig17 <= "00100001"; -- 9 and the dot is off
       when "1010" => dig17 <= "00010000"; -- A and the dot is on
       when "1011" => dig17 <= "00000000"; -- B and the dot is on
       when "1100" => dig17 <= "10001100"; -- C and the dot is on
       when "1101" => dig17 <= "10000000"; -- D and the dot is on
       when "1110" => dig17 <= "00001100"; -- E and the dot is on
       when "1111" => dig17 <= "00011100"; -- F and the dot is on
       when others => dig17 <= "11111111"; -- Dark
      end case;
      end process;
      
digMap18: process(input1)
       begin
        case input1(71 downto 68) is
         when "0000" => dig18 <= "10000001"; -- 0 and the dot is off
         when "0001" => dig18 <= "11110011"; -- 1 and the dot is off
         when "0010" => dig18 <= "01001001"; -- 2 and the dot is off
         when "0011" => dig18 <= "01100001"; -- 3 and the dot is off
         when "0100" => dig18 <= "00110011"; -- 4 and the dot is off
         when "0101" => dig18 <= "00100101"; -- 5 and the dot is off
         when "0110" => dig18 <= "00000101"; -- 6 and the dot is off
         when "0111" => dig18 <= "11110001"; -- 7 and the dot is off
         when "1000" => dig18 <= "00000001"; -- 8 and the dot is off
         when "1001" => dig18 <= "00100001"; -- 9 and the dot is off
         when "1010" => dig18 <= "00010000"; -- A and the dot is on
         when "1011" => dig18 <= "00000000"; -- B and the dot is on
         when "1100" => dig18 <= "10001100"; -- C and the dot is on
         when "1101" => dig18 <= "10000000"; -- D and the dot is on
         when "1110" => dig18 <= "00001100"; -- E and the dot is on
         when "1111" => dig18 <= "00011100"; -- F and the dot is on
         when others => dig18 <= "11111111"; -- Dark
        end case;
        end process;
        
digMap19: process(input1)
           begin
            case input1(75 downto 72) is
             when "0000" => dig19 <= "10000001"; -- 0 and the dot is off
             when "0001" => dig19 <= "11110011"; -- 1 and the dot is off
             when "0010" => dig19 <= "01001001"; -- 2 and the dot is off
             when "0011" => dig19 <= "01100001"; -- 3 and the dot is off
             when "0100" => dig19 <= "00110011"; -- 4 and the dot is off
             when "0101" => dig19 <= "00100101"; -- 5 and the dot is off
             when "0110" => dig19 <= "00000101"; -- 6 and the dot is off
             when "0111" => dig19 <= "11110001"; -- 7 and the dot is off
             when "1000" => dig19 <= "00000001"; -- 8 and the dot is off
             when "1001" => dig19 <= "00100001"; -- 9 and the dot is off
             when "1010" => dig19 <= "00010000"; -- A and the dot is on
             when "1011" => dig19 <= "00000000"; -- B and the dot is on
             when "1100" => dig19 <= "10001100"; -- C and the dot is on
             when "1101" => dig19 <= "10000000"; -- D and the dot is on
             when "1110" => dig19 <= "00001100"; -- E and the dot is on
             when "1111" => dig19 <= "00011100"; -- F and the dot is on
             when others => dig19 <= "11111111"; -- Dark
            end case;
            end process;
           
digMap20: process(input1)
               begin
                case input1(79 downto 76) is
                 when "0000" => dig20 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig20 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig20 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig20 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig20 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig20 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig20 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig20 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig20 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig20 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig20 <= "00010000"; -- A and the dot is on
                 when "1011" => dig20 <= "00000000"; -- B and the dot is on
                 when "1100" => dig20 <= "10001100"; -- C and the dot is on
                 when "1101" => dig20 <= "10000000"; -- D and the dot is on
                 when "1110" => dig20 <= "00001100"; -- E and the dot is on
                 when "1111" => dig20 <= "00011100"; -- F and the dot is on
                 when others => dig20 <= "11111111"; -- Dark
                end case;
                end process;
					 
digMap21: process(input1)
               begin
                case input1(83 downto 80) is
                 when "0000" => dig21 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig21 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig21 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig21 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig21 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig21 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig21 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig21 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig21 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig21 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig21 <= "00010000"; -- A and the dot is on
                 when "1011" => dig21 <= "00000000"; -- B and the dot is on
                 when "1100" => dig21 <= "10001100"; -- C and the dot is on
                 when "1101" => dig21 <= "10000000"; -- D and the dot is on
                 when "1110" => dig21 <= "00001100"; -- E and the dot is on
                 when "1111" => dig21 <= "00011100"; -- F and the dot is on
                 when others => dig21 <= "11111111"; -- Dark
                end case;
                end process;
					 
digMap22: process(input1)
               begin
                case input1(87 downto 84) is
                 when "0000" => dig22 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig22 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig22 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig22 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig22 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig22 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig22 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig22 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig22 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig22 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig22 <= "00010000"; -- A and the dot is on
                 when "1011" => dig22 <= "00000000"; -- B and the dot is on
                 when "1100" => dig22 <= "10001100"; -- C and the dot is on
                 when "1101" => dig22 <= "10000000"; -- D and the dot is on
                 when "1110" => dig22 <= "00001100"; -- E and the dot is on
                 when "1111" => dig22 <= "00011100"; -- F and the dot is on
                 when others => dig22 <= "11111111"; -- Dark
                end case;
                end process;
					 
digMap23: process(input1)
               begin
                case input1(91 downto 88) is
                 when "0000" => dig23 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig23 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig23 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig23 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig23 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig23 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig23 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig23 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig23 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig23 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig23 <= "00010000"; -- A and the dot is on
                 when "1011" => dig23 <= "00000000"; -- B and the dot is on
                 when "1100" => dig23 <= "10001100"; -- C and the dot is on
                 when "1101" => dig23 <= "10000000"; -- D and the dot is on
                 when "1110" => dig23 <= "00001100"; -- E and the dot is on
                 when "1111" => dig23 <= "00011100"; -- F and the dot is on
                 when others => dig23 <= "11111111"; -- Dark
                end case;
                end process;
					 
					 
digMap24: process(input1)
               begin
                case input1(95 downto 92) is
                 when "0000" => dig24 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig24 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig24 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig24 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig24 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig24 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig24 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig24 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig24 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig24 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig24 <= "00010000"; -- A and the dot is on
                 when "1011" => dig24 <= "00000000"; -- B and the dot is on
                 when "1100" => dig24 <= "10001100"; -- C and the dot is on
                 when "1101" => dig24 <= "10000000"; -- D and the dot is on
                 when "1110" => dig24 <= "00001100"; -- E and the dot is on
                 when "1111" => dig24 <= "00011100"; -- F and the dot is on
                 when others => dig24 <= "11111111"; -- Dark
                end case;
                end process;

digMap25: process(input1)
     begin
      case input1(99 downto 96) is
       when "0000" => dig25 <= "10000001"; -- 0 and the dot is off
       when "0001" => dig25 <= "11110011"; -- 1 and the dot is off
       when "0010" => dig25 <= "01001001"; -- 2 and the dot is off
       when "0011" => dig25 <= "01100001"; -- 3 and the dot is off
       when "0100" => dig25 <= "00110011"; -- 4 and the dot is off
       when "0101" => dig25 <= "00100101"; -- 5 and the dot is off
       when "0110" => dig25 <= "00000101"; -- 6 and the dot is off
       when "0111" => dig25 <= "11110001"; -- 7 and the dot is off
       when "1000" => dig25 <= "00000001"; -- 8 and the dot is off
       when "1001" => dig25 <= "00100001"; -- 9 and the dot is off
       when "1010" => dig25 <= "00010000"; -- A and the dot is on
       when "1011" => dig25 <= "00000000"; -- B and the dot is on
       when "1100" => dig25 <= "10001100"; -- C and the dot is on
       when "1101" => dig25 <= "10000000"; -- D and the dot is on
       when "1110" => dig25 <= "00001100"; -- E and the dot is on
       when "1111" => dig25 <= "00011100"; -- F and the dot is on
       when others => dig25 <= "11111111"; -- Dark
      end case;
      end process;
      
digMap26: process(input1)
       begin
        case input1(103 downto 100) is
         when "0000" => dig26 <= "10000001"; -- 0 and the dot is off
         when "0001" => dig26 <= "11110011"; -- 1 and the dot is off
         when "0010" => dig26 <= "01001001"; -- 2 and the dot is off
         when "0011" => dig26 <= "01100001"; -- 3 and the dot is off
         when "0100" => dig26 <= "00110011"; -- 4 and the dot is off
         when "0101" => dig26 <= "00100101"; -- 5 and the dot is off
         when "0110" => dig26 <= "00000101"; -- 6 and the dot is off
         when "0111" => dig26 <= "11110001"; -- 7 and the dot is off
         when "1000" => dig26 <= "00000001"; -- 8 and the dot is off
         when "1001" => dig26 <= "00100001"; -- 9 and the dot is off
         when "1010" => dig26 <= "00010000"; -- A and the dot is on
         when "1011" => dig26 <= "00000000"; -- B and the dot is on
         when "1100" => dig26 <= "10001100"; -- C and the dot is on
         when "1101" => dig26 <= "10000000"; -- D and the dot is on
         when "1110" => dig26 <= "00001100"; -- E and the dot is on
         when "1111" => dig26 <= "00011100"; -- F and the dot is on
         when others => dig26 <= "11111111"; -- Dark
        end case;
        end process;
        
digMap27: process(input1)
           begin
            case input1(107 downto 104) is
             when "0000" => dig27 <= "10000001"; -- 0 and the dot is off
             when "0001" => dig27 <= "11110011"; -- 1 and the dot is off
             when "0010" => dig27 <= "01001001"; -- 2 and the dot is off
             when "0011" => dig27 <= "01100001"; -- 3 and the dot is off
             when "0100" => dig27 <= "00110011"; -- 4 and the dot is off
             when "0101" => dig27 <= "00100101"; -- 5 and the dot is off
             when "0110" => dig27 <= "00000101"; -- 6 and the dot is off
             when "0111" => dig27 <= "11110001"; -- 7 and the dot is off
             when "1000" => dig27 <= "00000001"; -- 8 and the dot is off
             when "1001" => dig27 <= "00100001"; -- 9 and the dot is off
             when "1010" => dig27 <= "00010000"; -- A and the dot is on
             when "1011" => dig27 <= "00000000"; -- B and the dot is on
             when "1100" => dig27 <= "10001100"; -- C and the dot is on
             when "1101" => dig27 <= "10000000"; -- D and the dot is on
             when "1110" => dig27 <= "00001100"; -- E and the dot is on
             when "1111" => dig27 <= "00011100"; -- F and the dot is on
             when others => dig27 <= "11111111"; -- Dark
            end case;
            end process;
           
digMap28: process(input1)
               begin
                case input1(111 downto 108 ) is
                 when "0000" => dig28 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig28 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig28 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig28 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig28 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig28 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig28 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig28 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig28 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig28 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig28 <= "00010000"; -- A and the dot is on
                 when "1011" => dig28 <= "00000000"; -- B and the dot is on
                 when "1100" => dig28 <= "10001100"; -- C and the dot is on
                 when "1101" => dig28 <= "10000000"; -- D and the dot is on
                 when "1110" => dig28 <= "00001100"; -- E and the dot is on
                 when "1111" => dig28 <= "00011100"; -- F and the dot is on
                 when others => dig28 <= "11111111"; -- Dark
                end case;
                end process;
					 
digMap29: process(input1)
               begin
                case input1(115 downto 112) is
                 when "0000" => dig29 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig29 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig29 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig29 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig29 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig29 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig29 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig29 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig29 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig29 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig29 <= "00010000"; -- A and the dot is on
                 when "1011" => dig29 <= "00000000"; -- B and the dot is on
                 when "1100" => dig29 <= "10001100"; -- C and the dot is on
                 when "1101" => dig29 <= "10000000"; -- D and the dot is on
                 when "1110" => dig29 <= "00001100"; -- E and the dot is on
                 when "1111" => dig29 <= "00011100"; -- F and the dot is on
                 when others => dig29 <= "11111111"; -- Dark
                end case;
                end process;
					 
digMap30: process(input1)
               begin
                case input1(119 downto 116) is
                 when "0000" => dig30 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig30 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig30 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig30 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig30 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig30 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig30 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig30 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig30 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig30 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig30 <= "00010000"; -- A and the dot is on
                 when "1011" => dig30 <= "00000000"; -- B and the dot is on
                 when "1100" => dig30 <= "10001100"; -- C and the dot is on
                 when "1101" => dig30 <= "10000000"; -- D and the dot is on
                 when "1110" => dig30 <= "00001100"; -- E and the dot is on
                 when "1111" => dig30 <= "00011100"; -- F and the dot is on
                 when others => dig30 <= "11111111"; -- Dark
                end case;
                end process;
					 
digMap31: process(input1)
               begin
                case input1(123 downto 120) is
                 when "0000" => dig31 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig31 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig31 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig31 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig31 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig31 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig31 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig31 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig31 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig31 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig31 <= "00010000"; -- A and the dot is on
                 when "1011" => dig31 <= "00000000"; -- B and the dot is on
                 when "1100" => dig31 <= "10001100"; -- C and the dot is on
                 when "1101" => dig31 <= "10000000"; -- D and the dot is on
                 when "1110" => dig31 <= "00001100"; -- E and the dot is on
                 when "1111" => dig31 <= "00011100"; -- F and the dot is on
                 when others => dig31 <= "11111111"; -- Dark
                end case;
                end process;
					 
					 
digMap32: process(input1)
               begin
                case input1(127 downto 124) is
                 when "0000" => dig32 <= "10000001"; -- 0 and the dot is off
                 when "0001" => dig32 <= "11110011"; -- 1 and the dot is off
                 when "0010" => dig32 <= "01001001"; -- 2 and the dot is off
                 when "0011" => dig32 <= "01100001"; -- 3 and the dot is off
                 when "0100" => dig32 <= "00110011"; -- 4 and the dot is off
                 when "0101" => dig32 <= "00100101"; -- 5 and the dot is off
                 when "0110" => dig32 <= "00000101"; -- 6 and the dot is off
                 when "0111" => dig32 <= "11110001"; -- 7 and the dot is off
                 when "1000" => dig32 <= "00000001"; -- 8 and the dot is off
                 when "1001" => dig32 <= "00100001"; -- 9 and the dot is off
                 when "1010" => dig32 <= "00010000"; -- A and the dot is on
                 when "1011" => dig32 <= "00000000"; -- B and the dot is on
                 when "1100" => dig32 <= "10001100"; -- C and the dot is on
                 when "1101" => dig32 <= "10000000"; -- D and the dot is on
                 when "1110" => dig32 <= "00001100"; -- E and the dot is on
                 when "1111" => dig32 <= "00011100"; -- F and the dot is on
                 when others => dig32 <= "11111111"; -- Dark
                end case;
                end process;
					 
diMap1: process(input2)
     begin
      case input2(3 downto 0) is
       when "0000" => di1 <= "10000001"; -- 0 and the dot is off
       when "0001" => di1 <= "11110011"; -- 1 and the dot is off
       when "0010" => di1 <= "01001001"; -- 2 and the dot is off
       when "0011" => di1 <= "01100001"; -- 3 and the dot is off
       when "0100" => di1 <= "00110011"; -- 4 and the dot is off
       when "0101" => di1 <= "00100101"; -- 5 and the dot is off
       when "0110" => di1 <= "00000101"; -- 6 and the dot is off
       when "0111" => di1 <= "11110001"; -- 7 and the dot is off
       when "1000" => di1 <= "00000001"; -- 8 and the dot is off
       when "1001" => di1 <= "00100001"; -- 9 and the dot is off
       when "1010" => di1 <= "00010000"; -- A and the dot is on
       when "1011" => di1 <= "00000000"; -- B and the dot is on
       when "1100" => di1 <= "10001100"; -- C and the dot is on
       when "1101" => di1 <= "10000000"; -- D and the dot is on
       when "1110" => di1 <= "00001100"; -- E and the dot is on
       when "1111" => di1 <= "00011100"; -- F and the dot is on
       when others => di1 <= "11111111"; -- Dark
      end case;
      end process;
      
diMap2: process(input2)
       begin
        case input2(7 downto 4) is
         when "0000" => di2 <= "10000001"; -- 0 and the dot is off
         when "0001" => di2 <= "11110011"; -- 1 and the dot is off
         when "0010" => di2 <= "01001001"; -- 2 and the dot is off
         when "0011" => di2 <= "01100001"; -- 3 and the dot is off
         when "0100" => di2 <= "00110011"; -- 4 and the dot is off
         when "0101" => di2 <= "00100101"; -- 5 and the dot is off
         when "0110" => di2 <= "00000101"; -- 6 and the dot is off
         when "0111" => di2 <= "11110001"; -- 7 and the dot is off
         when "1000" => di2 <= "00000001"; -- 8 and the dot is off
         when "1001" => di2 <= "00100001"; -- 9 and the dot is off
         when "1010" => di2 <= "00010000"; -- A and the dot is on
         when "1011" => di2 <= "00000000"; -- B and the dot is on
         when "1100" => di2 <= "10001100"; -- C and the dot is on
         when "1101" => di2 <= "10000000"; -- D and the dot is on
         when "1110" => di2 <= "00001100"; -- E and the dot is on
         when "1111" => di2 <= "00011100"; -- F and the dot is on
         when others => di2 <= "11111111"; -- Dark
        end case;
        end process;
        
diMap3: process(input2)
           begin
            case input2(11 downto 8) is
             when "0000" => di3 <= "10000001"; -- 0 and the dot is off
             when "0001" => di3 <= "11110011"; -- 1 and the dot is off
             when "0010" => di3 <= "01001001"; -- 2 and the dot is off
             when "0011" => di3 <= "01100001"; -- 3 and the dot is off
             when "0100" => di3 <= "00110011"; -- 4 and the dot is off
             when "0101" => di3 <= "00100101"; -- 5 and the dot is off
             when "0110" => di3 <= "00000101"; -- 6 and the dot is off
             when "0111" => di3 <= "11110001"; -- 7 and the dot is off
             when "1000" => di3 <= "00000001"; -- 8 and the dot is off
             when "1001" => di3 <= "00100001"; -- 9 and the dot is off
             when "1010" => di3 <= "00010000"; -- A and the dot is on
             when "1011" => di3 <= "00000000"; -- B and the dot is on
             when "1100" => di3 <= "10001100"; -- C and the dot is on
             when "1101" => di3 <= "10000000"; -- D and the dot is on
             when "1110" => di3 <= "00001100"; -- E and the dot is on
             when "1111" => di3 <= "00011100"; -- F and the dot is on
             when others => di3 <= "11111111"; -- Dark
            end case;
            end process;
           
diMap4: process(input2)
               begin
                case input2(15 downto 12) is
                 when "0000" => di4 <= "10000001"; -- 0 and the dot is off
                 when "0001" => di4 <= "11110011"; -- 1 and the dot is off
                 when "0010" => di4 <= "01001001"; -- 2 and the dot is off
                 when "0011" => di4 <= "01100001"; -- 3 and the dot is off
                 when "0100" => di4 <= "00110011"; -- 4 and the dot is off
                 when "0101" => di4 <= "00100101"; -- 5 and the dot is off
                 when "0110" => di4 <= "00000101"; -- 6 and the dot is off
                 when "0111" => di4 <= "11110001"; -- 7 and the dot is off
                 when "1000" => di4 <= "00000001"; -- 8 and the dot is off
                 when "1001" => di4 <= "00100001"; -- 9 and the dot is off
                 when "1010" => di4 <= "00010000"; -- A and the dot is on
                 when "1011" => di4 <= "00000000"; -- B and the dot is on
                 when "1100" => di4 <= "10001100"; -- C and the dot is on
                 when "1101" => di4 <= "10000000"; -- D and the dot is on
                 when "1110" => di4 <= "00001100"; -- E and the dot is on
                 when "1111" => di4 <= "00011100"; -- F and the dot is on
                 when others => di4 <= "11111111"; -- Dark
                end case;
                end process;
					 
diMap5: process(input2)
               begin
                case input2(19 downto 16) is
                 when "0000" => di5 <= "10000001"; -- 0 and the dot is off
                 when "0001" => di5 <= "11110011"; -- 1 and the dot is off
                 when "0010" => di5 <= "01001001"; -- 2 and the dot is off
                 when "0011" => di5 <= "01100001"; -- 3 and the dot is off
                 when "0100" => di5 <= "00110011"; -- 4 and the dot is off
                 when "0101" => di5 <= "00100101"; -- 5 and the dot is off
                 when "0110" => di5 <= "00000101"; -- 6 and the dot is off
                 when "0111" => di5 <= "11110001"; -- 7 and the dot is off
                 when "1000" => di5 <= "00000001"; -- 8 and the dot is off
                 when "1001" => di5 <= "00100001"; -- 9 and the dot is off
                 when "1010" => di5 <= "00010000"; -- A and the dot is on
                 when "1011" => di5 <= "00000000"; -- B and the dot is on
                 when "1100" => di5 <= "10001100"; -- C and the dot is on
                 when "1101" => di5 <= "10000000"; -- D and the dot is on
                 when "1110" => di5 <= "00001100"; -- E and the dot is on
                 when "1111" => di5 <= "00011100"; -- F and the dot is on
                 when others => di5 <= "11111111"; -- Dark
                end case;
                end process;
					 
diMap6: process(input2)
               begin
                case input2(23 downto 20) is
                 when "0000" => di6 <= "10000001"; -- 0 and the dot is off
                 when "0001" => di6 <= "11110011"; -- 1 and the dot is off
                 when "0010" => di6 <= "01001001"; -- 2 and the dot is off
                 when "0011" => di6 <= "01100001"; -- 3 and the dot is off
                 when "0100" => di6 <= "00110011"; -- 4 and the dot is off
                 when "0101" => di6 <= "00100101"; -- 5 and the dot is off
                 when "0110" => di6 <= "00000101"; -- 6 and the dot is off
                 when "0111" => di6 <= "11110001"; -- 7 and the dot is off
                 when "1000" => di6 <= "00000001"; -- 8 and the dot is off
                 when "1001" => di6 <= "00100001"; -- 9 and the dot is off
                 when "1010" => di6 <= "00010000"; -- A and the dot is on
                 when "1011" => di6 <= "00000000"; -- B and the dot is on
                 when "1100" => di6 <= "10001100"; -- C and the dot is on
                 when "1101" => di6 <= "10000000"; -- D and the dot is on
                 when "1110" => di6 <= "00001100"; -- E and the dot is on
                 when "1111" => di6 <= "00011100"; -- F and the dot is on
                 when others => di6 <= "11111111"; -- Dark
                end case;
                end process;
					 
diMap7: process(input2)
               begin
                case input2(27 downto 24) is
                 when "0000" => di7 <= "10000001"; -- 0 and the dot is off
                 when "0001" => di7 <= "11110011"; -- 1 and the dot is off
                 when "0010" => di7 <= "01001001"; -- 2 and the dot is off
                 when "0011" => di7 <= "01100001"; -- 3 and the dot is off
                 when "0100" => di7 <= "00110011"; -- 4 and the dot is off
                 when "0101" => di7 <= "00100101"; -- 5 and the dot is off
                 when "0110" => di7 <= "00000101"; -- 6 and the dot is off
                 when "0111" => di7 <= "11110001"; -- 7 and the dot is off
                 when "1000" => di7 <= "00000001"; -- 8 and the dot is off
                 when "1001" => di7 <= "00100001"; -- 9 and the dot is off
                 when "1010" => di7 <= "00010000"; -- A and the dot is on
                 when "1011" => di7 <= "00000000"; -- B and the dot is on
                 when "1100" => di7 <= "10001100"; -- C and the dot is on
                 when "1101" => di7 <= "10000000"; -- D and the dot is on
                 when "1110" => di7 <= "00001100"; -- E and the dot is on
                 when "1111" => di7 <= "00011100"; -- F and the dot is on
                 when others => di7 <= "11111111"; -- Dark
                end case;
                end process;
					 
					 
diMap8: process(input2)
               begin
                case input2(31 downto 28) is
                 when "0000" => di8 <= "10000001"; -- 0 and the dot is off
                 when "0001" => di8 <= "11110011"; -- 1 and the dot is off
                 when "0010" => di8 <= "01001001"; -- 2 and the dot is off
                 when "0011" => di8 <= "01100001"; -- 3 and the dot is off
                 when "0100" => di8 <= "00110011"; -- 4 and the dot is off
                 when "0101" => di8 <= "00100101"; -- 5 and the dot is off
                 when "0110" => di8 <= "00000101"; -- 6 and the dot is off
                 when "0111" => di8 <= "11110001"; -- 7 and the dot is off
                 when "1000" => di8 <= "00000001"; -- 8 and the dot is off
                 when "1001" => di8 <= "00100001"; -- 9 and the dot is off
                 when "1010" => di8 <= "00010000"; -- A and the dot is on
                 when "1011" => di8 <= "00000000"; -- B and the dot is on
                 when "1100" => di8 <= "10001100"; -- C and the dot is on
                 when "1101" => di8 <= "10000000"; -- D and the dot is on
                 when "1110" => di8 <= "00001100"; -- E and the dot is on
                 when "1111" => di8 <= "00011100"; -- F and the dot is on
                 when others => di8 <= "11111111"; -- Dark
                end case;
                end process;

diMap9: process(input2)
     begin
      case input2(35 downto 32) is
       when "0000" => di9 <= "10000001"; -- 0 and the dot is off
       when "0001" => di9 <= "11110011"; -- 1 and the dot is off
       when "0010" => di9 <= "01001001"; -- 2 and the dot is off
       when "0011" => di9 <= "01100001"; -- 3 and the dot is off
       when "0100" => di9 <= "00110011"; -- 4 and the dot is off
       when "0101" => di9 <= "00100101"; -- 5 and the dot is off
       when "0110" => di9 <= "00000101"; -- 6 and the dot is off
       when "0111" => di9 <= "11110001"; -- 7 and the dot is off
       when "1000" => di9 <= "00000001"; -- 8 and the dot is off
       when "1001" => di9 <= "00100001"; -- 9 and the dot is off
       when "1010" => di9 <= "00010000"; -- A and the dot is on
       when "1011" => di9 <= "00000000"; -- B and the dot is on
       when "1100" => di9 <= "10001100"; -- C and the dot is on
       when "1101" => di9 <= "10000000"; -- D and the dot is on
       when "1110" => di9 <= "00001100"; -- E and the dot is on
       when "1111" => di9 <= "00011100"; -- F and the dot is on
       when others => di9 <= "11111111"; -- Dark
      end case;
      end process;
      
diMap10: process(input2)
       begin
        case input2(39 downto 36) is
         when "0000" => di10 <= "10000001"; -- 0 and the dot is off
         when "0001" => di10 <= "11110011"; -- 1 and the dot is off
         when "0010" => di10 <= "01001001"; -- 2 and the dot is off
         when "0011" => di10 <= "01100001"; -- 3 and the dot is off
         when "0100" => di10 <= "00110011"; -- 4 and the dot is off
         when "0101" => di10 <= "00100101"; -- 5 and the dot is off
         when "0110" => di10 <= "00000101"; -- 6 and the dot is off
         when "0111" => di10 <= "11110001"; -- 7 and the dot is off
         when "1000" => di10 <= "00000001"; -- 8 and the dot is off
         when "1001" => di10 <= "00100001"; -- 9 and the dot is off
         when "1010" => di10 <= "00010000"; -- A and the dot is on
         when "1011" => di10 <= "00000000"; -- B and the dot is on
         when "1100" => di10 <= "10001100"; -- C and the dot is on
         when "1101" => di10 <= "10000000"; -- D and the dot is on
         when "1110" => di10 <= "00001100"; -- E and the dot is on
         when "1111" => di10 <= "00011100"; -- F and the dot is on
         when others => di10 <= "11111111"; -- Dark
        end case;
        end process;
        
diMap11: process(input2)
           begin
            case input2(43 downto 40) is
             when "0000" => di11 <= "10000001"; -- 0 and the dot is off
             when "0001" => di11 <= "11110011"; -- 1 and the dot is off
             when "0010" => di11 <= "01001001"; -- 2 and the dot is off
             when "0011" => di11 <= "01100001"; -- 3 and the dot is off
             when "0100" => di11 <= "00110011"; -- 4 and the dot is off
             when "0101" => di11 <= "00100101"; -- 5 and the dot is off
             when "0110" => di11<= "00000101"; -- 6 and the dot is off
             when "0111" => di11<= "11110001"; -- 7 and the dot is off
             when "1000" => di11<= "00000001"; -- 8 and the dot is off
             when "1001" => di11<= "00100001"; -- 9 and the dot is off
             when "1010" => di11<= "00010000"; -- A and the dot is on
             when "1011" => di11<= "00000000"; -- B and the dot is on
             when "1100" => di11<= "10001100"; -- C and the dot is on
             when "1101" => di11<= "10000000"; -- D and the dot is on
             when "1110" => di11<= "00001100"; -- E and the dot is on
             when "1111" => di11<= "00011100"; -- F and the dot is on
             when others => di11<= "11111111"; -- Dark
            end case;
            end process;
           
diMap12: process(input2)
               begin
                case input2(47 downto 44 ) is
                 when "0000" => di12 <= "10000001"; -- 0 and the dot is off
                 when "0001" => di12 <= "11110011"; -- 1 and the dot is off
                 when "0010" => di12 <= "01001001"; -- 2 and the dot is off
                 when "0011" => di12 <= "01100001"; -- 3 and the dot is off
                 when "0100" => di12 <= "00110011"; -- 4 and the dot is off
                 when "0101" => di12 <= "00100101"; -- 5 and the dot is off
                 when "0110" => di12 <= "00000101"; -- 6 and the dot is off
                 when "0111" => di12 <= "11110001"; -- 7 and the dot is off
                 when "1000" => di12 <= "00000001"; -- 8 and the dot is off
                 when "1001" => di12 <= "00100001"; -- 9 and the dot is off
                 when "1010" => di12 <= "00010000"; -- A and the dot is on
                 when "1011" => di12 <= "00000000"; -- B and the dot is on
                 when "1100" => di12 <= "10001100"; -- C and the dot is on
                 when "1101" => di12 <= "10000000"; -- D and the dot is on
                 when "1110" => di12 <= "00001100"; -- E and the dot is on
                 when "1111" => di12 <= "00011100"; -- F and the dot is on
                 when others => di12 <= "11111111"; -- Dark
                end case;
                end process;
					 
diMap13: process(input2)
               begin
                case input2(51 downto 48) is
                 when "0000" => di13 <= "10000001"; -- 0 and the dot is off
                 when "0001" => di13 <= "11110011"; -- 1 and the dot is off
                 when "0010" => di13 <= "01001001"; -- 2 and the dot is off
                 when "0011" => di13 <= "01100001"; -- 3 and the dot is off
                 when "0100" => di13 <= "00110011"; -- 4 and the dot is off
                 when "0101" => di13 <= "00100101"; -- 5 and the dot is off
                 when "0110" => di13 <= "00000101"; -- 6 and the dot is off
                 when "0111" => di13 <= "11110001"; -- 7 and the dot is off
                 when "1000" => di13 <= "00000001"; -- 8 and the dot is off
                 when "1001" => di13 <= "00100001"; -- 9 and the dot is off
                 when "1010" => di13 <= "00010000"; -- A and the dot is on
                 when "1011" => di13 <= "00000000"; -- B and the dot is on
                 when "1100" => di13 <= "10001100"; -- C and the dot is on
                 when "1101" => di13 <= "10000000"; -- D and the dot is on
                 when "1110" => di13 <= "00001100"; -- E and the dot is on
                 when "1111" => di13 <= "00011100"; -- F and the dot is on
                 when others => di13 <= "11111111"; -- Dark
                end case;
                end process;
					 
diMap14: process(input2)
               begin
                case input2(55 downto 52) is
                 when "0000" => di14 <= "10000001"; -- 0 and the dot is off
                 when "0001" => di14 <= "11110011"; -- 1 and the dot is off
                 when "0010" => di14 <= "01001001"; -- 2 and the dot is off
                 when "0011" => di14 <= "01100001"; -- 3 and the dot is off
                 when "0100" => di14 <= "00110011"; -- 4 and the dot is off
                 when "0101" => di14 <= "00100101"; -- 5 and the dot is off
                 when "0110" => di14 <= "00000101"; -- 6 and the dot is off
                 when "0111" => di14 <= "11110001"; -- 7 and the dot is off
                 when "1000" => di14 <= "00000001"; -- 8 and the dot is off
                 when "1001" => di14 <= "00100001"; -- 9 and the dot is off
                 when "1010" => di14 <= "00010000"; -- A and the dot is on
                 when "1011" => di14 <= "00000000"; -- B and the dot is on
                 when "1100" => di14 <= "10001100"; -- C and the dot is on
                 when "1101" => di14 <= "10000000"; -- D and the dot is on
                 when "1110" => di14 <= "00001100"; -- E and the dot is on
                 when "1111" => di14 <= "00011100"; -- F and the dot is on
                 when others => di14 <= "11111111"; -- Dark
                end case;
                end process;
					 
diMap15: process(input2)
               begin
                case input2(59 downto 56) is
                 when "0000" => di15 <= "10000001"; -- 0 and the dot is off
                 when "0001" => di15 <= "11110011"; -- 1 and the dot is off
                 when "0010" => di15 <= "01001001"; -- 2 and the dot is off
                 when "0011" => di15 <= "01100001"; -- 3 and the dot is off
                 when "0100" => di15 <= "00110011"; -- 4 and the dot is off
                 when "0101" => di15 <= "00100101"; -- 5 and the dot is off
                 when "0110" => di15 <= "00000101"; -- 6 and the dot is off
                 when "0111" => di15 <= "11110001"; -- 7 and the dot is off
                 when "1000" => di15 <= "00000001"; -- 8 and the dot is off
                 when "1001" => di15 <= "00100001"; -- 9 and the dot is off
                 when "1010" => di15 <= "00010000"; -- A and the dot is on
                 when "1011" => di15 <= "00000000"; -- B and the dot is on
                 when "1100" => di15 <= "10001100"; -- C and the dot is on
                 when "1101" => di15 <= "10000000"; -- D and the dot is on
                 when "1110" => di15 <= "00001100"; -- E and the dot is on
                 when "1111" => di15 <= "00011100"; -- F and the dot is on
                 when others => di15 <= "11111111"; -- Dark
                end case;
                end process;
					 
					 
diMap16: process(input2)
               begin
                case input2(63 downto 60) is
                 when "0000" => di16 <= "10000001"; -- 0 and the dot is off
                 when "0001" => di16 <= "11110011"; -- 1 and the dot is off
                 when "0010" => di16 <= "01001001"; -- 2 and the dot is off
                 when "0011" => di16 <= "01100001"; -- 3 and the dot is off
                 when "0100" => di16 <= "00110011"; -- 4 and the dot is off
                 when "0101" => di16 <= "00100101"; -- 5 and the dot is off
                 when "0110" => di16 <= "00000101"; -- 6 and the dot is off
                 when "0111" => di16 <= "11110001"; -- 7 and the dot is off
                 when "1000" => di16 <= "00000001"; -- 8 and the dot is off
                 when "1001" => di16 <= "00100001"; -- 9 and the dot is off
                 when "1010" => di16 <= "00010000"; -- A and the dot is on
                 when "1011" => di16 <= "00000000"; -- B and the dot is on
                 when "1100" => di16 <= "10001100"; -- C and the dot is on
                 when "1101" => di16 <= "10000000"; -- D and the dot is on
                 when "1110" => di16 <= "00001100"; -- E and the dot is on
                 when "1111" => di16 <= "00011100"; -- F and the dot is on
                 when others => di16 <= "11111111"; -- Dark
                end case;
					 end process;

digitMap1: process(Output)
     begin
      case Output(3 downto 0) is
       when "0000" => digit1 <= "10000001"; -- 0 and the dot is off
       when "0001" => digit1 <= "11110011"; -- 1 and the dot is off
       when "0010" => digit1 <= "01001001"; -- 2 and the dot is off
       when "0011" => digit1 <= "01100001"; -- 3 and the dot is off
       when "0100" => digit1 <= "00110011"; -- 4 and the dot is off
       when "0101" => digit1 <= "00100101"; -- 5 and the dot is off
       when "0110" => digit1 <= "00000101"; -- 6 and the dot is off
       when "0111" => digit1 <= "11110001"; -- 7 and the dot is off
       when "1000" => digit1 <= "00000001"; -- 8 and the dot is off
       when "1001" => digit1 <= "00100001"; -- 9 and the dot is off
       when "1010" => digit1 <= "00010000"; -- A and the dot is on
       when "1011" => digit1 <= "00000000"; -- B and the dot is on
       when "1100" => digit1 <= "10001100"; -- C and the dot is on
       when "1101" => digit1 <= "10000000"; -- D and the dot is on
       when "1110" => digit1 <= "00001100"; -- E and the dot is on
       when "1111" => digit1 <= "00011100"; -- F and the dot is on
       when others => digit1 <= "11111111"; -- Dark
      end case;
      end process;
      
digitMap2: process(Output)
       begin
        case Output(7 downto 4) is
         when "0000" => digit2 <= "10000001"; -- 0 and the dot is off
         when "0001" => digit2 <= "11110011"; -- 1 and the dot is off
         when "0010" => digit2 <= "01001001"; -- 2 and the dot is off
         when "0011" => digit2 <= "01100001"; -- 3 and the dot is off
         when "0100" => digit2 <= "00110011"; -- 4 and the dot is off
         when "0101" => digit2 <= "00100101"; -- 5 and the dot is off
         when "0110" => digit2 <= "00000101"; -- 6 and the dot is off
         when "0111" => digit2 <= "11110001"; -- 7 and the dot is off
         when "1000" => digit2 <= "00000001"; -- 8 and the dot is off
         when "1001" => digit2 <= "00100001"; -- 9 and the dot is off
         when "1010" => digit2 <= "00010000"; -- A and the dot is on
         when "1011" => digit2 <= "00000000"; -- B and the dot is on
         when "1100" => digit2 <= "10001100"; -- C and the dot is on
         when "1101" => digit2 <= "10000000"; -- D and the dot is on
         when "1110" => digit2 <= "00001100"; -- E and the dot is on
         when "1111" => digit2 <= "00011100"; -- F and the dot is on
         when others => digit2 <= "11111111"; -- Dark
        end case;
        end process;
        
digitMap3: process(Output)
           begin
            case Output(11 downto 8) is
             when "0000" => digit3 <= "10000001"; -- 0 and the dot is off
             when "0001" => digit3 <= "11110011"; -- 1 and the dot is off
             when "0010" => digit3 <= "01001001"; -- 2 and the dot is off
             when "0011" => digit3 <= "01100001"; -- 3 and the dot is off
             when "0100" => digit3 <= "00110011"; -- 4 and the dot is off
             when "0101" => digit3 <= "00100101"; -- 5 and the dot is off
             when "0110" => digit3 <= "00000101"; -- 6 and the dot is off
             when "0111" => digit3 <= "11110001"; -- 7 and the dot is off
             when "1000" => digit3 <= "00000001"; -- 8 and the dot is off
             when "1001" => digit3 <= "00100001"; -- 9 and the dot is off
             when "1010" => digit3 <= "00010000"; -- A and the dot is on
             when "1011" => digit3 <= "00000000"; -- B and the dot is on
             when "1100" => digit3 <= "10001100"; -- C and the dot is on
             when "1101" => digit3 <= "10000000"; -- D and the dot is on
             when "1110" => digit3 <= "00001100"; -- E and the dot is on
             when "1111" => digit3 <= "00011100"; -- F and the dot is on
             when others => digit3 <= "11111111"; -- Dark
            end case;
            end process;
           
digitMap4: process(Output)
               begin
                case Output(15 downto 12) is
                 when "0000" => digit4 <= "10000001"; -- 0 and the dot is off
                 when "0001" => digit4 <= "11110011"; -- 1 and the dot is off
                 when "0010" => digit4 <= "01001001"; -- 2 and the dot is off
                 when "0011" => digit4 <= "01100001"; -- 3 and the dot is off
                 when "0100" => digit4 <= "00110011"; -- 4 and the dot is off
                 when "0101" => digit4 <= "00100101"; -- 5 and the dot is off
                 when "0110" => digit4 <= "00000101"; -- 6 and the dot is off
                 when "0111" => digit4 <= "11110001"; -- 7 and the dot is off
                 when "1000" => digit4 <= "00000001"; -- 8 and the dot is off
                 when "1001" => digit4 <= "00100001"; -- 9 and the dot is off
                 when "1010" => digit4 <= "00010000"; -- A and the dot is on
                 when "1011" => digit4 <= "00000000"; -- B and the dot is on
                 when "1100" => digit4 <= "10001100"; -- C and the dot is on
                 when "1101" => digit4 <= "10000000"; -- D and the dot is on
                 when "1110" => digit4 <= "00001100"; -- E and the dot is on
                 when "1111" => digit4 <= "00011100"; -- F and the dot is on
                 when others => digit4 <= "11111111"; -- Dark
                end case;
                end process;
					 
digitMap5: process(Output)
               begin
                case Output(19 downto 16) is
                 when "0000" => digit5 <= "10000001"; -- 0 and the dot is off
                 when "0001" => digit5 <= "11110011"; -- 1 and the dot is off
                 when "0010" => digit5 <= "01001001"; -- 2 and the dot is off
                 when "0011" => digit5 <= "01100001"; -- 3 and the dot is off
                 when "0100" => digit5 <= "00110011"; -- 4 and the dot is off
                 when "0101" => digit5 <= "00100101"; -- 5 and the dot is off
                 when "0110" => digit5 <= "00000101"; -- 6 and the dot is off
                 when "0111" => digit5 <= "11110001"; -- 7 and the dot is off
                 when "1000" => digit5 <= "00000001"; -- 8 and the dot is off
                 when "1001" => digit5 <= "00100001"; -- 9 and the dot is off
                 when "1010" => digit5 <= "00010000"; -- A and the dot is on
                 when "1011" => digit5 <= "00000000"; -- B and the dot is on
                 when "1100" => digit5 <= "10001100"; -- C and the dot is on
                 when "1101" => digit5 <= "10000000"; -- D and the dot is on
                 when "1110" => digit5 <= "00001100"; -- E and the dot is on
                 when "1111" => digit5 <= "00011100"; -- F and the dot is on
                 when others => digit5 <= "11111111"; -- Dark
                end case;
                end process;
					 
digitMap6: process(Output)
               begin
                case Output(23 downto 20) is
                 when "0000" => digit6 <= "10000001"; -- 0 and the dot is off
                 when "0001" => digit6 <= "11110011"; -- 1 and the dot is off
                 when "0010" => digit6 <= "01001001"; -- 2 and the dot is off
                 when "0011" => digit6 <= "01100001"; -- 3 and the dot is off
                 when "0100" => digit6 <= "00110011"; -- 4 and the dot is off
                 when "0101" => digit6 <= "00100101"; -- 5 and the dot is off
                 when "0110" => digit6 <= "00000101"; -- 6 and the dot is off
                 when "0111" => digit6 <= "11110001"; -- 7 and the dot is off
                 when "1000" => digit6 <= "00000001"; -- 8 and the dot is off
                 when "1001" => digit6 <= "00100001"; -- 9 and the dot is off
                 when "1010" => digit6 <= "00010000"; -- A and the dot is on
                 when "1011" => digit6 <= "00000000"; -- B and the dot is on
                 when "1100" => digit6 <= "10001100"; -- C and the dot is on
                 when "1101" => digit6 <= "10000000"; -- D and the dot is on
                 when "1110" => digit6 <= "00001100"; -- E and the dot is on
                 when "1111" => digit6 <= "00011100"; -- F and the dot is on
                 when others => digit6 <= "11111111"; -- Dark
                end case;
                end process;
					 
digitMap7: process(Output)
               begin
                case Output(27 downto 24) is
                 when "0000" => digit7 <= "10000001"; -- 0 and the dot is off
                 when "0001" => digit7 <= "11110011"; -- 1 and the dot is off
                 when "0010" => digit7 <= "01001001"; -- 2 and the dot is off
                 when "0011" => digit7 <= "01100001"; -- 3 and the dot is off
                 when "0100" => digit7 <= "00110011"; -- 4 and the dot is off
                 when "0101" => digit7 <= "00100101"; -- 5 and the dot is off
                 when "0110" => digit7 <= "00000101"; -- 6 and the dot is off
                 when "0111" => digit7 <= "11110001"; -- 7 and the dot is off
                 when "1000" => digit7 <= "00000001"; -- 8 and the dot is off
                 when "1001" => digit7 <= "00100001"; -- 9 and the dot is off
                 when "1010" => digit7 <= "00010000"; -- A and the dot is on
                 when "1011" => digit7 <= "00000000"; -- B and the dot is on
                 when "1100" => digit7 <= "10001100"; -- C and the dot is on
                 when "1101" => digit7 <= "10000000"; -- D and the dot is on
                 when "1110" => digit7 <= "00001100"; -- E and the dot is on
                 when "1111" => digit7 <= "00011100"; -- F and the dot is on
                 when others => digit7 <= "11111111"; -- Dark
                end case;
                end process;
					 
					 
digitMap8: process(Output)
               begin
                case Output(31 downto 28) is
                 when "0000" => digit8 <= "10000001"; -- 0 and the dot is off
                 when "0001" => digit8 <= "11110011"; -- 1 and the dot is off
                 when "0010" => digit8 <= "01001001"; -- 2 and the dot is off
                 when "0011" => digit8 <= "01100001"; -- 3 and the dot is off
                 when "0100" => digit8 <= "00110011"; -- 4 and the dot is off
                 when "0101" => digit8 <= "00100101"; -- 5 and the dot is off
                 when "0110" => digit8 <= "00000101"; -- 6 and the dot is off
                 when "0111" => digit8 <= "11110001"; -- 7 and the dot is off
                 when "1000" => digit8 <= "00000001"; -- 8 and the dot is off
                 when "1001" => digit8 <= "00100001"; -- 9 and the dot is off
                 when "1010" => digit8 <= "00010000"; -- A and the dot is on
                 when "1011" => digit8 <= "00000000"; -- B and the dot is on
                 when "1100" => digit8 <= "10001100"; -- C and the dot is on
                 when "1101" => digit8 <= "10000000"; -- D and the dot is on
                 when "1110" => digit8 <= "00001100"; -- E and the dot is on
                 when "1111" => digit8 <= "00011100"; -- F and the dot is on
                 when others => digit8 <= "11111111"; -- Dark
                end case;
                end process;

digitMap9: process(output)
     begin
      case output(35 downto 32) is
       when "0000" => digit9 <= "10000001"; -- 0 and the dot is off
       when "0001" => digit9 <= "11110011"; -- 1 and the dot is off
       when "0010" => digit9 <= "01001001"; -- 2 and the dot is off
       when "0011" => digit9 <= "01100001"; -- 3 and the dot is off
       when "0100" => digit9 <= "00110011"; -- 4 and the dot is off
       when "0101" => digit9 <= "00100101"; -- 5 and the dot is off
       when "0110" => digit9 <= "00000101"; -- 6 and the dot is off
       when "0111" => digit9 <= "11110001"; -- 7 and the dot is off
       when "1000" => digit9 <= "00000001"; -- 8 and the dot is off
       when "1001" => digit9 <= "00100001"; -- 9 and the dot is off
       when "1010" => digit9 <= "00010000"; -- A and the dot is on
       when "1011" => digit9 <= "00000000"; -- B and the dot is on
       when "1100" => digit9 <= "10001100"; -- C and the dot is on
       when "1101" => digit9 <= "10000000"; -- D and the dot is on
       when "1110" => digit9 <= "00001100"; -- E and the dot is on
       when "1111" => digit9 <= "00011100"; -- F and the dot is on
       when others => digit9 <= "11111111"; -- Dark
      end case;
      end process;
      
digitMap10: process(output)
       begin
        case output(39 downto 36) is
         when "0000" => digit10 <= "10000001"; -- 0 and the dot is off
         when "0001" => digit10 <= "11110011"; -- 1 and the dot is off
         when "0010" => digit10 <= "01001001"; -- 2 and the dot is off
         when "0011" => digit10 <= "01100001"; -- 3 and the dot is off
         when "0100" => digit10 <= "00110011"; -- 4 and the dot is off
         when "0101" => digit10 <= "00100101"; -- 5 and the dot is off
         when "0110" => digit10 <= "00000101"; -- 6 and the dot is off
         when "0111" => digit10 <= "11110001"; -- 7 and the dot is off
         when "1000" => digit10 <= "00000001"; -- 8 and the dot is off
         when "1001" => digit10 <= "00100001"; -- 9 and the dot is off
         when "1010" => digit10 <= "00010000"; -- A and the dot is on
         when "1011" => digit10 <= "00000000"; -- B and the dot is on
         when "1100" => digit10 <= "10001100"; -- C and the dot is on
         when "1101" => digit10 <= "10000000"; -- D and the dot is on
         when "1110" => digit10 <= "00001100"; -- E and the dot is on
         when "1111" => digit10 <= "00011100"; -- F and the dot is on
         when others => digit10 <= "11111111"; -- Dark
        end case;
        end process;
        
digitMap11: process(output)
           begin
            case output(43 downto 40) is
             when "0000" => digit11 <= "10000001"; -- 0 and the dot is off
             when "0001" => digit11 <= "11110011"; -- 1 and the dot is off
             when "0010" => digit11 <= "01001001"; -- 2 and the dot is off
             when "0011" => digit11 <= "01100001"; -- 3 and the dot is off
             when "0100" => digit11 <= "00110011"; -- 4 and the dot is off
             when "0101" => digit11 <= "00100101"; -- 5 and the dot is off
             when "0110" => digit11<= "00000101"; -- 6 and the dot is off
             when "0111" => digit11<= "11110001"; -- 7 and the dot is off
             when "1000" => digit11<= "00000001"; -- 8 and the dot is off
             when "1001" => digit11<= "00100001"; -- 9 and the dot is off
             when "1010" => digit11<= "00010000"; -- A and the dot is on
             when "1011" => digit11<= "00000000"; -- B and the dot is on
             when "1100" => digit11<= "10001100"; -- C and the dot is on
             when "1101" => digit11<= "10000000"; -- D and the dot is on
             when "1110" => digit11<= "00001100"; -- E and the dot is on
             when "1111" => digit11<= "00011100"; -- F and the dot is on
             when others => digit11<= "11111111"; -- Dark
            end case;
            end process;
           
digitMap12: process(output)
               begin
                case output(47 downto 44 ) is
                 when "0000" => digit12 <= "10000001"; -- 0 and the dot is off
                 when "0001" => digit12 <= "11110011"; -- 1 and the dot is off
                 when "0010" => digit12 <= "01001001"; -- 2 and the dot is off
                 when "0011" => digit12 <= "01100001"; -- 3 and the dot is off
                 when "0100" => digit12 <= "00110011"; -- 4 and the dot is off
                 when "0101" => digit12 <= "00100101"; -- 5 and the dot is off
                 when "0110" => digit12 <= "00000101"; -- 6 and the dot is off
                 when "0111" => digit12 <= "11110001"; -- 7 and the dot is off
                 when "1000" => digit12 <= "00000001"; -- 8 and the dot is off
                 when "1001" => digit12 <= "00100001"; -- 9 and the dot is off
                 when "1010" => digit12 <= "00010000"; -- A and the dot is on
                 when "1011" => digit12 <= "00000000"; -- B and the dot is on
                 when "1100" => digit12 <= "10001100"; -- C and the dot is on
                 when "1101" => digit12 <= "10000000"; -- D and the dot is on
                 when "1110" => digit12 <= "00001100"; -- E and the dot is on
                 when "1111" => digit12 <= "00011100"; -- F and the dot is on
                 when others => digit12 <= "11111111"; -- Dark
                end case;
                end process;
					 
digitMap13: process(output)
               begin
                case output(51 downto 48) is
                 when "0000" => digit13 <= "10000001"; -- 0 and the dot is off
                 when "0001" => digit13 <= "11110011"; -- 1 and the dot is off
                 when "0010" => digit13 <= "01001001"; -- 2 and the dot is off
                 when "0011" => digit13 <= "01100001"; -- 3 and the dot is off
                 when "0100" => digit13 <= "00110011"; -- 4 and the dot is off
                 when "0101" => digit13 <= "00100101"; -- 5 and the dot is off
                 when "0110" => digit13 <= "00000101"; -- 6 and the dot is off
                 when "0111" => digit13 <= "11110001"; -- 7 and the dot is off
                 when "1000" => digit13 <= "00000001"; -- 8 and the dot is off
                 when "1001" => digit13 <= "00100001"; -- 9 and the dot is off
                 when "1010" => digit13 <= "00010000"; -- A and the dot is on
                 when "1011" => digit13 <= "00000000"; -- B and the dot is on
                 when "1100" => digit13 <= "10001100"; -- C and the dot is on
                 when "1101" => digit13 <= "10000000"; -- D and the dot is on
                 when "1110" => digit13 <= "00001100"; -- E and the dot is on
                 when "1111" => digit13 <= "00011100"; -- F and the dot is on
                 when others => digit13 <= "11111111"; -- Dark
                end case;
                end process;
					 
digitMap14: process(output)
               begin
                case output(55 downto 52) is
                 when "0000" => digit14 <= "10000001"; -- 0 and the dot is off
                 when "0001" => digit14 <= "11110011"; -- 1 and the dot is off
                 when "0010" => digit14 <= "01001001"; -- 2 and the dot is off
                 when "0011" => digit14 <= "01100001"; -- 3 and the dot is off
                 when "0100" => digit14 <= "00110011"; -- 4 and the dot is off
                 when "0101" => digit14 <= "00100101"; -- 5 and the dot is off
                 when "0110" => digit14 <= "00000101"; -- 6 and the dot is off
                 when "0111" => digit14 <= "11110001"; -- 7 and the dot is off
                 when "1000" => digit14 <= "00000001"; -- 8 and the dot is off
                 when "1001" => digit14 <= "00100001"; -- 9 and the dot is off
                 when "1010" => digit14 <= "00010000"; -- A and the dot is on
                 when "1011" => digit14 <= "00000000"; -- B and the dot is on
                 when "1100" => digit14 <= "10001100"; -- C and the dot is on
                 when "1101" => digit14 <= "10000000"; -- D and the dot is on
                 when "1110" => digit14 <= "00001100"; -- E and the dot is on
                 when "1111" => digit14 <= "00011100"; -- F and the dot is on
                 when others => digit14 <= "11111111"; -- Dark
                end case;
                end process;
					 
digitMap15: process(output)
               begin
                case output(59 downto 56) is
                 when "0000" => digit15 <= "10000001"; -- 0 and the dot is off
                 when "0001" => digit15 <= "11110011"; -- 1 and the dot is off
                 when "0010" => digit15 <= "01001001"; -- 2 and the dot is off
                 when "0011" => digit15 <= "01100001"; -- 3 and the dot is off
                 when "0100" => digit15 <= "00110011"; -- 4 and the dot is off
                 when "0101" => digit15 <= "00100101"; -- 5 and the dot is off
                 when "0110" => digit15 <= "00000101"; -- 6 and the dot is off
                 when "0111" => digit15 <= "11110001"; -- 7 and the dot is off
                 when "1000" => digit15 <= "00000001"; -- 8 and the dot is off
                 when "1001" => digit15 <= "00100001"; -- 9 and the dot is off
                 when "1010" => digit15 <= "00010000"; -- A and the dot is on
                 when "1011" => digit15 <= "00000000"; -- B and the dot is on
                 when "1100" => digit15 <= "10001100"; -- C and the dot is on
                 when "1101" => digit15 <= "10000000"; -- D and the dot is on
                 when "1110" => digit15 <= "00001100"; -- E and the dot is on
                 when "1111" => digit15 <= "00011100"; -- F and the dot is on
                 when others => digit15 <= "11111111"; -- Dark
                end case;
                end process;
					 
					 
digitMap16: process(output)
               begin
                case output(63 downto 60) is
                 when "0000" => digit16 <= "10000001"; -- 0 and the dot is off
                 when "0001" => digit16 <= "11110011"; -- 1 and the dot is off
                 when "0010" => digit16 <= "01001001"; -- 2 and the dot is off
                 when "0011" => digit16 <= "01100001"; -- 3 and the dot is off
                 when "0100" => digit16 <= "00110011"; -- 4 and the dot is off
                 when "0101" => digit16 <= "00100101"; -- 5 and the dot is off
                 when "0110" => digit16 <= "00000101"; -- 6 and the dot is off
                 when "0111" => digit16 <= "11110001"; -- 7 and the dot is off
                 when "1000" => digit16 <= "00000001"; -- 8 and the dot is off
                 when "1001" => digit16 <= "00100001"; -- 9 and the dot is off
                 when "1010" => digit16 <= "00010000"; -- A and the dot is on
                 when "1011" => digit16 <= "00000000"; -- B and the dot is on
                 when "1100" => digit16 <= "10001100"; -- C and the dot is on
                 when "1101" => digit16 <= "10000000"; -- D and the dot is on
                 when "1110" => digit16 <= "00001100"; -- E and the dot is on
                 when "1111" => digit16 <= "00011100"; -- F and the dot is on
                 when others => digit16 <= "11111111"; -- Dark
                end case;
                end process;
					 
activateAnode: process(clk,rst)
   begin 
       if(rst = '1') then 
       an_sig <= "11111110";            
       elsif(clk'event and clk='1') then                 
        if(counter = 0) then  
       an_sig(7 downto 0)<= an_sig(6 downto 0)& an_sig(7);
       end if; 
       end if; 
       end process;
	
counter_inc: process(clk, rst)   
             begin          
           if(rst = '1') then                
             counter<= (others => '0');          
           elsif(clk'event and clk='1') then                 
             counter <= counter + '1';           
            end if;   
            end process;

pickDigit: process(clk, rst)  
           begin    
            if(rst = '1') then                  
            seg <= (others=>'1');    
            dp<= '1'; 
          elsif(clk'event and clk='1') then 	
             if(input_output="00")then 
				      if(displaybit="00")then
				      case an_sig(7 downto 0) is             
                  when "11111110" => seg <= dig1(7 downto 1); dp <= dig1(0);             
                  when "11111101" => seg <= dig2(7 downto 1); dp <= dig2(0);     
                  when "11111011" => seg <= dig3(7 downto 1); dp <= dig3(0);             
                  when "11110111" => seg <= dig4(7 downto 1); dp <= dig4(0);
                  when "11101111" => seg <= dig5(7 downto 1); dp <= dig5(0);	
						when "11011111" => seg <= dig6(7 downto 1); dp <= dig6(0);
						when "10111111" => seg <= dig7(7 downto 1); dp <= dig7(0);
						when "01111111" => seg <= dig8(7 downto 1); dp <= dig8(0);
                  when others => seg <= "1111111"; dp <= '1';  -- Dark and the dot is off           
                  end case;	
                  elsif(displaybit="01")then	
                  case an_sig(7 downto 0) is             
                  when "11111110" => seg <= dig9(7 downto 1); dp <= dig9(0);             
                  when "11111101" => seg <= dig10(7 downto 1); dp <= dig10(0);     
                  when "11111011" => seg <= dig11(7 downto 1); dp <= dig11(0);             
                  when "11110111" => seg <= dig12(7 downto 1); dp <= dig12(0);
                  when "11101111" => seg <= dig13(7 downto 1); dp <= dig13(0);	
						when "11011111" => seg <= dig14(7 downto 1); dp <= dig14(0);
						when "10111111" => seg <= dig15(7 downto 1); dp <= dig15(0);
						when "01111111" => seg <= dig16(7 downto 1); dp <= dig16(0);
                  when others => seg <= "1111111"; dp <= '1';  -- Dark and the dot is off           
                  end case;
						elsif(displaybit="10") then
						case an_sig(7 downto 0) is             
                  when "11111110" => seg <= dig17(7 downto 1); dp <= dig9(0);             
                  when "11111101" => seg <= dig18(7 downto 1); dp <= dig10(0);     
                  when "11111011" => seg <= dig19(7 downto 1); dp <= dig11(0);             
                  when "11110111" => seg <= dig20(7 downto 1); dp <= dig12(0);
                  when "11101111" => seg <= dig21(7 downto 1); dp <= dig13(0);	
						when "11011111" => seg <= dig22(7 downto 1); dp <= dig14(0);
						when "10111111" => seg <= dig23(7 downto 1); dp <= dig15(0);
						when "01111111" => seg <= dig24(7 downto 1); dp <= dig16(0);
                  when others => seg <= "1111111"; dp <= '1';  -- Dark and the dot is off           
                  end case;
						else 
						case an_sig(7 downto 0) is             
                  when "11111110" => seg <= dig25(7 downto 1); dp <= dig9(0);             
                  when "11111101" => seg <= dig26(7 downto 1); dp <= dig10(0);     
                  when "11111011" => seg <= dig27(7 downto 1); dp <= dig11(0);             
                  when "11110111" => seg <= dig28(7 downto 1); dp <= dig12(0);
                  when "11101111" => seg <= dig29(7 downto 1); dp <= dig13(0);	
						when "11011111" => seg <= dig30(7 downto 1); dp <= dig14(0);
						when "10111111" => seg <= dig31(7 downto 1); dp <= dig15(0);
						when "01111111" => seg <= dig32(7 downto 1); dp <= dig16(0);
                  when others => seg <= "1111111"; dp <= '1';  -- Dark and the dot is off     
                  end case;						
					   end if;
				elsif(input_output="01")then 
					  if(displaybit="00")then
					  case an_sig(7 downto 0) is             
                  when "11111110" => seg <= di1(7 downto 1); dp <= di1(0);             
                  when "11111101" => seg <= di2(7 downto 1); dp <= di2(0);     
                  when "11111011" => seg <= di3(7 downto 1); dp <= di3(0);             
                  when "11110111" => seg <= di4(7 downto 1); dp <= di4(0);
                  when "11101111" => seg <= di5(7 downto 1); dp <= di5(0);	
						when "11011111" => seg <= di6(7 downto 1); dp <= di6(0);
						when "10111111" => seg <= di7(7 downto 1); dp <= di7(0);
						when "01111111" => seg <= di8(7 downto 1); dp <= di8(0);
                  when others => seg <= "1111111"; dp <= '1';  -- Dark and the dot is off           
                  end case;
                  else
                  case an_sig(7 downto 0) is             
                  when "11111110" => seg <= di9(7 downto 1); dp <= di9(0);             
                  when "11111101" => seg <= di10(7 downto 1); dp <= di10(0);     
                  when "11111011" => seg <= di11(7 downto 1); dp <= di11(0);             
                  when "11110111" => seg <= di12(7 downto 1); dp <= di12(0);
                  when "11101111" => seg <= di13(7 downto 1); dp <= di13(0);	
						when "11011111" => seg <= di14(7 downto 1); dp <= di14(0);
						when "10111111" => seg <= di15(7 downto 1); dp <= di15(0);
						when "01111111" => seg <= di16(7 downto 1); dp <= di16(0);
                  when others => seg <= "1111111"; dp <= '1';  -- Dark and the dot is off           
                  end case;	
                 end if;
				else 
				  if(displaybit="00")then
					case an_sig(7 downto 0) is             
                  when "11111110" => seg <= digit1(7 downto 1); dp <= digit1(0);             
                  when "11111101" => seg <= digit2(7 downto 1); dp <= digit2(0);     
                  when "11111011" => seg <= digit3(7 downto 1); dp <= digit3(0);             
                  when "11110111" => seg <= digit4(7 downto 1); dp <= digit4(0);
                  when "11101111" => seg <= digit5(7 downto 1); dp <= digit5(0);	
						when "11011111" => seg <= digit6(7 downto 1); dp <= digit6(0);
						when "10111111" => seg <= digit7(7 downto 1); dp <= digit7(0);
						when "01111111" => seg <= digit8(7 downto 1); dp <= digit8(0);
                  when others => seg <= "1111111"; dp <= '1';  -- Dark and the dot is off           
                  end case;
                  else
                  case an_sig(7 downto 0) is             
                  when "11111110" => seg <= digit9(7 downto 1); dp <= digit9(0);             
                  when "11111101" => seg <= digit10(7 downto 1); dp <= digit10(0);     
                  when "11111011" => seg <= digit11(7 downto 1); dp <= digit11(0);             
                  when "11110111" => seg <= digit12(7 downto 1); dp <= digit12(0);
                  when "11101111" => seg <= digit13(7 downto 1); dp <= digit13(0);	
						when "11011111" => seg <= digit14(7 downto 1); dp <= digit14(0);
						when "10111111" => seg <= digit15(7 downto 1); dp <= digit15(0);
						when "01111111" => seg <= digit16(7 downto 1); dp <= digit16(0);
                  when others => seg <= "1111111"; dp <= '1';  -- Dark and the dot is off           
                  end case;	
                 end if;
       		end if;
           end if;
         end process;			  

end Behavioral;

