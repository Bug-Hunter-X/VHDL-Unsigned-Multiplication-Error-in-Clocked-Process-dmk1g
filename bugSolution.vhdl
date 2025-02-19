```vhdl
ENTITY multiplier IS
  GENERIC (WIDTH : INTEGER := 8);
  PORT ( 
    clk : IN STD_LOGIC;
    a : IN STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
    result : OUT STD_LOGIC_VECTOR(2*WIDTH-1 DOWNTO 0);
    overflow : OUT STD_LOGIC
  );
END ENTITY;

ARCHITECTURE behavioral OF multiplier IS
  SIGNAL product : UNSIGNED(2*WIDTH-1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL ovf : STD_LOGIC := '0';
BEGIN
  PROCESS (clk)  
  BEGIN
    IF rising_edge(clk) THEN
      product <= UNSIGNED(a) * UNSIGNED(b);
      ovf <= '1' WHEN product >= 2** (2*WIDTH) ELSE '0'; --Overflow detection
    END IF;
  END PROCESS;
  result <= STD_LOGIC_VECTOR(product);
  overflow <= ovf; --Output the overflow signal
END ARCHITECTURE;
```