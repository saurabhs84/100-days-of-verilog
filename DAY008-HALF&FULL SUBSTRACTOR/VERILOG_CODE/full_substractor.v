`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2025 20:00:02
// Design Name: 
// Module Name: full_substractor
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


module full_substractor(
input a,b,bin,
output diff,bout
);
assign diff=a^b^bin;
assign bout=(~a&b)|(~a&bin)|(b&bin);
endmodule
