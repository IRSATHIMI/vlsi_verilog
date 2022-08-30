`include "fa_4bit_dataflow.v"
module tb;
reg a0, a1, a2, a3, b0, b1, b2, b3;
reg ci;
wire s0, s1, s2, s3;
wire c;
integer seed;

fa_4bit dut(s0, s1, s2, s3, c, a0, a1, a2, a3, b0, b1, b2, b3, ci);

initial begin
seed = 1919;
$monitor("%t: a=%b, b=%b, ci=%b, s=%b, c=%b", $time, a, b, ci, s, c);
repeat(10) begin
	{ci, a0, a1, a2, a3,b0, b1, b2, b3} = $random(seed);
	#1;
end
end

initial begin
  $dumpvars;
  $dumpfile("test.vcd");
end
endmodule


