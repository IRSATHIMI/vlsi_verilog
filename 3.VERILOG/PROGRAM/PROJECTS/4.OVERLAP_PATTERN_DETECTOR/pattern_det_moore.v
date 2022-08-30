module pattern_det_moore(clk,rst,d_i,valid_i,pattern);

parameter S_RESET = 3'B000;
parameter S_B = 3'B001;
parameter S_BC = 3'B010;
parameter S_BCC = 3'B011;
parameter S_BCCB = 3'B100;
parameter S_BCCBC = 3'B101;
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
				if (d_i == C) next_state = S_BC;
				else next_state=S_RESET;
					end
            S_BC 	: begin
				if (d_i == C) next_state = S_BCC;
				else next_state = S_RESET;
				end
			S_BCC 	: begin
				if (d_i == B) next_state = S_BCCB;
				else next_state = S_RESET;
			 		end
            S_BCCB 	: begin
				if (d_i == C) next_state = S_BCCBC;
				else next_state = S_B;
			  		end
		 	S_BCCBC	: begin
				pattern = 1;
				if (d_i == B) next_state = S_B;
				else next_state = S_BCC;
				end
		 	default : begin
				$display ("ERROR DETECTED");
					next_state = S_RESET;
					  end
			endcase
		end
		else $display("valid is 0");
		end
end
endmodule
