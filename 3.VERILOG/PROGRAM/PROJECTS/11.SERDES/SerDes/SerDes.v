`include "piso_design.v"
`include "sipo_design.v"
module SerDes(sclk_i,pclk_i,rst_i,
			  //sipo interface
			  d_in_s,d_out_s,valid_i_s,ready_o_s,valid_o_s,ready_i_s,
			  //piso inteface
			  d_in_p,d_out_p,valid_i_p,ready_o_p,valid_o_p,ready_i_p);

input pclk_i, rst_i, sclk_i;
//sipo interface
input d_in_s;
input valid_i_s,ready_i_s;
output ready_o_s, valid_o_s; 
output [7:0] d_out_s;
//piso interface
input [7:0] d_in_p;
output d_out_p;
input valid_i_p,ready_i_p;
output ready_o_p, valid_o_p; 

	sipo_design u0(.sclk_i(sclk_i), .pclk_i(pclk_i), .rst_i(rst_i),
				   .data_i(d_in_s), .valid_i(valid_i_s), .ready_o(ready_o_s),
				   .data_o(d_out_s), .valid_o(valid_o_s), .ready_i(ready_i_s));	
	piso_design u1(.pclk_i(pclk_i), .rst_i(rst_i), .sclk_i(sclk_i),
			.data_i(d_in_p), .valid_i(valid_i_p), .ready_o(ready_o_p),
			.data_o(d_out_p), .valid_o(valid_o_p), .ready_i(ready_i_p));

endmodule
