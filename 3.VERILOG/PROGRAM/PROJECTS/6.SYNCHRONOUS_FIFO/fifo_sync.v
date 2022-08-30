module fifo_sync(//input 
clk_i,rst_i,
//write interface
wdata_i,full_o,wr_en_i,wr_error_o,
//read interface
r_data_o,empty_o,rd_en_i,rd_error_o);

parameter DEPTH = 16;
parameter WIDTH = 8;
parameter PTR_WIDTH = 4; 

input clk_i,rst_i,wr_en_i,rd_en_i;
input [WIDTH-1:0] wdata_i;
output reg wr_error_o,full_o,empty_o,rd_error_o;
output reg [WIDTH-1:0] r_data_o;

reg [WIDTH-1:0] mem [DEPTH-1:0];
reg [PTR_WIDTH-1:0] wr_ptr,rd_ptr;
reg wr_tog_f,rd_tog_f;
integer i;

always @(posedge clk_i) begin
	if(rst_i) begin
		wr_error_o = 0;
		full_o = 0;
		empty_o = 1;
		rd_error_o =0;
		r_data_o = 0;
		wr_ptr = 0;
		rd_ptr = 0;
		wr_tog_f = 0;
		rd_tog_f = 0;
		for (i=0;i<DEPTH;i=i+1) mem[i] = 0;
	end
	else begin
		wr_error_o = 0;
		rd_error_o = 0;
		//writing into MEM from wdata_i
	
		if (wr_en_i) begin
			if(!full_o) begin 
				mem[wr_ptr] = wdata_i;
				if(wr_ptr == DEPTH-1) begin
					wr_tog_f = ~wr_tog_f;
					wr_ptr = wr_ptr+1;
				end
				else wr_ptr = wr_ptr+1;
				end
			else wr_error_o = 1;
		end
		else $display("write is not happening");
		
		//reading from MEM to r_data_o
		if (rd_en_i) begin
			if(!empty_o) begin
				r_data_o = mem[rd_ptr];
				if(rd_ptr == DEPTH-1) begin
					rd_tog_f = ~rd_tog_f;
					rd_ptr = rd_ptr+1;
				end
				else rd_ptr =rd_ptr+1;
			end
			else rd_error_o = 1;
		end
		else $display("read is not happening");
		
		end
end

always @(*) begin
	// setting full and empty
	empty_o = 0;
	full_o = 0;
	if ( (rd_ptr == wr_ptr)&(rd_tog_f == wr_tog_f) ) empty_o = 1;
	if ( (rd_ptr == wr_ptr)&(rd_tog_f != wr_tog_f) ) full_o	= 1;

end

endmodule
