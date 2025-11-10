`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2025 01:25:51
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
    input clk,
    input reset,    
    input J, K,
    output reg Q
    );

always @(posedge clk or posedge reset)
begin
    if (reset)
        Q <= 1'b0;
    else
        case ({J, K})
            2'b10 : Q <= 1'b1;  
            2'b01 : Q <= 1'b0;   
            2'b11 : Q <= ~Q;   
            2'b00 : Q <= Q;     
        endcase
end

endmodule

