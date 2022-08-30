#compuilation
vlog fifo.svh

#elaboration
vsim -novopt work.tb

#logging, to view the signals values in waveform, trace them
add log -r sim:/tb/*

#simualtion
run -all
