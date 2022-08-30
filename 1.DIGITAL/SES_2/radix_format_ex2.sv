module top;
reg [31:0] a;
//reg [MSB:LSB] a;
//formula -> (MSB-LSB)+1

initial begin
	//a=15;
	a=-5;
	$display("binary a=%b",a);
	$display("decimal a=%d",a);
	//$display("octal a=%o",a);
	//$display("hexadecimal a=%h",a);
end
endmodule
