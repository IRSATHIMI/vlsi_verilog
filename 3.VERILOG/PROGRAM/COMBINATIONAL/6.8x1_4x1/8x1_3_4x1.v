`include "mux_4x1.v"
module mux_8x1(i1,i2,s,y);
input [3:0] i1,i2;
output y;

input [2:0] s;

//assign s21=~s[2];

//assign y=y1&y2;
//assign s21=0|x;
	
	mux_4x1 u0(i1,s[1:0],1'b1,y2);	
	mux_4x1 u1(i2,s[1:0],1'b1,y1);
	mux_4x1 u3({y1,1'b0,1'b0,y2},{s[2],s[2]},1'b1,y);

//assign y=y1|y2;

endmodule


