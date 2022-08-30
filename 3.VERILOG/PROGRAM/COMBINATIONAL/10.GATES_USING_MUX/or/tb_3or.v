`include "or3.v"
module tb;
reg a,b,c;
wire y;
integer seed;

or3g dut(a,b,c,y);

initial begin
seed=200;
	repeat(10) begin
	
		{a,b,c}=$random;
		#2;
	end
end
initial begin

$monitor("%0t= a=%b b=%b c=%b y=%b",$time,a,b,c,y);

end 
endmodule
