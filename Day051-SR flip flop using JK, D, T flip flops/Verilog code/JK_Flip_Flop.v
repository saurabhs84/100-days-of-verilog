`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2025 23:37:25
// Design Name: 
// Module Name: JK_Flip_Flop
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


module JK_Flip_Flop(
J,K,clk,rst,Q
    );
    input J,K,clk,rst;
    output reg Q;
    
    always @(posedge clk) begin
    if (rst)
    Q <= 1'b0;
    
    else 
    begin
    case ({J,K})
    2'b00 : Q = Q;
    2'b01 : Q = 0;
    2'b10 : Q = 1;
    2'b11 : Q = ~Q;
    endcase
    end
    end
endmodule
