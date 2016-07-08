module shift(sig,in,rst,q0,q1,q2,q3);
output reg [3:0]q0;
output reg [3:0]q1;
output reg [3:0]q2;
output reg [3:0]q3;
input sig,rst;
input [3:0]in;

always@(posedge sig,negedge rst)
begin
 if(!rst)
  begin
   q0<=15;
   q1<=15;
   q2<=15;
   q3<=15;
  end
else begin
  q3<=in;
  q2<=q3;
  q1<=q2;
  q0<=q1;
  end
end
endmodule
