module encoder_4x2_behav(i,y);
input [3:0] i;
output reg [1:0] y;

always @(*) begin

if (i==4'b0001) y=2'b00;
else if (i[3:1]==3'b001) y=2'b01;
else if (i[3:2]==2'b01) y=2'b10;
else if (i[3]==1'b1) y=2'b11;
else y='bxx;

end

endmodule
