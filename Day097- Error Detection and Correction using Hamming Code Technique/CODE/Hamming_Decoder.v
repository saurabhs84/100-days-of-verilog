`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2026 23:29:49
// Design Name: 
// Module Name: Hamming_Decoder
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

module Hamming_Decoder(
    input  [6:0] ham_data,
    output [3:0] data,
    output [2:0] error_position,
    output       is_error
);

    wire c1, c2, c3;
    reg  [6:0] corrected_data;

    assign c1 = ham_data[0] ^ ham_data[2] ^ ham_data[4] ^ ham_data[6];
    assign c2 = ham_data[1] ^ ham_data[2] ^ ham_data[5] ^ ham_data[6];
    assign c3 = ham_data[3] ^ ham_data[4] ^ ham_data[5] ^ ham_data[6];

    assign error_position = {c3, c2, c1};
    assign is_error = |error_position;

    always @(*) begin
        corrected_data = ham_data;
        if (is_error)
            corrected_data[error_position - 1] = ~ham_data[error_position - 1];
    end

    assign data[0] = corrected_data[2];
    assign data[1] = corrected_data[4];
    assign data[2] = corrected_data[5];
    assign data[3] = corrected_data[6];

endmodule

