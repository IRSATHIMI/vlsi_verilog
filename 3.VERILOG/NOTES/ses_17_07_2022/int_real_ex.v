module top;
integer a;
real r;

		initial begin
			$display("r=%0f",r);//0.0
			$display("a=%0d",a);//x
			r= 3.142;
			a=10;
			$display("r=%0f",r);//3.142
			$display("a=%0d",a);//10
			r= 3.142;
			a=10.110;
			$display("r=%0f",r);//3.142
			$display("a=%0d",a);//10
			r= 3;
			a=10;
			$display("r=%0f",r);//3.142
			$display("a=%0d",a);//10
		end

endmodule

