`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2025 23:46:02
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


module T_Flip_Flop(
T,clk,rst,Q
    );
    input T,clk,rst;
    output reg Q;
    
    always @(posedge clk)
    begin
    if (rst)
    Q <= 0;
    
    else begin
    if (T)
       Q <= ~Q;
       
       else 
        Q <= Q;
       
    end
    
    end
    
 
endmodule
