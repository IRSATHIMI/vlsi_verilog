module dff(clk, rst, d, q);
input wire clk, rst, d;
output reg q;

always @(posedge clk) begin  //behavioral modeling
	if (rst == 1)  q <= 0;
	else q <= d;
end
endmodule
