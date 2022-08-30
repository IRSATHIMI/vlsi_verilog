module top;
reg [-3:3] a=7'b111;//LSb=3   MSB=-3//size 7  
reg [7:1] b = 7'b1110_011;//LSb=1   MSB= 7//size 7
integer out_mul,out_add;
integer val=122;
reg [2:0] c;

initial begin
	$display("value of a=%0d",a);
	$display("value of b=%0d",b);
	out_mul=a*b;
	out_add = a+b;
	//$display("a*b=%0d",a*b);
	//$display("a*b=%b",a*b);
	$display("out_mul=%b",out_mul);
	$display("out_mul=%0d",out_mul);
	$display("out_add=%b",out_add);
	$display("out_add=%0d",out_add);
	//$display("a+b=%0d",a+b);
	$display("val=%b",val);
	c=val;
	$display("c=%d",c);
end
endmodule
/*
reg [3:0] a;
reg [3:0] b;
reg [15:0] c;

initial begin
	a=4'b0100;//4
	b=4'b0100;//4
	c=a*b;//16
	//16 -> binary -> 1_0000;
	//where as  my out variable size is 4 to store value of 16 we need size of 5 minimum
	c=0;//which is wrong in multiplication




end



*/
