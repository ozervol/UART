module seg2(CLK_seg,q3,q2,q1,q0,data_out,seg_sel);
  input CLK_seg;
  input [3:0]q3;
  input [3:0]q2;
  input [3:0]q1;
  input [3:0]q0;
  output reg [7:0]data_out;
  output reg [3:0]seg_sel;
 
  reg [1:0]state;
  reg [3:0]q=15;

always@(posedge CLK_seg)
      begin
		      case(state)
				0:state<=1;
				1:state<=2;
				2:state<=3;
				3:state<=0;
				endcase
		end

always@(state)
    begin
	     case(state)
		  0:begin seg_sel<=8; q<=q3; end
		  1:begin seg_sel<=4; q<=q2; end
		  2:begin seg_sel<=2; q<=q1; end
		  3:begin seg_sel<=1; q<=q0; end
		  endcase
	 end 
	 
always@(q)
    begin
		      case(q)
				    0:data_out<=8'b11000000;
					 1:data_out<=8'b11111001;
					 2:data_out<=8'b10100100;
					 3:data_out<=8'b10110000;
					 4:data_out<=8'b10011001;
					 5:data_out<=8'b10010010;
					 6:data_out<=8'b10000010;
					 7:data_out<=8'b11111000;
					 8:data_out<=8'b10000000;
					 9:data_out<=8'b10010000;
					 default:data_out<=8'b11111111;
				endcase
    end

	 
	 
endmodule
