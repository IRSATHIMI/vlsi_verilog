`include "fifo_async.v"
module tb;

parameter DEPTH = 16;
parameter WIDTH = 8;
parameter PTR_WIDTH = 4; 
parameter WR_CLK_TP = 10; 
parameter RD_CLK_TP = 15; 
parameter MAX_WR_DLY = 10; 
parameter MAX_RD_DLY = 10; 

reg wr_clk_i, rd_clk_i, rst_i,wr_en_i,rd_en_i;
reg [WIDTH-1:0] wdata_i;
wire wr_error_o,full_o,empty_o,rd_error_o;
wire [WIDTH-1:0] r_data_o;
integer i, p, q, r, no_wr, no_rd, rd_delay, wr_delay;
reg [30*8:1] testcase;

fifo_async #(.WIDTH(WIDTH),.DEPTH(DEPTH),.PTR_WIDTH(PTR_WIDTH))dut(rd_clk_i, wr_clk_i, rst_i,wdata_i,full_o,wr_en_i,wr_error_o,r_data_o,empty_o,rd_en_i,rd_error_o);

//clcok generation
//write clock generation
initial wr_clk_i=1;
always #(WR_CLK_TP/2.0) wr_clk_i = ~wr_clk_i;
//read clock generation
initial rd_clk_i=1;
always #(RD_CLK_TP/2.0) rd_clk_i = ~rd_clk_i;


initial begin
$value$plusargs("Test_Case=%s",testcase);
$value$plusargs("NO_WRITE=%d",no_wr);
$value$plusargs("NO_READ=%d",no_rd);

wr_en_i=0;
rd_en_i=0;
wdata_i=0;
rst_i=1;
#20;
rst_i=0;

case (testcase)

"wr_full"  : wr_fifo(DEPTH);

"wr_rd_user" : begin
				wr_fifo(no_wr);
				rd_fifo(no_rd);
			   end

"rd_empty" : begin
				wr_fifo(DEPTH);
				rd_fifo(DEPTH);
			end
"wr_error" : begin 
				wr_fifo(DEPTH+1);
			 end
"rd_error" : begin
				wr_fifo(DEPTH);
				rd_fifo(DEPTH+1);
			 end
"concurrent" : begin
				fork
				begin
			   	wr_fifo(no_wr);
				end
				begin
				rd_fifo(no_rd);
				end
			   	join
			   end
"real_life" : begin
				fork
				begin
					for(r=0;r<no_wr;r=r+1) begin
						wr_fifo(1);
						wr_delay = $urandom_range(1,MAX_WR_DLY);
						repeat (wr_delay) @(posedge wr_clk_i);
					end
				end
				begin
					for(q=0;q<no_rd;q=q+1) begin
						rd_fifo(1);
						rd_delay = $urandom_range(1,MAX_RD_DLY);
						repeat (rd_delay) @(posedge rd_clk_i);
					end
				end
			   	join
			   end

endcase

#50;
$finish;
end

task wr_fifo(input integer num_wr);
begin
	for (i=0;i<num_wr;i=i+1) begin
		@(posedge wr_clk_i);
		wdata_i = $random;
		wr_en_i = 1;
	end
		@(posedge wr_clk_i);
	wr_en_i = 0;
	wdata_i = 0;
end
endtask

task rd_fifo(input integer num_rd);
begin
	for (p=0;p<num_rd;p=p+1) begin
		@(posedge rd_clk_i);
		rd_en_i = 1;
		if (rd_error_o) p=p-1;
	end
		@(posedge rd_clk_i);
	rd_en_i = 0;
end
endtask

endmodule

