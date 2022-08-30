module spi_ctrl(
//apb
pclk_i,prst_i, paddr_i, pwdata_i, prdata_o, pwrite_i, penable_i,
pready_o, 
//spi_ctrl
sclk_i, sclk_o, mosi, miso, cs );

parameter S_IDLE = 5'b00001;
parameter S_ADDR = 5'b00010;
parameter S_IDLE_BW_ADDR_DATA = 5'b00100;
parameter S_DATA = 5'b01000;
parameter S_IDLE_PEND_TXN = 5'b10000;

parameter MAX_NUM_TXS = 8;

input pclk_i, prst_i;
input [7:0] paddr_i;
input [7:0] pwdata_i;
output reg [7:0] prdata_o;
input pwrite_i, penable_i;
output reg pready_o;
input sclk_i;
output sclk_o;
output reg mosi;
input  miso;
output reg [3:0] cs;

reg [7:0] addr_regA [MAX_NUM_TXS-1:0]; //'h0 to MAX_NUM_TXS-1
reg [7:0] data_regA [MAX_NUM_TXS-1:0]; //'h10 to 'h10 -MAX_NUM_TXS-1
reg [7:0] ctrl_reg; //'h20

reg [4:0] state, next_state;
reg sclk_gated_f;
reg [2:0] cur_tx_idx;
reg [3:0] num_txn_pending, count;
reg [7:0] add_to_drive;
reg [7:0] data_to_drive, data_collect;
integer i;
// writing registor
always @(posedge pclk_i) begin
	if (prst_i) begin
		prdata_o = 0;
		pready_o = 0;
		for (i = 0; i < MAX_NUM_TXS; i = i+1) 
		begin
			addr_regA[i] = 0;
			data_regA[i] = 0;
		end
		state = S_IDLE;
		next_state = S_IDLE;
		cs = 1;
		cur_tx_idx = 0;
		num_txn_pending = 0;
		count = 0;
		add_to_drive = 0;
		data_to_drive = 0;
		data_collect = 0;
		ctrl_reg = 0;
		sclk_gated_f =1;
		mosi =1;
		ctrl_reg[7:4]=0;
	end
	else begin
		if (penable_i) begin
			pready_o = 1;
			if(pwrite_i) begin 
				if(paddr_i >= 8'h0 && paddr_i <= 8'h7) addr_regA[paddr_i] = pwdata_i;
				if(paddr_i >= 8'h10 && paddr_i <= 8'h17) data_regA[paddr_i-8'h10] = pwdata_i;
				if(paddr_i == 8'h20) ctrl_reg[3:0] = pwdata_i[3:0];
			end
			else begin 
				if(paddr_i >= 8'h0 && paddr_i <= 8'h7) prdata_o = addr_regA[paddr_i] ;
				if(paddr_i >= 8'h10 && paddr_i <= 8'h17) prdata_o = data_regA[paddr_i-8'h10];
				if(paddr_i == 8'h20) prdata_o = ctrl_reg ;
			end
		end
		else pready_o = 0;	
	end
end

//doing SPI TXN
always @(posedge sclk_i) begin
	if(!prst_i) begin
		case(state)
			S_IDLE : begin
				mosi = 1;
				add_to_drive = 0;
				data_to_drive = 0;
				sclk_gated_f = 1;
				count = 0;
				if(ctrl_reg[0] /*&& ctrl_reg[3:1] != 0*/)begin
					cur_tx_idx = ctrl_reg[6:4];
					num_txn_pending = ctrl_reg[3:1] + 1;
					next_state = S_ADDR;
					count = 0;
					add_to_drive = addr_regA[cur_tx_idx];
					data_to_drive = data_regA[cur_tx_idx];
				end
			end
			S_ADDR : begin
				sclk_gated_f = 0;
				mosi = add_to_drive[count];
				count = count+1;
				if(count == 8) begin
					next_state = S_IDLE_BW_ADDR_DATA;
					count = 0;
				end
			end
			S_IDLE_BW_ADDR_DATA : begin
				mosi = 1;
				sclk_gated_f = 1;
				count = count+1;
				if(count == 4) begin
					next_state =S_DATA;
					count = 0;
				end
			end
			S_DATA : begin
				sclk_gated_f = 0;
				if(add_to_drive[7]) begin //write
					mosi = data_to_drive[count];
					count = count+1;
				end
				if(!add_to_drive[7]) begin //read
					data_collect[count] = miso;
					count = count+1;
				end
				if(count == 8) begin
					count = 0;
					num_txn_pending = num_txn_pending - 1;
					cur_tx_idx = cur_tx_idx + 1;
					ctrl_reg[6:4] = cur_tx_idx;
					if(!add_to_drive) prdata_o = data_collect;
					if (!num_txn_pending) begin
						next_state = S_IDLE;
						ctrl_reg[0] = 0;
						ctrl_reg[3:1] = 0;
					end
					else next_state = S_IDLE_PEND_TXN;
				end
			end
			S_IDLE_PEND_TXN : begin
				mosi = 1;
				sclk_gated_f = 1;
				count = count + 1;
				if (count == 4) begin
					count = 0;
					next_state =S_ADDR;
					add_to_drive = addr_regA[cur_tx_idx];
					data_to_drive = data_regA[cur_tx_idx];
				end
			end
		endcase
	end
end
// nextstate condition
always @(next_state) state = next_state;

// driving sclk_o condition
assign sclk_o = prst_i ? 0 : sclk_gated_f ? 1 : sclk_i;
/*
always @(posedge sclk_i) begin
	if (state == 8 | state == 2) begin
		data_display[count1] = mosi;
		count1 = count1 + 1;
	if(count1 == 8) begin
		data_collect = data_display;
		count1 = 0;
	end
	end
	else data_display =0;
end */
endmodule
