`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.12.2025 16:27:12
// Design Name: 
// Module Name: freq_div_by4
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

module D_flip_flop (
input clk,reset,d,
output reg Q
);
always @(posedge clk) 
begin
if(reset)
Q <= 1'b0;
else
Q <= d;
end
endmodule
module freq_div_by4(
input clk,reset,
output clk_by4
    );
    wire clk_by2 ;
    
    D_flip_flop D1 (clk,reset,~clk_by4,clk_by2);
    D_flip_flop D2 (clk,reset,clk_by2,clk_by4);
endmodule
