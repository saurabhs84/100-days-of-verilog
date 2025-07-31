`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.07.2025 21:58:18
// Design Name: 
// Module Name: SWITCH_LEVEL_MODELING
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


module SWITCH_LEVEL_MODELING(
input in,
output out

    );
    supply0 gnd;
    supply1 vdd;
    pmos(out, vdd, in);
    nmos(out, gnd, in);
endmodule
