----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:43:08 02/02/2009 
-- Design Name: 
-- Module Name:    FullAdder - Behavioral 
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

entity FullAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           sum : out  STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is

component HalfAdder
	 Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
			end component;

component ORGate
		Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cout : out  STD_LOGIC);
			end component;
			
signal siga, sigb, sigc : STD_LOGIC;

begin

X1: HalfAdder port map (a,b, siga, sigb);
X2: HalfAdder port map (siga, cin, sum, sigc);
OR1: ORGate port map (sigc, sigb, cout);

end Behavioral;

