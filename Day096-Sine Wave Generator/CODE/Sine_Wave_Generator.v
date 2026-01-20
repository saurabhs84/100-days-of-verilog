`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2026 02:24:11
// Design Name: 
// Module Name: Sine_Wave_Generator
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

module Sine_Wave_Generator(
    input  [5:0] t,           // 6-bit input for 64 LUT values
    output [15:0] o
);

    reg [15:0] lut [0:63];

    integer i;
    initial begin
        lut[0]  = 1000;  lut[1]  = 1098; lut[2]  = 1195; lut[3]  = 1290;
        lut[4]  = 1383;  lut[5]  = 1471; lut[6]  = 1556; lut[7]  = 1634;
        lut[8]  = 1707;  lut[9]  = 1773; lut[10] = 1831; lut[11] = 1882;
        lut[12] = 1924;  lut[13] = 1957; lut[14] = 1981; lut[15] = 1995;
        lut[16] = 2000;  lut[17] = 1995; lut[18] = 1981; lut[19] = 1957;
        lut[20] = 1924;  lut[21] = 1882; lut[22] = 1831; lut[23] = 1773;
        lut[24] = 1707;  lut[25] = 1634; lut[26] = 1556; lut[27] = 1471;
        lut[28] = 1383;  lut[29] = 1290; lut[30] = 1195; lut[31] = 1098;
        lut[32] = 1000;  lut[33] = 902;  lut[34] = 805;  lut[35] = 710;
        lut[36] = 617;   lut[37] = 529;  lut[38] = 444;  lut[39] = 366;
        lut[40] = 293;   lut[41] = 227;  lut[42] = 169;  lut[43] = 118;
        lut[44] = 76;    lut[45] = 43;   lut[46] = 19;   lut[47] = 5;
        lut[48] = 0;     lut[49] = 5;    lut[50] = 19;   lut[51] = 43;
        lut[52] = 76;    lut[53] = 118;  lut[54] = 169;  lut[55] = 227;
        lut[56] = 293;   lut[57] = 366;  lut[58] = 444;  lut[59] = 529;
        lut[60] = 617;   lut[61] = 710;  lut[62] = 805;  lut[63] = 902;
    end

    // Connect LUT values to mux_16_64
    mux_16_64 sine_mux(
        o,
        lut[0], lut[1], lut[2], lut[3], lut[4], lut[5], lut[6], lut[7],
        lut[8], lut[9], lut[10], lut[11], lut[12], lut[13], lut[14], lut[15],
        lut[16], lut[17], lut[18], lut[19], lut[20], lut[21], lut[22], lut[23],
        lut[24], lut[25], lut[26], lut[27], lut[28], lut[29], lut[30], lut[31],
        lut[32], lut[33], lut[34], lut[35], lut[36], lut[37], lut[38], lut[39],
        lut[40], lut[41], lut[42], lut[43], lut[44], lut[45], lut[46], lut[47],
        lut[48], lut[49], lut[50], lut[51], lut[52], lut[53], lut[54], lut[55],
        lut[56], lut[57], lut[58], lut[59], lut[60], lut[61], lut[62], lut[63],
        t
    );

endmodule

