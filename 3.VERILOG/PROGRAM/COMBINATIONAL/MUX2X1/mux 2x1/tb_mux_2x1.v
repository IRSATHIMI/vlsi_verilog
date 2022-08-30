`include "mux_2x1.v"
module tb;
reg i0, i1, sel; //convert input to reg
wire y; //convert output to wire

//design instantiation
//keep the design on the testbench
//dut : Design Under Test
mux_2x1 dut(i0, i1, sel, y);

//generate and drive input to the design
initial begin
repeat(10) begin
	i0 = $random;
	i1 = $random;
	sel = $random;
	#2; //2 time unit delay
	$display("%t : i0=%b, i1=%b, sel=%b, y=%b", $time, i0, i1, sel, y);
end
end
endmodule
