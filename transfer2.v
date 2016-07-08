module transfer2(in,out);
input [3:0]in;
output reg [7:0]out;

always@(in)
  begin
      case(in)
        4'b0000: out<=8'b00110000;
        4'b0001: out<=8'b00110001;
        4'b0010: out<=8'b00110010;
        4'b0011: out<=8'b00110011;
        4'b0100: out<=8'b00110100;
        4'b0101: out<=8'b00110101;
        4'b0110: out<=8'b00110110;
        4'b0111: out<=8'b00110111;
        4'b1000: out<=8'b00111000;
        4'b1001: out<=8'b00111001;
        default:out<=8'b00100011;
      endcase
  end
endmodule
