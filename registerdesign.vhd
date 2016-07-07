----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:48:55 02/25/2009 
-- Design Name: 
-- Module Name:    registerDesign - Behavioral 
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

entity registerDesign is 
    Port ( 
           load : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end registerDesign;

architecture Behavioral of registerDesign is



begin
    process(load, reset, data)
	 variable q_tmp: std_logic_vector (3 downto 0);
    begin
	if (reset = '1' )then           
            q_tmp := (q_tmp'range => '0');
	
	    elsif (load = '1' )then
	         q_tmp := data;
	    end if;
	
	q <= q_tmp;
    end process;
       


end Behavioral;

