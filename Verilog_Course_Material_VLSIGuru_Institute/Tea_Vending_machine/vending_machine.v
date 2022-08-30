module vending_machine(input clk, input rst, input coin_valid, output reg machine_ready, input [2:0] coin, output reg tea_f, output reg [3:0] bal);

integer total_amount_collected;  //Paise

always @(posedge clk) begin
	if (rst) begin
		total_amount_collected = 0;
	end
	else begin
		if (coin_valid) begin
			machine_ready = 1;
			case (coin)
				3'b000 : begin //invalid coin
				end
				3'b001 : begin  //25 paise
					total_amount_collected = total_amount_collected + 25;
				end
				3'b010 : begin  //50
					total_amount_collected = total_amount_collected + 50;
				end
				3'b011 : begin  //100
					total_amount_collected = total_amount_collected + 100;
				end
				3'b100 : begin  //200
					total_amount_collected = total_amount_collected + 200;
				end
				3'b101 : begin  //500
					total_amount_collected = total_amount_collected + 500;
				end
				3'b110 : begin  //1000
					total_amount_collected = total_amount_collected + 1000;
				end
				3'b111 : begin  //invaldi
				end
			endcase
			if (total_amount_collected >= 150) begin
				tea_f = 1;
				$display("Please collect tea, remaining balance %d", total_amount_collected-150);
			end
			else begin
				$display("Total amount is %d, remianing %d", total_amount_collected, 150-total_amount_collected);
				tea_f = 0;
			end
		end
	end
end


endmodule
