module mux2x1(i,sel,out);
input [1:0] i;//MSb -> 1
			  //LSB -> 0
			  //size -> (MSB -LSB ) + 1
			  //size -> 2
input sel;
output reg out;

always@(*) begin
	if(sel == 1'b1) begin
	//if(sel) begin-> same as above line
		out = i[1];
		//out = i1;-> wrong
	end
	else begin
		out = i[0];
		//out = i0;->wrong
	end
end
endmodule

