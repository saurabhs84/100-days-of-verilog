`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2026 02:27:18
// Design Name: 
// Module Name: mux_16_8
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

module mux_16_8(
    output [15:0] o,
    input  [15:0] i1,i2,i3,i4,i5,i6,i7,i8,
    input  [2:0] s
);
    wire [15:0] x1, x2, x3, x4;
    wire [15:0] y1, y2;

    mux_16 mux_16_1(x1, i1, i2, s[0]);
    mux_16 mux_16_2(x2, i3, i4, s[0]);
    mux_16 mux_16_3(x3, i5, i6, s[0]);
    mux_16 mux_16_4(x4, i7, i8, s[0]);

    mux_16 mux_16_5(y1, x1, x2, s[1]);
    mux_16 mux_16_6(y2, x3, x4, s[1]);

    mux_16 mux_16_7(o, y1, y2, s[2]);
endmodule
