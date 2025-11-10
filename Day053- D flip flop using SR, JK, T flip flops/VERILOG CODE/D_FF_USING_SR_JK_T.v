`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2025 01:23:24
// Design Name: 
// Module Name: D_FF_USING_SR_JK_T
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


module D_FF_USING_SR_JK_T(
    input clk, reset, D,
    output Q_sr, Q_jk, Q_t
);

    wire Dbar;
    assign Dbar = ~D;
    wire w; 
    SR_flipflop SR_inst (.clk(clk),.reset(reset),.S(D),.R(Dbar),.Q(Q_sr));
    
    JK_flipflop JK_inst (.clk(clk),.reset(reset),.J(D),.K(Dbar),.Q(Q_jk));

    assign w = D ^ Q_t;
    T_flipflop T_inst (.clk(clk),.reset(reset),.T(w),.Q(Q_t) );

endmodule

