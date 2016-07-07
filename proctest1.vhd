----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:41 04/03/2009 
-- Design Name: 
-- Module Name:    proctest1 - Behavioral 
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
    Port ( an0 : inout  STD_LOGIC;
           an1 : inout  STD_LOGIC;
           an2 : inout  STD_LOGIC;
           an3 : inout  STD_LOGIC;
			  aluswitches : in STD_LOGIC_VECTOR(3 downto 0);
			  dmuxswitches : in STD_LOGIC_VECTOR(3 downto 0);
			  pcincrb : in  STD_LOGIC;
           start : in  STD_LOGIC;
			  clk : in STD_LOGIC;
           rst : in  STD_LOGIC;
			  controlmemb : in STD_LOGIC;
           ramin : in  STD_LOGIC_VECTOR(7 downto 0);
			  addr : in STD_LOGIC_VECTOR(3 downto 0);
			  cout : out STD_LOGIC;
           displayout : out  STD_LOGIC_VECTOR(6 downto 0));
end firstproctest1;

architecture Behavioral of firstproctest1 is

component pcmux
Port ( pcsel : in STD_LOGIC;
button : in STD_LOGIC;
controlpc : in STD_LOGIC;
topc : out STD_LOGIC);
end component;

component clockdivider
Port ( globalclk : in STD_LOGIC;
rst : in STD_LOGIC;
clk_div : out STD_LOGIC);
end component;

component sevensegment
Port ( seginput : in STD_LOGIC_VECTOR(3 downto 0);
segment : out STD_LOGIC_VECTOR(6 downto 0));
end component;

component programCounter
Port ( clk : in STD_LOGIC;
	reset : in STD_LOGIC;
	sel : in std_logic;
	pc: in std_logic;
	address: in STD_LOGIC_VECTOR (3 downto 0);
	cnt : out STD_LOGIC_VECTOR (3 downto 0));
end component;


component ram 
GENERIC ( bits: INTEGER := 8; -- # of bits per word
words: INTEGER := 16); -- # of words in the
-- memory
PORT ( wr_ena, clk, controlmemb : IN STD_LOGIC;
addr : IN std_logic_vector(3 downto 0);
data_in : IN STD_LOGIC_VECTOR (bits-1 DOWNTO 0);
data_out : OUT STD_LOGIC_VECTOR (bits-1
DOWNTO 0));
end component;

component instreg 
    Port ( datain : in  STD_LOGIC_VECTOR(7 downto 0);
           enable : in  STD_LOGIC;
           op : out  STD_LOGIC_VECTOR(1 downto 0);
           cc : out  STD_LOGIC_VECTOR(1 downto 0);
           src : out  STD_LOGIC_VECTOR(1 downto 0);
           dst : out  STD_LOGIC_VECTOR(1 downto 0));
end component;


component controlunit 
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
end component;


component sevensegdivide
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
end component; 

component dMUX 
    Port ( sel : in  STD_LOGIC_VECTOR (1 downto 0);
           enable : in  STD_LOGIC; -- for switches or alu
			  dmuxenable : in STD_LOGIC; -- turn on dmux
			  manual_switch0 : in STD_LOGIC;
			  manual_switch1 : in STD_LOGIC;
			  manual_switch2 : in STD_LOGIC;
			  manual_switch3 : in STD_LOGIC;
           --manual_switch : in  STD_LOGIC_VECTOR (3 downto 0);
			  alu_out : in STD_LOGIC_VECTOR(3 downto 0);
           out0 : out  STD_LOGIC_VECTOR (3 downto 0);
			  out1 : out  STD_LOGIC_VECTOR (3 downto 0);
			  out2 : out  STD_LOGIC_VECTOR (3 downto 0);
			  out3 : out  STD_LOGIC_VECTOR (3 downto 0));
end component;


