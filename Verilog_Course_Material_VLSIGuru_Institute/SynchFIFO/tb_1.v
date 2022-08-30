module tb;
reg clk, rst, wr_rd_i, valid_i, ready_i;
wire ready_o, valid_o, fifo_full_o, fifo_empty_o;
wire [7:0] data_o;
bit ready_f = 0;
reg [7:0] data_i;
reg [1:0] wr_dly;
reg [2:0] rd_dly;
/*
	fifo_synch dut(
		.*
	);
	*/

	fifo_synch dut(
	.clk( clk), 
	.rst( rst), 
	.wr_rd_i( wr_rd_i),
	.valid_i( valid_i), 
	.ready_o( ready_o), 
	.data_i( data_i), 
	.valid_o( valid_o),  
	.ready_i( ready_i),  
	.data_o( data_o),  
	.fifo_full_o( fifo_full_o),  
	.fifo_empty_o( fifo_empty_o)
	);

initial begin
	clk = 0;
	forever #5 clk = ~clk;
end

initial begin
	rst = 1;
	repeat(2) @(posedge clk);
	rst = 0;
end
//READING FROM FIFO with random delay between each of read
initial begin
	@(negedge rst);
	//TC1 : only write to FIFO, don;t read
	repeat(20) begin
		rd_dly = $random%6;
		repeat(rd_dly) @(posedge clk);
		valid_i = 1;
		wr_rd_i = 0;
		ready_f = 0;
		while (ready_f == 0) begin
			@(posedge clk);
			if (ready_o == 1) begin
				ready_f = 1;
			end
		end
		@(negedge clk);
		valid_i = 0;
		ready_f = 0;
	end
	valid_i = 0;
	//check the if FIFO is full or not
end

//WRITING TO FIFO with random delay between each of writes
initial begin
	@(negedge rst);
	//TC1 : only write to FIFO, don;t read
	repeat(30) begin
		wr_dly = $random%4;
		repeat(wr_dly) @(posedge clk);
		valid_i = 1;
		data_i = $random;
		wr_rd_i = 1;
		ready_f = 0;
		while (ready_f == 0) begin
			@(posedge clk);
			if (ready_o == 1) begin
				ready_f = 1;
			end
		end
		@(negedge clk);
		valid_i = 0;
		ready_f = 0;
	end
	valid_i = 0;
	//check the if FIFO is full or not
end

initial begin
	#3000;
	$finish;
end



initial begin
	$monitor("Time = %t : fifo_full_o = %h, fifo_empty_o = %h", $time, fifo_full_o, fifo_empty_o);
end
endmodule

