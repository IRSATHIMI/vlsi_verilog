`include "mod6_counter_high_level.v"
module tb;
reg clk, rst; //scalar
wire [2:0] count; //vector

mod6_counter dut(clk, rst, count);

initial begin
	clk = 0;
	forever #5 clk = ~clk; //clock generation, TP=10ns
end

initial begin
	rst = 1; //applying reset
	#20; //holding reset
	rst = 0; //releasing reset
	#500; //run things for 500 units
	$finish; //end the simulation
end
endmodule
