vlog tb_spi_ctrl.v 
vsim -novopt tb -suppress 12110
add wave -position insertpoint sim:/tb/dut/*
run -all
