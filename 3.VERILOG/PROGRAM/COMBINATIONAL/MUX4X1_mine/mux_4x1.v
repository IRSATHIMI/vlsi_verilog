module mux_4x1(i0,i1,i2,i3,s,e,y);
input i0,i1,i2,i3;
input [1:0] s;
input e;
output y;

if (e==1'b1) begin 
	
y = s == 2'b11 ? i3 : s == 2'b10 ? i2 : s == 2'b01 ? i1 : i0;
	
else  y=1'b0;
end	
endmodule

