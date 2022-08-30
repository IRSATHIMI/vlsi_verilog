module not_gate(a,out);
input a;
output out;

//module mux2x1(i,sel,out);//mux2x1 (i1,i0,sel,out)
//here i is a 2 bit vector
//input [1:0] i;//i1,i0
mux2x1 mux1({1'b0,1'b1},a,out);
//main design needs sub blocks
//main design is not gate
//sub block is mux2x1


endmodule
