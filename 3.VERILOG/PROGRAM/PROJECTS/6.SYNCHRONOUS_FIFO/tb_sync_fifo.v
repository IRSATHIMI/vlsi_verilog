`include "fifo_sync.v"
module tb;

parameter DEPTH = 16;
parameter WIDTH = 8;
parameter PTR_WIDTH = 4; 

reg clk_i,rst_i,wr_en_i,rd_en_i;
reg [WIDTH-1:0] wdata_i;
wire wr_error_o,full_o,empty_o,rd_error_o;
wire [WIDTH-1:0] r_data_o;
integer i;
reg [30*8:1] testcase;

fifo_sync #(.WIDTH(WIDTH),.DEPTH(DEPTH),.PTR_WIDTH(PTR_WIDTH))dut(clk_i,rst_i,wdata_i,full_o,wr_en_i,wr_error_o,r_data_o,empty_o,rd_en_i,rd_error_o);
//clcok generation
initial clk_i=0;
always #5 clk_i = ~clk_i;

initial begin
$value$plusargs("Test_Case=%s",testcase);
wr_en_i=0;
rd_en_i=0;
wdata_i=0;
rst_i=1;
#20;
rst_i=0;

case (testcase)

"wr_full"  : wr_fifo(DEPTH);

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
			   	wr_fifo(DEPTH);
				rd_fifo(DEPTH);
				end
			   	join
			   end
endcase

#50;
$finish;
end

task wr_fifo(input integer num_wr);
begin
	for (i=0;i<=num_wr;i=i+1) begin
		@(posedge clk_i);
		wdata_i = $random;
		wr_en_i = 1;
	end
	wr_en_i = 0;
	wdata_i = 0;
end
endtask

task rd_fifo(input integer num_rd);
begin
	for (i=0;i<=num_rd;i=i+1) begin
		@(posedge clk_i);
		rd_en_i = 1;
	end
	rd_en_i = 0;
end
endtask

endmodule

