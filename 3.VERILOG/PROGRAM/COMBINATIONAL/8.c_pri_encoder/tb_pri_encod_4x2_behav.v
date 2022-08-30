`include "pri_encoder3x8_behav.v"
module tb;
reg [3:0] i,rs;
wire [1:0] y;
integer a,b;

encoder_4x2_behav dut(i,y);

initial begin
rs=4'b0001;

$display(" time  i   y");

	for (a=0;a<=3;a=a+1) begin
		i=rs;
		rs=rs<<1;
		#2;
		$display("%5t %b %b",$time, i, y);
	if (a==3) begin
	$display("\n whatever may b d bit before i[n] output is same\n");
	$display(" time  i   y");
	rs=4'b0001;
	for (b=0;b<=3;b=b+1) begin

		i=rs;
		rs=rs<<1|1;
		#2;
		$display("%5t %b %b",$time, i, y);
	end
	end
	end


end
endmodule

