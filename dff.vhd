LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY dff is
	generic (N : INTEGER:=3);
   port( d          : in  std_logic_VECTOR (N-1 downto 0);
         clk        : in  std_logic;
         reset      : in  std_logic;
         q          : out std_logic_VECTOR (N-1 downto 0));
END dff;

architecture BEHAVIOURAL of dff is
	
BEGIN
    DFF:process(clk)
     begin
      IF (clk'EVENT AND clk='1') THEN	
		  
		  	FOR  i IN 0 TO N-1 LOOP
			  q(i) <= d(i) and reset;  	
			END LOOP;
		  
      END IF;
     END process DFF;

END BEHAVIOURAL;
