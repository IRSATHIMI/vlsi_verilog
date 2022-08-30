module fifo_async(//input 
rd_clk_i, wr_clk_i, rst_i,
//write interface
wdata_i, full_o, wr_en_i, wr_error_o,
//read interface
r_data_o, empty_o, rd_en_i, rd_error_o);

parameter DEPTH = 16;
parameter WIDTH = 8;
parameter PTR_WIDTH = 4; 

input rd_clk_i,wr_clk_i, rst_i, wr_en_i, rd_en_i;
input [WIDTH-1:0] wdata_i;
output reg wr_error_o, full_o, empty_o, rd_error_o;
output reg [WIDTH-1:0] r_data_o;

reg [WIDTH-1:0] mem [DEPTH-1:0];
reg [PTR_WIDTH-1:0] wr_ptr,rd_ptr, wr_ptr_gray, rd_ptr_gray,wr_ptr_rd_clk, rd_ptr_wr_clk;
reg wr_tog_f, rd_tog_f, rd_tog_f_wr_clk, wr_tog_f_rd_clk;
integer i;

// action reset and write in wr_clk_i
always @(posedge wr_clk_i) begin
	//applying reset
	if(rst_i) begin
		wr_error_o = 0;
		full_o = 0;
		empty_o = 1;
		rd_error_o =0;
		r_data_o = 0;
		wr_ptr = 0;
		rd_ptr = 0;
		wr_ptr_rd_clk=0;
		rd_ptr_wr_clk=0;
		wr_ptr_gray =0;
		rd_ptr_gray =0;
		wr_tog_f = 0;
		rd_tog_f = 0;
		for (i=0;i<DEPTH;i=i+1) mem[i] = 0;
	end
	//write operation
	else begin
		wr_error_o = 0;
		//writing into MEM from wdata_i
	
		if (wr_en_i) begin
			if(!full_o) begin 
				mem[wr_ptr] = wdata_i;
				if(wr_ptr == DEPTH-1) begin
					wr_tog_f = ~wr_tog_f;
					wr_ptr = wr_ptr+1;
				end
				else wr_ptr = wr_ptr+1;
				end
			else wr_error_o = 1;
		wr_ptr_gray = gray(wr_ptr);
		end
				
	end
end

//action read in read clock	
always @(posedge rd_clk_i) begin
	rd_error_o = 0;
	r_data_o = 0;
	if(!rst_i) begin
		if (rd_en_i) begin
			if(!empty_o) begin
				r_data_o = mem[rd_ptr];
				if(rd_ptr == DEPTH-1) begin
					rd_tog_f = ~rd_tog_f;
					rd_ptr = rd_ptr+1;
				end
				else rd_ptr =rd_ptr+1;
			rd_ptr_gray = gray(rd_ptr);
			end
			else rd_error_o = 1;
		end
	end
end

// read pointer sampling in write clk
always @(posedge wr_clk_i) begin
	rd_ptr_wr_clk <= rd_ptr_gray;
	rd_tog_f_wr_clk <= rd_tog_f;
end

// wr pointer samplin in read clock
always @(posedge rd_clk_i) begin
	wr_ptr_rd_clk <= wr_ptr_gray;
	wr_tog_f_rd_clk <= wr_tog_f;
end

/*//converting wr/rd ptr binary into gray avoid metastability
always @(*) begin
	wr_ptr_gray = gray(wr_ptr); 
	rd_ptr_gray = gray(rd_ptr); 
end */

//setting full and empty condition
always @(*) begin
	if ( (rd_ptr_gray == wr_ptr_rd_clk)&(rd_tog_f == wr_tog_f_rd_clk) ) empty_o = 1;
	else empty_o = 0;

	if ( (rd_ptr_wr_clk == wr_ptr_gray)&(rd_tog_f_wr_clk != wr_tog_f) ) full_o	= 1;
	else full_o = 0;
end

//function for converting binary to gray
function reg[3:0] gray(input reg[3:0] binary);
begin
 gray = {binary[3], binary[3:1] ^ binary[2:0] };
end
endfunction

endmodule
