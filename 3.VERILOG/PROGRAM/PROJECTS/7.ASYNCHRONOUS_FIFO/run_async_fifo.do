vlog tb_async_fifo.v
vsim -novopt tb -suppress 12110 +Test_Case=real_life +NO_WRITE=10 +NO_READ=9
add wave -position insertpoint sim:/tb/dut/*
run -all
