`timescale 1ns/1ps
module tb;
reg clk;
real freq,tp,duty;
real jitter,jitter_fact,tj;
real prev_edge_time,curr_edge_time,tp_calc,freq_calc;

always begin
jitter_fact=$urandom_range(100-jitter,100+jitter)/100.0;
tj=tp*jitter_fact;
clk=1;
#(tj*duty/100);	
clk=0;
#(tj*((100-duty)/100));
end

initial begin
$value$plusargs("freq=%f",freq); //freq in mhz
$value$plusargs("duty=%f",duty); //dutycycle in percentage
$value$plusargs("jitter=%f",jitter); //jitter parameter
tp=1000/freq; //converting frequncy into nanosecond
#100;
$finish;
end

always @(posedge clk) begin
	prev_edge_time = curr_edge_time;
	curr_edge_time = $realtime;
	tp_calc = curr_edge_time-prev_edge_time;
	freq_calc = 1000/tp_calc;
	$display("timeperiod =%f \t frequncy =%f \t duty=%f \t jitter=%f",tp_calc,freq_calc,duty,jitter);
end

endmodule
