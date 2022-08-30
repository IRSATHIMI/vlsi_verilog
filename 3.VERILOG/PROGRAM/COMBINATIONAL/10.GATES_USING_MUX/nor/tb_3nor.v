`include "nor3.v"
module tb;
reg a,b,c;
wire y;
integer seed;
nor3 dut(a,b,c,y);

initial begin
seed=207;
	repeat(20) begin
	
		{a,b,c}=$random;
		#2;
	end
end
initial begin

$monitor("%0t= a=%b b=%b c=%b y=%b",$time,a,b,c,y);

end 
endmodule
