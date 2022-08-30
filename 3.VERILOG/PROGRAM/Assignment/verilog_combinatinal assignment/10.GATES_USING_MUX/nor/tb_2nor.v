`include "nor2.v"
module tb;
reg a,b;
wire y;

norg2 dut(a,b,y);

initial begin

	repeat(10) begin
	
		{a,b}=$random;
		#2;
	end
end
initial begin

$monitor("%0t= a=%b b=%b y=%b",$time,a,b,y);

end 
endmodule
