`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2025 20:35:51
// Design Name: 
// Module Name: Binary_to_2s_complement
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


module Binary_to_2s_complement(
input [7:0]Binaryin,
output [7:0]twos_comp
 );
 assign twos_comp=~Binaryin + 8'b00000001; 
endmodule
