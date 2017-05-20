library ieee;
use ieee.std_logic_1164.all;
use STD.textio.all;
use ieee.std_logic_textio.all; -- Some write routenes. Not necessary, but need --std=08
                               -- flag for this use! 

entity fileio_tb is
end fileio_tb;

architecture arch of fileio_tb is
  constant T          : time := 1 ns;  -- clk period
  constant numperiods : integer := 50; -- number of periods (simulation length)
  signal clk, reset   : std_logic;
  file file_VECTORS   : text;          -- for read/write of external signals from/to file:
  file file_OUT       : text;
  signal in_byte      : std_logic_vector(7 downto 0) := (others => '0');
begin

  --******
  -- clock
  --******
  process
  begin
    clk <= '0';
    wait for T/2;
    clk <= '1';
    wait for T/2;
  end process;

  --******
  -- reset
  --******
  reset <= '1', '0' after T/2;

  --***************
  -- instantiations
  --***************

  --********
  -- stimuli
  --********
  -- read/write i/o:
  process
    variable v_in_line  : line;                         --read in line
    variable v_in_byte  : std_logic_vector(7 downto 0); --to convert read in line to bits
    variable v_out_line : line;                         --
    --variable v_out_byte : std_logic_vector(7 downto 0); --
  begin

    file_open(file_VECTORS, "tf1.txt",  read_mode);
    file_open(file_OUT, "outfile.txt",  write_mode);

    -- Read in test signals:
    while not endfile(file_VECTORS) loop
      
      readline(file_VECTORS, v_in_line);
      read(v_in_line, v_in_byte);
      in_byte <= v_in_byte;
      wait for 2*T;

      -- Write test signals to a new file to file:
      write(v_out_line, in_byte, right, 8);
      writeline(file_OUT, v_out_line);
   
    end loop;    

    --wait for 10*T; -- Would space out end /begininig pf process as it ran
                     -- over and over. Note needed here.
    
    file_close(file_VECTORS);
    file_close(file_OUT);
    wait;            -- Run this process once.
    
  end process;

  --**********************************
  -- run the sim as a concrete process
  --**********************************
  process
  begin

    for i in 1 to numperiods loop -- Run simulation for this number of clock cycles
      wait until falling_edge(clk);
    end loop;
  

    --***************
    -- end simulation
    --***************
    assert false
      report "Simulation Complete"
    severity failure;
  
  end process;  

end arch;
