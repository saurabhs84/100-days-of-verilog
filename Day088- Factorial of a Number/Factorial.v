`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.12.2025 16:52:33
// Design Name: 
// Module Name: Factorial
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

module Factorial #(
    parameter N = 4,          
    parameter OUT_W = 32      
)
(
    input  [N-1:0] number,
    output reg [OUT_W-1:0] factorial
);
    integer i;
    always @(*) begin
    factorial =1;
    if ( number == 0 || number ==1)
        factorial=1;
    else
    begin
    for (i=2;i < number +1;i=i+1) begin
    factorial= factorial * i;
    end
    
    end
    end
endmodule
