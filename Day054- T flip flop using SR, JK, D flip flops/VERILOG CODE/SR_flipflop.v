`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2025 20:41:44
// Design Name: 
// Module Name: SR_flipflop
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


module SR_flipflop(
input clk,rst,S,R,
output reg Q
    );
    
   always @(posedge clk or posedge rst)
   begin
   if (rst)
   Q <= 0;
   else  begin
   case ({S,R})
   2'b00 : Q <= Q;
   2'b01 : Q <= 1'b0;
   2'b10 : Q <= 1'b1;
   2'b11 : Q  <= 1'bx;
   endcase
   end
   
   end
endmodule
