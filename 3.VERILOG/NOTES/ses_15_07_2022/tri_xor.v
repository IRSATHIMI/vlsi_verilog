module tri_xor(a,b,dir,y);
input a,b,dir;
output tri y;


assign y = dir ? (a ^b) : 'bz; 

//conditonal operator
// out = <exp> ? true : false;
//out = (a == 10) ? 10 : 20;
//in testbench i will pass value of "a" as 10
//	out = 10
//in testbench i will pass value of "a" as 1
// out = 20
// conditonal operator and if -else statemnt both are same in operation
// only difference is we can use conditonal operation outside procedural blocks using assign key word
// were as if -else statement should be used inside procedural blocks
endmodule
