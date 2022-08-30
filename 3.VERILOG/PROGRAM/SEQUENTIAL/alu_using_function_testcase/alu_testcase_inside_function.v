module tb;
real x,y,z;
reg [8*3:1] op;
initial begin
$value$plusargs("value_x=%f",x);
$value$plusargs("value_y=%f",y);
$value$plusargs("operation=%s",op);

$display ("x=%0f  y=%0f operation=%0s",x,y,op);
z=alu(x,y,op);
$display ("x=%0f  y=%0f the %s=%0f",x,y,op,z);

end

function reg [31:0] alu(input real a, input real b,input reg [8*3:1] operation);
begin
$display ("a=%0f  b=%0f operation=%0s",a,b,operation);
case (operation)
 "add": begin
	alu=a+b;
	$display ("a=%0f  b=%0f the sum=%0f",a,b,alu);
 end
 "sub" : begin
	alu=a-b;
	$display ("a=%0f  b=%0f the sub=%0f",a,b,alu);
 end
 "mul" : begin
	alu=a*b;
	$display ("a=%0d  b=%0d the mul=%0d",a,b,alu);
 end
 "div" : begin
	alu=a/b;
	$display ("a=%0d  b=%0d the div=%0d",a,b,alu);
 end
endcase
end
endfunction

endmodule
