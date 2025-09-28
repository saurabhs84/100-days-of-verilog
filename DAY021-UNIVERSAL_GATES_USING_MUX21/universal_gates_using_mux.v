`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2025 23:16:58
// Design Name: 
// Module Name: universal_gates_using_mux
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


module universal_gates_using_mux(
    input i0, i1,   
    input sel,       
    output y
    );
    assign y = sel ? i1 : i0;
endmodule

module universal_gates(
    input a, b,
    output nand_out, nor_out
    );


    universal_gates_using_mux u1(.i0(1'b1), .i1(~b), .sel(a), .y(nand_out));

    universal_gates_using_mux u2(.i0(~b), .i1(1'b0), .sel(a), .y(nor_out));

endmodule

