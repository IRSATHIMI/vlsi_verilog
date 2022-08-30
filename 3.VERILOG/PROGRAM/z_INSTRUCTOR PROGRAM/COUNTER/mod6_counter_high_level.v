//2 mins
module mod6_counter(clk, rst, count);
input clk, rst; //scalar
output reg [2:0] count; //vector

//algorithm: at every +edge of clk, if reset applied, count will become 0, else it keeps incrementing, whenever it reaches 6, make it 0.
//English -> Verilog format

//high level description
always @(posedge clk) begin
	if (rst == 1) begin
		count = 0;
	end
	else begin
		count = count + 1;
		if (count == 6) count = 0;
	end
end
endmodule
