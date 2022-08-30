`include "decod_using_mux.v"
module tb;
reg [1:0] i;
wire [3:0] y;
integer a;

decoder dut(i,y);

//generate and drive input to the design
initial begin
//ls=1'b0001;
		for (a=0;a<=3;a=a+1) begin

		i=a;
		#2;
		$display("%5t %b %b",$time, i, y);
		//$display("%5t %b %b",$time,dut.m0.i[0], y);
	
		end

end
endmodule
