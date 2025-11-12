`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2025 20:45:22
// Design Name: 
// Module Name: JK_flipflop
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


module JK_flipflop(
input clk,rst,J,K,
output reg Q
    );
    
    always @(posedge clk or posedge rst) begin
    if (rst)
    Q <= 0;
    
    else begin
    case ({J,K})
    2'b00: Q <= Q;
    2'b01: Q <= 1'b0;
    2'b01: Q <= 1'b1;
    2'b11: Q <= ~Q;
    endcase
    end
    end
endmodule
