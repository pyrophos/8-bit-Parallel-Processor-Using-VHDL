
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:27:18 04/15/2009
-- Design Name:   ccmux
-- Module Name:   ccmuxtest.vhd
-- Project Name:  firsttest1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ccmux
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

ENTITY ccmuxtest_vhd IS
END ccmuxtest_vhd;

ARCHITECTURE behavior OF ccmuxtest_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT ccmux
	PORT(
		ccin : IN std_logic_vector(1 downto 0);
		cinalu : IN std_logic;          
		cout : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL cinalu :  std_logic := '0';
	SIGNAL ccin :  std_logic_vector(1 downto 0) := (others=>'0');

	--Outputs
	SIGNAL cout :  std_logic_vector(3 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: ccmux PORT MAP(
		ccin => ccin,
		cinalu => cinalu,
		cout => cout
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 50 ns;
		
		cinalu <= '0';
		wait for 50ns;
		ccin <= "00";
		wait for 50ns;
		ccin <= "01";
		wait for 50ns;
		ccin <= "10";
		wait for 50ns;
		ccin <= "11";
		wait for 50ns;
		ccin <= "00";
		
		
		wait for 100ns;
		cinalu <= '1';
		wait for 50ns;
		ccin <= "00";
		wait for 50ns;
		ccin <= "01";
		wait for 50ns;
		ccin <= "10";
		wait for 50ns;
		ccin <= "11";

		-- Place stimulus here

		wait; -- will wait forever
	END PROCESS;

END;
