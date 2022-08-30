module mux_4x1(i,s,e,y);
input e;
input [3:0] i;
input [1:0] s;
output reg y;
always @(*) begin

	if (e==1'b1) begin 
	  y = s == 2'b11 ? i[3] : s == 2'b10 ? i[2] : s == 2'b01 ? i[1] : i[0];
	end	
	else  y=1'b0;
	
 //	$display("4x1 i=%b, s=%b, E=%b, y=%b",i,s,e,y);
end

endmodule

