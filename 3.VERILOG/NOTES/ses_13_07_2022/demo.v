`include "half_adder.v"
`include "full_adder.v"
module tb;
reg a_tb,b_tb,cin_tb;
wire sum_tb,carry_tb;
reg a0,a1,a2,a3,a4....
integer xyz;

full_adder fa(a_tb,b_tb,cin_tb,sum_tb,carry_tb);

initial begin
xyz=8796543;
$monitor("inputs are -> a_tb=%b,b_tb=%b,cin_tb=%b,\noutputs -> sum_tb=%b,carry_tb=%b\n", a_tb,b_tb,cin_tb,sum_tb,carry_tb);
$monitor("",a,b,c,s,ca);
repeat(10) begin
	{a_tb,b_tb,cin_tb}=$random(xyz);
	#10;
end
end

//initial begin
//$monitor("inputs are -> a_tb=%b,b_tb=%b,cin_tb=%b,\noutputs -> sum_tb=%b,carry_tb=%b\n", a_tb,b_tb,cin_tb,sum_tb,carry_tb);
//end
endmodule
