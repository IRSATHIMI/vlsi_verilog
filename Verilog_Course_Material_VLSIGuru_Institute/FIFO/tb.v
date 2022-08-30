`include "fifo_sync.v"
module tb;
reg clk, rst, wr_req, rd_req;
wire wr_ack, rd_ack;
wire fifo_full, fifo_empty;
reg [7:0] data_in;
wire [7:0] data_out;
integer i;

reg wr_ack_f, rd_ack_f;
  fifo dut(
	    .clk(clk), 
	    .rst(rst), 
	    .data_in(data_in), 
	    .data_out(data_out), 
	    .wr_req(wr_req), 
	    .rd_req(rd_req), 
	    .wr_ack(wr_ack),
	    .rd_ack(rd_ack),
	    .fifo_full(fifo_full), 
	    .fifo_empty(fifo_empty)
  );

  //clock geenration
  initial begin
	  clk = 0;
	  forever #5 clk = ~clk;
  end
  initial begin
	  #1000;
	  $finish;
  end

  initial begin
	  rst = 1;  //applying reset
	  repeat(2) @(posedge clk);
	  rst = 0;  //releaing reset
  end

  //TB stimulus
  initial begin
	  //check whether FIFO generates fifo_full on getting filled?
	  for (i = 0; i < 32; i=i+1) begin
		wr_req = 1;
		data_in = $random;
		wr_ack_f = 1;
	  	while(wr_ack_f) begin
			@(posedge clk);
			if (wr_ack) begin
				$display("write_data = %h", data_in);
				wr_ack_f = 0;
			end
	  	end
		wr_req = 0;
	  end
	  //check if FIFO_FULL
	  //Read FIFO data
	  for (i = 0; i < 32; i=i+1) begin
		rd_req = 1;
		rd_ack_f = 1;
	  	while(rd_ack_f) begin
			@(posedge clk);
			if (rd_ack) begin
				rd_ack_f = 0;
				$display("read_data = %h", data_out);
			end
	  	end
		@(negedge clk);
		rd_req = 0;
	  end
  end

endmodule
