`include "8x1_3_4x1.v"
module tb;

reg [2:0] i0,i1,i2,i3,i4,i5,i6,i7;
wire [2:0] y;
reg [2:0] sel;
integer e;

mux_8x1 dut(i0,i1,i2,i3,i4,i5,i6,i7,sel,y);


initial begin
i0=3'd0;
i1=3'd1;
i2=3'd2;
i3=3'd3;
i4=3'd4;
i5=3'd5;
i6=3'd6;
i7=3'd7;


		for(e=0;e<=7;e=e+1) begin
		sel = e;
		//#2;
		//$display("%0t : i0=%b i1=%b i2=%b i3=%b i4=%b i5=%b i6=%b i7=%b sel=%b y=%b", $time,  i0, i1, i2, i3,i4, i5,i6,i7,sel[2:0], y);

	 end	

end
initial begin
	$monitor("%0t : i0=%b i1=%b i2=%b i3=%b i4=%b i5=%b i6=%b i7=%b sel=%b y=%b", $time,  i0, i1, i2, i3,i4, i5,i6,i7,sel[2:0], y);
end
endmodule

