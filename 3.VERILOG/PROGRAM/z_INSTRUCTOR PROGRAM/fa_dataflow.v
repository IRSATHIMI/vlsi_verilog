module fa(s, c, a, b, ci);
input a, b, ci;
output s, c;

assign {c, s} = a+b+ci; 
endmodule
