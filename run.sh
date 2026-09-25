#!/bin/bash
verilator --binary -j 0 -Wall counter.v mux2x1.v alu.v mini_soc.v mini_soc_tb.v --top mini_soc_tb --timing --CFLAGS "-std=c++20" --trace

cd obj_dir || {echo "obj_dir not found"; exit 1;}

make -f Vmini_soc_tb.mk Vmini_soc_tb || {echo "Compilation failed";exit 1;};

./Vmini_soc_tb || {echo "Simulation failed"; exit 1;}

gtkwave dump.vcd
