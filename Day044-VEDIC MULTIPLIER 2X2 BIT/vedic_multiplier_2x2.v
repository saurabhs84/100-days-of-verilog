`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2025 19:13:55
// Design Name: 
// Module Name: vedic_multiplier_2x2
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


module vedic_multiplier_2x2(
input [1:0]A,B,
output [3:0]out
);
wire [3:0]s;
and a1 (out[0],A[0],B[0]);
and a2(s[0],A[1],B[0]);
and a3(s[1],A[0],B[1]);
HA h1(out[1],s[2],s[1],s[0]);
and a4 (s[3],A[1],B[1]);
HA h2 (out[2],out[3],s[2],s[3]);
endmodule

module HA (sum,carry,a,b);
input a,b;
output sum,carry;

assign sum=a^b;
assign carry= a&b;

endmodule
