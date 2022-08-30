`include "4bitadd_fa.v"
module tb;
reg [3:0] a,b;
reg ci;
wire [3:0] sum;
wire carry;
integer seed;

bitadder dut(a,b,ci,sum,carry);

initial begin
	seed=120;
	ci=1'b0;

repeat(10) begin
	seed=seed+$random;
	a=$random(seed);
	b=$random(seed);
	#2;

end

end

initial begin
	$monitor("%0t: a=%b, b=%b,c=%b, sum=%b, carry=%b",$time, a,b,ci,sum,carry);
end

endmodule

	
