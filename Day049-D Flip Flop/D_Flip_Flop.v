`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2025 17:31:19
// Design Name: 
// Module Name: D_Flip_Flop
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


module D_Flip_Flop(
input D,reset,clk,
output reg Q
 );
 
 always @(posedge clk or posedge reset)
 begin
 if(reset)
 Q <= 1'b0;
 else 
 Q <= D;
 end
endmodule
