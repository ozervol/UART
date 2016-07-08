`timescale 100ns / 1ps

module send_tb;

	// Inputs
	reg clk;
	reg rst;
	reg order;
	reg [7:0]data;

	// Outputs
	wire sgn;
	wire out;

	// Instantiate the Unit Under Test (UUT)
	send uut (
		.clk(clk),		 
		.rst(rst),  
		.order(order), 
		.data(data),
      .sgn(sgn),
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
	  order=0;
	  data=0;
	forever begin
     #400
     data= $random() %256;
     order=1;
     #100
     order=0;	  
	  end
	end
		
endmodule
