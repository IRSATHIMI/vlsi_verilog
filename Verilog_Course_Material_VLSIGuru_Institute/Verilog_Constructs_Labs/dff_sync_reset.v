module dff_sync(d, rst, clk, q);
input wire d, rst, clk;
output reg q;
//synchronous reset: reset will take effect only at +edge of clock
always @(posedge clk) begin
	if(rst == 1) begin
		q = 0;
	end
	else begin
		q <= d;
	end
end
endmodule

module tb_dff;
reg d, rst, clk;
wire q;
	dff_sync dff(.*);

	initial begin
		clk = 0;
		rst = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		#4;
		d = 1;
		#4;
		d = 0;
		#6;
		d = 1;
	end

	initial begin
		#23;
		rst = 1;
		#7 rst = 0;
		#20;
		$finish;

	end
   
endmodule
