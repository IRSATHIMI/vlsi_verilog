module dff(clk,d,rst,q);
input d,clk,rst;
output q;
wire qn;

nand g1(n1,d,clk);
nand g2(n2,n1,clk);
nand g3(n3,n1,n4);
nand g4(n4,n3,n2);
nand g5(n5,n3,~clk);
nand g6(n6,~clk,n4);
nand g7(q,n5,qn);
nand g8(qn,q,n6);


endmodule
