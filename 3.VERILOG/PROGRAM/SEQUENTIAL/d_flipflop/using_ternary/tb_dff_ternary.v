`include "d_ff_behav_ternary.v"
module tb;
reg d,clk,rst;
wire q;

dff dut(clk,d,rst,q);

initial clk=0;
always #5 clk=~clk;

initial begin
rst=1;
#10;
rst=0;
d=0;
repeat (10) begin
d=~d;
#2;
d=$random;
#2;
end
#2;
$finish;
end

endmodule
