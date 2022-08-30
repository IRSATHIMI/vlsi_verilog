module sample;
   task print();
   endtask

   assign a = print(); //WRONG

   initial beign
	   print(); 
	   a = print(); //not allowed
   end
endmodule
