module tb;
integer a=10,b=20,c;

initial begin
$display("before swaping a=%d  b=%d",a,b);
#5;
c=b;
b=a;
a=c;
$display("after swaping a=%d  b=%d",a,b);
end


endmodule
