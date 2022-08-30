module mux_2x1(i0, i1, sel, y);
input i0, i1, sel;
output y;

//sensitivity list
always @(i0 or i1 or sel) begin
	if (sel == 1) y = i0;
	else if (sel == 0) y = i1;
	else y = 1'bx; //what if sel is unknown
end
endmodule
