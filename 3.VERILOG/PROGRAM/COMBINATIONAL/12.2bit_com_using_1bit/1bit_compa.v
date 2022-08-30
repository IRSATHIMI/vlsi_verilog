module onebitcomp(a,b,g,e,l);
input a,b;
output g,e,l;

and g1(l,(~a),b);
and l1(g,a,(~b));
nor e1(e,g,l);

endmodule

