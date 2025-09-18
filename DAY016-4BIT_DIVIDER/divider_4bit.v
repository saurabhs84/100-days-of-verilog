`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2025 17:19:18
// Design Name: 
// Module Name: divider_4bit
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


`timescale 1ns / 1ps

module divider_4bit(
    input [3:0]dividend,divisor,
    output reg [3:0]quotient,remainder);

    always@(dividend,divisor)
        begin
        quotient = 0;
        remainder= dividend;
            while(remainder>=divisor)
            begin	
                remainder = remainder - divisor;
                quotient = quotient + 1;
            end
        end
endmodule
