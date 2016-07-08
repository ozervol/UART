module together
(
  input clk,
  input rst,
  input equal,
  input [3:0]in,
  input come,

  output reg order,
  output reg[3:0]out
);

  parameter N=6; //存N+1个数

  parameter M=4;
  parameter T=2**M;

  
  reg [3:0]ram[T-1:0];  
  reg [T-1:0]read_ptr,write_ptr;
  
  integer K;
  
always @( posedge come or negedge rst)
  begin
    if (!rst)
	   begin
		  write_ptr<=0;
		  for (K=0;K<N+1;K=K+1)
		     begin 
			    ram[K]=15;
			  end
		end
	 else
	   begin
		  ram[write_ptr]=in;
        write_ptr=(write_ptr==N)?0:write_ptr+1;
		end
  end
  
always @(posedge clk  or negedge rst)
  begin
    if (!rst)
	   begin
		  read_ptr<=0;
		  out<=15;
		end
	 else if (equal==1)
	   begin
		  out=ram[read_ptr];
        read_ptr=(read_ptr==N)?0:read_ptr+1;
		end
	 else 
	   begin
		  out<=out;
		  read_ptr<=read_ptr;
	   end
	end

always @	(clk)
	begin 
	  if (clk==1&&equal==1)
	    order<=1;
	  else if (clk==0&&equal==1)
	    order=0;
	  else if (equal==0)
	    order<=0;	 
	end

	
endmodule
	      
		  
	   
		  