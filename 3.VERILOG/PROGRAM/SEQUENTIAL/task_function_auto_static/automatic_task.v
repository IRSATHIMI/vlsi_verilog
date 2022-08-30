module tb;
integer a=0;
integer i=0;

initial begin
display();
display();
display();
display();

autodis();
autodis();
autodis();
autodis();

end

task display();
begin
a=a+1;
$display("value of a=%0d",a);
end
endtask

task automatic autodis();
begin
i=i+1;
$display("autodis value of i=%0d",i);
end
endtask

endmodule
