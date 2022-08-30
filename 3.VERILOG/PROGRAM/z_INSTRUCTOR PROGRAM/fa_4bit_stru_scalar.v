module fa_4bit(s0, s1, s2, s3, c, a0, a1, a2, a3, b0, b1, b2, b3, ci);
input a0, a1, a2, a3, b0, b1, b2, b3;
input ci;
output s0, s1, s2, s3;
output c;
wire c1, c2, c3;

fa u0(s0, c1, a0, b0, ci);
fa u1(s1, c2, a1, b1, c1);
fa u2(s2, c3, a2, b2, c2);
fa u3(s3, c, a3, b3, c3);
endmodule


