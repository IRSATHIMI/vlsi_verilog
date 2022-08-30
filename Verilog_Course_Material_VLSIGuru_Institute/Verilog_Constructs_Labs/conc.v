module top_c;  //top most module is what holds complete evnironment components
   reg [3:0] a,b;
   reg [7:0] c;
   reg [5:0] d;
   reg [30:0] e;
   initial begin
	   b = 4'b1010;
	   a = 4'b1110;
	   c = {a, b};  //concatenate the bits of a & bits of b => give output of 8 bits => MSB positions are occupied by a, LSB positions by b
	   $display("a & b concatenated : a = %b, b = %b, c = %b", a, b, c);  //one time print

	   d = {a, b};  //concatenate the bits of a & bits of b => give output of 8 bits => MSB positions are occupied by a, LSB positions by b
	   $display("a & b concatenated to smaller vector: a = %b, b = %b, d = %b", a, b, d);  //one time print


	   a = 10;  //4'b1010
	   b = 5;  //4'b0101
	   c = {a, b};  //concatenate the bits of a & bits of b => give output of 8 bits => MSB positions are occupied by a, LSB positions by b
	   $display("a & b concatenated : a = %b, b = %b, c = %b", a, b, c);  //one time print

	   c = {a, 1'b1};
	   $display("a & 1 concatenated : a = %b, c = %b", a, c);  //one time print

	   //c = {{3'{a}}, {2'{b}}};  //concatenate the bits of a & bits of b => give output of 8 bits => MSB positions are occupied by a, LSB positions by b
	   //$display("a & b concatenated : a = %b, b = %b, c = %b", a, b, c);  //one time print

   end
endmodule



