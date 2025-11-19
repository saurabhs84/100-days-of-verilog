`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2025 16:25:39
// Design Name: 
// Module Name: pipo
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


module pipo(
input clk,reset,
input [2:0]parallel_in,
output reg [2:0] parallel_out
    );
    
    always @(posedge clk or posedge reset)
    begin
    if (reset)
    parallel_out <= 3'b000;
    else
    parallel_out <= parallel_in;
    end
endmodule
