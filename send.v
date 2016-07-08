module send
(
  input clk,
  input rst,
  input order,
  input [7:0]data,
  
  output out,
  output sgn
);

  reg r_buf,r_rising;
  reg [4:0]div_cnt;  //分频计数器
  reg div_clk;  //分频时钟
 
  reg [1:0]state,state0;  
  reg [4:0]shift_cnt;
  reg [9:0]shift;
  
  reg [7:0]r_data;
  reg r_error;

  assign out=shift[0];
  assign sgn=(state==0)?0:1;
  
always @ (posedge clk or negedge rst)  //16分频
   begin
    if(!rst)
	   begin
	     div_cnt<=0;
		  div_clk<=0;
		end
	 else
	   begin
		  div_cnt<=div_cnt+1;
		  div_clk<=div_cnt[3];  
		end
  end
 
 always @ (posedge div_clk or negedge rst) //捕捉发送数据的上升沿
  begin
    if(!rst)
	   begin
	     r_buf<=0;
		  r_rising<=0;
		end
	 else
	   begin
		  r_buf<=order;
		  r_rising=order&(~r_buf); //order上升沿来了则r_rising为1
		end
  end

always @ (posedge div_clk or negedge rst)
  begin
    if (!rst)
       state<=0;
	 else state<=state0;	
  end

always @ (*)
  begin
    case(state)
	   0: if (r_rising)   //order上升沿来了，转至状态1开始发送数据，否则停在原状态
	           state0<=1;
			   else 
			     state0<=0;
		1: if (shift_cnt==9)  //数据发送完毕，返回状态0
			  state0<=0;
			else 
			  state0<=1;  //发送数据
		default:state0<=0;
	 endcase
  end

always @ (posedge div_clk or negedge rst)
  begin 
    if (!rst)
	   begin
		  shift<=10'b1111111111;
		  shift_cnt<=0;
		end
    else
	   begin
		  if(state==0&&r_rising==1)    //确定要发送的数据
		    begin
			   shift_cnt<=0;
				shift<={1'b1,data,1'b0};
			 end
		  else if (state==1)
		    begin
			   shift_cnt<=shift_cnt+1;
				shift<={1'b1,shift[9:1]};  //通过移位改变发送的数据
			 end
		  else
		    begin
			   shift<=10'b1111111111;
		      shift_cnt<=0;
			 end
		end
	end
	
endmodule
				