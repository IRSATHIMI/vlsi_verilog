module top;
integer a;
//string name;//not supported in verilog 
			


initial begin
	a=100;
	$display("a=%0d",a);
	$display("a=%d",a);
	//a=f;	
	a=32'hf;
	$display("a=%h",a);
	$display("a=%d",a);
	a=32'o17;
	$display("a=%o",a);
	$display("a=%d",a);
	a=17;
	$display("a=%o",a);
	$display("a=%d",a);
end

endmodule
