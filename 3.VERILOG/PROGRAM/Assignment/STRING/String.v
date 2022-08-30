module top;
reg[8*8:1] name;

initial begin
name ="irsathimi";
#50;
$display("name=%s",name);
end 

endmodule
