----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:39:10 04/15/2009 
-- Design Name: 
-- Module Name:    ccandaluadd - Behavioral 
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

entity ccandaluadd is
    Port ( finaladdop : in STD_LOGIC;
			  finaladdenable : in STD_LOGIC;
			  ccinfourbit : in  STD_LOGIC_VECTOR(3 downto 0);
           aluoutfourbit : in  STD_LOGIC_VECTOR(3 downto 0);
           finalout : out  STD_LOGIC_VECTOR(3 downto 0));
end ccandaluadd;

architecture Behavioral of ccandaluadd is

begin

process (finaladdenable, finaladdop)
begin 
if (finaladdenable = '1') then

	if (finaladdop = '0') then

		finalout <= ccinfourbit + aluoutfourbit;
		
	elsif (finaladdop = '1') then
		finalout <= aluoutfourbit - ccinfourbit;
		
		end if;
	
 
 end if;
 end process;

end Behavioral;

