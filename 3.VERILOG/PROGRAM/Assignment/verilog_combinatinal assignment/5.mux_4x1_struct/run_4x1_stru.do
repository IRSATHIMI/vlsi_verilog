vlog tb_mux_4x1_struct.v
vsim -novopt tb -suppress 12110
add wave -position insertpoint sim:/tb/dut/*
run -all