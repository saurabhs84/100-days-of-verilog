`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2025 22:39:36
// Design Name: 
// Module Name: T_Flip_Flop
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


module T_Flip_Flop(
input T,clk,rst,
output reg Q

    );
    
  always @(posedge clk)
   begin
    if (rst)
    begin
      Q=0;
    end
    else
    begin
    if(T)
      Q=~Q;
    else 
      Q=Q;
    end
    
   end
endmodule
