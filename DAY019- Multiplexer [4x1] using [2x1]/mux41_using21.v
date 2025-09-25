`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2025 19:48:37
// Design Name: 
// Module Name: mux41_using21
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


module mux41_using21(
input [3:0]I,
input [1:0]sel,
output y
    );
    wire [1:0]w;
    mux2_1 m1 (w[0],I[0],I[1],sel[0]);
    mux2_1 m2 (w[1],I[2],I[3],sel[0]);
    mux2_1 m3 (y,w[0],w[1],sel[1]);
endmodule

module mux2_1 (out,in1,in2,sel);
input in1,in2,sel;
output out;
assign out=sel?in2:in1;
endmodule
