module tb;
reg [7:0] data;
reg [2:0] poly;
reg [1:0] crc,crc_d;
reg [2:0] remainder;
integer i,data_shift;

initial begin
	poly = 3'b101;
	data = 8'b1100_0110;
	data_shift = 0;
	for(i = 7; i > 1 ; i=i-1) begin
		if(i==7) begin
			remainder = data[7:5] ^ poly;
			data = data << 3;
			data_shift = data_shift + 3;
		end
		else begin
			remainder = remainder ^ poly;
			if(remainder[2:0] == 3'b000) begin
				remainder[2:0] = data[7:5];
				data = data << 3;
				data_shift = data_shift + 3;
			end
			else if(remainder[2:1] == 2'b00) begin
				remainder = remainder << 2;
				remainder[1:0] = data[7:6];
				data = data << 2;
				data_shift = data_shift + 2;
				if(data_shift == 6) begin
					i=1;
				end
			end
			else if(remainder[2] == 1'b0) begin
				remainder = remainder << 1;
				remainder[2] = data[7];
				data = data << 1;
				data_shift = data_shift + 1;
				if(data_shift == 7) begin
					i=1;
				end
			end
			crc = remainder ;
		end
	end
	$display ("crc = %0b -- %0d",crc,crc);
end
endmodule
