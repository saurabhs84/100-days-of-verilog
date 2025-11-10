`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2025 01:26:18
// Design Name: 
// Module Name: T_flipflop
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

module T_flipflop(
    input clk,
    input reset,     
    input T,
    output reg Q
    );

always @(posedge clk or posedge reset)
begin
    if (reset)
        Q <= 1'b0;
    else if (T)
        Q <= ~Q;    
    else
        Q <= Q;       
end

endmodule

