module vibrate(clk,rst,signal_in,signal_out);
   input clk,rst,signal_in;
	output reg signal_out=0;
	
	reg [7:0]count;
	parameter N=3;
	
always @(posedge clk or negedge rst)
   begin
	if(!rst)
	   begin
		count=0;
		signal_out=0;
		end
	else
	   begin
		if(signal_in!=signal_out)
		   begin
			if(count==N)
			   begin
				signal_out=signal_in;
				count=0;
				end
			else
			   begin
				count=count+1;
				end
			end
		else
		   begin
			count=0;
			end
		end
	end
endmodule
