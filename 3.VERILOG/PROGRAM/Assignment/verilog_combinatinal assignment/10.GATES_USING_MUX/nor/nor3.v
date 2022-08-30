`include "mux_2x1.v" 
module nor3(a,b,c,y);
input a,b,c;
wire q,y0;
output y;
// mux_2x1(i0, i1, sel, y);

assign q=a&(~a); //q=1;

mux_2x1 u0(q,b,c,y0);
mux_2x1 u1(q,y0,a,y);

endmodule
