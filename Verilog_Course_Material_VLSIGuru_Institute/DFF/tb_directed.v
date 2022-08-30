`timescale 10ns/10ps
`include "dff.v"
module tb;
  //dealre the design inputs as regs (they will be assignied values in the initial block)
  reg clk1;
  reg rst1;
  reg d1;
  wire d2;
  //decalre the design output as wire
  wire q1;
  //delay variable
  reg [2:0] delay_t;

  //instantite design
  dff dff_inst(
	  .clk(clk1),
	  .rst(rst1),
	  .d(d1),
	  .q(q1)
  	);


   assing d2 = d1;

   initial begin
	   clk1 = 0;
	   forever #4 clk1 = ~clk1;  //generating clock fo time period =8units = 80ns
   end

   //generate rst also
   initial begin
	   //for initial few clock cycles apply reset (ex: 3 clocks)
	   rst1 = 1;//appplying reset
	   repeat(3) @(posedge clk1);
	   rst1 = 0; //reset is released
   end

   //DFF input need to be driven, else DFF will not give any outptu
   initial begin  //random testcase
	d1 = 1'b1;
	repeat(3) @(posedge clk1);
	d1 = 1'b0;
	repeat(4) @(posedge clk1);
	d1 = 1'b1;
	repeat(3) @(posedge clk1);
	$finish();
   end
endmodule

