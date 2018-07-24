LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY contatore is		
   port( m          : in  std_logic;
   		 clk        : in  std_logic;
         reset      : in  std_logic;
         qf         : out std_logic_VECTOR (1 downto 0));
END contatore;	   

architecture structural of contatore is  

	component multiplexer is	--multiplexer
	generic (N : INTEGER:=3);
   	port(
   		i          : in  std_logic;
   		o          : out std_logic_VECTOR (N-1 downto 0)
   		);
	end component multiplexer;

	component adder is			--sommatore
		port( 
			a 			: in  std_logic_VECTOR (2 downto 0);
			b 			: in  std_logic_VECTOR (2 downto 0);
         	carry_in   : in  std_logic;
         	s          : out std_logic_VECTOR (2 downto 0);
         	carry_out  : out std_logic
			   );
	end component adder ;
	
	component dff is			--flip flop
		port(
			d          : in  std_logic_VECTOR (2 downto 0);
         	clk        : in  std_logic;
         	reset      : in  std_logic;
         	q          : out std_logic_VECTOR (2 downto 0)
			 );
	end component dff;		
	
	signal mul_to_adder : std_logic_VECTOR (2 downto 0);	--uscita del multiplexer
	signal adder_to_dff : std_logic_VECTOR (2 downto 0);	--uscita del sommatore
	signal dff_to_qf : std_logic_VECTOR (2 downto 0);		--uscita del flip flop  	
BEGIN	
	MUL: multiplexer port map (m,mul_to_adder);
	AD1: adder port map (dff_to_qf,mul_to_adder,'0',adder_to_dff,open); 
	DFF1: dff port map (adder_to_dff,clk,reset,dff_to_qf);
	qf<=dff_to_qf(1 downto 0);		
END architecture structural;
