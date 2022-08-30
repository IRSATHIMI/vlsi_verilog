module upcount(clk,reset,count);
input clk,reset;
output reg [2:0] count;
reg [2:0] n;
reg ud;

initial begin
$value$plusargs ("N=%d",n);
$value$plusargs ("up'1down'0'=%d",ud);
end

always @(posedge clk)
begin
//for up counter if ud==1
if (ud==1)begin
if (reset==1) count<=0;
else begin if (count==n-1) count<=0; //count up to n-1 and reset to 0
else count<=count+1;
end
end
//for down counter if ud==0
else begin
if (reset==1) count<=n;
else begin if (count==0) count<=n-1;// count down to zero from n-1 and repeat again
else count<=count-1;
end
end
end
endmodule
