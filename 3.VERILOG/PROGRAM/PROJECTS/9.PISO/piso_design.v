`include "fifo_async.v"
module piso(
pclk_i, rst_i, sclk_i,
data_i, valid_i, ready_o,
data_o, valid_o, ready_i
);

parameter S_FIFO_EMPTY = 3'b001;
parameter S_RD_FIFO = 3'b010;
parameter S_DRIVE_SERIAL_INTF = 3'b100;

input pclk_i, rst_i, sclk_i;
input [7:0] data_i;
input valid_i,ready_i;
output reg ready_o, data_o, valid_o;
reg [7:0] data_t;
reg  rd_en_t, wr_en_t, wr_en_t_1;
wire full_t,  empty_t, rd_error_t;
wire [7:0] r_data_t;
reg [2:0] state, next_state;
reg [4:0] count;
//block 1;
always @(posedge pclk_i) begin
if (rst_i) begin
 ready_o = 0;
 data_o = 0;
 valid_o = 0;
 data_t = 0;
 wr_en_t_1 =0;
 wr_en_t = 0;
 rd_en_t = 0;
 state = S_FIFO_EMPTY;
 next_state =S_FIFO_EMPTY;
 count=0;
end
else begin
	if(valid_i ==1 && full_t ==0) begin
		wr_en_t_1 <= 1;
		wr_en_t <= wr_en_t_1;
		data_t <= data_i;
		ready_o <=1;
	end
	else begin
	wr_en_t =0;
	wr_en_t_1 =0;
	ready_o =0;
	data_t = 0;
	end
end
end

//block 2

fifo_async dut(.rd_clk_i(sclk_i), .wr_clk_i(pclk_i), .rst_i(rst_i),
.wdata_i(data_t), .full_o(full_t), .wr_en_i(wr_en_t), .wr_error_o(wr_error_t),
.r_data_o(r_data_t), .empty_o(empty_t), .rd_en_i(rd_en_t), .rd_error_o(rd_error_t));

always @(posedge sclk_i) begin
if(!rst_i) begin
case (state) 
	S_FIFO_EMPTY : begin
		if (!empty_t) begin
			rd_en_t = 1;
			next_state = S_RD_FIFO;
		end
	end
	S_RD_FIFO : begin
		rd_en_t =0;
		count =0;
		next_state = S_DRIVE_SERIAL_INTF;	
	end
	S_DRIVE_SERIAL_INTF : begin
		data_o = r_data_t[count];
		valid_o =1;
		if(ready_i) count = count+1;
		if (count == 8) begin
			count = 0;
			//$display(
			valid_o =0;
			if (!empty_t) begin
			next_state = S_RD_FIFO;
			rd_en_t = 1;
			end
			else begin
			next_state = S_FIFO_EMPTY;
			end
		end
	end
endcase
end
end

always @ (next_state) state = next_state;

endmodule
