--------------------------------------------------
-- Brittany Giangarra
-- Lab 5 - Memory and Register Bank
--
----------------------------------------------------------------
LIBRARY ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;
Use ieee.std_logic_unsigned.all;

entity RAM is
     Port(Reset:     in std_logic;
	  Clock:     in std_logic;
	  OE:	     in std_logic;
	  WE:	     in std_logic;
	  Address:   in std_logic_vector(29 downto 0);
	  DataIn:    in std_logic_vector(31 downto 0);
	  DataOut:   out std_logic_vector(31 downto 0));
end entity RAM;

architecture staticRAM of RAM is

     type ram_type is array (0 to 127) of std_logic_vector(31 downto 0);
     signal i_ram : ram_type;

begin

     RamProc: process(Clock, Reset, OE, WE, Address) is

begin
     if Reset = '1' then
	for i in 0 to 127 loop
	    i_ram(i) <= x"00000000";
	end loop;
     end if;

    	--Storing at Address
	 if falling_edge(Clock) AND WE = '1' AND (to_integer(unsigned(Address)))(7 downto 0) then
		i_ram(to_integer(unsigned(Address)(7 downto 0)))) <= DataIn)
	end if;

	-- Reading from Address
	if (OE = '0') AND (to_integer(unsigned(Address)) < 127) AND (to_integer(unsigned(Address)) >=0) then
	   DataOut <= i_ram(to_integer(unsigned(Address(7 downto 0))));
	else
	   DataOut <= (others => 'Z');
	end if;

	


     end process;

end staticRAM;


--------------------------------------------------------------------------------------------
LIBRARY ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;
Use ieee.std_logic_unsigned.all;

entity Registers is
     Port(ReadReg1: in std_logic_vector(4 downto 0);
     	  ReadReg2: in std_logic_vector(4 downto 0);
	  WriteReg: in std_logic_vector(4 downto 0);
	  WriteData: in std_logic_vector(31 downto 0);
	  WriteCmd: in std_logic;
	  ReadData1: out std_logic_vector(31 downto 0);
	  ReadData2: out std_logic_vector(31 downto 0));
end entity Registers;

architecture remember of Registers is
	  component register32
		port(datain: in std_logic_vector(31 downto 0);
		     enout32,enout16,enout8: in std_logic;
		     writein32, writein16, writein8: in std_logic;
		     dataout: out std_logic_vector(31 downto 0));
	end component;

	SIGNAL x0out: std_logic_vector(31 downto 0);
	SIGNAL a0out: std_logic_vector(31 downto 0);
	SIGNAL a1out: std_logic_vector(31 downto 0);
	SIGNAL a2out: std_logic_vector(31 downto 0);
	SIGNAL a3out: std_logic_vector(31 downto 0);
	SIGNAL a4out: std_logic_vector(31 downto 0);
	SIGNAL a5out: std_logic_vector(31 downto 0);
	SIGNAL a6out: std_logic_vector(31 downto 0);
	SIGNAL a7out: std_logic_vector(31 downto 0);
	SIGNAL writeSel: std_logic_vector(7 downto 0);

begin

	WITH WriteReg SELECT
	writeSel <= "10000000" when "01010".
	"01000000" when "01011",
	"00100000" when "01100",
	"00010000" when "01101",
	"00001000" when "01110",
	"00000100" when "01111",
	"00000010" when "10000",
	"00000001" when "10000",
	"00000001" when "10001",
	(others => '0') when others;



	A0: register32 PORT MAP (WriteData, '0', '1', '1', writeSel(7), '0','0'
	A1: register32 PORT MAP (WriteData, '0', '1', '1', writeSel(6), '0', '0'
	A2: register32 PORT MAP (WriteData, '0', '1', '1', writeSel(5), '0', '0'
	A3: register32 PORT MAP (WriteData, '0', '1', '1', writeSel(4), '0', '0'
	A4: register32 PORT MAP (WriteData, '0', '1', '1', writeSel(3), '0', '0'
	A5: register32 PORT MAP (WriteData, '0', '1', '1', writeSel(2), '0', '0'
	A6: register32 PORT MAP (WriteData, '0', '1', '1', writeSel(1), '0', '0'
	A7: register32 PORT MAP (WriteData, '0', '1', '1', writeSel(0), '0', '0'


	With ReadReg1 Select
	ReadData1 <= a0out whenn "01010",
	alout when "01011",
	a2out when "01100",
	a3out when "01101",
	a4out when "01110",
	a5out when "01111",
	a6out when "10000",
	a7out when "10001",
	(others => '0') when others;

	with ReadReg2 Select
	ReadData2 <= a0out when "01010",
	a1out when "01011",
	a2out when "01100",
	a3out when "01101",
	a4out when "01110",
	a5out when "01111",
	a6out when "10000",
	a7out when "10001",
	(others => '0') when others;

end remember;

----------------------------------------------------------------------------------------------------------
