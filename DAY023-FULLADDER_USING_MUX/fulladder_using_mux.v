`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2025 00:08:07
// Design Name: 
// Module Name: fulladder_using_mux
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

module mux2_1(
    input m,n,
    input sel,
    output y_out    
    );
    assign y_out= sel ? n : m;
endmodule

module fulladder_using_mux(
    input a,b,cin,
    output sum, carry
    );
    wire [4:0]w;
    
    mux2_1 m0(1'b1, 1'b0, a, w[0]);
    mux2_1 m1(a, w[0], b, w[1]);
    mux2_1 m2(1'b1, 1'b0, w[1], w[2]);
    mux2_1 m3(w[1], w[2], cin, sum);
    
    mux2_1 m4(1'b0, w[1], cin, w[3]);
    mux2_1 m5(1'b0, a, b, w[4]);
    mux2_1 m6(w[3], w[4], w[4], carry);
        
endmodule
