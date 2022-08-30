module mux_8x1(i0,i1,i2,i3,i4,i5,i6,i7,sel,y);
input [2:0] i0,i1,i2,i3,i4,i5,i6,i7;
output reg [2:0] y;

input [2:0] sel;

always @ (*) begin

case(sel) 

3'b000 : y=i0;
3'b001 : y=i1;
3'b010 : y=i2;
3'b011 : y=i3;
3'b100 : y=i4;
3'b101 : y=i5;
3'b110 : y=i6;
3'b111 : y=i7;
default: y=3'b111;

endcase

end

endmodule


