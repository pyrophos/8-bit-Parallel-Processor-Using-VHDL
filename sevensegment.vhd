----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:43:25 02/02/2009 
-- Design Name: 
-- Module Name:    sevensegment - Behavioral 
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

entity sevensegment is
    Port ( seginput : in STD_LOGIC_VECTOR(3 downto 0);
           segment : out STD_LOGIC_VECTOR(6 downto 0));
			  
end sevensegment;



 
architecture Behavioral of sevensegment is



--signal testinput : STD_LOGIC_VECTOR(3 downto 0);


begin
	--testinput <= seginput;
	
	with seginput select
	
	 segment <= "0000001" when "0000",
					"1001111" when "0001",
					"0010010" when "0010",
					"0000110" when "0011",
					"1001100" when "0100",
					"0100100" when "0101",
					"0100000" when "0110",
					"0001111" when "0111",
					"0000000" when "1000",
					"0000100" when "1001",
					"0001000" when "1010",
					"1100000" when "1011",
					"0110001" when "1100",
					"1000010" when "1101",
					"0110000" when "1110",
					"0111000" when "1111",
					"0111000" when others;
					



end Behavioral;

