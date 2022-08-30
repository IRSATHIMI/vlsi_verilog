`include "spi.v"
module tb;
parameter MAX_NUM_TXS = 8;
parameter S_IDLE = 3'b001;
parameter S_ADDR = 3'b010;
parameter S_DATA = 3'b100;
reg pclk_i, prst_i;
reg [7:0] paddr_i;
reg [7:0] pwdata_i;
wire [7:0] prdata_o;
reg pwrite_i, penable_i;
wire pready_o;
reg sclk_i;
wire sclk_o;
wire mosi;
reg  miso;
wire [3:0] cs;
reg [7:0] data,addr_mosi, data_mosi;
reg [2:0] state, next_state;
integer i,count;

spi_ctrl #(.MAX_NUM_TXS(MAX_NUM_TXS)) dut(
//apb
pclk_i,prst_i, paddr_i, pwdata_i, prdata_o, pwrite_i, penable_i,
pready_o, 
//spi_ctrl
sclk_i, sclk_o, mosi, miso, cs );

initial begin
 pclk_i = 0;
 forever #5 pclk_i = ~pclk_i;
end
initial begin
 sclk_i = 0;
 forever #1 sclk_i = ~sclk_i;
end

initial begin
	prst_i = 1;
	rst_ip();
	state = S_IDLE;
	next_state =S_IDLE;
	repeat (2) @(posedge pclk_i);
	prst_i = 0;
	//wriitng into addr_regA
	for (i =0; i <MAX_NUM_TXS ; i =i+1)	write_reg (i,8'hd3+i);//53,54,55
	//writting into data_regA
	for (i =0; i <MAX_NUM_TXS ; i =i+1)	write_reg (i+8'h10,8'h46+i);//46,47,48
	// writting into ctrl_reg
	data = {4'h0,3'h2,1'h1};
	write_reg (8'h20,data);
	#200;
	data = {4'h0,3'h1,1'h1};
	write_reg (8'h20,data);
	#300;
	data = {4'h0,3'h1,1'h0};
	write_reg (8'h20,data);
	for(i=0; i <32; i=i+1) begin
		@(posedge sclk_i);
		miso = $random;
	end
	#300;
	$finish;
	
end
// state machine to collect the data of mosi
always @(posedge sclk_o) begin
 case (state) 
 	S_IDLE : begin
		next_state = S_ADDR;
		count = 0;
	end
	S_ADDR : begin
		addr_mosi[count] = mosi;
		count = count+1;
		if(count == 8) begin
			next_state = S_DATA;
			count = 0;
			$display("t:%0t addr=%0h",$time,addr_mosi);
		end
	end
	S_DATA : begin
		data_mosi[count] = mosi;
		count = count+1;
		if(count == 8) begin
			next_state = S_ADDR;
			count = 0;
			$display("t:%0t data=%0h",$time,data_mosi);
		end
	end
 endcase
end

always @(next_state) state = next_state;

task rst_ip();
begin
	paddr_i = 0;
	pwdata_i = 0;
	pwrite_i = 0;
	penable_i = 0;
	miso = 1;
end
endtask

task write_reg (input reg [7:0] w_addr, input reg [7:0] w_data);
begin
	@(posedge pclk_i);
	paddr_i = w_addr;
	pwdata_i = w_data;
	pwrite_i = 1;
	penable_i = 1;
	wait (pready_o == 1);
	@(posedge pclk_i);
	pwrite_i = 0;
	pwdata_i = 0;
	paddr_i = 0;
	penable_i = 0;
end
endtask

task read_reg (input reg [7:0] r_addr, input reg [7:0] r_data);
begin
	@(posedge pclk_i);
	penable_i = 1;
	paddr_i = r_addr;
	pwrite_i = 0;
	wait (pready_o);
	@(posedge pclk_i);
	penable_i = 0;
	paddr_i = 0;
end
endtask


endmodule
