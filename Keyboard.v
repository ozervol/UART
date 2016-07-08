module Keyboard
(
	input clk,
	input rst,
	input [3:0]V,
   input [3:0]H,

	output reg [3:0]num,
	output reg signal
);	
	reg [15:0]count=0;   //count变量作为计数变量实现键盘防抖功能
	reg [4:0]p;
	
always @(posedge clk or negedge rst)
	begin
	if(!rst)
   	begin
		count=0;
		p=0;
		signal=0;
		end
   else
	   begin
		if(V!=4'b0000)
   		begin
			count=0;
			//通过p的值来计算按键位置
			p=(V[3]*0+V[2]*4+V[1]*8+V[0]*12)+(H[3]*1+H[2]*2+H[1]*3+H[0]*4); 
			end
		else
	      begin
			//键盘防抖模块，抽样20个clk周期				
			if(count==20)   
		      begin
				p=0;
			   signal=0;
				end
			else
	   		begin
			   count=count+1;
				end
			end
			
		case(p)
			1: begin   num=1; signal=1;   end
			2: begin   num=2; signal=1;   end
			3: begin   num=3; signal=1;   end
			4: begin   num=4; signal=1;   end
			5: begin   num=5; signal=1;   end
			6: begin   num=6; signal=1;   end
			7: begin   num=7; signal=1;   end
			8: begin   num=8; signal=1;   end
			9: begin   num=9; signal=1;   end
			10:begin   num=0; signal=1;   end
			11:begin   num=10;signal=1;   end
			12:begin   num=11;signal=1;   end
			15:begin   num=12;signal=1;   end
			16:begin   num=13;signal=1;   end
	      default: 
			   begin   num=0; signal=0;   end			
		   endcase
		end
   end
endmodule
	