component registerDesign  
    Port ( 
           load : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component dstmux 
    Port ( reg0 : in  STD_LOGIC_VECTOR(3 downto 0);
           reg1 : in  STD_LOGIC_VECTOR(3 downto 0);
           reg2 : in  STD_LOGIC_VECTOR(3 downto 0);
           reg3 : in  STD_LOGIC_VECTOR(3 downto 0);
           sel : in  STD_LOGIC_VECTOR(1 downto 0);
           enable : in  STD_LOGIC;
			  srccienablep : in STD_LOGIC;
           dstreg : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component alu 
    Port ( avect : in  STD_LOGIC_VECTOR(3 downto 0);
           bvect : in  STD_LOGIC_VECTOR(3 downto 0);
           carryin : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           carryout : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR(3 downto 0));
			  
end component;

component ccmux 
    Port ( ccmuxenable : in STD_LOGIC;
			  ccin : in  STD_LOGIC_VECTOR(1 downto 0);
           cinalu : in  STD_LOGIC;
           cout : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component ccandaluadd 
    Port ( finaladdop : in STD_LOGIC;
		     finaladdenable : in STD_LOGIC;
			  ccinfourbit : in  STD_LOGIC_VECTOR(3 downto 0);
           aluoutfourbit : in  STD_LOGIC_VECTOR(3 downto 0);
           finalout : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component displaydst 
    Port ( dstdatain : in  STD_LOGIC_VECTOR(3 downto 0);
           displayenable : in  STD_LOGIC;
           dataout : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component srcmux 
    Port ( reg0 : in  STD_LOGIC_VECTOR(3 downto 0);
           reg1 : in  STD_LOGIC_VECTOR(3 downto 0);
           reg2 : in  STD_LOGIC_VECTOR(3 downto 0);
           reg3 : in  STD_LOGIC_VECTOR(3 downto 0);
           sel : in  STD_LOGIC_VECTOR(1 downto 0);
			  enable : in  STD_LOGIC;
           srcreg : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component dstselector 
    Port ( dstdatain : in  STD_LOGIC_VECTOR(3 downto 0);
           dataout : out  STD_LOGIC_VECTOR(3 downto 0);
           enable : in  STD_LOGIC);
end component;




signal pcclock, irenable, pcsel, pcmuxe, memwrite, controlpcmuxsel, regLoadonecu, regLoadtwocu, regLoadthreecu, regLoadfourcu, dmuxenablecu, dmuxswitchenablecu, dstmuxenablecu : STD_LOGIC;
signal pccontrolunit, aluaddsubselcu, srcmuxenablecu, cincu, coutalu, finaladdopcu, regLoadfinalcu : STD_LOGIC;
signal statedisplay, datainreg1, datainreg2, datainreg3, datainreg4, datainmux1, datainmux2, datainmux3, datainmux4, dstdisplay, srcdatain, dstdatain : STD_LOGIC_VECTOR(3 downto 0);
signal memaddress, coutmuxtoadder, aluouttofinal, dataouttofinal, dataouttofinalreg, dataintodmux, finaldisplayout, dstselectoralu, pcjumpaddrcu : STD_LOGIC_VECTOR(3 downto 0);
signal memtoir : STD_LOGIC_VECTOR(7 downto 0);
signal opcu, cccu, srccu, dstcu, dmuxsel : STD_LOGIC_VECTOR(1 downto 0);
signal displayoutpc, displayoutalu, displayoutstate, displayoutdst, aludisplay : STD_LOGIC_VECTOR(6 downto 0);
signal regLoadtempcu, cmuxenablecu, finaladdenablecu, displayenablecu, dstselectorcu : STD_LOGIC;

begin




clockdivid : clockdivider port map (clk, rst, pcclock);
pcmux1 : pcmux port map (pcmuxe, pcincrb, controlpcmuxsel, pccontrolunit);
pc1 : programCounter port map (pcclock, rst, pcsel, pccontrolunit, pcjumpaddrcu, memaddress);
ram1 : ram port map (memwrite, pcclock, controlmemb, memaddress, ramin, memtoir);
ir1 : instreg port map (memtoir, irenable, opcu, cccu, srccu, dstcu);

reg1 : registerdesign port map (regLoadonecu, rst, datainreg1, datainmux1);
reg2 : registerdesign port map (regLoadtwocu, rst, datainreg2, datainmux2);
reg3 : registerdesign port map (regLoadthreecu, rst, datainreg3, datainmux3);
reg4 : registerdesign port map (regLoadfourcu, rst, datainreg4, datainmux4);

dmux1 : dmux port map (dstcu, dmuxswitchenablecu, dmuxenablecu, ramin(3), ramin(2), ramin(1), ramin(0), dataintodmux, datainreg1, datainreg2, datainreg3, datainreg4);

dstmux1 : srcmux port map (datainmux1, datainmux2, datainmux3, datainmux4, dstcu, dstmuxenablecu, dstdatain);
srcmux1 : srcmux port map (datainmux1, datainmux2, datainmux3, datainmux4, srccu, srcmuxenablecu, srcdatain);
dstselector1 : dstselector port map (dstdatain, dstselectoralu, dstselectorcu);

alu1 : alu port map (srcdatain, dstselectoralu, cincu, aluaddsubselcu, coutalu, aluouttofinal);
tempreg : registerdesign port map (regLoadtempcu, rst, aluouttofinal, dataouttofinal);
ccmux1 : ccmux port map (cmuxenablecu, cccu, coutalu, coutmuxtoadder);
finaladd : ccandaluadd port map (finaladdopcu, finaladdenablecu, coutmuxtoadder, dataouttofinal, dataouttofinalreg);
finalreg : registerdesign port map (regLoadfinalcu, rst, dataouttofinalreg, dataintodmux);

dstdisplay1 : displaydst port map (dstdatain, displayenablecu, finaldisplayout);

cu1: controlunit port map (opcu, cccu, srccu, dstcu, start, rst, controlmemb, irenable, pcsel, pcmuxe, memwrite, controlpcmuxsel, aludisplay, statedisplay, pcclock, regLoadonecu, regLoadtwocu, regLoadthreecu, regLoadfourcu, dmuxenablecu, dmuxswitchenablecu, dstmuxenablecu, aluaddsubselcu, srcmuxenablecu, cincu, regLoadtempcu, cmuxenablecu, finaladdenablecu, finaladdopcu, regLoadfinalcu, displayenablecu, dstselectorcu, pcjumpaddrcu);
sevendisplay1: sevensegment port map (finaldisplayout, displayoutalu); -- E
sevendisplay2: sevensegment port map (statedisplay, displayoutstate);  -- first N
sevendisplay3: sevensegment port map (memaddress, displayoutpc); -- A
--sevendisplay4: sevensegment port map (pcjumpaddrcu, displayoutdst); -- second N  
sevensegdivide1 : sevensegdivide port map (clk, an0, an1, an2, an3, displayout, displayoutpc, displayoutstate, displayoutalu, aludisplay);  -- displayoutdst replaced displayoutalu to see jumpaddr


end Behavioral;

