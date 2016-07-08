module prepare(in,rst,signal,num,cs,equal);

input[3:0] in;
input signal,rst;
output reg[3:0]num;
output reg[1:0]cs;
output reg equal;

always@(posedge signal or negedge rst)
    begin
	     if(!rst)
		      begin
                num<=0;
					 cs<=0;
					 equal<=0;
				end
		  else if(signal==1)
		      case(in)
				    0:begin num<=in; end
					 1:begin num<=in; end
					 2:begin num<=in; end
					 3:begin num<=in; end
					 4:begin num<=in; end
					 5:begin num<=in; end
					 6:begin num<=in; end
					 7:begin num<=in; end
					 8:begin num<=in; end
					 9:begin num<=in; end
					 10:begin cs<=1; end
					 11:begin cs<=2; end
					 12:begin num<=0;cs<=0; end
					 13:begin equal<=1; end
					 default: begin  num<=num;cs<=cs; end
            endcase
    end
	 
endmodule
