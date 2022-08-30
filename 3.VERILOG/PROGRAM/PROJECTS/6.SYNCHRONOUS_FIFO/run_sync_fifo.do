vlog tb_sync_fifo.v
vsim -novopt tb -suppress 12110 +Test_Case=concurrent
add wave -position insertpoint sim:/tb/dut/*
run -all
