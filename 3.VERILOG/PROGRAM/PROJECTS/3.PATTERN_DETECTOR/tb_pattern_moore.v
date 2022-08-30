`include "pattern_det_moore.v"
module tb;
reg clk,rst,d_i,valid_i;
wire pattern;
integer seed=124;
integer count=0;

pattern_det_moore dut(clk,rst,d_i,valid_i,pattern);

always begin
#5 clk=0; 
#5 clk=1;
end

initial begin
	rst=1;
	#20;
	rst=0;
	repeat(600) begin
	@(posedge clk);
	valid_i = 1;
	d_i=$random(seed);
	end
	@(posedge clk);
	valid_i =0;
	d_i =0;
	$display ("no. of pattern detected is %0d",count);
	#50;
	$finish;
end

always @(posedge pattern) count=count+1;

endmodule

