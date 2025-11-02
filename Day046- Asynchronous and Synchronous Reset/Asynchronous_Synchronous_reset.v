`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2025 11:18:49
// Design Name: 
// Module Name: Asynchronous_Synchronous_reset
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


module Asynchronous_Synchronous_reset(
input clk,rst,in,
output reg out_sync,out_async
 );
 // Synchronous reset
 always @(posedge clk)
 begin
 if(rst)
 out_sync <= 1'b0;
  else 
 out_sync <= in;
 end
 
 //asynchronous reset
 
 always @(posedge clk or posedge rst) 
 begin
 if (rst)
 out_async <= 1'b0;
 else 
 out_async <= in;
 end
endmodule
