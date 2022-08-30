module dff (d0,d1,sel,rst,clk,q);

  input d0,d1,sel,rst,clk;
  output q;
  
  reg q,d;
  
  always @ (d0 or d1 or sel)
    begin
     case(sel)
            0 : d = d0;
            1 : d = d1;
      default : d = 1'bx;
     endcase
    end
    
  always @ (posedge clk)
    begin
      if (rst)       
         q <= 1'b0;    
      else
         q <= d;         
    end 
    
endmodule

            
             
