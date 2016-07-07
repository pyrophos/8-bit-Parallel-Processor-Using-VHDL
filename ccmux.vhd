----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:21:31 04/15/2009 
-- Design Name: 
-- Module Name:    ccmux - Behavioral 
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

entity ccmux is
    Port ( ccmuxenable : in STD_LOGIC;
			  ccin : in  STD_LOGIC_VECTOR(1 downto 0);
           cinalu : in  STD_LOGIC;
           cout : out  STD_LOGIC_VECTOR(3 downto 0));
end ccmux;

architecture Behavioral of ccmux is

begin

process (ccin, cinalu, ccmuxenable)
begin
if (ccmuxenable = '1') then

if (ccin = "00") then
		cout <= "0000";
	elsif (ccin = "01") then
		cout <= "0001";
	elsif (ccin = "10") then
		cout <= "000" & cinalu;	
	elsif (ccin = "11") then
		cout <= "000" & (not cinalu);
	end if;
end if;

end process;
end Behavioral;

