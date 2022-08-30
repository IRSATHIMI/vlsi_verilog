`include "mux_2x1.v" 
module or2g(a,b,y);
input a,b;
wire c;
output y;
// mux_2x1(i0, i1, sel, y);

assign c=a|(~a);

mux_2x1 u0(b,c,a,y);

endmodule
