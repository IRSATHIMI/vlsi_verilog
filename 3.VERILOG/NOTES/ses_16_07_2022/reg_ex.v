//module top;
//reg [3:0] addr;
//assign addr=10; //-> this statement is wrong . Q why?
//endmodule


module top;
reg [3:0] addr;
wire [3:0] addr_tmp;
assign addr_tmp=addr; 
initial begin
		addr=10;
end
endmodule

