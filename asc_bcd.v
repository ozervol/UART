module asc_bcd
(
   input rst,
	input sgn,
	input [7:0]in,
	
   output reg [3:0]out,
	output reg come
);

	
always@(negedge sgn or negedge rst)
    begin
	     if(!rst)
		      begin
                out<=0;
					 come<=0;
				end
        else if(!sgn)
		      begin 
				  out<=in%16;
				  come<=1;
				end
		  else if (sgn)
		     begin
			     out<=out;
				  come<=0;
			  end
	 end

endmodule
