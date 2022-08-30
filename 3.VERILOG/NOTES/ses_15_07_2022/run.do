vlog tb.v 
vsim -novopt -suppress 12110 tb +inputcase=test2
add wave -position insertpoint sim:/tb/dut/*
run -all
