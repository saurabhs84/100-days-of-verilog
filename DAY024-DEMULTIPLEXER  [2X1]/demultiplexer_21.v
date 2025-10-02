`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2025 19:24:03
// Design Name: 
// Module Name: demultiplexer_21
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


module demultiplexer_21(
input i,sel,
output [1:0]y   
);

assign {y[1],y[0]}=sel?{i,1'b0}:{1'b0 ,i} ;
endmodule
