`include "upcount3bit_behav.v"
module tb;
reg clk,reset;
wire [2:0] count;
reg n;

upcount dut(clk,reset,count);

always begin

clk=0;
#5;
clk=1;
#5;

end

initial begin

reset=1;
@(posedge clk);
reset=0;
#105;
reset=1;
@(posedge clk);
reset=0;
#100;
$finish;
end
endmodule
