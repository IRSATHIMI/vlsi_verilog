module fa_4bit(s, c, a, b, ci);
input [3:0] a, b; //a0 => a[0], b0 => b[0]
input ci;
output [3:0] s;
output c;
wire c1, c2, c3;

fa u0(s[0], c1, a[0], b[0], ci);
fa u1(s[1], c2, a[1], b[1], c1);
fa u2(s[2], c3, a[2], b[2], c2);
fa u3(s[3], c, a[3], b[3], c3);
endmodule

