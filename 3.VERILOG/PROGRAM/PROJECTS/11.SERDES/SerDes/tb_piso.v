`include "piso_design.v"
module tb; 

parameter S_FIFO_EMPTY = 3'b001;
parameter S_RD_FIFO = 3'b010;
parameter S_DRIVE_SERIAL_INTF = 3'b100;

reg pclk_i, rst_i, sclk_i;
reg [7:0] data_i;
reg valid_i,ready_i;
wire ready_o, data_o, valid_o;
integer i;

piso dut(.*);

initial begin
 pclk_i =0;
 forever #8 pclk_i = ~pclk_i;
end

initial begin
sclk_i=0;
forever #1 sclk_i = ~sclk_i;
end

initial begin
	rst_ip();
	rst_i =1;
	repeat(2) @(posedge pclk_i);
	rst_i =0;
	for (i=0; i<10; i=i+1) begin
	@(posedge pclk_i);
	data_i = $random;
	valid_i =1;
	wait (ready_o == 1);
	end
	@(posedge pclk_i);
	data_i = 0;
	valid_i = 0;
	#500;
	$finish;
end

always @(posedge sclk_i) begin
	if(valid_o ==1) begin
	ready_i = 1;
	end
	else ready_i = 0;
end

task rst_ip();
begin
	data_i = 0;
	valid_i = 0;
	ready_i = 0;
end
endtask

endmodule
