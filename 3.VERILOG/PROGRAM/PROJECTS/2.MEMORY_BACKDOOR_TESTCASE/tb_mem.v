`include "memory.v"
module tb;
parameter width=16, depth=16;//1024*1024*4;
parameter addr_width=4;
reg clk_i,rst_i,wr_rd_en_i,valid_i;
wire rdy_o;
reg [width-1:0] wr_data_i;
reg [addr_width-1:0] addr_i,startaddr,endaddr,start_addr_t;
wire [width-1:0] rd_data_o;
integer i;
reg [width-1:0] mem [depth-1:0];
reg [30*8:0] testcase;
memory #(.width(width),.depth(depth),.addr_width(addr_width)) dut(clk_i,rst_i,addr_i,wr_data_i,rd_data_o,wr_rd_en_i,valid_i,rdy_o);

always begin
clk_i =0;
#5;
clk_i =1;
#5;
end

initial begin
//clk_i=0;
$value$plusargs("testcase=%s",testcase);
$value$plusargs("startaddr=%h",startaddr);
$value$plusargs("endaddr=%h",endaddr);
rst_i=1;
#20;
rst_i=0;
	
case (testcase)

"bd_rd_bd_wr" : begin
	bd_write_mem(startaddr,endaddr);
	bd_read_mem(startaddr,endaddr);
end

"bd_rd_fd_wr" : begin
	fd_write_mem(startaddr,endaddr);
	bd_read_mem(startaddr,endaddr);
end

"fd_rd_fd_wr" : begin
	fd_write_mem(startaddr,endaddr);
	fd_read_mem(startaddr,endaddr);
end

"fd_rd_bd_wr" :begin
	bd_write_mem(startaddr,endaddr);
	fd_read_mem(startaddr,endaddr);
/*	for (i=startaddr ;i<=endaddr ;i=i+1) begin
	if
	end */
end
"random_mem_write_read_backdoor": begin
	for(i=0;i<depth;i=i+1) begin
		start_addr_t=$urandom_range(0,15);
		$display("iteration = %0d --->start_addr_t write mem =%0d",i,start_addr_t);
		//start_addr_t = 15
		//start_addr_t = 12
		//start_addr_t = 8
		//start_addr_t = 1
		bd_read_mem(start_addr_t,1);

	end

	for(i=0;i<depth;i=i+1) begin
		start_addr_t=$urandom_range(0,15);
		$display("iteration = %0d --->start_addr_t read mem =%0d",i,start_addr_t);
		bd_write_mem(start_addr_t,1);
	end

end

endcase
	#100;
	$finish;
end

task fd_write_mem(input [addr_width-1:0] start_loc,input [addr_width:0] num_loc);
begin
	for (i=start_loc ;i<=num_loc ;i=i+1) begin
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

task fd_read_mem(input [addr_width-1:0] start_loc,input [addr_width-1:0] num_loc);
begin
	for (i=start_loc; i<=num_loc ; i=i+1) begin
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

task bd_read_mem(input [addr_width-1:0] start_loc,input [addr_width-1:0] num_loc);
begin
	$readmemh("image.hex",dut.mem,start_loc,num_loc);
end
endtask	

task bd_write_mem(input [addr_width-1:0] start_loc,input [addr_width-1:0] num_loc);
begin
	$writememb("image.bin",dut.mem,start_loc,num_loc);
end
endtask	
endmodule
