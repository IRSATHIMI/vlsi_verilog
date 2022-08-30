




module top;
reg [4:0] poly;
reg [4:0] crc;
reg [15:0] data;
initial begin
	//crc = data % poly; //remainder is CRC
	//100/7 = 2
	crc = calc_crc(data, poly);

	data = 16'h1F;
	crc = calc_crc(data, poly);

end

function [4:0] calc_crc(input [15:0] data, input [4:0] poly);
	for (int i = 0; i < 16; i++) begin
		crc_l = data ^ poly;
		data <<= 1;
	end
	calc_crc = crc_l;
endfunction
endmodule
