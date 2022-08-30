`timescale 1ns/1ps
module tb;
reg clk;
real freq,tp,duty;
real jitter,jitter_fact,tj;
always begin
jitter_fact=$urandom_range(100-jitter,100+jitter)/100.0;
tj=tp*jitter_fact;
clk=0;
#(tj*duty/100);	
clk=1;
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

endmodule
