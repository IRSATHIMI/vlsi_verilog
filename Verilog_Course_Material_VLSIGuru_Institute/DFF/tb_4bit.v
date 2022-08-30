`timescale 10ns/10ps
`include "dff_4bit.v"
module tb_4bit;
  //dealre the design inputs as regs (they will be assignied values in the initial block)
  reg clk1;
  reg rst1;
  reg [3:0] d1;
  //decalre the design output as wire
  wire [3:0] q1;
  //delay variable
  reg [2:0] delay_t;

  //instantite design
  dff dff_inst(
	  .clk(clk1),
	  .rst(rst1),
	  .d(d1),
	  .q(q1)
  	);

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
	   repeat(20) begin
		delay_t = $random(); //generate random number between 0--7
		d1 = $random();
		repeat(delay_t) @(posedge clk1);
	   end
	   $finish();
   end

   initial begin
	   $display("Time_d = %t : q = %d, d = %d", $time, q1, d1); //it is only once
   end

   initial begin
	   $monitor("Time_m = %t : q = %d, d = %d", $time, q1, d1);  //anytime if any of the varialbles inside gets changed it gets displayed
	   //if all teh operation happens in 0time, only one print will come
   end
endmodule

