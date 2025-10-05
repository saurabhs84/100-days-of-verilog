`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2025 21:00:05
// Design Name: 
// Module Name: Nand_gate_demux
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



module demux_1_2(
    input sel,
    input i,
    output y0, y1
    );    
    assign {y0,y1} = sel?{1'b0,i}: {i,1'b0};
endmodule

module Nand_gate_demux(
    input a, b,
    output nand_g
    );
    wire w0, w1, w2;
    
    demux_1_2 nandgate(b, a, w0, w1);
    demux_1_2 not_t(w1, 1'b1, nand_g, w2);
endmodule
