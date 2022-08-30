`include "decoder3x8.v"
module tb;
reg [2:0] i;
wire [7:0] y;
integer a;
encoder_3x8 dut(i,y);

initial begin


//	$display("%t : i0=, i1=, i2=, i3=, y=");
$display("$time  i            y");
	
	for (a=0;a<=7;a=a+1) begin

		i=a;
		#2;
		$display("%5t %b%b%b %b",$time, i[0], i[1], i[2], y);
	
	end


end
endmodule

