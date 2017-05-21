Note: I find it easier to just use a few bash scripts than make to do
simple stuff with ghdl. But that said, here is a Makefile workflow:

1. Put necessary .vhd files (including a _tb file) into chk and run it once as ./chk

2. Run:
   * ghdl --gen-makefile WHATEVER_NAME_tb > Makefile to get a
     skeleton makefile, then:
   * make run
   * ./view

3. To clean execute:
    ./cln. 
    * I didn't put this in the Makefile, but the commands in there can
      be. The same is true of view.
