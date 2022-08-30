`timescale 1ns/1ps
module tb;
time t1;
realtime r1;

initial begin
	t1=$time;
	r1=$realtime;
	$display("\n\nbefore #10 delay given -> t1=%0t  r1=%0t",t1,r1);
	#10.5;
	t1=$time;
	r1=$realtime;
	$display("\n\nafter #10 delay given  -> t1=%0t  r1=%0t",t1,r1);
	$finish();//used to end the simulation
end
endmodule
