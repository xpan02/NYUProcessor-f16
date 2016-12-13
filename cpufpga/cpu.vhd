--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:04:31 12/08/2016
-- Design Name:   
-- Module Name:   C:/NYU VHDL/cpufpga/cpu.vhd
-- Project Name:  cpufpga
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cpufpga
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY cpu IS
END cpu;
 
ARCHITECTURE behavior OF cpu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cpufpga
    PORT(
         led : OUT  std_logic_vector(15 downto 0);
         seg : OUT  std_logic_vector(6 downto 0);
         dp : OUT  std_logic;
         an : OUT  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         sw : IN  std_logic_vector(15 downto 0);
         btnC : IN  std_logic;
         btnR : IN  std_logic;
         btnL : IN  std_logic;
         btnU : IN  std_logic;
         btnD : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal sw : std_logic_vector(15 downto 0) := (others => '0');
   signal btnC : std_logic := '0';
   signal btnR : std_logic := '0';
   signal btnL : std_logic := '0';
   signal btnU : std_logic := '0';
   signal btnD : std_logic := '0';

 	--Outputs
   signal led : std_logic_vector(15 downto 0);
   signal seg : std_logic_vector(6 downto 0);
   signal dp : std_logic;
   signal an : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cpufpga PORT MAP (
          led => led,
          seg => seg,
          dp => dp,
          an => an,
          clk => clk,
          sw => sw,
          btnC => btnC,
          btnR => btnR,
          btnL => btnL,
          btnU => btnU,
          btnD => btnD
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
