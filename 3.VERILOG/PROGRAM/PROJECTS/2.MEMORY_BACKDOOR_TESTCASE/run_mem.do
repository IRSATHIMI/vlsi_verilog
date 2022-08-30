vlog tb_mem.v 
vsim -novopt tb -suppress 12110 +testcase=random_mem_write_read_backdoor +startaddr=0 +endaddr=10
add wave -position insertpoint sim:/tb/dut/*
run -all
