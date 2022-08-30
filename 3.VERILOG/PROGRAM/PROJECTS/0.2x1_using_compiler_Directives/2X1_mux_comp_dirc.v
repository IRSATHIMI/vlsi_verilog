module mux(i,s,y);
input [1:0] i;
input s;
output y;
`ifdef BEHAV reg y;
`else wire y;
`endif

`ifdef BEHAV
	always @(*) begin
	y= s ? i[1] : i[0];
	end
`elsif DATAFLOW
	assign y= s ? i[1] : i[0];
`else //GATE	
	and g1(n1,i[0],~s);
	and g2(n2,i[1],s);
	or g3(y,n1,n2);
`endif
	

endmodule
