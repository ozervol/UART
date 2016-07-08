`timescale 100ns / 1ps

module receive_tb;

	// Inputs
	reg clk;
	reg rst;
	reg in;

	// Outputs
	wire sgn;
	wire error;
	wire [7:0]data;

	// Instantiate the Unit Under Test (UUT)
	receive uut (
		.clk(clk),		 
		.rst(rst),  
		.in(in), 
      .sgn(sgn),
		.error(error),
		.data(data)
	);
	

	
  initial begin
	  rst=0;
	  #10 rst=1;
	end
	
	
  initial begin
     clk=0;
   forever
     #1 clk=~clk;
   end	
	
  initial begin
	  in=1;
	forever begin
	  #32 in=0;
	  #32 in=$random()%2;
     #32 in=$random()%2;
     #32 in=$random()%2;
     #32 in=$random()%2;
     #32 in=$random()%2;
     #32 in=$random()%2;
     #32 in=$random()%2;
     #32 in=$random()%2;
     #32 in=1;	    
	  end
	end
		
endmodule
