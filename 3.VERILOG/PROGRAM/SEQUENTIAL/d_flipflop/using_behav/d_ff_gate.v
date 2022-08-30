module dff(clk,d,rst,q);
input d,clk,rst;
output q,qn;

nand g1(n1,d,clk);
nand g2(n2,~d,clk);
nand g3(q,n1,qn);
nand g4(qn,q,n2);


endmodule
