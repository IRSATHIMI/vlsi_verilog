module decoder_3x8(i,y);
input [2:0] i;
output reg [7:0]y;

always @(*) begin

	case (i)
	
		3'b000 	: y =1;
		3'b001 	: y =2;
		3'b010 	: y =4;
		3'b011 	: y =8;
		3'b100 	: y =16;
		3'b101 	: y =32;
		3'b110 	: y =64;
		3'b111 	: y =128;
		default : y = 0 ;
	endcase

	end

endmodule
