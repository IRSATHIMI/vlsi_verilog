`include "priority_encod_casex.v"
module tb;
reg [3:0] i,rs;
wire [1:0] y;
integer a,b;

priority_en dut(i,y);

initial begin
rs=1'b00000001;

$display(" time     i     y");

	for (a=0;a<=7;a=a+1) begin

		i=rs;
		rs=rs<<1;
		#2;
		$display("%5t %b %b",$time, i, y);
	if (a==7) begin
	$display("\n whatever may b d bit before i[n] output is same\n");
	$display(" time     i     y");
	for (b=0;b<=7;b=b+1) begin

		i=rs;
		rs=rs<<1|1;
		#2;
		$display("%5t %b %b",$time, i, y);
	end
	end
	end


end
endmodule

