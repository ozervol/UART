module transfer(in,sgn,out,come);
 
   input [7:0]in;
	input sgn;
	
	output [3:0]out;
	output  come;
	
	assign out=in%16;
	assign come=~sgn;

endmodule
