module write2file();
reg [31:0] fd;
   initial begin
      fd = $fopen("my_txt");
      $display("Print this message to screen");
      $fdisplay("Print this message to my_txt file");
   end
endmodule
