`include "or2.v"
module tb;
reg a,b;
wire y;

or2g dut(a,b,y);

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
