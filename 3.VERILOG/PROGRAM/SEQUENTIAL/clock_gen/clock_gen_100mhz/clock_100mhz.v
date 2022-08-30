module tb;
reg clk;

always begin
clk=0;
#5;	 //5nano sec
clk=1;
#5;
end

initial begin
#100;
$finish;
end

endmodule
