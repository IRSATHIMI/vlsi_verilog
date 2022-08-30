`include "SerDes.v"
module tb;

parameter PCLK_TP = 8;
parameter SCLKTP = 1;

reg sclk_i, pclk_i, rst_i;
reg d_in, valid_i;
wire ready_o;
wire d_out;
wire valid_o;
reg ready_i;
integer i ,n;


SerDes dut(d_in,d_out,valid_i,ready_o,valid_o,ready_i,sclk_i,pclk_i,rst_i);

// sclock gen
initial begin
sclk_i =0;
forever #SCLKTP sclk_i = ~sclk_i;
end

// pclock gen
initial begin
pclk_i =0;
forever #PCLK_TP pclk_i = ~pclk_i;
end

initial begin
	// applying reset
	rst_i=1;
	rst_ip();
	repeat (2) @(posedge pclk_i);
	rst_i=0;
	// stimulus;

	for (i=0 ; i<10 ; i=i+1) begin
		for(n=0 ; n<8 ; n=n+1) begin
			@(posedge sclk_i)
			valid_i = 1;
			d_in =$random;
			wait (ready_o);
		end
	end
	@(posedge pclk_i);
	valid_i = 0;
	d_in = 0;
		
	#100;
	$finish;
end

task rst_ip();
begin
	d_in = 0;
	valid_i = 0;
	ready_i = 0;
	n=0;
	i=0;
end
endtask

always @(posedge pclk_i) begin
	if(valid_o) ready_i = 1;
	else ready_i = 0;
end
endmodule
