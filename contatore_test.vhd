LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY contatore_tb IS

END contatore_tb;

ARCHITECTURE contatore_test OF contatore_tb IS

   COMPONENT contatore	
   		port( 	m         : in  std_logic;
         		clk       : in  std_logic;
         		reset     : in  std_logic;	 -- Active low --
         		qf        : out std_logic_VECTOR (1 downto 0)
			 );
   END COMPONENT;

   ----------------------------------------------------------------------------	 

   CONSTANT MckPer  :  TIME     := 20 ns;     -- Master Clk period
   CONSTANT TestLen :  INTEGER  := 1024;      -- No. of Count (MckPer/2) for test

-- I N P U T     S I G N A L S

   SIGNAL   clk   : std_logic := '0';
   SIGNAL   reset : std_logic := '0';
   SIGNAL 	m     : std_logic := '0';
   
-- O U T P U T     S I G N A L S

SIGNAL qf: std_logic_VECTOR (1 downto 0);

   SIGNAL clk_cycle : INTEGER;
   SIGNAL Testing: Boolean := True;

BEGIN

   I: contatore
   PORT MAP(m, clk, reset, qf);
   -- Generates clk and change m every 180 ns

		clk     <= NOT clk AFTER MckPer/2 WHEN Testing ELSE '0';
		m 		<= NOT m AFTER MckPer*9 WHEN Testing;

   -- Runs simulation for TestLen cycles;

   Test_Proc: PROCESS(clk)
      VARIABLE count: INTEGER:= 0;
   BEGIN
     clk_cycle <= (count+1)/2;

     CASE count IS
		  WHEN   0  => reset <= '0';
		  WHEN   4  => reset <= '1';
		 
          WHEN (TestLen - 1) =>   Testing <= False;
          WHEN OTHERS => NULL;
     END CASE;

     count:= count + 1;
   END PROCESS Test_Proc;

END contatore_test;