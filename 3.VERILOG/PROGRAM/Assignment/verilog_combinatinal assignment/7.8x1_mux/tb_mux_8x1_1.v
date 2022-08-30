`include "mux_8x1.v"
module tb;
reg [7:0] i,rshift;
reg [2:0] s;
wire y;
integer e;
mux_8x1 dut(i,s,y);

initial begin
rshift=8'b00000001;
		
		for(e=0;e<=7;e=e+1) begin
		s = e;
		i = rshift;	
		rshift=rshift<<1;
		#2;
		$display("%0t : e=%0d i0=%b i1=%b i2=%b i3=%b i4=%b i5=%b i6=%b i7=%b sel=%b y=%b", $time, e, i[0], i[1], i[2], i[3],i[4], i[5],i[6],i[7],s[2:0], y);

	 end	

end
endmodule

