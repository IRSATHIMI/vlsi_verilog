vlog clock_user_freq.v 
vsim -novopt tb -suppress 12110 +freq=50 +duty=80
add wave -position insertpoint sim:/tb/*
run -all
