vlog tb_upcount.v
vsim -novopt tb -suppress 12110 +N=5
add wave -position insertpoint sim:/tb/dut/*
run -all
