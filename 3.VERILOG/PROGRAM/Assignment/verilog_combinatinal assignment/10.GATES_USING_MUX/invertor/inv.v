`include "mux_2x1.v" 
module inv(a,y);
input a;
wire b,c;
output y;
// mux_2x1(i0, i1, sel, y);

assign c=a|(~a); //c=1
assign b=a&(~a); //b=0

mux_2x1 u0(c,b,a,y);

endmodule
