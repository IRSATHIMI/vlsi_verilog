vlog tb_decod_3x8.v
vsim -novopt tb -suppress 12110
add wave -position insertpoint sim:/tb/dut/*
run -all
