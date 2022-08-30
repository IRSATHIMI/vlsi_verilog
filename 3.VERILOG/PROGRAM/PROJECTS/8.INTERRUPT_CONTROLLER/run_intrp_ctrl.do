vlog tb_intrpt_ctrl.v 
vsim -novopt tb -suppress 12110 +testcase=assending +seed=345
add wave -position insertpoint sim:/tb/dut/*
run -all
