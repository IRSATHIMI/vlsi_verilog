`include "fulladder.v"
module tb;
reg  a,b,ci;
wire sum,carry;
integer seed;

fa dut(sum,carry,a,b,ci);

initial begin
seed=120;
repeat(10) begin
a=$random(seed);
b=$random(seed);
ci=$random(seed);

#2;
end

end
initial begin
$monitor("%0t: a=%b, b=%b, ci=%b, sum=%b, carry=%b",$time, a,b,ci,sum,carry);
end
endmodule

	
