`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2025 14:49:14
// Design Name: 
// Module Name: SR_latch
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


module SR_latch(
input S,R,en,rst,
output reg Q,Qbar
    );
    always @(*)
    begin
    if(rst)
    Q<=1'b0;
    else if (en)
    case ({S,R})
    2'b00: Q<=Q;
    2'b01: Q<=1'b0;
    2'b10: Q<=1'b1;
    default: Q<=1'bx;
    endcase
    Qbar=~Q;
    end
endmodule
