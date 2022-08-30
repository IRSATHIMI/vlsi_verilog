`include "inv.v"
module tb;
reg a;
wire y;
	
inv dut(a,y);

initial begin

	repeat(5) begin
	
		{a}=$random;
		#2;
	end
end
initial begin

$monitor("%0t= a=%b y=%b",$time,a,y);

end 
endmodule
