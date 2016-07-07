----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:23:25 03/04/2009 
-- Design Name: 
-- Module Name:    instreg - Behavioral 
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

entity instreg is
    Port ( datain : in  STD_LOGIC_VECTOR(7 downto 0);
           enable : in  STD_LOGIC;
           op : out  STD_LOGIC_VECTOR(1 downto 0);
           cc : out  STD_LOGIC_VECTOR(1 downto 0);
           src : out  STD_LOGIC_VECTOR(1 downto 0);
           dst : out  STD_LOGIC_VECTOR(1 downto 0));
end instreg;

architecture Behavioral of instreg is

begin

process (enable)

begin

if (enable = '1') then
dst <= datain(1) & datain(0);
src <= datain(3) & datain(2);
cc <= datain(5) & datain(4);
op <= datain(7) & datain(6);

end if;

end process;
end Behavioral;

