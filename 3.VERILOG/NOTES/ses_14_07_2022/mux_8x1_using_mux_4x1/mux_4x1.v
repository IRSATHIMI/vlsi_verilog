module mux_4x1(i,sel,out);
input [3:0] i;
input [1:0] sel;
output reg out;

always@(*) begin
	if(sel== 0) begin
		out=i[0];
	end
	else if(sel== 1) begin
		out=i[1];
	end
	else if(sel== 2) begin
		out=i[2];
	end
	else 
		out=i[3];
end
endmodule
