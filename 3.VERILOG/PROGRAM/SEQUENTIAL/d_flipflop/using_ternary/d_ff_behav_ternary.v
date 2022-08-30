module dff(clk,d,rst,q);
input d,clk,rst;
output reg q;

always@(posedge clk)
begin
q = (rst) ? 0 : d;
end

endmodule
