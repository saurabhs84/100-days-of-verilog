`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2025 23:30:06
// Design Name: 
// Module Name: SR_using_JK_D_T
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


module SR_using_JK_D_T(
input S,R,clk,rst,
output  Q_JK,Q_D,Q_T
    );
    wire w1,w2,w3,w4,w5;
    
    JK_Flip_Flop jk (S,R,clk,rst,Q_JK);
    
    assign w1=~R | Q_D ;
    assign w2= S| w1;
    D_Flip_Flop Dff (w2,clk,rst,Q_D);
    
    assign w3= S & ~Q_T;
    assign w4= R & Q_T;
    assign w5= w3 | w4;
    T_Flip_Flop T (w5, clk, rst, Q_T);
endmodule
