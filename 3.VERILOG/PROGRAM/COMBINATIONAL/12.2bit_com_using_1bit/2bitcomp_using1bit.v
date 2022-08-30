`include "1bit_compa.v"
module twobitcomp(a,b,g,e,l);
input [1:0] a,b;
output g,e,l;
wire g0,g1,e0,e1,l0,l1;

onebitcomp c1(a[0],b[0],g0,e0,l0);
onebitcomp c2(a[1],b[1],g1,e1,l1);

assign g=g1|(g0&(~l1));
assign e=e0&e1;
assign l=l1|(l0&(~g1));

endmodule

