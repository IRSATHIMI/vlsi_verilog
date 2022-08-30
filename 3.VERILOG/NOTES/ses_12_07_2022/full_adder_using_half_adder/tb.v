`include "half_adder.v"
`include "full_adder.v"
module tb;
reg a_tb,b_tb,cin_tb;
wire sum_tb,carry_tb;

integer xyz;

//design instantiation -> connecting tb component with design component  
//design_module_name instance_name(port_connection);
//port_connection -> connection by position
full_adder fa(a_tb,b_tb,cin_tb,sum_tb,sum_tb);

//how to generate inputs to the design 
//what blocks should i implement?
// we implemented initial block 
// what is this initial block called? - > procedural block
//what is procedural block?
// procedural blocks allows the statements to be executed sequentially
// we use procedural blocks to write the functionality for the given blocks
//there are two procedural blocks -> 1. initial block
//											- is  written in testbench part
//												because initial are non syntasizable	
//									 2. always block
//											- can be used in both design as well as testbench
//												because always blocks are syntasizable	
														
initial begin
xyz=8796543;
//concatination
// given by {var1,var2 and so on...}
// combines two or more variable values
$monitor("inputs are -> a_tb=%b,b_tb=%b,cin_tb=%b,\noutputs -> sum_tb=%b,carry_tb=%b\n design wires -> n1=%b,n2=%b,n3=%b\n half_adder signals [ha1] a_ha=%b,b_ha=%b,sum_ha=%b,carry_ha=%b\n", a_tb,b_tb,cin_tb,sum_tb,carry_tb,fa.n1,fa.n2,fa.n3,fa.ha1.a_ha,fa.ha1.b_ha,fa.ha1.sum_ha,fa.ha1.carry_ha);

//fa.ha1.a_ha
//fa.ha2.a_ha
repeat(10) begin
	{a_tb,b_tb,cin_tb}=$random(xyz);
	#10;
end
end

//initial begin
//$monitor("inputs are -> a_tb=%b,b_tb=%b,cin_tb=%b,\noutputs -> sum_tb=%b,carry_tb=%b\n", a_tb,b_tb,cin_tb,sum_tb,carry_tb);
//end
endmodule
