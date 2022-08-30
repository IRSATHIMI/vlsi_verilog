vlog tb_2x1.v +define+BEHAV 
vsim -novopt tb -suppress 12110
add wave -position insertpoint sim:/tb/dut/*
run -all
