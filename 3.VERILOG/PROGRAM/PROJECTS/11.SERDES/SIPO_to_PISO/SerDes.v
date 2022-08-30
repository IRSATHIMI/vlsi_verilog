`include "piso_design.v"
`include "sipo_design.v"
`include "fifo_async.v"
module SerDes(d_in,d_out,valid_i,ready_o,valid_o,ready_i,sclk_i,pclk_i,rst_i);

input pclk_i, rst_i, sclk_i;
input d_in;
input valid_i,ready_i;
output wire ready_o, valid_o, d_out;
wire [7:0] data_t;
wire valid_t, ready_t;

	sipo_design u0(.sclk_i(sclk_i), .pclk_i(pclk_i), .rst_i(rst_i),
				   .data_i(d_in), .valid_i(valid_i), .ready_o(ready_o),
				   .data_o(data_t), .valid_o(valid_t), .ready_i(ready_t));	
	piso_design u1(.pclk_i(pclk_i), .rst_i(rst_i), .sclk_i(sclk_i),
			.data_i(data_t), .valid_i(valid_t), .ready_o(ready_t),
			.data_o(d_out), .valid_o(valid_o), .ready_i(ready_i));

endmodule
