library ieee;
use ieee.std_logic_1164.all;

entity general_tb is
end general_tb;

architecture arch of general_tb is
  constant T          : time := 20 ns;
  constant numperiods : integer := 10;
  signal clk, reset   : std_logic;
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
  process
  begin

    for i in 1 to numperiods loop -- run simulation for this number of clock cycles
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
