`include "8x1_3_4x1.v"
module tb;
reg [3:0] i1,i2;
reg [7:0] rs1;
reg [2:0] s;
wire y;
integer e;
mux_8x1 dut(i1,i2,s,y);


initial begin
rs1=8'b00000001;
//rs2=4'b0001;
		
		for(e=0;e<=7;e=e+1) begin
		s = e;
		{i2,i1} = rs1;
		rs1=rs1<<1;
		#2;
		$display("%0t : i0=%b i1=%b i2=%b i3=%b i4=%b i5=%b i6=%b i7=%b sel=%b y=%b", $time,  i1[0], i1[1], i1[2], i1[3],i2[0], i2[1],i2[2],i2[3],s[2:0], y);

	 end	

end
endmodule

