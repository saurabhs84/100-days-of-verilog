`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2026 02:28:03
// Design Name: 
// Module Name: mux_16
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

module mux_16(
    output [15:0] o,
    input  [15:0] i0, i1,
    input  s
);
    assign o = s ? i1 : i0;
endmodule

