module pattern_det_mealy(clk,rst,d_i,valid_i,pattern);

parameter S_RESET = 3'B000;
parameter S_B = 3'B001;
parameter S_BB = 3'B010;
parameter S_BBC = 3'B011;
parameter S_BBCB = 3'B100;
parameter S_BBCBC = 3'B101;
parameter B = 1'B0;
parameter C = 1'B1;

input clk,rst,d_i,valid_i;
output reg pattern;

reg [2:0] state,next_state;

always @ (next_state) state=next_state;

always @(posedge clk) begin
	if (rst) begin
		pattern = 0;
		state= S_RESET;
		next_state= S_RESET;
	end
	else begin
	pattern=0;
		if (valid_i) begin
			case(state) 
			S_RESET	: begin
				if (d_i == B) next_state = S_B;
				else next_state = S_RESET;
					end
			S_B 	: begin
				if (d_i == B) next_state = S_BB;
				else next_state=S_RESET;
					end
            S_BB 	: begin
				if (d_i == C) next_state = S_BBC;
				else next_state = S_BB;
				end
			S_BBC 	: begin
				if (d_i == B) next_state = S_BBCB;
				else next_state = S_RESET;
			 		end
            S_BBCB 	: begin
				if (d_i == C) begin
				pattern = 1;
				next_state = S_RESET;
				end
				else next_state = S_BB;
			  		end
		 	default : begin
				$display ("ERROR DETECTED");
					next_state = S_RESET;
					  end
			endcase
		end
		end
end
endmodule
