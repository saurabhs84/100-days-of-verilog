`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2025 14:46:34
// Design Name: 
// Module Name: even_or_odd
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


module even_or_odd(
input [3:0]number,
output reg even_odd
    );
    
    parameter EVEN=1'b1;
    parameter ODD=1'b0;
    
    always @(*) begin
    if (number[0] == 0)
    even_odd = EVEN;
    else
    even_odd = ODD ;
    end
endmodule
