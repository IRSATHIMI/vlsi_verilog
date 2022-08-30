module memory(clk_i,rst_i,addr_i,wr_data_i,rd_data_o,wr_rd_en_i,valid_i,rdy_o);
parameter width=16, depth=64;
parameter addr_width=6;
input clk_i,rst_i,wr_rd_en_i,valid_i;
output reg rdy_o;
input [width-1:0] wr_data_i;
input [addr_width-1:0] addr_i;
output reg [width-1:0] rd_data_o;
integer i;

reg [width-1:0] mem [depth-1:0];

always @(posedge clk_i) begin
	if (rst_i==1) begin
	rd_data_o=0;
	rdy_o=0;
	for (i=0; i<depth ;i=i+1)	mem[i]=0;
	end
	else begin
	if (valid_i == 1) begin 
		rdy_o=1;
		if (wr_rd_en_i == 1) mem[addr_i]=wr_data_i;
		else rd_data_o =mem[addr_i];
		end
	else begin
	rdy_o=0;
	end
	end
end
endmodule
