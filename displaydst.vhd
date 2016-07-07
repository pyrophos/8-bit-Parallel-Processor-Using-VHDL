----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:58:44 04/15/2009 
-- Design Name: 
-- Module Name:    displaydst - Behavioral 
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

entity displaydst is
    Port ( dstdatain : in  STD_LOGIC_VECTOR(3 downto 0);
           displayenable : in  STD_LOGIC;
           dataout : out  STD_LOGIC_VECTOR(3 downto 0));
end displaydst;

architecture Behavioral of displaydst is

begin

process (displayenable)
begin

if (displayenable = '1') then

	dataout <= dstdatain;
	
elsif (displayenable = '0') then

	dataout <= "0000";
	
end if;

end process;	


end Behavioral;

