read_liberty -lib ../lib/nangate45_fast.lib
read_verilog FA.v
synth -top FA
techmap
show
opt
abc -liberty ../lib/nangate45_fast.lib
opt
show
