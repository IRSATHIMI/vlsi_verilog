module halfadder(a,b,s,c);
input a,b;
output reg s,c;

always @(*)begin
	if (a==1'b0 & b=='b0) begin 
		s=1'b0 ; c=1'b0; end
	else if (a==1'b0 & b==1'b1)
		begin s=1'b1; c=1'b0; end	
	else if (a==1'b1 & b==1'b0)
		begin s=1'b1; c=1'b0; end
	else if (a==1'b1 & b==1'b1) 
		begin s=1'b0; c=1'b1; end
	else begin s=1'bx;  c=1'bx;	end
end
endmodule
