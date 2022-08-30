module upcount(clk,reset,count);
input clk,reset;
output reg [2:0] count;
reg [2:0] n;

initial begin
$value$plusargs ("N=%d",n);
end

always @(posedge clk)
begin
if (reset==1) count<=0;
else begin if (count==n-1) count<=0;
else count<=count+1;
end
end

/*always begin
if (clk==5) count=0;
end*/

endmodule
