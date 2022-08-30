`include "ha_dataflow.v"
module tb;
reg a, b;
wire s, c;

ha dut(s, c, a, b);

initial begin
repeat(10) begin
	{a,b} = $random;
	#1;
end
end

initial begin
	$monitor("%t: a=%b, b=%b, s=%b, c=%b", $time, a, b, s, c);
end

initial begin
  $dumpvars;
  $dumpfile("test.vcd");
end
endmodule
