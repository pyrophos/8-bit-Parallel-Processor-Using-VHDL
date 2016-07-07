----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:55:47 04/09/2009 
-- Design Name: 
-- Module Name:    sevensegdivide - Behavioral 
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

entity sevensegdivide is
    Port ( clk : in  STD_LOGIC;
           an0 : inout  STD_LOGIC;
           an1 : inout  STD_LOGIC;
           an2 : inout  STD_LOGIC;
           an3 : inout  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR(6 downto 0);
           pccount : in  STD_LOGIC_VECTOR(6 downto 0);
           state : in  STD_LOGIC_VECTOR(6 downto 0);
			  aluout : in STD_LOGIC_VECTOR(6 downto 0);
			  dstout : in STD_LOGIC_VECTOR(6 downto 0));
end sevensegdivide;

architecture Behavioral of sevensegdivide is


signal CTR : STD_LOGIC_VECTOR(12 downto 0);
begin			
  Process (CLK)
  begin
    if CLK'event and CLK = '1' then
      if (CTR="0000000000000") then
        if (AN0='0') then 
          AN0 <= '1';	 
          LED <= dstout;             -- the letter n
          AN1 <= '0';
        elsif (AN1='0') then 
          AN1 <= '1';	 	 
          LED <= state;             -- the letter n
          AN2 <= '0';
        elsif (AN2='0') then 
          AN2 <= '1';	 
          LED <= pccount;             -- the letter A
          AN3 <= '0';
        elsif (AN3='0') then 
          AN3 <= '1';
          LED <= aluout;             -- the letter E
          AN0 <= '0';
        end if;
      end if;
      CTR<=CTR+"0000000000001";
      if (CTR > "1000000000000") then   -- counter reaches 2^13
        CTR<="0000000000000";
      end if;
    end if; -- CLK'event and CLK = '1' 

End Process;

end Behavioral;

