----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:12:21 02/22/2009 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( avect : in  STD_LOGIC_VECTOR(3 downto 0);
           bvect : in  STD_LOGIC_VECTOR(3 downto 0);
           carryin : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           carryout : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR(3 downto 0));
end alu;

architecture Behavioral of alu is


component FullAdderVector
Port ( avect : in  STD_LOGIC_VECTOR(3 downto 0);
           bvect : in  STD_LOGIC_VECTOR(3 downto 0);
           carryin : in  STD_LOGIC;
           carryout : out  STD_LOGIC;
           sumvect : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component submux
		Port ( bvect : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC;
           bvectsum : out  STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
signal bvectsum : STD_LOGIC_VECTOR(3 downto 0);	

begin



SubMux1: submux port map (bvect, sel, bvectsum); 
X1: FullAdderVector port map (avect, bvectsum, carryin, carryout, sum);



end Behavioral;

