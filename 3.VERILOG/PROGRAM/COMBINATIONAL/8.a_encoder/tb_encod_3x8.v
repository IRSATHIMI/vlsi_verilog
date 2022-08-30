`include "encoder3x8.v"
module tb;
reg [7:0] i,rs;
wire [2:0] y;
integer a;
encoder_3x8 dut(i,y);

initial begin
rs=1'b00000001;

$display("time  i          y");
	
	for (a=0;a<=7;a=a+1) begin

		i=rs;
		rs=rs<<1;
		#2;
		$display("%5t %b %b",$time, i, y);
	
	end


end
endmodule

