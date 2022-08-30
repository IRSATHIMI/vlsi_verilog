

module half_adder(S, C, A, B);
input [2:0] A, B;
output C;
output [2:0] S;
wire I1;
//continuous assingming based modeling (combinaitonal implementation)
//assign {C, S} = A + B - 1;
assign {C, S} = A + B ;
endmodule

module tb;
reg [2:0] A_t, B_t;
wire c_o;
wire [2:0] s;
half_adder  ha(
		s, c_o, A_t, B_t //conneciton by position
		//s, c_o, , B_t //conneciton by position, but A_t is not connected
		//.S(s), .A(A_t), .C(c_o), .B(B_t) //conneciton by name
		//.S(s), .A(A_t), .B(B_t) //conneciton by name, but C is not connected
		//s, A_t, c_o, B_t  //WRONG
	      );


	      initial begin
		      A_t = 3'b101;  //5
		      B_t = 3'b110;  //6   => 11 = 4'b1011 = 8 +3 => C = 1, S = 3'b011
		      if (c_o != 1'b1) begin
			      $display("ERROR : half_adder not giving proper carry");
		      end
		      else begin
			      $display("NOTE : half_adder is giving proper carry");
		      end

		      if (s != 3'b011) begin
			      $display("ERROR : half_adder not giving proper Sum, Expected Sum = 3'b011, Actual Sum = %b", s);
		      end
		      else begin
			      $display("NOTE : half_adder is giving proper Sum");
		      end

		      #1;
		      A_t = 3'b111;  //7
		      B_t = 3'b010;  //2   => 9 = 4'b1001 = 8 +1 => C = 1, S = 3'b001
		      if (c_o != 1'b1) begin
			      $display("ERROR : half_adder not giving proper carry");
		      end
		      else begin
			      $display("NOTE : half_adder is giving proper carry");
		      end

		      if (s != 3'b001) begin
			      $display("ERROR : half_adder not giving proper Sum, Expected Sum = 3'b001, Actual Sum = %b", s);
		      end
		      else begin
			      $display("NOTE : half_adder is giving proper Sum");
		      end
	      end
endmodule
