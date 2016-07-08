module receive
(
  input clk,
  input rst,
  input in,
  output [7:0]data,
  output error,
  output sgn
);
  
  reg r_buf,r_falling;
  reg [3:0]sample_cnt;  //采样计数器
 
  reg [1:0]state,state0;  
  reg [3:0]shift_cnt;
  reg [9:0]shift;
  
  reg [7:0]r_data;
  reg r_error;

  assign data=r_data;
  assign sgn=(state==0)?0:1;
  assign error=r_error;

always @ (posedge clk or negedge rst) //捕捉输入数据的下降沿
  begin
    if(!rst)
	   begin
	     r_buf<=0;
		  r_falling<=0;
		end
	 else
	   begin
		  r_buf<=in;
		  r_falling<=~in&(r_buf); //in下降沿来了则r_falling为1
		end
  end

always @ (posedge clk or negedge rst)
  begin
    if (!rst)
       state<=0;
	 else state<=state0;	
  end

always @ (*)
  begin
    case(state)
	   0: if (r_falling)   //in下降沿来了，转至状态1，否则停在原状态
	           state0<=1;
			   else 
			     state0<=0;
		1: if (shift_cnt==10)  //状态1存10位数据
			  state0<=2;
			else 
			  state0<=1;
		2: state0<=0;  //数据处理，回到状态0
		default:state0<=0;
	 endcase
  end

always @ (posedge clk or negedge rst)
  begin 
    if (!rst)
	   begin
		  shift<=10'b1111111111;
		  shift_cnt<=0;
		  sample_cnt<=0;
		  r_data<=0;
		  r_error<=0;
		end
    else
	   begin
		  if (state0==1)
          if (sample_cnt==8)
			   begin
				  shift_cnt<=shift_cnt+1;   //计到10状态就跳转
				  shift<={in,shift[9:1]};  //移位寄存
				  sample_cnt<=sample_cnt+1;  //计满16次才跳到下一次
				end
			 else sample_cnt<=sample_cnt+1;
		  
		  else if (state0==2)
			 begin
			   shift_cnt<=0;
				shift<=10'b1111111111;
				r_data<=shift[8:1];  //输出为8：1
				if (shift[9]==0)  //停止位为0，报错
				  r_error<=1;
				else
				  r_error<=0;
				shift_cnt<=0;
				sample_cnt<=0;
			 end
		  
		  else
		    begin
			   shift<=10'b1111111111;
				shift_cnt<=0;
				sample_cnt<=0;
          end
      end
  end		  
				
endmodule
