vlog reg_ex.v 
vsim -novopt -suppress 12110 top +inputcase=test2
run -all
