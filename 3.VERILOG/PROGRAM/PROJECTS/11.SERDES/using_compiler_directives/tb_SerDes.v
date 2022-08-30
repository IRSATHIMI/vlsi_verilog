`include "SerDES.v"
module tb;
`ifdef SP
reg sclk_i, pclk_i, rst_i;
reg data_i, valid_i;
wire ready_o;
wire [7:0] data_o;
wire valid_o;
reg ready_i;
integer i ,n;
`else
reg pclk_i, rst_i, sclk_i;
reg [7:0] data_i;
reg valid_i,ready_i;
wire ready_o, data_o, valid_o;
integer i;
`endif

`ifdef SP
sipo_design  dut(sclk_i, pclk_i, rst_i,
data_i, valid_i, ready_o,
data_o, valid_o, ready_i);

// sclock gen
initial begin
sclk_i =0;
forever #1 sclk_i = ~sclk_i;
end

// pclock gen
initial begin
pclk_i =0;
forever #8 pclk_i = ~pclk_i;
end

initial begin
	// applying reset
	rst_i=1;
	rst_ip();
	repeat (2) @(posedge pclk_i);
	rst_i=0;
	// stimulus;

	for (i=0 ; i<80 ; i=i+1) begin
		@(posedge sclk_i)
		valid_i = 1;
		for(n=0 ; n<8 ; n=n+1) begin
		data_i =$random;
		end
		wait (ready_o);
	end
	@(posedge pclk_i);
	valid_i = 0;
	data_i = 0;
		
	#500;
	$finish;
end

task rst_ip();
begin
	data_i = 0;
	valid_i = 0;
	ready_i = 0;
	n=0;
	i=0;
end
endtask

always @(posedge pclk_i) begin
	if(valid_o) ready_i = 1;
	else ready_i = 0;
end

`else
piso dut(.*);

initial begin
 pclk_i =0;
 forever #8 pclk_i = ~pclk_i;
end

initial begin
sclk_i=0;
forever #1 sclk_i = ~sclk_i;
end

initial begin
	rst_ip();
	rst_i =1;
	repeat(2) @(posedge pclk_i);
	rst_i =0;
	for (i=0; i<10; i=i+1) begin
	@(posedge pclk_i);
	data_i = $random;
	valid_i =1;
	wait (ready_o == 1);
	end
	@(posedge pclk_i);
	data_i = 0;
	valid_i = 0;
	#500;
	$finish;
end

always @(posedge sclk_i) begin
	$display("t:%0t data_o=%0b count=%0d",$time,data_o,dut.count);
	if(valid_o ==1) begin
	ready_i = 1;
	end
	else ready_i = 0;
end

task rst_ip();
begin
	data_i = 0;
	valid_i = 0;
	ready_i = 0;
end
endtask

endmodule

