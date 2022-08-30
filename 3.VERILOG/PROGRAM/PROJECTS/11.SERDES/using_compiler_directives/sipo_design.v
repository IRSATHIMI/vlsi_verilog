`include "fifo_async.v"
module sipo_design(
sclk_i, pclk_i, rst_i,
data_i, valid_i, ready_o,
data_o, valid_o, ready_i,
);

parameter S_NO_DATA = 3'b001;
parameter S_FETCHING_DATA = 3'b010;
parameter S_WRITE_FIFO = 3'b100;
parameter DEPTH_FIFO = 16;

input sclk_i, pclk_i, rst_i;
input data_i, valid_i;
output reg ready_o;
output reg [7:0] data_o;
output reg valid_o;
input ready_i;

reg [7:0] data_t, w_data_t;
wire full_t, empty_t ,wr_error_t, rd_error_t;
wire [7:0] r_data_t;
reg wr_en_t, rd_en_t;
reg [2:0] state, next_state;
reg[3:0] count;


//block 1&2 state machine
always @(posedge sclk_i) begin
if(rst_i) begin
	ready_o = 0;
	data_o = 0;
	valid_o = 0;
	count = 0;
	data_t = 0;
	rd_en_t = 0;
	state = S_NO_DATA;
	next_state = S_NO_DATA;
end
else begin
 case(state) 
 	S_NO_DATA : begin
		count = 0;
		if(valid_i && !full_t) begin
			ready_o = 1;
			next_state = S_FETCHING_DATA;
		end
		else begin
			ready_o = 0;
			wr_en_t = 0;
			data_t = 0;
			count = 0;
			w_data_t = 0;
		end
	end
	S_FETCHING_DATA : begin
		wr_en_t =0 ;
		w_data_t =0;
		data_t[count] = data_i;
		count = count+1;
		if(count == 8) begin
			count = 0;
			ready_o = 0;
			next_state = S_WRITE_FIFO;
		end
	end
	S_WRITE_FIFO : begin
		wr_en_t = 1;
		w_data_t = data_t;
		if(valid_i) begin
			if(!full_t) begin
				ready_o = 1;
				data_t = 0;
				next_state =S_FETCHING_DATA;
			end
			else begin 
				ready_o = 0;
				data_t = 0;
				next_state = S_NO_DATA;
			end
		end
		else begin
			next_state = S_NO_DATA;
		end
	end
endcase
end
end

//block 2 instantiation

fifo_async #(.DEPTH(DEPTH_FIFO)) dut(.rd_clk_i(pclk_i), .wr_clk_i(sclk_i), .rst_i(rst_i),
.wdata_i(w_data_t), .full_o(full_t), .wr_en_i(wr_en_t), .wr_error_o(wr_error_t), 
.r_data_o(r_data_t), .empty_o(empty_t), .rd_en_i(rd_en_t), .rd_error_o(rd_error_t));

always @(next_state) state = next_state;

//block 3 glue logic

always @(posedge pclk_i) begin
if (!rst_i) begin
	if (!empty_t) begin
		rd_en_t = 1;
		valid_o =1;
		data_o = r_data_t;
		wait(ready_i);
	end
	else begin
		rd_en_t = 0;
		valid_o = 0;
		data_o = 0;
	end
end
end

endmodule
