----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:08:56 03/09/2009 
-- Design Name: 
-- Module Name:    srcmux - Behavioral 
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

entity srcmux is
    Port ( reg0 : in  STD_LOGIC_VECTOR(3 downto 0);
           reg1 : in  STD_LOGIC_VECTOR(3 downto 0);
           reg2 : in  STD_LOGIC_VECTOR(3 downto 0);
           reg3 : in  STD_LOGIC_VECTOR(3 downto 0);
           sel : in  STD_LOGIC_VECTOR(1 downto 0);
			  enable : in  STD_LOGIC;
           srcreg : out  STD_LOGIC_VECTOR(3 downto 0));
end srcmux;

architecture Behavioral of srcmux is

begin

process (sel, enable)
begin

	if (enable = '1' and sel = "00") then
		srcreg <= reg0;
	
	elsif (enable = '1' and sel = "01") then
		srcreg <= reg1;
	
	elsif (enable = '1' and sel = "10") then
		srcreg <= reg2;
		
	elsif (enable = '1' and sel = "11") then
		srcreg <= reg3;	
		
	
		end if;
			end process;

end Behavioral;

