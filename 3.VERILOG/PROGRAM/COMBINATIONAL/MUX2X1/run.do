vlog tb_mux_2x1_dataflow.v
vsim -novopt tb -suppress 12110
add wave -position insertpoint sim:/tb/dut/*
run -all
