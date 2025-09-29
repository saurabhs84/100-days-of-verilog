`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2025 19:02:07
// Design Name: 
// Module Name: spe_gates_using_mux
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


    
module mux_2_1(
    input [1:0] i,
    input sel,
    output y_out    
    );
    assign y_out= sel ? i[1] : i[0];
endmodule

module spe_gates_using_mux(
    input a,b,
    output xor_out, xnor_out
    );
    wire bbar;
   
    mux_2_1 mbbar({1'b0, 1'b1}, b, bbar);
    
    mux_2_1 mxor({bbar, b}, a, xor_out);
    mux_2_1 mxnor({b, bbar}, a, xnor_out);

endmodule

