`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2025 09:41:42
// Design Name: 
// Module Name: n_bit_square
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

module n_bit_square(num, result);
    parameter n=4;
    input [n-1:0] num;
    output reg [2*n-1:0] result;
    reg [2*n-1:0] tmp;
    
    always @(*) begin
        tmp = num * num;
        result = tmp;
    end
endmodule
