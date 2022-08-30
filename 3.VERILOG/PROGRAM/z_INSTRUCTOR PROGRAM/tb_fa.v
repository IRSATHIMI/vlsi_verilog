`include "fa_dataflow.v"
module tb;
reg a, b, ci;
wire s, c;
integer seed;

fa dut(s, c, a, b, ci);

initial begin
seed = 1919;
$monitor("%t: a=%b, b=%b, ci=%b, s=%b, c=%b", $time, a, b, ci, s, c);
repeat(10) begin
	{ci, a,b} = $random(seed);
	#1;
end
end

initial begin
  $dumpvars;
  $dumpfile("test.vcd");
end
endmodule

