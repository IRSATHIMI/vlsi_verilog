module dff(clk,d,rst,q);
input d,clk,rst;
output reg q;

always @(posedge clk) begin
if (rst) q<=0;
else q<=d;
end

endmodule
