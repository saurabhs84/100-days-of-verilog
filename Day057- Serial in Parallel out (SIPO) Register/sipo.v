`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2025 17:19:04
// Design Name: 
// Module Name: sipo
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


module D_flipflop(
    input d, clk, reset,
    output reg Q
);
    always @(posedge clk or posedge reset)
        if (reset)
            Q <= 1'b0;
        else
            Q <= d;
endmodule


module sipo(
    input clk, reset, serial_in,
    output [2:0] parallel_out
);
    D_flipflop D0(serial_in,      clk, reset, parallel_out[0]);
    D_flipflop D1(parallel_out[0], clk, reset, parallel_out[1]);
    D_flipflop D2(parallel_out[1], clk, reset, parallel_out[2]);
endmodule
