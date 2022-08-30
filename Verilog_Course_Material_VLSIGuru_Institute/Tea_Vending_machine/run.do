vlog tb.v
vsim -novopt work.tb +testcase=2
add log -r sim:/tb/*
run -all
add wave sim:/tb/dut/*
