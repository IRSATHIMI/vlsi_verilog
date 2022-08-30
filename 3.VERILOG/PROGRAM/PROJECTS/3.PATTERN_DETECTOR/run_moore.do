vlog tb_pattern_moore.v
vsim -novopt tb -suppress 12110
add wave -position insertpoint sim:/tb/dut/*
run -all
