`include "pcie_pl.v"
`include "bfm.v"
module top;
reg clk, rst;
wire [4:0] data;
wire [3:0] state;
   pcie_pl dut(clk, rst, data, state);
   bfm bfm_i(clk, rst, data, state);

   initial begin
	   clk = 0;
	   forever #5 clk =  ~clk;
   end
   initial begin
	   rst = 1;
	   #15; //atleast for 1 clock cycle rst should be high
	   rst = 0;
   end
endmodule
