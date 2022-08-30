module encoder_3x8_str(i,y);
input [7:0] i;
output [2:0] y;
/*y2 = Y7 + Y6 + Y5 + Y4
y1 = Y7 + Y6 + Y3 + Y2
y0 = Y7 + Y5 + Y3 + Y1 */

//assign y[2]=i[7]|i[6]|i[5]|i[4];




or a2(y[2],i[7],i[6],i[5],i[4]);
or a1(y[1],i[7],i[6],i[3],i[2]);
or a0(y[0],i[7],i[5],i[3],i[1]);
	

endmodule
