module halfadder(a,s,c);
input [1:0] a;
output s,c;

assign s = a[0]^a[1]; 
assign c = a[0]&a[1];
endmodule
