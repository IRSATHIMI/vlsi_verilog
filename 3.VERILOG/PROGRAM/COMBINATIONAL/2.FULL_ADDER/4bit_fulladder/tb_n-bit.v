`include "n_bitadd_fa.v"
module tb;
parameter width=8;
reg [width-1:0] a,b;
reg ci;
wire [width-1:0] sum;
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
	$monitor("%0t: a=%0d, b=%0d,c=%0d, sum=%0d, carry=%0d, o=",$time, a,b,ci,sum,carry,{carry,sum});
end

endmodule

	
