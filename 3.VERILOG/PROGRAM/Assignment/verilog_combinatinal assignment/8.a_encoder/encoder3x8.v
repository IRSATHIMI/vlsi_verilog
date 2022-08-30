module encoder_3x8(i,y);
input [7:0] i;
output reg [2:0] y;

always @(*) begin

	case (i)
	
		8'b10000000 	: y =7;	
		8'b01000000 	: y =6;
		8'b00100000 	: y =5;
		8'b00010000 	: y =4;
		8'b00001000 	: y =3;
		8'b00000100 	: y =2;
		8'b00000010 	: y =1;
		8'b00000001 	: y =0;
		default : y = 3'bxxx;
	endcase

	end

endmodule
