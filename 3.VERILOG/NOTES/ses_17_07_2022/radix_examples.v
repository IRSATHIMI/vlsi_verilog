module top;
reg [7:0] addr;

initial begin
addr = 8'b101x_xx10;
$display("addr=%b",addr);
$display("addr=%d",addr);
$display("addr=%h",addr);//XX
$display("addr=%o",addr);//2XX

addr = 8'b1110_x111;
$display("addr=%b",addr);//1110_x111
$display("addr=%d",addr);//X
$display("addr=%h",addr);//EX
$display("addr=%o",addr);// 8'b11_10x_111; ->  3X7

addr = 8'b1110_z1z1;
$display("addr=%b",addr);//1110_z1z1
$display("addr=%d",addr);//Z
$display("addr=%h",addr);//EZ
$display("addr=%o",addr);// 8'b11_10z_1z1; ->  3ZZ


addr = 8'b111x_zxzx;
$display("addr=%b",addr);//111x_zxzx;
$display("addr=%d",addr);//X
$display("addr=%h",addr);//XX
$display("addr=%o",addr);// 11_1xz_xzx;//3XX

end
endmodule
