`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2025 20:35:23
// Design Name: 
// Module Name: T_Flip_Flop_using_SR_JK_D
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


module T_Flip_Flop_using_SR_JK_D(
input clk,rst,T,
output Q_SR,Q_JK,Q_D

    );
    wire w1,w2,w3;
    assign w1=T & (~Q_SR);
    assign w2=T & (Q_SR);
    SR_flipflop sr (clk,rst,w1,w2,Q_SR);
    
    JK_flipflop jk (clk,rst,T,T,Q_JK);
    
    assign w3= T ^ Q_D;
    
    D_flipflop d (clk,rst,w3,Q_D);
endmodule
