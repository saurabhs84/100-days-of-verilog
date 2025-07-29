`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2025 19:14:41
// Design Name: 
// Module Name: behavioural_tb
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


module behavioural_tb;
reg a,b;
wire c_nota,c_notb,c_or,c_and,c_xor,c_nand,c_nor,c_xnor;

Behavioural uut(.a(a),.b(b),.c_nota(c_nota),.c_notb(c_notb),.c_and(c_and),.c_or(c_or),.c_xor(c_xor),.c_nand(c_nand),.c_nor(c_nor),.c_xnor(c_xnor) );
initial begin
a=0;b=0;#2
a=0;b=1;#2
a=1;b=0;#2
a=1;b=1;#2
$finish();


end
endmodule
