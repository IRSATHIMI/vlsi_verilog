`timescale 1ns/1ps;
module tb;
integer a=10,b=20,c;

initial begin
$display("before swaping a=%d  b=%d",a,b);
#5;
b <=a;
a <=b;
#0.5;
$display("after swaping a=%d  b=%d",a,b);
end


endmodule
