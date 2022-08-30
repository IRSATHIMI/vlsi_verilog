`include "piso_design.v"
`include "sipo_design.v"
module top;
`ifdef SP
input sclk_i, pclk_i, rst_i;
input data_i, valid_i;
output reg ready_o;
output reg [7:0] data_o;
output reg valid_o;
input ready_i;
reg data_t;
`else
input pclk_i, rst_i, sclk_i;
input [7:0] data_i;
input valid_i,ready_i;
output reg ready_o, data_o, valid_o;
reg [7:0] data_t;`endif

`ifdef SP
	sipo_design u0(sclk_i, pclk_i, rst_i,
				   data_i, valid_i, ready_o,
				   data_t, valid_o, ready_i );
	
	piso u1(pclk_i, rst_i, sclk_i,
			data_t, valid_i, ready_o,
			data_o, valid_o, ready_i);
`else
	piso u0(pclk_i, rst_i, sclk_i,
			data_i, valid_i, ready_o,
			data_t, valid_o, ready_i);

	sipo_design u1(sclk_i, pclk_i, rst_i,
				   data_t, valid_i, ready_o,
				   data_o, valid_o, ready_i);
`endif

endmodule


