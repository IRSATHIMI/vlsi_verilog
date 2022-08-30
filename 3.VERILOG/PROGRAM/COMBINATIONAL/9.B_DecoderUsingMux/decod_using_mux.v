`include "mux_2x1_dataflow.v"
module decoder(i,y);
input [1:0] i;
output [3:0] y;


mux_2x1 m0({~i[1],1'b0},i[0],y[0]);
mux_2x1 m1({i[1],1'b0},i[0],y[1]);
mux_2x1 m2({1'b0,~i[1]},i[0],y[2]);
mux_2x1 m3({1'b0,i[0]},i[1],y[3]);

endmodule

