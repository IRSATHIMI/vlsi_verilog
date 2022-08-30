vlog String.v
vsim -novopt top -suppress 12110
add wave -position insertpoint sim:/top/*
run -all
