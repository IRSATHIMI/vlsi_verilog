module ha(s, c, a, b);
input a, b;
output s, c;

always @(*) begin
	{c, s} = a+b;
end
endmodule

