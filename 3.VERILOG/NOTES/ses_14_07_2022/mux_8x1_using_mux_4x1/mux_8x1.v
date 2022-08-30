module mux_8x1(i,sel,out);
input [7:0] i;
input [2:0] sel;
output out;

mux_4x1 m1(i[3:0],sel[1:0],n1);
mux_4x1 m2(i[7:4],sel[1:0],n2);
mux_4x1 m3({n2,2'b0,n1},{sel[2],sel[2]},out);
//mux_4x1 m3({n2,1'b0,1'b0,n1},{sel[2],sel[2]},out);
endmodule

//1'b0,1'b0,1'b1
//3'b001

//2'b0 -> 2'b00

