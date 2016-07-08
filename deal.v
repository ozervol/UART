module deal
(
  input clk,
  input rst,
  input [3:0]data_a,
  input come,
  input [3:0]data_b,
  input [1:0]cs,
  input equal,
  
  output reg order,
  output reg[3:0]q3,
  output reg[3:0]q2,
  output reg[3:0]q1,
  output reg[3:0]q0
);

  reg [3:0]r_a;
  reg [3:0]r_b;
  reg [1:0]r_cs;
  reg [4:0]result;
  reg a;
  
always @(posedge clk or negedge rst)
  begin
    if(!rst)
	    begin
		   r_a<=0; r_b<=0; r_cs<=0;
		 end
	 else begin
		 	  {order,a}<={a,equal};
		 if (!come)
			begin
			  r_a<=0;
			  r_b<=0;
			  r_cs<=0;
			end
		 else if(!equal)
		   begin
			  r_a<=data_a;
			  if (cs!=0)
              begin 
				     r_b<=data_b;
					  r_cs<=cs;
				  end
			  else r_b<=0;
			end
		else
		   begin			
           case(r_cs)
	        1: begin 
	             result<=r_a+r_b;
		        end
	        2: begin
	             result<=r_a-r_b;
				  end
	        default:
	          begin
		         result<=result;
		       end
	       endcase
	     end
	  end
  end
  
always @(*)  begin
    q3<=r_a;
    q2<=r_b;
  if (!equal) 
    begin
      q1<=0;
      q0<=0;
	 end
  else 
    case(r_cs)
	 1:begin
	     q1<=result/10;
		  q0<=result%10;
		end
	 2:begin
	     if(result[4]==1)
		     begin q1<=14;q0<=14;end
		  else
	        begin 
	          q1<=result/10;
		       q0<=result%10;
           end	
      end
    endcase
end	 
  
 
  
endmodule	
		 
			


			
		 
  