module mux_4x1(i0, i1, i2, i3, sel, y);
input i0, i1, i2, i3;
input [1:0] sel;
output y;

assign y = sel == 2'b11 ? i3 : sel == 2'b10 ? i2 : sel == 2'b01 ? i1 : i0;
endmodule

