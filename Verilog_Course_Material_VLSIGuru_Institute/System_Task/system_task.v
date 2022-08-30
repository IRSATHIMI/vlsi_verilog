`timescale 1ns/10ps
module top;
   reg [31:0] a, b, c;
   reg [31:0] memory [10:0];  //a memory whose depth is 11 elementgs, each element has 32 bits
   integer i;

   initial begin
	   //$readmemh : Used to load an external file data in to memory
	   for (i = 0; i < 11; i = i+1) begin
		   $display("memory[%d] = %h", i, memory[i]);
	   end
	   $readmemh("load_mem.txt", memory);
	   for (i = 0; i < 11; i = i+1) begin
		   $display("memory[%d] = %h", i, memory[i]);
	   end
	   $writememb("write_memb.txt", memory);
   end


   initial begin
	   $monitor("%t : Monitor: a = %h, b = %h, c = %h", $time, a, b, c);
	   $display("%t : Display: a = %h, b = %h, c = %h", $time, a, b, c);
	   #20;
	   $display("%t : Display: a = %h, b = %h, c = %h", $time, a, b, c);
	   #50 $stop;
	   //#50 $start;
	   #100 $finish;
   end
   initial begin
	   #10;
	   a = 10;
	   #5;
	   b = 5;
	   #3;
	   c = 20;
	   #10;
	   a = 0;
	   #4;
	   b = 2;
   end
endmodule
