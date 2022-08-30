`include "dual_port_ram.v"
module tb;
parameter width=16, depth=16;
parameter addr_width=4;
reg clk_i,rst_i,wr_en_i,rd_en_i,valid_i,rdy_i;
wire rdy_o,valid_o;
reg [width-1:0] wr_data_i;
reg [addr_width-1:0] wr_addr_i,rd_addr_i;
wire [width-1:0] rd_data_o;
integer i,j,max_write,max_read;
reg [width-1:0] mem [depth-1:0];

memory #(.width(width),.depth(depth),.addr_width(addr_width)) dut(clk_i,rst_i,rd_addr_i,wr_addr_i,wr_data_i,rd_data_o,wr_en_i,rd_en_i,valid_i,rdy_o,rdy_i,valid_o);

always begin
clk_i =0;
#5;
clk_i =1;
#5;
end

initial begin
//clk_i=0;
rst_i=1;
rst_ip();
repeat (2) @(posedge clk_i);
rst_i=0;
	fork
	begin
		//for writing data into memory
		write_mem(10);
	end
	begin
		//for reading the data from memory
		read_mem(15);
	end
	join
	#100;
	$finish;
end

task write_mem(input integer max_write);
begin
	for (i=0 ;i<max_write ;i=i+1) begin
		@(posedge clk_i);
		wr_addr_i = i;
		wr_data_i = $random;
		wr_en_i = 1;
		valid_i = 1;
		wait (rdy_o == 1);
	//mem[addr_i]=wr_data_i;
	end
	@(posedge clk_i);	
	wr_addr_i=0;
	wr_data_i=0;
	wr_en_i=0;
	valid_i=0;
end
endtask

task read_mem(input integer max_read);
begin
	for (j=0; j<max_read ; j=j+1) begin
		@(posedge clk_i);
		rdy_i = 1;
		rd_addr_i = j;
		rd_en_i = 1;
		wait (valid_o);
	end
	@(posedge clk_i);
	rd_addr_i = 0;
	rd_en_i = 0;
	rdy_i = 0;
end
endtask

task rst_ip();
begin
wr_en_i = 0;
rd_en_i = 0;
valid_i = 0;
wr_data_i = 0;
wr_addr_i = 0;
rd_addr_i = 0;
rdy_i = 0;
end
endtask
endmodule
