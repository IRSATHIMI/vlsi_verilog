module decoder_3x8(i,e,y);
input [2:0] i;
input e;
output [7:0]y;
/*
Y0=A0'.A1'.A2'
Y1=A0.A1'.A2'
Y2=A0'.A1.A2'
Y3=A0.A1.A2'
Y4=A0'.A1'.A2
Y5=A0.A1'.A2
Y6=A0'.A1.A2
Y7=A0.A1.A2
*/
assign y[0]=~i[0]&~i[1]&~i[2]&e;
assign y[1]=i[0]&~i[1]&~i[2]&e;
assign y[2]=~i[0]&i[1]&~i[2]&e;
assign y[3]=i[0]&i[1]&~i[2]&e;
assign y[4]=~i[0]&~i[1]&i[2]&e;
assign y[5]=i[0]&~i[1]&i[2]&e;
assign y[6]=~i[0]&i[1]&i[2]&e;
assign y[7]=i[0]&i[1]&i[2]&e;



endmodule
