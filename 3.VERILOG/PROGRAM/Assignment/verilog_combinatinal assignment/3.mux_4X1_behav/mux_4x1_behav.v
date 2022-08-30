module mux_4x1(i0, i1, i2, i3, sel, y);
input i0, i1, i2, i3;
input [1:0] sel;
output reg y;

always @(*) begin
	if (sel == 2'b11) y = i3;
	else if (sel == 2'b10) y = i2;
	else if (sel == 2'b01) y = i1;
	else if (sel == 2'b00) y = i0;
	else y = 1'bx;
	end

endmodule
