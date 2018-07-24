LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY multiplexer is

   generic (N : INTEGER:=3);
   port(i          : in  std_logic;
   		o          : out std_logic_VECTOR (N-1 downto 0)
   );
END multiplexer;

architecture bhv of multiplexer is

BEGIN
    MUL:process(i)
		begin  
		CASE i is	  
			when '0' => o<= "001"; --  1
	  		when '1' => o<= "111"; -- -1
			when others =>	NULL;
		end case;
	end  process MUL;	

END bhv;