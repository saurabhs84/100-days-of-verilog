`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2025 19:42:10
// Design Name: 
// Module Name: Data_Flow_level
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


module Data_Flow_level(
input a,b,output c_nota,c_notb,c_and,c_or,c_xor,c_nand,c_nor,c_xnor );
assign c_nota=~a;
assign c_notb=~b;
assign c_and=a&b;
assign c_or=a|b;
assign c_xor=a^b;
assign c_nand=~(a&b);
assign c_nor=~(a|b);
assign c_xnor=~(a^b);
endmodule
