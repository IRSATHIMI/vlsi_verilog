module dff(clk, rst, d, q);
input clk, rst, d;
output reg q;

always @(posedge clk) begin
	if (rst==1) q = 0;
	else q = d;
end
endmodule

module mod6_counter(clk, rst, count);
input clk, rst; //scalar
output [2:0] count; //vector

//low level description
assign D2 = count[2]&~count[0] | count[1]&count[0];
assign D1 = count[1]&~count[0] | ~count[2]&~count[1]&count[0];
assign D0 = ~count[0];

dff u2(clk, rst, D2, count[2]);
dff u1(clk, rst, D1, count[1]);
dff u0(clk, rst, D0, count[0]);
endmodule

