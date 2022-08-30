`include "mux_4x1_structural.v"
module tb;
reg i0, i1, i2, i3;
reg [1:0] sel;
wire y;
mux_4x1 dut(i0, i1, i2, i3, sel, y);


initial begin
repeat(10) begin
	{sel, i0, i1, i2, i3} = $random; 	
	#2;
	$display("%t : i0=%b, i1=%b, i2=%b, i3=%b, sel=%b, y=%b", $time, i0, i1, i2, i3, sel, y);
end
end
endmodule

