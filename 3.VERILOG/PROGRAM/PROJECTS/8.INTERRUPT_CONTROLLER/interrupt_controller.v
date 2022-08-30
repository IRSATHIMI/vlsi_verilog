module intr_ctrl(pclk_i,prst_i, paddr_i, pwdata_i, prdata_o, pwrite_i, penable_i,
pready_o, perror_o, intr_to_srvc_o,intr_valid_o, intr_srvcd_i, 
intr_active_i);
parameter NUM_INTRPT = 16; //number of pheriperals
parameter INTRPT_WIDTH = 4;
parameter S_NO_INTR = 3'b001;
parameter S_INTR_ACTIVE = 3'b010; 
parameter S_INTR_FOR_WAIT_STATE = 3'b100; 
input pclk_i, prst_i;
input [INTRPT_WIDTH-1:0] paddr_i, pwdata_i;
output reg [INTRPT_WIDTH-1:0] prdata_o;
input pwrite_i, penable_i;
output reg pready_o, perror_o;
output reg [INTRPT_WIDTH-1:0] intr_to_srvc_o;
output reg intr_valid_o;
input intr_srvcd_i;
input [NUM_INTRPT-1:0] intr_active_i;
reg [INTRPT_WIDTH-1:0] priorty_reg [NUM_INTRPT-1:0];
reg [2:0] next_state, state;
reg [INTRPT_WIDTH-1:0]  intr_with_high_prio;
reg [INTRPT_WIDTH-1:0] cur_high_prio;
integer first_match_f,i;

//register progarmming
always @(posedge pclk_i) begin
	if (prst_i) begin
		prdata_o = 0;
		pready_o = 0;
		perror_o = 0;
		intr_to_srvc_o = 0;
		intr_with_high_prio=0;
		cur_high_prio=0;
		intr_valid_o = 0;
		for (i=0;i<NUM_INTRPT;i=i+1) priorty_reg[i] = 0;
		state = S_NO_INTR;
		next_state = S_NO_INTR;
	end
	else begin
		if (penable_i) begin
			pready_o = 1;
			if(pwrite_i) priorty_reg[paddr_i] = pwdata_i;
			else prdata_o = priorty_reg[paddr_i];
		end
		else pready_o = 0;
		
	end
end

always @(posedge pclk_i) begin
	case (state)
		S_NO_INTR : begin
			if (intr_active_i != 0) next_state = S_INTR_ACTIVE;
			first_match_f = 1;
		end
		S_INTR_ACTIVE : begin
		// get the highest priority on all active interrupt
		// give to processor
			for (i = 0; i < NUM_INTRPT ; i = i+1) begin
				if(intr_active_i[i]) begin
					if (first_match_f ==1) begin
						cur_high_prio = priorty_reg[i];
						intr_with_high_prio = i;
						first_match_f =0;
					end
					else begin
						if(cur_high_prio < priorty_reg[i]) begin
						cur_high_prio = priorty_reg[i];
						intr_with_high_prio =i;
						end
					end
				end
			end
			intr_to_srvc_o = intr_with_high_prio;
			intr_valid_o =1;
			next_state = S_INTR_FOR_WAIT_STATE;
		end
		S_INTR_FOR_WAIT_STATE : begin
			if(intr_srvcd_i == 1) begin
				intr_to_srvc_o = 0;
				intr_valid_o = 0;
				intr_with_high_prio =0;
				cur_high_prio = 0;
				if (intr_active_i != 0) begin
				next_state = S_INTR_ACTIVE;
				first_match_f = 1;
				end
				else next_state = S_NO_INTR;
			end
		end
	endcase
end

always @(next_state) state = next_state;

endmodule

