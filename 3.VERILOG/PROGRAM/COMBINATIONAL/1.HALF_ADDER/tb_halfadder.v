`include "HALFADDER_DATAFLOW1.v"

module tb;
reg [1:0] a;
wire s,c;

halfadder dut(a,s,c);

initial begin

repeat(20) begin
 a=$random;
 
 #2;
 $display("%t : a=%b,sum=%b, carry=%b",$time, a, s, c);
 end
 end
 endmodule

