----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:25:24 03/09/2009 
-- Design Name: 
-- Module Name:    dstmux - Behavioral 
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

entity dstmux is
    Port ( reg0 : in  STD_LOGIC_VECTOR(3 downto 0);
           reg1 : in  STD_LOGIC_VECTOR(3 downto 0);
           reg2 : in  STD_LOGIC_VECTOR(3 downto 0);
           reg3 : in  STD_LOGIC_VECTOR(3 downto 0);
           sel : in  STD_LOGIC_VECTOR(1 downto 0);
           enable : in  STD_LOGIC;
			  srccienablep : in STD_LOGIC;
           dstreg : out  STD_LOGIC_VECTOR(3 downto 0));
end dstmux;

architecture Behavioral of dstmux is

begin

process (sel, enable, srccienablep)
begin

if (srccienablep = '0') then

	if (enable = '1' and sel = "00") then
		dstreg <= reg0;
	
	elsif (enable = '1' and sel = "01") then
		dstreg <= reg1;
	
	elsif (enable = '1' and sel = "10") then
		dstreg <= reg2;
		
	elsif (enable = '1' and sel = "11") then
		dstreg <= reg3;	
	
	end if;
		
elsif (srccienablep = '1') then

	if (enable = '1') then
		dstreg <= "0000";

	
		end if;
		
		end if;
			end process;
end Behavioral;

