`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2025 19:44:52
// Design Name: 
// Module Name: Binary_to_Gray
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


module Binary_to_Gray(
input  [3:0] bin,
output [3:0] Gout );
assign Gout[3]=bin[3];
assign Gout[2]=bin[2] ^ bin[3];
assign Gout[1]=bin[1] ^ bin[2];
assign Gout[0]=bin[1] ^ bin[0];
endmodule
