----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:44:01 04/01/2009 
-- Design Name: 
-- Module Name:    controlunit - Behavioral 
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

entity controlunit is
    Port ( op : in  STD_LOGIC_VECTOR(1 downto 0);
           cc : in  STD_LOGIC_VECTOR(1 downto 0);
           src : in  STD_LOGIC_VECTOR(1 downto 0);
           dst : in  STD_LOGIC_VECTOR(1 downto 0);
           start : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  button : in STD_LOGIC;
			  Irenable : out STD_LOGIC;
			  pcsel : out STD_LOGIC;
			  pcmuxsel : out STD_LOGIC;
			  memwriteenable : out STD_LOGIC;
			  pcmuxcontrolincrement : out STD_LOGIC;
			  aludisplayout : out STD_LOGIC_VECTOR(6 downto 0);
			  statedisplayout : out STD_LOGIC_VECTOR(3 downto 0);
			  clk : in STD_LOGIC;
			  regLoadone, regLoadtwo, regLoadthree, regLoadfour : out STD_LOGIC;
			  dmuxenable : out STD_LOGIC;
			  switchenable : out STD_LOGIC;
			  dstmuxenable : out STD_LOGIC;
			  aluaddsubsel : out STD_LOGIC;
			  srcmuxenable : out STD_LOGIC;
			  cin : out STD_LOGIC;
			  regLoadtemp : out STD_LOGIC;
			  ccmuxenable : out STD_LOGIC;
			  finaladdenable : out STD_LOGIC;
			  finaladdop : out STD_LOGIC;
			  regLoadfinal : out STD_LOGIC;
			  regfinaldisplayenable : out STD_LOGIC;
			  dstselectore : out STD_LOGIC;
			  pcjumpaddr : out STD_LOGIC_VECTOR(3 downto 0));
end controlunit;

architecture Behavioral of controlunit is

type states is (init,  s1, s2, s3, sL, s4, s5); 
signal nstate, cstate: states;

