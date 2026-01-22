`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2026 23:28:20
// Design Name: 
// Module Name: Hamming_Encoder
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

module Hamming_Encoder(
    input  [3:0] data,
    output [6:0] ham_data
);

    assign ham_data[0] = data[0] ^ data[1] ^ data[3]; 
    assign ham_data[1] = data[0] ^ data[2] ^ data[3]; 
    assign ham_data[3] = data[1] ^ data[2] ^ data[3]; 

    assign ham_data[2] = data[0];
    assign ham_data[4] = data[1];
    assign ham_data[5] = data[2];
    assign ham_data[6] = data[3];

endmodule

