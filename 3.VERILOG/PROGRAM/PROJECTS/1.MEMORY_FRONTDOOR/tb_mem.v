`include "memory.v"
module tb;
parameter width=16, depth=16;
parameter addr_width=4;
reg clk_i,rst_i,wr_rd_en_i,valid_i;
wire rdy_o;
reg [width-1:0] wr_data_i;
reg [addr_width-1:0] addr_i;
wire [width-1:0] rd_data_o;
integer i;
reg [width-1:0] mem [depth-1:0];

memory #(.width(width),.depth(depth),.addr_width(addr_width)) dut(clk_i,rst_i,addr_i,wr_data_i,rd_data_o,wr_rd_en_i,valid_i,rdy_o);

always begin
clk_i =0;
#5;
clk_i =1;
#5;
end

initial begin
//clk_i=0;
rst_i=1;
#20;
rst_i=0;
	//for writing data into memory
	write_mem();
	//for reading the data from memory
	read_mem();
	#100;
	$finish;
end

task write_mem();
begin
	for (i=0 ;i<depth ;i=i+1) begin
	@(posedge clk_i);
	addr_i=i;
	wr_data_i=$random;
	wr_rd_en_i=1;
	valid_i=1;
	wait (rdy_o == 1);
	//mem[addr_i]=wr_data_i;
	end
	@(posedge clk_i);	
	addr_i=0;
	wr_data_i=0;
	wr_rd_en_i=0;
	valid_i=0;
end
endtask

task read_mem();
begin
	for (i=0; i<depth ; i=i+1) begin
	@(posedge clk_i);
	addr_i=i;
	wr_rd_en_i=0;
	valid_i=1;
	wait (rdy_o == 1);
	end
	@(posedge clk_i);
	addr_i=0;
	wr_data_i=0;
	wr_rd_en_i=0;
	valid_i=0;
end
endtask

endmodule
