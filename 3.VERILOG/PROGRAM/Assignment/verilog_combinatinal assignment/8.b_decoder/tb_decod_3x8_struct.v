`include "decoder3x8_stuct.v"
module tb;
reg [2:0] i;
reg e;
wire [7:0] y;
integer a, b;

decoder_3x8 dut(i,e,y);

initial begin
e=1'b0;
	
	
	for (b=0;b<=1;b=b+1)begin	
	
	$display("when Enable = %b",e);
	$display("$time  e   i     y");
	
	for (a=0;a<=7;a=a+1) begin

		i=a;
		#2;
		$display("%5t  %b  %b%b%b %b",$time, e, i[2], i[1], i[0], y);
	end
	
	e=1'b1;
	
	end


end
endmodule

