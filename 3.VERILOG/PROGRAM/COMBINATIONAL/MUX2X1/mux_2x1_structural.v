module mux_2x1(i0, i1, sel, y);
input i0, i1, sel;
output y;

//y = sel&i1 | ~sel&i0
and g1(n1, sel, i1); //output of this gate: n1, inputs: sel, i1
and g2(n2, ~sel, i0);
or g3(y, n1, n2);
endmodule
