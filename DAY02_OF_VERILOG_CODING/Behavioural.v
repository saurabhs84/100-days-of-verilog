`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2025 17:51:42
// Design Name: 
// Module Name: Behavioural
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


module Behavioural(input a,b,output reg c_nota,c_notb,c_and,c_or,c_xor,c_nand,c_nor,c_xnor);
always @(*) begin
c_nota=~a;
c_notb=~b;
c_and=(a&b);
c_or=(a|b);
c_xor=a^b;
c_nand=~(a&b);
c_nor=~(a|b);
c_xnor=~(a^b);
end
endmodule
