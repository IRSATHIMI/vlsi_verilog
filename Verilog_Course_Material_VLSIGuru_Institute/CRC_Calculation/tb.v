`include "mac_tx.v"
module tb;
reg clk_rx, clk_tx, rst;
wire [7:0] data_o; 
reg [63:0] data_i;
reg valid_i;
wire valid_o;
reg [7:0] crc_in;
reg [7:0] data_in;
integer i;
reg [7:0] crc_t;

mac_tx dut(
	.clk_rx(clk_rx), 
	.clk_tx(clk_tx), 
	.rst(rst), 
	.data_o(data_o), 
	.data_i(data_i), 
	.valid_i(valid_i), 
	.valid_o(valid_o)
);

initial begin
	clk_rx = 0;
	forever #5 clk_rx = ~clk_rx;
end

initial begin
	clk_tx = 0;
	forever #5 clk_tx = ~clk_tx;
end

initial begin
	rst = 1;
	repeat(2) @(posedge clk_rx);
	rst = 0;
	repeat(2) @(posedge clk_rx);
	valid_i = 1;
	data_i = 64'h1F_2F_3F_4F_5F_6F_7F_8F;
	@(posedge clk_rx);
	valid_i = 0;
	#200;
	$finish;
end

initial begin
	crc_in = 8'h12;
	forever begin
		@(posedge clk_tx);
		if (valid_o == 1) begin
			calc_crc8(data_o, crc_in, crc_t);
			crc_in = crc_t;
		end
	end
end

initial begin
	$monitor("Time=%t : crc_in = %h", $time, crc_in);
end
		
task calc_crc8;
input [7:0] data_i;
input [7:0] crc_in;
output [7:0] crc_out;
begin
	//crc_out = 5'h1C;  //temporary
	//Poly = x8+x2+x+1
	data_in = data_i;
	for (i=0; i < 8; i=i+1) begin
		crc_t[0] = crc_in[0] ^ data_in[0];
		crc_t[1] = crc_in[1] ^ data_in[1];
		crc_t[2] = crc_in[2];
		crc_t[3] = crc_in[3];
		crc_t[4] = crc_in[4];
		crc_t[5] = crc_in[5];
		crc_t[6] = crc_in[6];
		crc_t[7] = crc_in[7] ^ data_in[7];
		data_in = data_in << 1;
	       //data_in = {data_in[6:0],};
	end
	crc_out = crc_t;
end
endtask



endmodule
