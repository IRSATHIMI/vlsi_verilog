module encoder_3x8_str(i,y);
input [7:0] i;
output [2:0] y;

//y[2] = D4+D5+D6+D7
//y[1] = (d5
//y[0] = D1+D3+D5+D7

assign y[2] =i[4]|i[5]|i[6]|i[7];
assign y[1] =(((~i[5])&(~i[4]))&(i[2]|i[3]))|i[6]|i[7];
assign y[0] =((~i[6])&(((~i[4])&(~i[2])&i[1])|((~i[4])&i[3])|i[5]))|i[7];	

endmodule
