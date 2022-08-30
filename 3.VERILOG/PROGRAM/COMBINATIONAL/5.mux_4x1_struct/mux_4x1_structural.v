module mux_4x1(i0, i1, i2, i3, sel, y);
input i0, i1, i2, i3;
input [1:0] sel;
output y;

//2 not
//4 AND
//1 OR
and g1(n1, sel[0], sel[1], i3);
and g2(n2, ~sel[0], sel[1], i2);
and g3(n3, sel[0], ~sel[1], i1);
and g4(n4, ~sel[0], ~sel[1], i0);
or g5(y, n1, n2, n3, n4);
endmodule


