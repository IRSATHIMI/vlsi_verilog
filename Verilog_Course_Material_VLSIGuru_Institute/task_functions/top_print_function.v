

module top;
integer b;
initial begin
	b = print(10);
end

//function print(input [3:0] a);   //if we don;t give any size, it take 1 bit size by default
function print(input integer a);   //if we don;t give any size, it take 1 bit size by default
begin
	$display("top :: print, a = %d", a);
	print = 10;
end
endfunction
endmodule

module sample;
endmodule
