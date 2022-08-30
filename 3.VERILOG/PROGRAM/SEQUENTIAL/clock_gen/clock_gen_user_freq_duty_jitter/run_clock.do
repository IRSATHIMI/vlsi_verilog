vlog clock_user_freq.v 
vsim -novopt tb -suppress 12110 +freq=100 +duty=50 +jitter=10
add wave -position insertpoint sim:/tb/*
run -all
