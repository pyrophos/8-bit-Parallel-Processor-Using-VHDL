
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:23:08 04/15/2009
-- Design Name:   ccandaluadd
-- Module Name:   finaladdtestbench.vhd
-- Project Name:  firsttest1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ccandaluadd
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
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY finaladdtestbench_vhd IS
END finaladdtestbench_vhd;

ARCHITECTURE behavior OF finaladdtestbench_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT ccandaluadd
	PORT(
		finaladdenable : IN std_logic;
		ccinfourbit : IN std_logic_vector(3 downto 0);
		aluoutfourbit : IN std_logic_vector(3 downto 0);          
		finalout : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL finaladdenable :  std_logic := '0';
	SIGNAL ccinfourbit :  std_logic_vector(3 downto 0) := (others=>'0');
	SIGNAL aluoutfourbit :  std_logic_vector(3 downto 0) := (others=>'0');

	--Outputs
	SIGNAL finalout :  std_logic_vector(3 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: ccandaluadd PORT MAP(
		finaladdenable => finaladdenable,
		ccinfourbit => ccinfourbit,
		aluoutfourbit => aluoutfourbit,
		finalout => finalout
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;
		
		
		finaladdenable <= '1';
		
		wait for 50ns;
		
		ccinfourbit <= "1010";
		-- Place stimulus here

		wait; -- will wait forever
	END PROCESS;

END;
