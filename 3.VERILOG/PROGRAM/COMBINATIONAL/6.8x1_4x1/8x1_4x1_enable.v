`include "mux_4x1.v"
module mux_8x1(i1,i2,s,y);
input [3:0] i1,i2;
output wor y;

input [2:0] s;

//assign s21=~s[2];

//assign y=y1&y2;
//assign s21=0|x;
	
	mux_4x1 u0(i1,s[1:0],s[2],y);	
	mux_4x1 u1(i2,s[1:0],~s[2],y);

//assign y=y1|y2;

endmodule


