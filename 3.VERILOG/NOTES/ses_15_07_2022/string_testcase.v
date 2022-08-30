module top;
reg [8*20:1] testcase;

initial begin
	//testcase = "test1";
	$value$plusargs("inputcase=%s",testcase);
	case(testcase)
		"test1":begin
			$display("we doing test1 operation phase");
		end
		"test2":begin
			$display("we doing test2 operation phase");
		end
		"test3":begin
			$display("we doing test3 operation phase");
		end
	endcase

end

endmodule
