`timescale 1ns/1ps
module tb;
reg clk;
real freq,tp;
always begin
clk=0;
#(tp/2);	 //5nano sec
clk=1;
#(tp/2);
end

initial begin
$value$plusargs("freq=%f",freq); //freq in mhz
tp=1000/freq; //converting frequncy into nanosecond
#100;
$finish;
end

endmodule
