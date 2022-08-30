module tb;

reg  a,b;
wire c;


and #(2:5:6,3:5:7) u1(c,a,b);
initial begin
repeat (100) begin
a=0;
b=1;
#3;
a=1;
b=1;
#3;
a=1;
b=0;
#5;
end
#50;
end
endmodule
