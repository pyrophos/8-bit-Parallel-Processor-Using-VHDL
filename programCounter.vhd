----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:00:43 02/25/2009 
-- Design Name: 
-- Module Name:    programCounter - Behavioral 
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

entity programCounter is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  sel : in std_logic;
			  pc: in std_logic;
			  address: in STD_LOGIC_VECTOR (3 downto 0);
           cnt : out  STD_LOGIC_VECTOR (3 downto 0));
end programCounter;

architecture Behavioral of programCounter is

begin

Process(clk)

	variable cnt_var: std_logic_vector (3 downto 0);

	begin
		if(reset = '1') then
			cnt_var := "0000";
			cnt <= "0000";
	
		elsif(clk'event and clk = '1') then
			if (pc = '1') then
				if (sel = '1') then 
				
					cnt_var := cnt_var + 1;
				else
				cnt_var := address;
				end if;
			 end if;
		end if;
		
cnt <= cnt_var;
end process;
end Behavioral;

