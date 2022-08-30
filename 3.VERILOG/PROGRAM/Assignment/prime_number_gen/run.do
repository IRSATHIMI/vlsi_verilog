vlog prime_number_gen.v
vsim -novopt tb -suppress 12110 +prime_no.=100
add wave -position insertpoint sim:/tb/*
run -all
