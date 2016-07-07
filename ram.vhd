----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		Adam Poncy
-- 
-- Create Date:    19:22:25 02/22/2009 
-- Design Name: 
-- Module Name:    ram - Behavioral 
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

ENTITY ram IS
GENERIC ( bits: INTEGER := 8; -- # of bits per word
words: INTEGER := 16); -- # of words in the
-- memory
PORT ( wr_ena, clk, controlmemb	: IN STD_LOGIC;
		addr				: IN std_logic_vector(3 downto 0);
		data_in			: IN STD_LOGIC_VECTOR (bits-1 DOWNTO 0);
		data_out			: OUT STD_LOGIC_VECTOR (bits-1 DOWNTO 0));
END ram;
---------------------------------------------------
ARCHITECTURE ram OF ram IS
TYPE vector_array IS ARRAY (0 TO words-1) OF
STD_LOGIC_VECTOR (bits-1 DOWNTO 0);
SIGNAL memory: vector_array;
	BEGIN		PROCESS (clk, controlmemb, wr_ena)
					BEGIN
			IF (controlmemb ='1') THEN
				IF (clk'EVENT AND clk='1' AND wr_ena='1') THEN
					memory(CONV_INTEGER(addr)) <= data_in;
				END IF;
			END IF;
		END PROCESS;
	data_out <= memory(CONV_INTEGER(addr));
END ram;
