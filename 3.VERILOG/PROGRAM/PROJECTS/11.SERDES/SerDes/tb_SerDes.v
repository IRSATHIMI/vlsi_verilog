`include "SerDes.v"
module tb;

parameter PCLK_TP = 8;
parameter SCLKTP = 1;

reg pclk_i, rst_i, sclk_i;
//sipo interface
reg d_in_s;
reg valid_i_s,ready_i_s;
wire ready_o_s, valid_o_s; 
wire [7:0] d_out_s;
//piso interface
reg [7:0] d_in_p,d_in_s_collect;
wire d_out_p;
reg valid_i_p,ready_i_p;
wire ready_o_p, valid_o_p; 
integer i,n,j,count;

SerDes dut(sclk_i,pclk_i,rst_i,
			  d_in_s,d_out_s,valid_i_s,ready_o_s,valid_o_s,ready_i_s,
			  d_in_p,d_out_p,valid_i_p,ready_o_p,valid_o_p,ready_i_p);


// sclock gen
initial begin
sclk_i =0;
forever #SCLKTP sclk_i = ~sclk_i;
end

// pclock gen
initial begin
pclk_i =0;
forever #PCLK_TP pclk_i = ~pclk_i;
end
//sipo tb
initial begin
	// applying reset
	rst_i=1;
	rst_ip_s();
	rst_ip_p();
	count = 0;
	repeat (2) @(posedge pclk_i);
	rst_i=0;
	// stimulus;
	fork
	begin
		for (i=0 ; i<10 ; i=i+1) begin
			for(n=0 ; n<8 ; n=n+1) begin
				@(posedge sclk_i)
				d_in_s =$random;
				valid_i_s = 1;
				d_in_s_collect[count] = d_in_s;
				wait (ready_o_s == 1);
				count = count+1;
			end
			count = 0;
			$display("t:%0t d_in_s_collect=%0b",$time,d_in_s_collect);
		end
		@(posedge pclk_i);
		valid_i_s = 0;
		d_in_s = 0;
	end
	begin
		for (j=0; j<10; j=j+1) begin
			@(posedge pclk_i);
			d_in_p = $random;
			valid_i_p =1;
			wait (ready_o_p);
		end
		@(posedge pclk_i);
		d_in_p = 0;
		valid_i_p = 0;
	end
	join
	#500;
	$finish;
end

task rst_ip_s();
begin
	d_in_s = 0;
	valid_i_s = 0;
	ready_i_s = 0;
	n=0;
	i=0;
end
endtask

always @(posedge pclk_i) begin
	if(valid_o_s) ready_i_s = 1;
	else ready_i_s = 0;
end

always @(posedge sclk_i) begin
	if(valid_o_p) ready_i_p = 1;
	else ready_i_p = 0;
end

task rst_ip_p();
begin
	d_in_p = 0;
	valid_i_p = 0;
	ready_i_p = 0;
end
endtask

endmodule
