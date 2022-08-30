module fa(s, c, a, b, ci);
input a, b, ci;
output s, c;
wire n1, n2, n3;

ha u0(n1, n2, a, b);
ha u1(s, n3, n1, ci);
or g1(c, n2, n3);

endmodule


