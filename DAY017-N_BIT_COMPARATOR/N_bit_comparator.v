`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2025 18:50:27
// Design Name: 
// Module Name: N_bit_comparator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module N_bit_comparator(a,b,greater,lesser,equal);
parameter N=8;
input [N-1:0]a,b;
output reg greater,lesser,equal;
always @(*)begin
if(a>b)begin
greater<=1'b1;
lesser<=1'b0;
equal<=1'b0;
end
else if(a<b)begin
greater<=1'b0;
lesser<=1'b1;
equal<=1'b0;
end
else begin
greater<=1'b0;
lesser<=1'b0;
equal<=1'b1;
end


end
endmodule
