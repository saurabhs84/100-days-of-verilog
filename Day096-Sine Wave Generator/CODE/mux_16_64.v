`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2026 02:25:34
// Design Name: 
// Module Name: mux_16_64
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

module mux_16_64(
    output [15:0] o,
    input  [15:0] i1,i2,i3,i4,i5,i6,i7,i8,
    input  [15:0] i9,i10,i11,i12,i13,i14,i15,i16,
    input  [15:0] i17,i18,i19,i20,i21,i22,i23,i24,
    input  [15:0] i25,i26,i27,i28,i29,i30,i31,i32,
    input  [15:0] i33,i34,i35,i36,i37,i38,i39,i40,
    input  [15:0] i41,i42,i43,i44,i45,i46,i47,i48,
    input  [15:0] i49,i50,i51,i52,i53,i54,i55,i56,
    input  [15:0] i57,i58,i59,i60,i61,i62,i63,i64,
    input  [5:0] s
);
    wire [15:0] y1,y2,y3,y4,y5,y6,y7,y8;

    mux_16_8 mux8_1(y1, i1,i2,i3,i4,i5,i6,i7,i8, s[2:0]);
    mux_16_8 mux8_2(y2, i9,i10,i11,i12,i13,i14,i15,i16, s[2:0]);
    mux_16_8 mux8_3(y3, i17,i18,i19,i20,i21,i22,i23,i24, s[2:0]);
    mux_16_8 mux8_4(y4, i25,i26,i27,i28,i29,i30,i31,i32, s[2:0]);
    mux_16_8 mux8_5(y5, i33,i34,i35,i36,i37,i38,i39,i40, s[2:0]);
    mux_16_8 mux8_6(y6, i41,i42,i43,i44,i45,i46,i47,i48, s[2:0]);
    mux_16_8 mux8_7(y7, i49,i50,i51,i52,i53,i54,i55,i56, s[2:0]);
    mux_16_8 mux8_8(y8, i57,i58,i59,i60,i61,i62,i63,i64, s[2:0]);

    mux_16_8 mux8_final(o, y1,y2,y3,y4,y5,y6,y7,y8, s[5:3]);
endmodule

