----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:10:08 04/15/2009 
-- Design Name: 
-- Module Name:    dstselector - Behavioral 
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

entity dstselector is
    Port ( dstdatain : in  STD_LOGIC_VECTOR(3 downto 0);
           dataout : out  STD_LOGIC_VECTOR(3 downto 0);
           enable : in  STD_LOGIC);
end dstselector;

architecture Behavioral of dstselector is

begin

process (enable)
begin

if (enable = '0') then
	dataout <= dstdatain;
	
elsif (enable = '1') then

	dataout <= "0000";
	
	end if;
	
	end process;


end Behavioral;

