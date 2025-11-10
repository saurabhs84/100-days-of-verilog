`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2025 01:25:15
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
input clk,reset,S,R,
output reg Q
    );
    
    always @(posedge clk or posedge reset) 
    begin
    if (reset)
    Q <= 1'b0;
    else 
    case ({S,R})
    2'b00: Q <= Q;
    2'b01: Q <= 0;
    2'b10: Q <= 1;
    2'b11: Q <= 1'bx;
    endcase
    end
endmodule
