`define DET2POL 1

`define POL2DET 2
`define POL2CFG 3

`define CFG2DET 4
`define CFG2L0 5
`define CFG2DIS 6
`define CFG2REC 7
`define CFG2LB 8

`define L02L0S 9
`define L02L1 10
`define L02L2 11
`define L02REC 12

`define L0S2L0 13
`define L0S2REC 14

`define L12REC 15
`define L22DET 16

`define REC2L0 17
`define REC2CFG 18
`define REC2DET 19
`define REC2LB 20
`define REC2HR 21
`define REC2DIS 22

`define LB2DET 23
`define HR2DET 24
`define DIS2DET 25

`define DET 0
`define POL 1
`define CFG 2
`define L0 3
`define L0S 4
`define L1 5
`define L2 6
`define REC 7
`define LB 8
`define HR 9
`define DIS 10


module pcie_pl(input clk, input rst, input [4:0] data, output reg [3:0] state);
reg [3:0] next_state;
always @(posedge clk) begin
	if (rst) begin
		next_state = `DET;
	end
	else begin
		case (state)
			`DET : begin
				if (data == `DET2POL) begin
					next_state = `POL;
				end
			end
			`POL : begin
				if (data == `POL2CFG) begin
					next_state = `CFG;
				end
				if (data == `POL2DET) begin
					next_state = `DET;
				end
			end
			`CFG : begin
				if (data == `CFG2DET) begin
					next_state = `DET;
				end
				if (data == `CFG2L0) begin
					next_state = `L0;
				end
				if (data == `CFG2DIS) begin
					next_state = `DIS;
				end
				if (data == `CFG2REC) begin
					next_state = `REC;
				end
				if (data == `CFG2LB) begin
					next_state = `LB;
				end
			end
			`L0 : begin
				if (data == `L02L0S) begin
					next_state = `L0S;
				end
				if (data == `L02L1) begin
					next_state = `L1;
				end
				if (data == `L02L2) begin
					next_state = `L2;
				end
				if (data == `L02REC) begin
					next_state = `REC;
				end
			end
			`L0S : begin
			end
			`L1 : begin
			end
			`L2 : begin
			end
			`REC : begin
				if (data == `REC2CFG) begin
					next_state = `CFG;
				end
			end
			`LB : begin
			end
			`HR : begin
			end
			`DIS : begin
			end
		endcase
	end
end

always @(next_state) begin
	state <= next_state;
end

endmodule




