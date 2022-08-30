module mux2_1 (a,
               b,
               sel,
               y);
 
       input  a,
              b,
              sel;
       output y;

assign y = (~sel&a)|(sel&b);

endmodule 
