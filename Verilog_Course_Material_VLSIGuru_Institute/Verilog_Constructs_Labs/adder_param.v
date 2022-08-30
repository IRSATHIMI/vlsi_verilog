module adder(a,b,out); //will only for 3 bit inputs, will it work for 4 bit inputs?
parameter WIDTH = 3;
input [WIDTH-1:0] a,b;
output [WIDTH:0] out;

assign out = a + b;
endmodule


module bigadder();
   adder #(.WIDTH(2)) add1 (a1, b1, out1);  //2 bit adder
   adder #(.WIDTH(4)) add2 (a2, b2, out2);  //4 bit adder
   adder add3 (a3, b3, out3);  //default vlaue used
   adder add4 (a2, b2, out2);  //5 bit adder
   	defparam add4.WIDTH=5;
endmodule
