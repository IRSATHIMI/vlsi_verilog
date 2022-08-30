module top;
//string name;//not supported in verilog 
reg [8*8:1] name;
//MSB -> 64
//LSB -> 1 
			


initial begin
name ="vlsiguru";
//8:1 -> u
//16:9 -> r
//24:17 -> u
// and so on
#50;
$display("name=%s",name);
//decial ->117
//hexadecimal -> 75
//octal ->165
//%s is a format specifier for display string in transcript
$display("name[8:1]=%s",name[8:1]);//u
$display("name[8:1]=%h",name[8:1]);//u
$display("name[8:1]=%d",name[8:1]);//u
$display("name[8:1]=%o",name[8:1]);//u
$display("name[24:17]=%s",name[24:17]);//u
name ="vlsiguruZ";
#50;
$display("name=%s",name);
end

endmodule
