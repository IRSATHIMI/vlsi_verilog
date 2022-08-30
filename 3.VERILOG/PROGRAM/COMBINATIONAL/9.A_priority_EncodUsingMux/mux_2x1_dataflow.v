module mux_2x1(i,sel, y);
input [1:0] i;
input sel;
output y;

assign y = sel ? i[0] : i[1];

endmodule
