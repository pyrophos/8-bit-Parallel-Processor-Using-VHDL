----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:32:58 02/04/2009 
-- Design Name: 
-- Module Name:    clockdivider - Behavioral 
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

entity clockdivider is
    Port ( globalclk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk_div : out  STD_LOGIC);
end clockdivider;

architecture Behavioral of clockdivider is

begin

	process(globalclk)
		variable cnt : Integer range 0 to 50000000;
		variable clk_var : std_logic;

			begin
			  if (rst = '1') then
					cnt := 0;
					clk_var := '0';
			
			  elsif (globalclk'event and globalclk = '1') then
						cnt := cnt + 1;
				
				
				if (cnt = 25000000) then
						clk_var := not (clk_var);
						cnt := 0;
						
					end if;	
			end if;
		clk_div <= clk_var;

	end process;


end Behavioral;

