vlog tb_dff.v  
vsim -novopt tb -suppress 12110 
add wave -position insertpoint sim:/tb/dut/*
run -all
