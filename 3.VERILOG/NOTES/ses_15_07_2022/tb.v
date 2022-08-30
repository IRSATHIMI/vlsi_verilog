`include "wand.v"
//`include "wor.v"
//`include "tri_xor.v"
module tb;
//reg a,b,dir;
reg a,b;
wire y;

wand_nature dut(a,b,y);

//tri_xor dut(a,b,dir,y);

initial begin
repeat(20) begin
	//{a,b,dir}=$random;
	{a,b}=$random;
	#10;
end
end
endmodule
