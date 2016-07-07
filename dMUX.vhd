----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:22:05 03/04/2009 
-- Design Name: 
-- Module Name:    dMUX - Behavioral 
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

entity dMUX is
    Port ( sel : in  STD_LOGIC_VECTOR (1 downto 0);
           enable : in  STD_LOGIC;
			  dmuxenable : in STD_LOGIC;
			  manual_switch0 : in STD_LOGIC;
			  manual_switch1 : in STD_LOGIC;
			  manual_switch2 : in STD_LOGIC;
			  manual_switch3 : in STD_LOGIC;
           --manual_switch : in  STD_LOGIC_VECTOR (3 downto 0);
			  alu_out : in STD_LOGIC_VECTOR(3 downto 0);
           out0 : out  STD_LOGIC_VECTOR (3 downto 0);
			  out1 : out  STD_LOGIC_VECTOR (3 downto 0);
			  out2 : out  STD_LOGIC_VECTOR (3 downto 0);
			  out3 : out  STD_LOGIC_VECTOR (3 downto 0));
end dMUX;

architecture Behavioral of dMUX is

begin
process (sel, enable, dmuxenable)
begin
if (dmuxenable = '1') then

if (enable ='1') then
	if (sel = "00") then
		out0 <= manual_switch0 & manual_switch1 & manual_switch2 & manual_switch3; -- manual switch
	elsif (sel = "01") then
		out1 <= manual_switch0 & manual_switch1 & manual_switch2 & manual_switch3;
	elsif (sel = "10") then
		out2 <= manual_switch0 & manual_switch1 & manual_switch2 & manual_switch3;		
	elsif (sel = "11") then
		out3 <= manual_switch0 & manual_switch1 & manual_switch2 & manual_switch3;
	end if;
else		
if (sel = "00") then
		out0 <= alu_out;
	elsif (sel = "01") then
		out1 <= alu_out;
	elsif (sel = "10") then
		out2 <= alu_out;		
	else 
		out3 <= alu_out;
		end if;
end if;
end if;
			end process;
				end Behavioral;

