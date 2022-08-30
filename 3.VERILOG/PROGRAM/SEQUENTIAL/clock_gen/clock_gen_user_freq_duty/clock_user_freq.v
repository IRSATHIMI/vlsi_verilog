module tb;
reg clk;
real freq,tp,duty;
always begin
clk=0;
#(tp*duty/100);	 //5nano sec
clk=1;
#(tp*((100-duty)/100));
end

initial begin
$value$plusargs("freq=%f",freq); //freq in mhz
$value$plusargs("duty=%f",duty); //dutycycle in percentage
tp=1000/freq; //converting frequncy into nanosecond
#100;
$finish;
end

endmodule
