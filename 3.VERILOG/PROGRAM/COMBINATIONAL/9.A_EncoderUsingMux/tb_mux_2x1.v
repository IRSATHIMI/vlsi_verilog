`include "encod_using_mux.v"
module tb;
reg [3:0] i,ls;
wire [1:0] y;
integer a;

encoder dut(i,y);

//generate and drive input to the design
initial begin
ls=1'b0001;
		for (a=0;a<=3;a=a+1) begin

		i=ls;
		ls=ls<<1;
		#2;
		$display("%5t %b %b",$time, i, y);
	
		end

end
endmodule
