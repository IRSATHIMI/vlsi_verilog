module tb;
integer i,e;
integer a[9:0];
integer b[9:0];

initial begin
	//initialising random value to array
	for(i=0;i<=9;i=i+1) begin
	a[i]=$urandom_range(40,60);
	end
	//checking and replacing array value to eliminate redundant value
	for(i=0;i<=9;i=i+1) begin
	for(e=0;e<=9;e=e+1) begin
		if(i==e) e=e+1;
		if(a[i]==a[e]) begin 
		a[i]=$urandom_range(40,60);
		end
	end
	end
	// displaying the value in array
	for(i=0;i<=9;i=i+1) begin
	$display("a[%0d]=%0d",i,a[i]);
	end
	for(i=0;i<=9;i=i+1) begin 
	for(e=0;e<=9;e=e+1) begin
		if(a[i]==a[e]) begin
		$display("a[%0d] is = a[%0d]",i,e);
		end
		else begin
		$display("a[%0d] is not = a[%0d]",i,e);
		end
	end
	end
end
endmodule
