module pattern_det_moore(clk,rst,d_i,valid_i,pattern);

parameter S_RESET = 3'B000;
parameter S_1 = 3'B001;
parameter S_2 = 3'B010;
parameter S_3 = 3'B011;
parameter S_4 = 3'B100;
parameter S_5 = 3'B101;

input clk,rst,d_i,valid_i;
output reg pattern;
integer pattern_i;
reg [4:0] pattern_det,current_pat;
reg [2:0] state,next_state;

always @ (next_state) state=next_state;

initial begin
$value$plusargs("Pattern_to_detect=%b",pattern_i);
pattern_det=pattern_i;
current_pat=5'b00000;
$display("pattern to detect is %b",pattern_det);
end

always @(posedge clk) begin
	if (rst) begin
		pattern = 0;
		state= S_RESET;
		next_state= S_RESET;
	end
	else begin
	pattern=0;
	current_pat<={current_pat[3:0],d_i};
		if (valid_i) begin
			case(state) 

			S_5	: begin
				pattern=1;
				if (current_pat[3:0] == pattern_det[4:1]) next_state = S_4; 
				else next_state = S_RESET;
					  end

			S_4 	: begin
				if(current_pat == pattern_det) next_state=S_5;
			//	else next_state = S_RESET;
					  end

            S_3 	: begin
				if(current_pat[3:0] == pattern_det[4:1]) next_state= S_4;
			//	else next_state = S_RESET;
					  end

			S_2 	: begin
				if(current_pat[2:0] == pattern_det[4:2]) next_state = S_3;
			//	else next_state = S_RESET;
			 		  end

            S_1 	: begin
				if(current_pat[1:0] == pattern_det[4:3]) next_state = S_2;
			//	else next_state = S_RESET;
			  		  end

			S_RESET		: begin
				if(current_pat[0] == pattern_det[4]) next_state = S_1;
			//	else next_state = S_RESET;
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
