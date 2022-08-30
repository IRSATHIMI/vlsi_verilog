module tb;
integer i,e;
integer a[9:0];
integer b;

initial begin
	/* assigning unique value to array after comparing it 
	all the below array */
	for(i=0;i<=9;i=i+1) begin
	for(e=0;e<=i;e=e+1) begin
	b=$urandom_range(40,60);
		if (i==0) a[i]=b;
		if(a[i]==a[e]) e=0;
		else a[i]=b;
	end
	end
	
	// displaying the value in array
	for(i=0;i<=9;i=i+1) begin
	$display("a[%0d]=%0d",i,a[i]);
	end
	for(i=0;i<=9;i=i+1) begin 
	for(e=0;e<=9;e=e+1) begin
		if (a[i]==a[e]) $display("a[%0d] is = a[%0d]",i,e);
		else $display("a[%0d] is not = a[%0d]",i,e);
	end
	end
end
endmodule
