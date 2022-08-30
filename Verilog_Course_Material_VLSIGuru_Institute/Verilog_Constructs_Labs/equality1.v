
module top;
  reg clk;
  reg [ 3:0] regA;
  reg [ 3:0] regB;
  reg [ 3:0] regC;

  always @(posedge clk) begin
	  $display("iniside always");
  end

  initial begin
	  regA = 4'b10xz;
	  regB = 4'b1000;
	  if ( regA == regB) begin
	  end
	  if ( regB == regA) begin
	  end
	  if ( regB === regA) begin
	  end
	  if ( regB !== regA) begin
	  end
  end

  task my_task();
  endtask
endmodule
