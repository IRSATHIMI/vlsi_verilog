`include "mux_2x1_dataflow.v"
module encoder(i,y);
input [3:0] i;
output [1:0] y;
wire [1:0] w;

assign w1=i[2]|i[3];
assign w0=i[3]|(i[1]&(~i[2]));

mux_2x1 m1({2'b01},w0,y[0]);
mux_2x1 m2({2'b01},w1,y[1]);

endmodule

