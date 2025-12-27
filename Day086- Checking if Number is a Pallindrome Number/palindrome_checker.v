`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2025 14:45:04
// Design Name: 
// Module Name: palindrome_checker
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

module palindrome_checker (
    input  [15:0] number,
    input         mode,        
    output reg    is_palindrome
);

integer i;
reg bin_pal;
reg dec_pal;
always @(*) begin
    bin_pal = 1'b1;
    for (i = 0; i < 8; i = i + 1) begin
        if (number[i] != number[15 - i])
            bin_pal = 1'b0;
    end
end

reg [3:0] d0, d1, d2, d3, d4;

always @(*) begin
    d0 = number % 10;
    d1 = (number / 10)    % 10;
    d2 = (number / 100)   % 10;
    d3 = (number / 1000)  % 10;
    d4 = (number / 10000) % 10;

    if ((d0 == d4) && (d1 == d3))
        dec_pal = 1'b1;
    else
        dec_pal = 1'b0;
end

always @(*) begin
    case (mode)
        1'b0: is_palindrome = bin_pal;
        1'b1: is_palindrome = dec_pal;
        default: is_palindrome = 1'b0;
    endcase
end

endmodule
