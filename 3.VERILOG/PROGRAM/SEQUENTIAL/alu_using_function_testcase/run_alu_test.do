vlog alu_testcase_inside_function.v 
vsim -novopt tb -suppress 12110 +value_x=10.0 +value_y=5.0 +operation=mul 
add wave -position insertpoint sim:/tb/*
run -all
