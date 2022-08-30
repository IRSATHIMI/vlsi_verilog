`include "interrupt_controller.v"
module tb;

parameter NUM_INTRPT = 16; //number of pheriperals
parameter INTRPT_WIDTH = 4;

reg pclk_i, prst_i; 
reg [INTRPT_WIDTH-1:0] paddr_i, pwdata_i;
wire [INTRPT_WIDTH-1:0] prdata_o;
reg pwrite_i, penable_i;
wire pready_o, perror_o;
wire [INTRPT_WIDTH-1:0] intr_to_srvc_o;
wire intr_valid_o;
reg intr_srvcd_i;
reg [NUM_INTRPT-1:0] intr_active_i;
reg [30*8:1] testcase;
integer i, seed;
reg [INTRPT_WIDTH-1:0] unique_array [NUM_INTRPT-1:0];
intr_ctrl #(.NUM_INTRPT(NUM_INTRPT),.INTRPT_WIDTH(INTRPT_WIDTH)) dut(.*);

// clock generation
initial begin
pclk_i = 0;
forever #5 pclk_i = ~pclk_i;
end

initial begin
$value$plusargs("testcase=%s",testcase);
$value$plusargs("seed=%d",seed);
	prst_i = 1;
	rst_desgn_ip();
	fill_unique_array();
	repeat (2) @(posedge pclk_i);
	prst_i = 0;
	//stimulus 
	//1) writing into reg
	if(testcase == "random"
	for(i=0;i<NUM_INTRPT;i=i+1) $display("index=%0d value=%0d",i,unique_array[i]);
	repeat (3) begin
		for (i=0 ; i < NUM_INTRPT ; i=i+1) begin
			case(testcase)
				"assending" : write_reg(i,(INTRPT_WIDTH-1-i));
				"descending": write_reg(i,i);
				"random"	:begin
					write_reg(i,unique_array[i]);
				end
			endcase
		end
		//2) generating inturrupt
		intr_active_i = $random;
		#500;
	end
	$finish;
end

initial begin
forever begin
	@(posedge pclk_i);
	if (intr_valid_o == 1) begin
		#20;
		intr_active_i[intr_to_srvc_o] = 0;
		intr_srvcd_i = 1;
		@(posedge pclk_i);
		intr_srvcd_i = 0;
	end
end
end

task fill_unique_array();
integer p,q,r,num_to_fill,flag;
begin
	for (p = 0 ; p<NUM_INTRPT ;) begin
		//num_to_fill = $urandom_range(0,NUM_INTRPT-1);
		num_to_fill = $random(seed)%NUM_INTRPT;
		flag = 1;
		for(q = 0 ; q < p ; q=q+1) begin
			if(unique_array[q] == num_to_fill) begin
			flag=0;
			q=p;
			end
		end
		if	(flag) begin
		unique_array[p]=num_to_fill;
		p=p+1;
		end
	end	
end
endtask

task write_reg (input reg [3:0] addr, input reg [3:0] data);
begin
	@(posedge pclk_i);
	paddr_i = addr;
	pwdata_i = data;
	pwrite_i = 1;
	penable_i = 1;
	wait (pready_o == 1);
	@(posedge pclk_i);
	pwrite_i = 0;
	penable_i = 0;

end
endtask

task rst_desgn_ip();
begin
paddr_i = 0;
pwdata_i = 0;
pwdata_i = 0; 
penable_i = 0;
intr_srvcd_i = 0;
intr_active_i = 0;
end
endtask

endmodule