begin
process (rst, clk)
begin
	if (rst = '1')then
	cstate <= init;
		elsif(clk'event and clk = '1') then
		cstate <= nstate;
	end if;
end process;

process (start, OP, CC, SRC, DST, cstate) 
begin 
case cstate is 
	when init =>
		if (start = '0') then
			IRenable <= '0';  -- to not read from the IR
			pcsel <= '1'; -- to not jump address
			pcmuxsel <= '0';  -- to increment from button instead of control unit
			memwriteenable <= '1'; -- always write during initial state
			--regload <= '0';  -- make sure nothing is loaded to registers
			pcmuxcontrolincrement <= '0';
			statedisplayout <= "0000";
			aludisplayout <= "0000001";
			dmuxenable <= '0';
			switchenable <= '0';
			regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
			dstmuxenable <= '0';
			srcmuxenable <= '0';
			aluaddsubsel <= '0';
			cin <= '0';
			regLoadtemp <= '0';
			ccmuxenable <= '0';
			finaladdenable <= '0';
			finaladdop <= '0';
			regLoadfinal <= '0';
			regfinaldisplayenable <= '0';
			
		nstate <= init;
		else 
		-- reset PC?
		nstate <= s1;
		end if;
	
	when s1 =>                       -- Fetch data from Instruction Register
			IRenable <= '1';
			pcsel <= '1';
			pcmuxsel <= '1';
			pcmuxcontrolincrement <= '0';
			memwriteenable <= '0';
			statedisplayout <= "0001";
			aludisplayout <= "0111000";
			dmuxenable <= '0';
			switchenable <= '0';
			regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
			dstmuxenable <= '0';
			srcmuxenable <= '0';
			aluaddsubsel <= '0';
			cin <= '0';
			regLoadtemp <= '0';
			ccmuxenable <= '0';
			finaladdenable <= '0';
			finaladdop <= '0';
			regLoadfinal <= '0';
			regfinaldisplayenable <= '0';
			
			nstate <= s2;
			
	when s2 =>   -- Decode instruction
	
		if (OP = "00" or OP = "01" or OP = "10")  then   -- checks for arithmetic 
			IRenable <= '0';
			pcsel <= '1';
			pcmuxsel <= '1';
			pcmuxcontrolincrement <= '1'; --increments pc
			memwriteenable <= '0';
			statedisplayout <= "0010";
			aludisplayout <= "1000010";
			dmuxenable <= '0';
			switchenable <= '0';
			regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
			dstmuxenable <= '0';
			srcmuxenable <= '0';
			aluaddsubsel <= '0';
			cin <= '0';
			regLoadtemp <= '0';
			ccmuxenable <= '0';
			finaladdenable <= '0';
			finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
			
			nstate <= s3;
		
		end if;
		
		if (OP = "11" and CC = "00" and SRC = "10") then  -- load
				if (button = '1') then
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '1'; --increments pc
					memwriteenable <= '0';
					statedisplayout <= "0010";
					aludisplayout <= "1110001";
					dmuxenable <= '0';
					switchenable <= '0';
					regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
					dstmuxenable <= '0';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '0';
					finaladdenable <= '0';
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					
					nstate <= sL; -- state load
					
				else
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; -- no increments pc
					memwriteenable <= '0';
					statedisplayout <= "0010";
					aludisplayout <= "1000010";
					dmuxenable <= '0';
					switchenable <= '0';
					regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
					dstmuxenable <= '0';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '0';
					finaladdenable <= '0';
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					
				
					nstate <= s2;
					
					end if;
				end if;
				
				
			if (OP = "11" and CC = "00" and SRC = "01") then -- halt
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; --increments pc
					memwriteenable <= '0';
					statedisplayout <= "0010";
					aludisplayout <= "1001000";
					dmuxenable <= '0';
					switchenable <= '0';
					regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
					dstmuxenable <= '1';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '0';
					finaladdenable <= '0';	
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '1';
					
					
					nstate <= s2;
			end if;
			
			if (OP = "11" and CC = "01") then   -- branch
					IRenable <= '0';
					pcsel <= '0';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '1'; --increments pc
					memwriteenable <= '0';
					statedisplayout <= "0010";
					aludisplayout <= "1100000";
					dmuxenable <= '0';
					switchenable <= '0';
					regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
					dstmuxenable <= '0';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '0';
					finaladdenable <= '0';	
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					pcjumpaddr <= SRC & DST;
					
					nstate <= s1;
					
			end if;
			
			if (OP = "00" and CC = "00" and SRC = "00" and DST = "00") then  -- default hault
				IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; --increments pc
					memwriteenable <= '0';
					statedisplayout <= "0010";
					aludisplayout <= "1001000";
					dmuxenable <= '0';
					switchenable <= '0';
					regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
					dstmuxenable <= '0';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '0';
					finaladdenable <= '0';	
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					
					
					nstate <= s2;
					
					end if;
						
	when sL =>
	
			if (button = '0') then
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; -- no increments pc
					memwriteenable <= '0';
					statedisplayout <= "1011";
					aludisplayout <= "1110001";
					dmuxenable <= '0';
					switchenable <= '0';
					regLoadfour <= '1';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
					dstmuxenable <= '0';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '0';
					finaladdenable <= '0';
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					
					
				nstate <= s1;
		
			else
			
			if (DST = "00") then
			-- MAKE FUNCTION OF DST, if DST = 01, REG1 = 1 and so on.  Make register function of clock.
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; -- no increments pc
					memwriteenable <= '0';
					statedisplayout <= "1011";
					aludisplayout <= "1110001";
					dmuxenable <= '1';
					switchenable <= '1';
					regLoadfour <= '0';
					regLoadone <= '1';
					regLoadtwo <= '0';
					regLoadthree <= '0';
					dstmuxenable <= '0';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '0';
					finaladdenable <= '0';
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					
					
					nstate <= sL;
					
				elsif (DST = "01") then
			
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; -- no increments pc
					memwriteenable <= '0';
					statedisplayout <= "1011";
					aludisplayout <= "1110001";
					dmuxenable <= '1';
					switchenable <= '1';
					regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '1';
					regLoadthree <= '0';
					dstmuxenable <= '0';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '0';
					finaladdenable <= '0';
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					
					
					nstate <= sL;	
					
					elsif (DST = "10") then
			
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; -- no increments pc
					memwriteenable <= '0';
					statedisplayout <= "1011";
					aludisplayout <= "1110001";
					dmuxenable <= '1';
					switchenable <= '1';
					regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '1';
					dstmuxenable <= '0';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '0';
					finaladdenable <= '0';
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					
					nstate <= sL;	
					
					elsif (DST = "11") then
			
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; -- no increments pc
					memwriteenable <= '0';
					statedisplayout <= "1011";
					aludisplayout <= "1110001";
					dmuxenable <= '1';
					switchenable <= '1';
					regLoadfour <= '1';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
					dstmuxenable <= '0';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '0';
					finaladdenable <= '0';
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					
					
					nstate <= sL;	
					end if;
					
					
					
			end if;
		
	when s3 =>
		
		if (OP = "00")  then
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; -- no increments pc
					memwriteenable <= '0';
					statedisplayout <= "0011";
					aludisplayout <= "0001000";
					dmuxenable <= '0';
					switchenable <= '0';
					regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
					dstmuxenable <= '1';
					srcmuxenable <= '1';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '1';
					ccmuxenable <= '0';
					finaladdenable <= '0';
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					dstselectore <= '1';
					 -- dst reg outputs 0000 for src + ci -> dst
					
					nstate <= s4;
		
		end if;
		
		
		if (OP = "01") then
		
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; -- no increments pc
					memwriteenable <= '0';
					statedisplayout <= "0011";
					aludisplayout <= "0001000";
					dmuxenable <= '0';
					switchenable <= '0';
					regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
					dstmuxenable <= '1';
					srcmuxenable <= '1';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '1';
					ccmuxenable <= '0';
					finaladdenable <= '0';
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					dstselectore <= '0';
					
					
					nstate <= s4;
		
		end if;
		
		
		if (OP = "10") then
		IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; -- no increments pc
					memwriteenable <= '0';
					statedisplayout <= "0011";
					aludisplayout <= "0100100";
					dmuxenable <= '0';
					switchenable <= '0';
					regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
					dstmuxenable <= '1';
					srcmuxenable <= '1';
					aluaddsubsel <= '1';
					cin <= '0';
					regLoadtemp <= '1';
					ccmuxenable <= '0';
					finaladdenable <= '1'; -- I changed this
					finaladdop <= '1'; -- I changed this
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					  -- dst selects the actual register value, not 0000
					dstselectore <= '0';
					
					nstate <= s4;
					
		end if;
		
		
		
		when s4 =>
			-- carry
			if (OP = "01" or OP = "00") then
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; -- no increments pc
					memwriteenable <= '0';
					statedisplayout <= "0100";
					aludisplayout <= "0110001";
					dmuxenable <= '0';
					switchenable <= '0';
					regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
					dstmuxenable <= '0';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '1';
					finaladdenable <= '1';
					finaladdop <= '0';
					regLoadfinal <= '1';
					regfinaldisplayenable <= '0';
					
					nstate <= s5;
					
					end if;
					
				if (OP = "10") then
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; -- no increments pc
					memwriteenable <= '0';
					statedisplayout <= "0100";
					aludisplayout <= "0110001";
					dmuxenable <= '0';
					switchenable <= '0';
					regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
					dstmuxenable <= '0';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '1';
					finaladdenable <= '1';
					finaladdop <= '1';
					regLoadfinal <= '1';
					regfinaldisplayenable <= '0';
					
					nstate <= s5;
					end if;
					
			
			when s5 =>	
			
			if (DST = "00") then
			
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; -- no increments pc
					memwriteenable <= '0';
					statedisplayout <= "0101";
					aludisplayout <= "1100000";
					dmuxenable <= '1';
					switchenable <= '0';
					regLoadfour <= '0';
					regLoadone <= '1';
					regLoadtwo <= '0';
					regLoadthree <= '0';
					dstmuxenable <= '0';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '0';
					finaladdenable <= '0';
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					
					nstate <= s1;
			
			elsif (DST = "01") then
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; -- no increments pc
					memwriteenable <= '0';
					statedisplayout <= "0101";
					aludisplayout <= "1100000";
					dmuxenable <= '1';
					switchenable <= '0';
					regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '1';
					regLoadthree <= '0';
					dstmuxenable <= '0';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '0';
					finaladdenable <= '0';
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					
					nstate <= s1;
			
			elsif (DST = "10") then
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; -- no increments pc
					memwriteenable <= '0';
					statedisplayout <= "0101";
					aludisplayout <= "1100000";
					dmuxenable <= '1';
					switchenable <= '0';
					regLoadfour <= '0';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '1';
					dstmuxenable <= '0';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '0';
					finaladdenable <= '0';
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					
					nstate <= s1;
			
			
			elsif (DST = "11") then
					IRenable <= '0';
					pcsel <= '1';
					pcmuxsel <= '1';
					pcmuxcontrolincrement <= '0'; -- no increments pc
					memwriteenable <= '0';
					statedisplayout <= "0101";
					aludisplayout <= "1100000";
					dmuxenable <= '1';
					switchenable <= '0';
					regLoadfour <= '1';
					regLoadone <= '0';
					regLoadtwo <= '0';
					regLoadthree <= '0';
					dstmuxenable <= '0';
					srcmuxenable <= '0';
					aluaddsubsel <= '0';
					cin <= '0';
					regLoadtemp <= '0';
					ccmuxenable <= '0';
					finaladdenable <= '0';
					finaladdop <= '0';
					regLoadfinal <= '0';
					regfinaldisplayenable <= '0';
					
					nstate <= s1;
			
			end if;
			
			
			
			
				
		
		end case;
		end process;

end Behavioral;

