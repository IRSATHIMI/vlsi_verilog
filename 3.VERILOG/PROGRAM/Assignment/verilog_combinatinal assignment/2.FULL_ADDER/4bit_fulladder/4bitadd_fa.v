`include "fulladder.v"
module bitadder(a,b,ci,sum,carry);
input [3:0] a,b;
input ci;
output [3:0] sum;
output carry;
wire carry0,carry1,carry2;

	fa u0(sum[0],carry0,a[0],b[0],ci);
	fa u1(sum[1],carry1,a[1],b[1],carry0);
	fa u2(sum[2],carry2,a[2],b[2],carry1);
	fa u3(sum[3],carry,a[3],b[3],carry2);

endmodule

