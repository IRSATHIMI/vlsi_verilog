module tb;

reg [31:0] a,b,cout,cout1;

initial begin
	a=20;
	b=20;
	cout = multiply(a,b);
	if (cout[31]==1'b1) begin
		cout= ~cout;
		cout=cout+1'b1;
		$display("\tmultiply of a=%0d b=%0d is -%0d\n\n",a,b,cout);
		
	end
	else $display("\tmultiply of a=%0d b=%0d is %0d\n\n",a,b,cout);
	cout1 = multiply1(a,b);
	if (cout1[31]==1'b1) begin
		cout1= ~cout1;
		cout1=cout1+1'b1;
		$display("\tmultiply of a=%0d b=%0d is -%0d\n\n",a,b,cout1);
		
	end
	else $display("\tmultiply1 of a=%0d b=%0d is %0d\n\n",a,b,cout1);
end

function reg[31:0] multiply(input reg[31:0] p, input reg[31:0] q);
integer p_dash=0,iteration=0,ans=0,count=0;
begin
	while (q)
	begin
		p_dash=q%2;
		$display("before iteration=%0d ans=%0b p=%0b q=%0b q mod 2=%0b count=%0b",iteration,ans,p,q,p_dash,count);
		if(q % 2 == 1)
		//	p_dash =p<<count;
			ans = ans + (p<<count);
			count=count+1;
			q = q/2;  
		$display("after iteration=%0d ans=%0b p=%0b q=%0b q mod 2=%0b count=%0b",iteration,ans,p,q,p_dash,count);
		$display("after iteration=%0d ans=%0d p=%0d q=%0d q mod 2=%0d count=%0d\n",iteration,ans,p,q,p_dash,count);
		iteration=iteration+1;
	end
	multiply=ans;	
end
endfunction
function reg[31:0] multiply1(input reg[31:0] p, input reg[31:0] q);
integer iteration=0,ans=0,count=0;
begin
		$display("before iteration=%0d ans=%0b p=%0b q=%0b count=%0b",iteration,ans,p,q,count);
	while (q)
	begin
		count = q&1;
		if(q % 2 == 1) begin
			ans = ans +p;
		end
		p = p << 1;
		q = q >> 1;
		$display("after iteration=%0d ans=%0b p=%0b q=%0b count=%0b",iteration,ans,p,q,count);
		$display("after iteration=%0d ans=%0d p=%0d q=%0d count=%0d\n",iteration,ans,p,q,count);
		iteration=iteration+1;
	end
	multiply1=ans;	
end
endfunction

endmodule
