


`include "memory.v"
module tb;
   memory dut();
   initial begin
	   $readmemh("image.hex", dut.mem);
	   $writememb("image.bin", dut.mem);

   end
endmodule
