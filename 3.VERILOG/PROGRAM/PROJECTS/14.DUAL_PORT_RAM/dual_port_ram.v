`timescale 1ns/1ps
module memory(clk_i,rst_i,rd_addr_i,wr_addr_i,wr_data_i,rd_data_o,wr_en_i,rd_en_i,valid_i,rdy_o,rdy_i,valid_o);
parameter width=16, depth=64;
parameter addr_width=6;
input clk_i,rst_i,wr_en_i,rd_en_i,valid_i,rdy_i;
output reg rdy_o,valid_o;
input [width-1:0] wr_data_i;
input [addr_width-1:0] wr_addr_i,rd_addr_i;
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
	//fork
	//begin
		//writting phase
		if (valid_i) begin 
			rdy_o = 1;
			if (wr_en_i) mem[wr_addr_i]=wr_data_i;
		end
		else begin
			rdy_o=0;
		end
		//reading phase
		if (rdy_i) begin 
			valid_o = 1;
			if (rd_en_i) rd_data_o =mem[rd_addr_i];
		end
		else begin
			valid_o = 0;
		end
	//end
	//join
	end
end
endmodule
