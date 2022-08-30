module mux_2x1(i0, i1, sel, y);
input i0, i1, sel;
output y;

assign y = sel ? i1 : i0;
	//if sel=true(1), y=i1
	//if sel=false(0), y=i0
	//else y=x
endmodule
