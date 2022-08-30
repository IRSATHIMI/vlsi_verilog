module fa(s, c, a, b, ci);
input a, b, ci;
output reg s, c;

always @(*) begin
	{c, s} = a+b+ci; 
end
endmodule

