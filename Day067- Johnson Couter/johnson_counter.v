`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.12.2025 12:14:54
// Design Name: 
// Module Name: johnson_counter
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


module johnson_counter #(parameter N=4)(
input clk,reset,
output [N-1:0]Q
    );
    reg  [N-1:0] shift_reg;
    always @(posedge clk) begin
    if (reset)
    shift_reg <= 0;
    else 
    shift_reg <= {~shift_reg[N-1],shift_reg[N-1:1]};
    end
    assign Q = shift_reg;
endmodule
