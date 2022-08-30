`include "xnor.v"
module tb;
reg a,b;
wire y;

xnorg dut(a,b,y);

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
