`include "2X1_mux_comp_dirc.v"

module tb;
reg [1:0] i;
reg s;
wire y;

mux dut(i,s,y);

initial begin
s=0;
repeat(10) begin
i=$random;
s=~s;
#5;
end

end
endmodule
