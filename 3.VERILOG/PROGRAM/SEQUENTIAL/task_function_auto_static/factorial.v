module tb;
integer a=5,b,c;

initial begin
b=factorial(a);
c=fact(a);
$display("factorial of %0d is %0d",a,b);
end
// both the automatic function and static function give me the same output as factorial of(5) is 120
function automatic integer factorial(input integer a);
begin
 if (a>1) begin 
 factorial= a*factorial(a-1);
 $display("value of a=%d auto fact=%d",a,factorial);
 end
 else begin 
	factorial=1;
 	$display("a=%d aut0 fact=%d",a,factorial);
	end
end
endfunction

function integer fact(input integer a);
begin
 if (a>1) begin 
 fact= a*fact(a-1);
 $display("value of a=%d staic_fact=%d",a,fact);
 end
 else begin 
	fact=1;
 	$display("a=%d staic_fact=%d",a,fact);
end
end
endfunction
endmodule
