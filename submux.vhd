----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:02:02 02/22/2009 
-- Design Name: 
-- Module Name:    submux - Behavioral 
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

entity submux is
    Port ( bvect : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC;
           bvectsum : out  STD_LOGIC_VECTOR(3 downto 0));
end submux;

architecture Behavioral of submux is

begin

process(bvect,sel)
    begin
    
	case sel is
	    when '0' =>
				bvectsum <= bvect;
	    when '1' =>						
				bvectsum <= (not bvect) + 1;
	    when others =>	 
				bvectsum <= bvect;
        end case;

    end process;



end Behavioral;

