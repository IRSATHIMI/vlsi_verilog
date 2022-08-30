vlog swap2_integer_nonblock.v 
vsim -novopt tb -suppress 12110
add wave -position insertpoint sim:/tb/*
run -all
