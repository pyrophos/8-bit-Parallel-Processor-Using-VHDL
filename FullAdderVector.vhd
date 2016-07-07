----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:55:29 02/22/2009 
-- Design Name: 
-- Module Name:    FullAdderVector - Behavioral 
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

entity FullAdderVector is
    Port ( avect : in  STD_LOGIC_VECTOR(3 downto 0);
           bvect : in  STD_LOGIC_VECTOR(3 downto 0);
           carryin : in  STD_LOGIC;
           carryout : out  STD_LOGIC;
           sumvect : out  STD_LOGIC_VECTOR(3 downto 0));
end FullAdderVector;

architecture Behavioral of FullAdderVector is

component FullAdder
 Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           sum : out  STD_LOGIC);
			  end component;
			  
signal sigc1, sigc2, sigc3 : STD_LOGIC;

begin

X1: FullAdder port map (avect(0), bvect(0), carryin, sigc1, sumvect(0));
X2: FullAdder port map (avect(1), bvect(1), sigc1, sigc2, sumvect(1));
X3: FullAdder port map (avect(2), bvect(2), sigc2, sigc3, sumvect(2));
X4: FullAdder port map (avect(3), bvect(3), sigc3, carryout, sumvect(3));


end Behavioral;

