`include "fulladder.v"
module bitadder(a,b,ci,sum,carry);
parameter width=8;
input [width-1:0] a,b;
input ci;

output [width-1:0] sum;
output carry;

genvar n;
wire [width:0] c;

assign c[0]=ci;
assign carry=c[width];

for (n=0 ; n<width ; n=n+1) begin
	 fa u(sum[n],c[n+1],a[n],b[n],c[n]);
end

endmodule

