vlog tb_upcount.v
vsim -novopt tb -suppress 12110 +N=5 +up'1down'0'=0
add wave -position insertpoint sim:/tb/dut/*
run -all
