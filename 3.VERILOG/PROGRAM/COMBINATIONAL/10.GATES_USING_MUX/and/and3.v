`include "mux_2x1.v" 
module andg2(a,b,c,y);
input a,b,c;
wire q,y0;
output y;
// mux_2x1(i0, i1, sel, y);

assign q=a&(~a);

mux_2x1 u0(q,c,b,y0);
mux_2x1 u1(q,y0,a,y);

endmodule
