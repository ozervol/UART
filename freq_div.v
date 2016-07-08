module freq_div
(
    input clk_in,
	 output reg clk_out0,
    output reg clk_out1
);

    reg [16:0]count1;
	 reg [16:0]count2;


	 parameter CLK_FREQ=25000000;
    localparam N1=CLK_FREQ/250;
    localparam N2=CLK_FREQ/153600;

always@(posedge clk_in)
	begin
			if(count1==N1/2)
				begin 
				    count1<=0;
					 clk_out0<=~clk_out0;
				end
			else 	count1<=count1+1;
			
			if(count2==N2/2)
				begin 
				    count2<=0;
					 clk_out1<=~clk_out1;
				end
			else 	count2<=count2+1;
			
	end	
	
endmodule
