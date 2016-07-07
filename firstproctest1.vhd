----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:27:29 04/03/2009 
-- Design Name: 
-- Module Name:    firstproctest1 - Behavioral 
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

entity firstproctest1 is
    Port ( pcincr : in  STD_LOGIC;
           start : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           ram : in  STD_LOGIC;
           display : out  STD_LOGIC);
end firstproctest1;

architecture Behavioral of firstproctest1 is

begin


end Behavioral;

