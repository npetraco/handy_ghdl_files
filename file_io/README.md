Note: Assumes R is installed. R is used to randomly sample bytes and
dump them to file. That said, anything can be used to do this. I just
like to use R.

Execute:

* ./cln
* ./chk

Then:

* ./run2
   * To get a get a random set of 1 byte signals and a .ghk file.  Plot in gtkwave.

* ./rerun2
   * If code is changed, handy to regenerate the .ghk file but NOT gen
      a new set of random bytes NOR reset gtkwave.
   
* ./rerun2s
   * Same as rerun2 but get a new set of random bytes.
