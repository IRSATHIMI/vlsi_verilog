vlog tb_n-bit.v 
vsim -novopt tb -suppress 12110 +N-bit_adder=5
add wave -position insertpoint sim:/tb/dut/*
run -all
