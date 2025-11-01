`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2025 18:49:45
// Design Name: 
// Module Name: vedic_multiplier_4x4_using_2x2
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
module HA(sum,carry,in1,in2);
input in1,in2;
output sum,carry;
assign sum= in1 ^ in2;
assign carry = in1 & in2;
endmodule

module vedic_2x2 (A,B,out);
input [1:0]A,B;
output [3:0]out;
wire [3:0]s;
and a1 (out[0],A[0],B[0]);
and a2 (s[0],A[0],B[1]);
and a3 (s[1],A[1],B[0]);
HA h1 (out[1],s[2],s[0],s[1]);
and a4 (s[3],A[1],B[1]);
HA h2 (out[2],out[3],s[2],s[3]);
endmodule

module vedic_multiplier_4x4_using_2x2(
input [3:0]A,B,
output [7:0]product
);
wire [3:0] P0,P1,P2,P3;
wire [5:0] temp1;
wire [7:0]temp2;

wire [1:0]A0=A[1:0];
wire [1:0]A1=A[3:2];
wire [1:0]B0=B[1:0];
wire [1:0]B1=B[3:2];

vedic_2x2 v1 (A0,B0,P0);
vedic_2x2 v2 (A1,B0,P1);
vedic_2x2 v3 (A0,B1,P2);
vedic_2x2 v4 (A1,B1,P3);

assign temp1={2'b00,P1}+{2'b00,P2};
assign temp2={P3,4'b0000}+{temp1,2'b00};
assign product={4'b0000,P0}+temp2;


endmodule
