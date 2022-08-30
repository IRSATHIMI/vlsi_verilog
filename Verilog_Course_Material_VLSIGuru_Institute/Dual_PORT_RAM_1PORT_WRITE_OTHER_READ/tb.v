`include "dual_port_ram.v"
module tb;
	reg rst; //if we want to reset whole memory
	//Write port
	reg clk_wr;
	reg valid_wr;
	reg [7:0] addr_wr;
	reg [7:0] data_wr;
	//Read port
	reg clk_rd;
	reg valid_rd;
	reg [7:0] addr_rd;
	wire [7:0] data_rd;
	integer i;

dual_port_ram dut(
	.rst( rst), 
	.clk_wr( clk_wr),
	.valid_wr( valid_wr),
	.addr_wr( addr_wr),
	.data_wr( data_wr),
	.clk_rd( clk_rd),
	.valid_rd( valid_rd),
	.addr_rd( addr_rd),
	.data_rd( data_rd)
);

initial begin
	clk_wr = 0;
	forever #5 clk_wr = ~clk_wr;
end
initial begin
	clk_rd = 0;
	forever #5 clk_rd = ~clk_rd;
end

initial begin
	rst = 1;
	repeat(2) @(posedge clk_wr);
	rst = 0;
	repeat(1) @(posedge clk_wr);

	//preload the memory(backdoor loading)
	$readmemh("data.hex", dut.mem);
	//read back all the contents in binary format
	$writememb("data.binary", dut.mem);

case (testname)
1 : begin  //Only read 5 locaitons
	//we have already loaded image, now do front door read, 5 random locaitons
	for (i = 0; i < 5; i= i+1) begin
		addr_rd = $random%256;
		valid_rd = 1;
		@(posedge clk_rd);
		#1;
		$display("addr_rd = %d, data_rd = %h", addr_rd, data_rd);
	end
end
2 : begin
	//write to 5 locaiton, read back from same location after words and
	//compare
end
3 : begin
	//write to 5 locaiton, read back from same location after words at
	//same time
end
endcase
endcase
	#10;
	$finish;
end


endmodule
