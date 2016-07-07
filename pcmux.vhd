----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:24:13 04/01/2009 
-- Design Name: 
-- Module Name:    pcmux - Behavioral 
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

entity pcmux is
    Port ( pcsel : in  STD_LOGIC;
           button : in  STD_LOGIC;
           controlpc : in  STD_LOGIC;
           topc : out  STD_LOGIC);
end pcmux;

architecture Behavioral of pcmux is

begin
process (pcsel)
begin


if(pcsel = '0') then
topc <= button;
elsif (pcsel = '1') then
topc <= controlpc;

end if;
end process;


end Behavioral;

