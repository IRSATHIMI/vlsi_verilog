`include "1bit_compa.v"
module tb;
reg a,b;
wire g,e,l;
integer s;
onebitcomp dut(a,b,g,e,l);

initial begin
 
 	$display("time  A B		G E L");

 	for(s=0;s<=3;s=s+1) begin
	
	{a,b}=s;
	#3;
	$display("%2t    %b %b		%b %b %b",$time,a,b,g,e,l);
	
	end
	
end
endmodule
