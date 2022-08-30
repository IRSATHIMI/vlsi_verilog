//module sample(inout a);
module sample(inout reg a);
endmodule

module tb_p;
//reg a_inst;
wire a_inst;
sample s_inst(a_inst);
endmodule
