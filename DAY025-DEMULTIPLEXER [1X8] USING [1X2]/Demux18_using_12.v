`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2025 13:04:05
// Design Name: 
// Module Name: Demux18_using_12
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
module dmux21 (a,s,out1,out2);
input a,s;
output out1,out2;

assign {out1,out2}=s?{1'b0,a}:{a,1'b0};

endmodule

module Demux18_using_12(
input i,
input [2:0]sel,
output [7:0]y
);
wire [0:5]w;

dmux21 d1 (i,sel[2],w[0],w[1]);
dmux21 d2 (w[0],sel[1],w[2],w[3]);
dmux21 d3 (w[1],sel[1],w[4],w[5]);
dmux21 d4 (w[2],sel[0],y[0],y[1]);
dmux21 d5 (w[3],sel[0],y[2],y[3]);
dmux21 d6 (w[4],sel[0],y[4],y[5]);
dmux21 d7 (w[5],sel[0],y[6],y[7]);

endmodule
