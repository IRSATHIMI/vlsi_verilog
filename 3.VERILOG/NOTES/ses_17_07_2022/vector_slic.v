module top;
reg [-3:3] a;//LSb=3   MSB=-3//size 7  
reg [7:1] b = 7'b1110_011;//LSb=1   MSB= 7//size 7

initial begin
	$display("b=%b",b);	
	a=b;
	$display("####  we are doing  a=b  ###;");
	$display("a=%b",a);	
	$display("a[-2:2]=%b",a[-2:2]); //->5'b11001
	$display("a[-1:1]=%b",a[-1:1]); //->3'b100
	$display("a[0:3]=%b",a[0:3]);  //->4'b0011
//	$display("a[0:3]=%b",a[3:-3]);//this is wrong 
// we have to use MSB to LSb itself
end


endmodule
/*
# vsim top "+inputcase=test2" 
# Start time: 12:06:30 on Jul 18,2022
# Loading work.top
# b=1110011
####  we are doing  a=b  ###;
# a=1110011
# a[-2:2]=11001
# a[-1:1]=100
# a[0:3]=0011


*/
