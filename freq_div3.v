module freq_div3
(
    input clk_in,
	 output reg clk_out
);

    reg [16:0]count1;

	 parameter CLK_FREQ=153600;
    localparam N1=CLK_FREQ/768;

always@(posedge clk_in)
	begin
			if(count1==N1/2)
				begin 
				    count1<=0;
					 clk_out<=~clk_out;
				end
			else 	count1<=count1+1;
			
	end	
	
endmodule
