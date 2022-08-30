module fa(sum,carry,a,b,ci);
input a,b,ci;
output reg sum,carry;

always @(*) begin

	{carry,sum}=a+b+ci;
end
endmodule
	
