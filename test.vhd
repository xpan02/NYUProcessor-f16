--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:06:12 12/08/2016
-- Design Name:   
-- Module Name:   C:/NYU VHDL/NYU_6463_Processor/test.vhd
-- Project Name:  NYU_6463_Processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cpu
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
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cpu
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         sel : IN  std_logic;
         skey : IN  std_logic_vector(127 downto 0);
         din : IN  std_logic_vector(63 downto 0);
			valid: IN std_logic;
         dout : OUT  std_logic_vector(63 downto 0);
         data_vld : OUT  std_logic;
         instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic ;
   signal reset : std_logic ;
   signal sel : std_logic ;
   signal skey : std_logic_vector(127 downto 0) ;
   signal din : std_logic_vector(63 downto 0) ;
	signal valid:std_logic;

 	--Outputs
   signal dout : std_logic_vector(63 downto 0);
   signal data_vld : std_logic;
   signal instruction : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cpu PORT MAP (
          clk => clk,
          reset => reset,
          sel => sel,
          skey => skey,
          din => din,
			 valid=>valid,
          dout => dout,
          data_vld => data_vld,
          instruction => instruction
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   rst_process :process
   begin
		reset <= '1';
		wait for 2ns;
		reset<= '0';
		wait ;
   end process;
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		skey<=x"00000000000000000000000000000001";
      wait ;	
	end process;
 	valid_process :process
   begin
		valid <= '0';
		wait for 10ns;
		valid<= '1';
		wait ;
   end process;

    
   
	proc2: process
   begin		
      -- hold reset state for 100 ns.
		sel<='0';
      wait ;	
		

    
   end process;
	proc: process
   begin		
      -- hold reset state for 100 ns.
		din<=x"0000000000000002";
      wait ;	
		

    
   end process;
	
	

END;
