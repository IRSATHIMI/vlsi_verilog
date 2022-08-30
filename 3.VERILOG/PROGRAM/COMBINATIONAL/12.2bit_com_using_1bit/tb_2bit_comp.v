`include "2bitcomp_using1bit.v"
module tb;
reg [1:0] a,b;
//reg  a,b;
wire g,e,l;
integer s;

twobitcomp dut(a,b,g,e,l);

initial begin
 
 	$display("time  A B		G E L");

 	for(s=0;s<=15;s=s+1) begin
	
	{a,b}=s;
	#10;
	$display("%2t    %b %b		%b %b %b",$time,a,b,g,e,l);
	
	end
	
end
endmodule
