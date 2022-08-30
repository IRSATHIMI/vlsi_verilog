module tb;
integer a,i,j,prime_count,prime_no,prime_f;

initial begin
$value$plusargs("prime_no.=%d",a);
prime_count=0;

	$display("%d is the value of a",a);
	for(i=2;i<=a;i=i+1) begin
		prime_f=1;
		for(j=2;j<=i**0.5;j=j+1) begin
		//	$display("j=%d  i=%d",j,i);
			if((i % j)==0) begin
				prime_f=0;
				j=i;
			end	
		end
		if(prime_f==1) begin
			$display("%d is a prime No.",i);
			prime_count=prime_count+1;
		end
	end

	$display("%d is the no. of prime number.",prime_count);
end
endmodule
