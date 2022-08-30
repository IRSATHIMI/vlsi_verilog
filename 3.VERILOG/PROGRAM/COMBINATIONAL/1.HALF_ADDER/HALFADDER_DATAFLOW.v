module halfadder(a,s,c);
input [1:0] a;
output s,c;

assign s = a == 2'b00 ? 1'b0 : a == 2'b01 ? 1'b1 : a == 2'b10 ? 1'b1 : 1'b0;
assign c = a == 2'b00 ? 1'b0 : a == 2'b01 ? 1'b0 : a == 2'b10 ? 1'b0 : 1'b1;

endmodule
