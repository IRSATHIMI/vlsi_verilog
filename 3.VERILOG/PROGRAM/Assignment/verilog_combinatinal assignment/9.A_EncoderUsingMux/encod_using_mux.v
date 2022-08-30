`include "mux_2x1_dataflow.v"
module encoder(i,y);
input [3:0] i;
output [1:0] y;

mux_2x1 m1({2'b01},i[1]|i[3],y[0]);
mux_2x1 m2({2'b01},i[2]|i[3],y[1]);

endmodule

