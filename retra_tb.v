`timescale 100ns / 1ps

module retra_tb;

	// Inputs
	reg clk;
	reg rst;
	reg in;
	reg equal;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
  retra uut (
		.clk(clk),		 
		.rst(rst),  
		.in(in), 
      .equal(equal),
		.out(out)

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
	  in=1;equal=0;  
	  
	  #320   
	      in=0;
	  #32 in=1;
     #32 in=0;
     #32 in=0;
     #32 in=1;
     #32 in=1;
     #32 in=1;
     #32 in=0;
     #32 in=0;
     #32 in=1;
	  #32 in=0;
	  #32 in=0;
     #32 in=1;
     #32 in=1;
     #32 in=0;
     #32 in=1;
     #32 in=1;
     #32 in=0;
     #32 in=0;
     #32 in=1;	   
	  #32 in=0;
	  #32 in=0;
     #32 in=0;
     #32 in=1;
     #32 in=0;
     #32 in=1;
     #32 in=1;
     #32 in=0;
     #32 in=0;
     #32 in=1;	

     #160  equal=1;	  
	  
	  #3200  rst=0;equal=0;
	  #64 rst=1;  	 
	 
	  #320 
	      in=0;
	  #32 in=1;
     #32 in=0;
     #32 in=1;
     #32 in=0;
     #32 in=1;
     #32 in=1;
     #32 in=0;
     #32 in=0;
     #32 in=1;	    
	  
	  #160 equal=1;
	  
	  
	  end
	

		
endmodule
