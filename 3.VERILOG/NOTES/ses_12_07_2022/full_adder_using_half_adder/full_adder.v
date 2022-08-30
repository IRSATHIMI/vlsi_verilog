module full_adder(a_fa,b_fa,cin_fa,sum_fa,carry_fa);
input a_fa,b_fa,cin_fa;
output sum_fa,carry_fa;

wire n1,n2,n3;

//how to instantiate half_adder design ?
//design_module_name instance_name(port_connection);
//port_connection -> connection by position

half_adder ha1(a_fa,b_fa,n1,n2);
half_adder ha2(n1,cin_fa,sum_fa,n3);

//module half_adder_example(a_ha,sum_ha,b_ha,carry_ha);//port declaration
//half_adder_example ha1(a_fa,n1,b_fa,n2);

//how to instantiate gates ?
//gate_module_name instance_name(output,input1,input2 sna dso on);
or g1(carry_fa,n2,n3);
endmodule
