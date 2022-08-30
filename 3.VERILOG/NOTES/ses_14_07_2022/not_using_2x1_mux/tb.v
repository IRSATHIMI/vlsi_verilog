`include "mux2x1.v"
`include "not_gate.v"
//to auto_file file names
//in gvim 
//go to insert mode
//ctrlxctrlf -> this will open filename list
module tb;
reg a;
wire out;

not_gate n_gate(a,out);

initial begin
$monitor("current time = %t\ninput a=%b\n output out=%b\n\n",$time,a,out);
//when there is a change in the argument list of $monitor command then only values gets printed in transcript
//printf("HELLOE WORD");
repeat(10) begin
	a=$random;
	#10;
end
end


endmodule
