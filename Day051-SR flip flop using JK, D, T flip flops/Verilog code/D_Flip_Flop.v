`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2025 23:42:05
// Design Name: 
// Module Name: D_Flip_Flop
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


module D_Flip_Flop(
D,clk,rst,Q

    );
    input D,clk,rst;
    output reg Q;
    
    always @(posedge clk)
    begin
    if (rst)
    Q <= 1'b0;
    
    else 
    Q <= D;
   
    end 
endmodule
