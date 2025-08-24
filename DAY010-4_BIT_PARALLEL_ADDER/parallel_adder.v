`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.08.2025 20:42:09
// Design Name: 
// Module Name: parallel_adder
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


module parallel_adder(sum,cout,a,b,cin);
input a,b,cin;
output sum,cout;

    assign sum = a^b^cin;
    assign cout = (a&b) | (b&cin) | (a&cin);
    
endmodule

module full_adder(s,co,x,y,zin);
input [3:0]x,y;
input zin;
output [3:0]s;
output co;
wire [2:0]c;
parallel_adder pa1(s[0],c[0],x[0],y[0],zin);
parallel_adder pa2(s[1],c[1],x[1],y[1],c[0]);
parallel_adder pa3(s[2],c[2],x[2],y[2],c[1]);
parallel_adder pa4(s[3],co,x[3],y[3],c[2]);

endmodule
