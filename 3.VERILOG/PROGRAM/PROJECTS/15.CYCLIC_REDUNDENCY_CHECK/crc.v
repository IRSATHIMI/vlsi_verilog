module tb;
reg [7:0] data;
reg [2:0] poly;
reg [1:0] crc;
reg [2:0] remainder;
integer i;

initial begin
	poly = 3'b101;
	data = 8'b1011_1110;
	crc = 0;
	for(i = 8; i >= 0 ;i=i-1 ) begin
		if(i==7) begin
			remainder = data[7:5];
			data = data << 3;
			i = i-2;
			$display ("1st remaninder =%b  data =%b crc = %b i=%0d ",remainder,data,crc,i);
		end
		else begin
			if(remainder[2:0] == 3'b000) begin
				remainder[2:0] = data[7:5];
				data = data << 3;
				i=i-2;
			$display ("3shift remaninder =%b data=%b crc = %b i=%0d ",remainder,data,crc,i);
			end
			else if(remainder[2:1] == 2'b00) begin
				remainder = remainder << 2;
				remainder[1:0] = data[7:6];
				data = data << 2;
				i=i-1;
			$display ("2shift remaninder =%b data=%b crc = %b i=%0d ",remainder,data,crc,i);
			end
			else if(remainder[2] == 1'b0) begin
				remainder = remainder << 1;
				remainder[0] = data[7];
				data = data << 1;
			$display ("1shift remaninder =%b data=%b crc = %b i=%0d ",remainder,data,crc,i);
			end
			remainder = remainder ^ poly;
		//	if(data == 0) i=2;
		end
	end
	crc = remainder;
	$display ("crc = %0b -- %0d",crc,crc);
end
endmodule
