module ha(s, c, a, b);
input a, b;
output s, c;

and (c, a, b);
xor (s, a, b);
endmodule


