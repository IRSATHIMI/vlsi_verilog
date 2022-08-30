module half_adder(a_ha,b_ha,sum_ha,carry_ha);//port declaration
input a_ha,b_ha;
output sum_ha,carry_ha;

//dataflow
assign sum_ha=a_ha ^ b_ha;
assign carry_ha = a_ha & b_ha;
//behavioural


//gatelevel
endmodule
