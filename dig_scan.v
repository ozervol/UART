module dig_scan(clk,st);

input clk;
output reg[3:0]st; 
reg[1:0]state;

always@(posedge clk)
    begin 
	     case(state)
		      0:state<=1;
				1:state<=2;
				2:state<=3;
				3:state<=0;
				//状态机的状态循环
		  endcase
	 end
	 
always@(state)
    begin
	     case(state)
		      0:st<=4'b0001;
				1:st<=4'b0010;
				2:st<=4'b0100;
				3:st<=4'b1000;
		  endcase
    end
	 
endmodule
